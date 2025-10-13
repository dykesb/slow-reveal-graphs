#
# FILE:
# rulison_national_map.R
#
# DESCRIPTION
# National political chart & map of the United States.
# https://www.loc.gov/resource/g3701f.ct003590/?r=0.003,0.421,0.774,0.434,0
#
#
# AUTHORS:
#   Louis Cousino (main code)

# Loading libraries
library(tidyverse)
library(sf)
library(flextable)
library(canadianmaps)
library(showtext)
library(rnaturalearth)
library(rnaturalearthdata)

# Adding the fonts
font_add_google("Dynalight", "Dynalight")
font_add_google("IM Fell DW Pica", "IM Fell DW Pica")
showtext_auto()

global_font <- "IM Fell DW Pica"

# Canada

world <- ne_countries(scale = "medium", returnclass = "sf")

# ontario <- canadianmaps::PROV |> 
#   filter(PRENAME == "Ontario")

# canada <- subset(world, name == "Canada")

canada <- read_sf(here::here("Slow reveal Recreations", "rulison-national-map", "lpr_000b21a_e", "lpr_000b21a_e.shp"))

canada_proj <- st_transform(canada, 3857)

bbox <- st_bbox(c(xmin = -126, xmax = -66, ymin = 23.5, ymax = 50), crs = st_crs(4326))
bbox_sf <- st_as_sfc(bbox)
bbox_proj <- st_transform(bbox_sf, 3857)

ca_cropped <- st_crop(canada_proj, bbox_proj)

# Mexico

mexico_sf <- subset(world, name == "Mexico")

mexico_sf <- st_make_valid(mexico_sf)

validity <- st_is_valid(mexico_sf)

mexico_sf <- mexico_sf[validity, ]

mexico_sf <- st_make_valid(mexico_sf)

mexico_sf <- st_transform(mexico_sf, 3857)

me_cropped <- st_intersection(mexico_sf, bbox_proj)

# Loading GIS data
data <- read_sf(here::here("Slow reveal Recreations", "rulison-national-map", "us_state_1860_shape", "US_state_1860.shp"))

# Loading Text Data
text <- readxl::read_xlsx(here::here("Slow reveal Recreations", "rulison-national-map", "text_position.xlsx"))

arched_data <- read.csv(here::here("Slow reveal Recreations", "rulison-national-map", "arched_text.csv"))

vertical_text <- tibble(
  text = c("VERMONT", "NEW HAMPSHIRE", "RHODE I", "DELAWARE", "WASHINGTON"), # I just needed to put Washington somewhere
  lon = c(-72.754640, -71.601623, -71.609655, -75.492133, -78.133740),
  lat = c(43.848661, 43.790826, 41.707703, 39.035403, 38.800855),
  angle = c(75, 75, -80, -90, 0),
  size =  c(4, 4, 2, 3, 4)
)

# Adding colors to the shape file

data <- data |> 
  mutate(id = 1:nrow(data),
    fill = case_when(id %in% c(22, 41, 36, 26, 23, 38, 2, 21, 10, 33, 17, 34, 39) ~ "#979C73",
                      id %in% c(30, 24, 4, 3, 1, 40) ~ "#E8C174",
                      TRUE ~ "#D99686"))

# Coordinates for Washington, D.C.
DC <- tibble(
  lon = -77.0369,
  lat = 38.9072
)


arched_data <- arched_data |> 
  mutate(coords = str_replace_all(WKT, "POINT \\(|\\)", "") |> 
           str_split(" ")) |> 
  unnest_longer(col = coords) |> 
  mutate(coords = as.numeric(coords),
         set = rep(c("x1", "y1", "x2", "y2", "x3", "y3"), times = 18)) |> 
  pivot_wider(id_cols = c(name, description, size), names_from = set, values_from = coords) |> 
  rename(text = name,
         arc_dir = description)


circle_calc <- function(dataframe) {
  
  # Defining points
  x1 <- dataframe$x1
  y1 <- dataframe$y1
  
  x2 <- dataframe$x2
  y2 <- dataframe$y2
  
  x3 <- dataframe$x3
  y3 <- dataframe$y3
  
  size <- dataframe$size
  
  arc_dir <- dataframe$arc_dir
  
  # Calculating Center Coordinates
  A <- matrix(c(
    2*(x2 - x1), 2*(y2 - y1),
    2*(x3 - x1), 2*(y3 - y1)
  ), nrow = 2, byrow = TRUE)
  
  b <- c(
    x2^2 + y2^2 - x1^2 - y1^2,
    x3^2 + y3^2 - x1^2 - y1^2
  )
  
  center <- solve(A, b)
  
  h <- center[1]
  k <- center[2]
  
  # Calculating Radius
  a_squared <- (x1 - h)^2
  b_squared <- (y1 - k)^2
  
  radius <- sqrt(a_squared + b_squared)
  
  # Calculating the central angle
  numerator <- ((x1 - h) * (x3 - h)) + ((y1 - k) * (y3 - k))
  central_angle <- acos((numerator/(radius^2)))
  central_deg <- (central_angle*180)/pi
  
  # Parsing out text and calculating degrees
  
  if (arc_dir == 0) {
    
    theta_start <- 0
    
  } else {
    
    theta_start <- atan2(y1 - k, x1 - h)
    
  }
  
  dataframe <- dataframe |>
    rowwise() |>
    mutate(deg = list(seq(from = theta_start, to = theta_start + central_angle, length.out = str_length(text))),
           text = str_extract_all(text, "."))
  
  # Expanding the dataframe so that each row is a letter
  text_list <- list()
  
  for (i in 1:nrow(dataframe)) {
    
    text_processing <- list()
    
    for (j in 1:length(unlist(dataframe$text[[i]]))) {
      
      text_processing[[j]] <- tibble(
        
        degrees = unlist(dataframe$deg[[i]])[[j]],
        radius = radius,
        center_x = h,
        center_y = k,
        text = unlist(dataframe$text[[i]])[[j]],
        arc_dir = unlist(dataframe$arc_dir[[i]]),
        size = unlist(dataframe$size[[i]])
        
      )
      
      text_list[[i]] <- text_processing |>
        bind_rows()
      
    }
    
  }
  
  return_df <- text_list |>
    bind_rows()
  
  return(return_df)
  
}

arched_text <- list()

for (i in 1:nrow(arched_data)) {
  
  arched_text[[i]] <- arched_data |>
    slice(i) |>
    circle_calc() |>
    mutate(radians = degrees*(pi/180),
           lon = case_when(arc_dir == 0 ~ center_x + (radius*sin(degrees)),
                           arc_dir == 1 ~ center_x + (radius*cos(degrees))),
           lat = case_when(arc_dir == 0 ~ center_y + (radius*cos(degrees)),
                           arc_dir == 1 ~ center_y + (radius*sin(degrees))),
           slope = case_when(arc_dir == 0 ~ (lat - center_y)/(lon - center_x),
                             arc_dir == 1 ~ (center_y - lat)/(center_x - lon)),
           angle = atan(-(1/slope)) * (180/pi),
           size = size)
}

arched_text <- arched_text |>
  bind_rows()

# Calculating coordinates for text

text <- text |> 
  rowwise() |> 
  mutate(position = list(seq(from = x1, to = x2, length.out = str_length(text))),
         text = str_extract_all(text, "."))

text_list <- list()

for (i in 1:nrow(text)) {
  
  text_processing <- list()
  
  for (j in 1:length(unlist(text$text[[i]]))) {
    
    text_processing[[j]] <- tibble(
      
      lon = unlist(text$position[[i]])[[j]],
      angle = text$angle[[i]],
      size = text$size[[i]],
      lat = text$y[[i]],
      text = unlist(text$text[[i]])[[j]]
      
    )
    
    text_list[[i]] <- text_processing |> 
      bind_rows()
    
  }
  
}

display_text <- bind_rows(text_list, arched_text, vertical_text)

# display_text <- arched_text


# Ensuring that DC is on the same reference system as the map and that the projection is cylindrical 
city_point <- st_as_sf(DC, coords = c("lon", "lat"), crs = 4326)

data <- st_transform(data, crs = "ESRI:54004")

city_point <- st_transform(city_point, crs = "ESRI:54004")

display_text <- st_as_sf(display_text, coords = c("lon", "lat"), crs = 4326)

display_text <- st_transform(display_text, crs = "ESRI:54004")

# Importing images

electors <- png::readPNG(here::here("Slow reveal Recreations", "rulison-national-map", "electors.png"))
electors_grob <- grid::rasterGrob(electors)

popular <- png::readPNG(here::here("Slow reveal Recreations", "rulison-national-map", "popular.png"))
popular_grob <- grid::rasterGrob(popular)

portraits <- png::readPNG(here::here("Slow reveal Recreations", "rulison-national-map", "portraits.png"))
portraits_grob <- grid::rasterGrob(portraits)

# Plotting map

map <- ggplot() +
  geom_sf(aes(fill = fill),
          data = data) +
  geom_sf(data = city_point) +
  geom_sf_text(aes(label = text, angle = angle, size = size),
               family = global_font,
               data = display_text) +
  geom_sf(data = ca_cropped, fill = NA) +
  geom_sf(data = me_cropped, fill = NA) +
  scale_fill_identity() + 
  scale_size_identity() +
  ylim(c(22, 58)) +
  annotate("rect",
           xmin = -66, xmax = -126,
           ymin = 23.5, ymax = 50,
           alpha = 0,
           color = "black") +
  annotate("text",
           family = global_font,
           x = c(-67, -72, -77, -82, -87, -92, -94.5, -97, -102, -107, -112, -117, -122),
           y = rep(50.15,length(c(-67, -72, -77, -82, -87, -92, -94.5, -97, -102, -107, -112, -117, -122))), # Added an extra 0.15 for a vertical offset
           label = as.character(c(-67, -72, -77, -82, -87, -92, "Longitude West from Greenwich", -97, -102, -107, -112, -117, -122))) +
  annotate("segment",
           x = c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122),
           xend = c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122),
           y = rep(50,length(c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122))),
           yend = rep(23.5,length(c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122))),
           linewidth = 0.1,
           alpha = 0.25) +
  annotate("text",
           family = global_font,
           x = rep(-126.15,length(c(30, 35, 45, 50))),
           y = c(30, 35, 45, 50), # Added an extra 0.15 for a horizontal offset
           label = as.character(c(30, 35, 45, 50))) +
  annotate("segment",
           x = rep(-66,length(c(30, 35, 40, 45, 50))),
           xend = rep(-126, length(c(30, 35, 40, 45, 50))),
           y = c(30, 35, 40, 45, 50),
           yend = c(30, 35, 40, 45, 50),
           linewidth = 0.1,
           alpha = 0.25) +
  annotate("text",
           family = global_font,
           x = c(-77.0369-5, -77.0369-10, -77.0369-15, -77.0369-17.5, -77.0369-20, -77.0369-25, -77.0369-30, -77.0369-35, -77.0369-40),
           y = rep(23.35,length(c(-77.0369-5, -77.0369-10, -77.0369-15, -77.0369-17.5, -77.0369-20, -77.0369-25, -77.0369-30, -77.0369-35, -77.0369-40))), # Added an extra 0.15 for a vertical offset
           label = as.character(c(5, 10, 15, "Longitude West from Washington", 20, 25, 30, 35, 40))) +
  annotate("text",
           family = global_font,
           x = -120, y = 22, label = "Created with data from: IPUMS NHGIS, University of Minnesota, www.nhgis.org", size = 16/.pt) +
  annotation_custom(grob = electors_grob,
                    xmin = -84.657431,
                    xmax = -95.094440,
                    ymin = 24.860749,
                    ymax = 28.569304) +
  annotation_custom(grob = popular_grob,
                    xmin = -125,
                    xmax = -112.997515,
                    ymin = 24,
                    ymax = 32.239907) + 
  annotation_raster(raster = portraits,
                    xmin = -66,
                    xmax = -126,
                    ymin = 51,
                    ymax = 58) +
  coord_sf(default_crs = st_crs(4326)) +
  theme_void() +
  theme(panel.background = element_rect(fill = "#ECCFA7"),
        plot.margin = unit(c(0, 0, 0, 0), "cm"))

png(here::here("Slow reveal Recreations", "rulison-national-map", "recreated-imgs", "01_recreated.png"),
    width = 2929,
    height = 2377)

map

dev.off()

# Blank map

# Plotting map

map <- ggplot() +
  geom_sf(aes(),
          data = data) +
  # geom_sf(data = city_point) +
  # geom_sf_text(aes(label = text, angle = angle, size = size),
  #              data = display_text) +
  geom_sf(data = ca_cropped, fill = NA) +
  geom_sf(data = me_cropped, fill = NA) +
  scale_fill_identity() + 
  scale_size_identity() + 
  ylim(c(22, 58)) +
  annotate("rect",
           xmin = -66, xmax = -126,
           ymin = 23.5, ymax = 50,
           alpha = 0,
           color = "black") +
  annotate("text",
           x = c(-67, -72, -77, -82, -87, -92, -94.5, -97, -102, -107, -112, -117, -122),
           y = rep(50.15,length(c(-67, -72, -77, -82, -87, -92, -94.5, -97, -102, -107, -112, -117, -122))), # Added an extra 0.15 for a vertical offset
           label = as.character(c(-67, -72, -77, -82, -87, -92, "Longitude West from Greenwich", -97, -102, -107, -112, -117, -122))) +
  annotate("segment",
           x = c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122),
           xend = c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122),
           y = rep(50,length(c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122))),
           yend = rep(23.5,length(c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122))),
           linewidth = 0.1,
           alpha = 0.25) +
  annotate("text",
           x = rep(-126.15,length(c(30, 35, 45, 50))),
           y = c(30, 35, 45, 50), # Added an extra 0.15 for a horizontal offset
           label = as.character(c(30, 35, 45, 50))) +
  annotate("segment",
           x = rep(-66,length(c(30, 35, 40, 45, 50))),
           xend = rep(-126, length(c(30, 35, 40, 45, 50))),
           y = c(30, 35, 40, 45, 50),
           yend = c(30, 35, 40, 45, 50),
           linewidth = 0.1,
           alpha = 0.25) +
  annotate("text",
           x = c(-77.0369-5, -77.0369-10, -77.0369-15, -77.0369-17.5, -77.0369-20, -77.0369-25, -77.0369-30, -77.0369-35, -77.0369-40),
           y = rep(23.35,length(c(-77.0369-5, -77.0369-10, -77.0369-15, -77.0369-17.5, -77.0369-20, -77.0369-25, -77.0369-30, -77.0369-35, -77.0369-40))), # Added an extra 0.15 for a vertical offset
           label = as.character(c(5, 10, 15, "Longitude West from Washington", 20, 25, 30, 35, 40))) +
  # annotation_custom(grob = electors_grob,
  #                   xmin = -84.657431,
  #                   xmax = -95.094440,
  #                   ymin = 24.860749,
  #                   ymax = 28.569304) +
  # annotation_custom(grob = popular_grob,
  #                   xmin = -125,
  #                   xmax = -112.997515,
  #                   ymin = 24,
  #                   ymax = 32.239907) + 
  # annotation_raster(raster = portraits,
  #                   xmin = -66,
  #                   xmax = -126,
  #                   ymin = 51,
  #                   ymax = 58) +
  coord_sf(default_crs = st_crs(4326)) +
  theme_void() +
  theme(panel.background = element_rect(fill = "#ECCFA7"),
        plot.margin = unit(c(0, 0, 0, 0), "cm"))

png(here::here("Slow reveal Recreations", "rulison-national-map", "recreated-imgs", "02_fully_masked.png"),
    width = 2929,
    height = 2377)

map

dev.off()

# Map with colors

# Plotting map

map <- ggplot() +
  geom_sf(aes(fill = fill),
          data = data) +
  # geom_sf(data = city_point) +
  # geom_sf_text(aes(label = text, angle = angle, size = size),
  #              data = display_text) +
  geom_sf(data = ca_cropped, fill = NA) +
  geom_sf(data = me_cropped, fill = NA) +
  scale_fill_identity() + 
  scale_size_identity() + 
  ylim(c(22, 58)) +
  annotate("rect",
           xmin = -66, xmax = -126,
           ymin = 23.5, ymax = 50,
           alpha = 0,
           color = "black") +
  annotate("text",
           x = c(-67, -72, -77, -82, -87, -92, -94.5, -97, -102, -107, -112, -117, -122),
           y = rep(50.15,length(c(-67, -72, -77, -82, -87, -92, -94.5, -97, -102, -107, -112, -117, -122))), # Added an extra 0.15 for a vertical offset
           label = as.character(c(-67, -72, -77, -82, -87, -92, "Longitude West from Greenwich", -97, -102, -107, -112, -117, -122))) +
  annotate("segment",
           x = c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122),
           xend = c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122),
           y = rep(50,length(c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122))),
           yend = rep(23.5,length(c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122))),
           linewidth = 0.1,
           alpha = 0.25) +
  annotate("text",
           x = rep(-126.15,length(c(30, 35, 45, 50))),
           y = c(30, 35, 45, 50), # Added an extra 0.15 for a horizontal offset
           label = as.character(c(30, 35, 45, 50))) +
  annotate("segment",
           x = rep(-66,length(c(30, 35, 40, 45, 50))),
           xend = rep(-126, length(c(30, 35, 40, 45, 50))),
           y = c(30, 35, 40, 45, 50),
           yend = c(30, 35, 40, 45, 50),
           linewidth = 0.1,
           alpha = 0.25) +
  annotate("text",
           x = c(-77.0369-5, -77.0369-10, -77.0369-15, -77.0369-17.5, -77.0369-20, -77.0369-25, -77.0369-30, -77.0369-35, -77.0369-40),
           y = rep(23.35,length(c(-77.0369-5, -77.0369-10, -77.0369-15, -77.0369-17.5, -77.0369-20, -77.0369-25, -77.0369-30, -77.0369-35, -77.0369-40))), # Added an extra 0.15 for a vertical offset
           label = as.character(c(5, 10, 15, "Longitude West from Washington", 20, 25, 30, 35, 40))) +
  # annotation_custom(grob = electors_grob,
  #                   xmin = -84.657431,
  #                   xmax = -95.094440,
  #                   ymin = 24.860749,
  #                   ymax = 28.569304) +
  # annotation_custom(grob = popular_grob,
  #                   xmin = -125,
  #                   xmax = -112.997515,
  #                   ymin = 24,
  #                   ymax = 32.239907) + 
  # annotation_raster(raster = portraits,
  #                   xmin = -66,
  #                   xmax = -126,
  #                   ymin = 51,
  #                   ymax = 58) +
  coord_sf(default_crs = st_crs(4326)) +
  theme_void() +
  theme(panel.background = element_rect(fill = "#ECCFA7"),
        plot.margin = unit(c(0, 0, 0, 0), "cm"))

png(here::here("Slow reveal Recreations", "rulison-national-map", "recreated-imgs", "03_map_with_colors.png"),
    width = 2929,
    height = 2377)

map

dev.off()

# Map with colors and text

# Plotting map

map <- ggplot() +
  geom_sf(aes(fill = fill),
          data = data) +
  # geom_sf(data = city_point) +
  geom_sf_text(aes(label = text, angle = angle, size = size),
               data = display_text |> 
                 filter(text != "WASHINGTON")) +
  geom_sf(data = ca_cropped, fill = NA) +
  geom_sf(data = me_cropped, fill = NA) +
  scale_fill_identity() + 
  scale_size_identity() + 
  ylim(c(22, 58)) +
  annotate("rect",
           xmin = -66, xmax = -126,
           ymin = 23.5, ymax = 50,
           alpha = 0,
           color = "black") +
  annotate("text",
           x = c(-67, -72, -77, -82, -87, -92, -94.5, -97, -102, -107, -112, -117, -122),
           y = rep(50.15,length(c(-67, -72, -77, -82, -87, -92, -94.5, -97, -102, -107, -112, -117, -122))), # Added an extra 0.15 for a vertical offset
           label = as.character(c(-67, -72, -77, -82, -87, -92, "Longitude West from Greenwich", -97, -102, -107, -112, -117, -122))) +
  annotate("segment",
           x = c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122),
           xend = c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122),
           y = rep(50,length(c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122))),
           yend = rep(23.5,length(c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122))),
           linewidth = 0.1,
           alpha = 0.25) +
  annotate("text",
           x = rep(-126.15,length(c(30, 35, 45, 50))),
           y = c(30, 35, 45, 50), # Added an extra 0.15 for a horizontal offset
           label = as.character(c(30, 35, 45, 50))) +
  annotate("segment",
           x = rep(-66,length(c(30, 35, 40, 45, 50))),
           xend = rep(-126, length(c(30, 35, 40, 45, 50))),
           y = c(30, 35, 40, 45, 50),
           yend = c(30, 35, 40, 45, 50),
           linewidth = 0.1,
           alpha = 0.25) +
  annotate("text",
           x = c(-77.0369-5, -77.0369-10, -77.0369-15, -77.0369-17.5, -77.0369-20, -77.0369-25, -77.0369-30, -77.0369-35, -77.0369-40),
           y = rep(23.35,length(c(-77.0369-5, -77.0369-10, -77.0369-15, -77.0369-17.5, -77.0369-20, -77.0369-25, -77.0369-30, -77.0369-35, -77.0369-40))), # Added an extra 0.15 for a vertical offset
           label = as.character(c(5, 10, 15, "Longitude West from Washington", 20, 25, 30, 35, 40))) +
  # annotation_custom(grob = electors_grob,
  #                   xmin = -84.657431,
  #                   xmax = -95.094440,
  #                   ymin = 24.860749,
  #                   ymax = 28.569304) +
  # annotation_custom(grob = popular_grob,
  #                   xmin = -125,
  #                   xmax = -112.997515,
  #                   ymin = 24,
  #                   ymax = 32.239907) + 
  # annotation_raster(raster = portraits,
  #                   xmin = -66,
  #                   xmax = -126,
  #                   ymin = 51,
  #                   ymax = 58) +
  coord_sf(default_crs = st_crs(4326)) +
  theme_void() +
  theme(panel.background = element_rect(fill = "#ECCFA7"),
        plot.margin = unit(c(0, 0, 0, 0), "cm"))

png(here::here("Slow reveal Recreations", "rulison-national-map", "recreated-imgs", "04_map_with_colors_text.png"),
    width = 2929,
    height = 2377)

map

dev.off()

# Map with Washington DC

# Plotting map

map <- ggplot() +
  geom_sf(aes(fill = fill),
          data = data) +
  geom_sf(data = city_point) +
  geom_sf_text(aes(label = text, angle = angle, size = size),
               data = display_text) +
  geom_sf(data = ca_cropped, fill = NA) +
  geom_sf(data = me_cropped, fill = NA) +
  scale_fill_identity() + 
  scale_size_identity() + 
  ylim(c(22, 58)) +
  annotate("rect",
           xmin = -66, xmax = -126,
           ymin = 23.5, ymax = 50,
           alpha = 0,
           color = "black") +
  annotate("text",
           x = c(-67, -72, -77, -82, -87, -92, -94.5, -97, -102, -107, -112, -117, -122),
           y = rep(50.15,length(c(-67, -72, -77, -82, -87, -92, -94.5, -97, -102, -107, -112, -117, -122))), # Added an extra 0.15 for a vertical offset
           label = as.character(c(-67, -72, -77, -82, -87, -92, "Longitude West from Greenwich", -97, -102, -107, -112, -117, -122))) +
  annotate("segment",
           x = c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122),
           xend = c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122),
           y = rep(50,length(c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122))),
           yend = rep(23.5,length(c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122))),
           linewidth = 0.1,
           alpha = 0.25) +
  annotate("text",
           x = rep(-126.15,length(c(30, 35, 45, 50))),
           y = c(30, 35, 45, 50), # Added an extra 0.15 for a horizontal offset
           label = as.character(c(30, 35, 45, 50))) +
  annotate("segment",
           x = rep(-66,length(c(30, 35, 40, 45, 50))),
           xend = rep(-126, length(c(30, 35, 40, 45, 50))),
           y = c(30, 35, 40, 45, 50),
           yend = c(30, 35, 40, 45, 50),
           linewidth = 0.1,
           alpha = 0.25) +
  annotate("text",
           x = c(-77.0369-5, -77.0369-10, -77.0369-15, -77.0369-17.5, -77.0369-20, -77.0369-25, -77.0369-30, -77.0369-35, -77.0369-40),
           y = rep(23.35,length(c(-77.0369-5, -77.0369-10, -77.0369-15, -77.0369-17.5, -77.0369-20, -77.0369-25, -77.0369-30, -77.0369-35, -77.0369-40))), # Added an extra 0.15 for a vertical offset
           label = as.character(c(5, 10, 15, "Longitude West from Washington", 20, 25, 30, 35, 40))) +
  # annotation_custom(grob = electors_grob,
  #                   xmin = -84.657431,
  #                   xmax = -95.094440,
  #                   ymin = 24.860749,
  #                   ymax = 28.569304) +
  # annotation_custom(grob = popular_grob,
  #                   xmin = -125,
  #                   xmax = -112.997515,
  #                   ymin = 24,
  #                   ymax = 32.239907) + 
  # annotation_raster(raster = portraits,
  #                   xmin = -66,
  #                   xmax = -126,
  #                   ymin = 51,
  #                   ymax = 58) +
  coord_sf(default_crs = st_crs(4326)) +
  theme_void() +
  theme(panel.background = element_rect(fill = "#ECCFA7"),
        plot.margin = unit(c(0, 0, 0, 0), "cm"))

png(here::here("Slow reveal Recreations", "rulison-national-map", "recreated-imgs", "05_map_with_DC.png"),
    width = 2929,
    height = 2377)

map

dev.off()

# Map with portraits

# Plotting map

map <- ggplot() +
  geom_sf(aes(fill = fill),
          data = data) +
  # geom_sf(data = city_point) +
  geom_sf_text(aes(label = text, angle = angle, size = size),
               data = display_text) +
  geom_sf(data = ca_cropped, fill = NA) +
  geom_sf(data = me_cropped, fill = NA) +
  scale_fill_identity() + 
  scale_size_identity() + 
  ylim(c(22, 58)) +
  annotate("rect",
           xmin = -66, xmax = -126,
           ymin = 23.5, ymax = 50,
           alpha = 0,
           color = "black") +
  annotate("text",
           x = c(-67, -72, -77, -82, -87, -92, -94.5, -97, -102, -107, -112, -117, -122),
           y = rep(50.15,length(c(-67, -72, -77, -82, -87, -92, -94.5, -97, -102, -107, -112, -117, -122))), # Added an extra 0.15 for a vertical offset
           label = as.character(c(-67, -72, -77, -82, -87, -92, "Longitude West from Greenwich", -97, -102, -107, -112, -117, -122))) +
  annotate("segment",
           x = c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122),
           xend = c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122),
           y = rep(50,length(c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122))),
           yend = rep(23.5,length(c(-67, -72, -77, -82, -87, -92, -97, -102, -107, -112, -117, -122))),
           linewidth = 0.1,
           alpha = 0.25) +
  annotate("text",
           x = rep(-126.15,length(c(30, 35, 45, 50))),
           y = c(30, 35, 45, 50), # Added an extra 0.15 for a horizontal offset
           label = as.character(c(30, 35, 45, 50))) +
  annotate("segment",
           x = rep(-66,length(c(30, 35, 40, 45, 50))),
           xend = rep(-126, length(c(30, 35, 40, 45, 50))),
           y = c(30, 35, 40, 45, 50),
           yend = c(30, 35, 40, 45, 50),
           linewidth = 0.1,
           alpha = 0.25) +
  annotate("text",
           x = c(-77.0369-5, -77.0369-10, -77.0369-15, -77.0369-17.5, -77.0369-20, -77.0369-25, -77.0369-30, -77.0369-35, -77.0369-40),
           y = rep(23.35,length(c(-77.0369-5, -77.0369-10, -77.0369-15, -77.0369-17.5, -77.0369-20, -77.0369-25, -77.0369-30, -77.0369-35, -77.0369-40))), # Added an extra 0.15 for a vertical offset
           label = as.character(c(5, 10, 15, "Longitude West from Washington", 20, 25, 30, 35, 40))) +
  # annotation_custom(grob = electors_grob,
  #                   xmin = -84.657431,
  #                   xmax = -95.094440,
  #                   ymin = 24.860749,
  #                   ymax = 28.569304) +
  # annotation_custom(grob = popular_grob,
  #                   xmin = -125,
  #                   xmax = -112.997515,
  #                   ymin = 24,
  #                   ymax = 32.239907) + 
  annotation_raster(raster = portraits,
                    xmin = -66,
                    xmax = -126,
                    ymin = 51,
                    ymax = 58) +
  coord_sf(default_crs = st_crs(4326)) +
  theme_void() +
  theme(panel.background = element_rect(fill = "#ECCFA7"),
        plot.margin = unit(c(0, 0, 0, 0), "cm"))

png(here::here("Slow reveal Recreations", "rulison-national-map", "recreated-imgs", "06_map_with_portraits.png"),
    width = 2929,
    height = 2377)

map

dev.off()

