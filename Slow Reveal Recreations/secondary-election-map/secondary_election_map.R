#
# FILE:
# secondary_election_map.R
#
# DESCRIPTION
# Secondary Source: Map of the 1860 Election
# Requested by teacher partner
#
#
# AUTHORS:
#   Louis Cousino (main code)

# Loading libraries
library(tidyverse)
library(ggpattern)
library(sf)
library(flextable)

# Loading State GIS data
data <- read_sf(here::here("Slow reveal Recreations", "secondary-election-map", "us_state_1860_shape", "US_state_1860.shp"))

# Loading National GIS data
nat_data <- read_sf(here::here("Slow reveal Recreations", "secondary-election-map", "cb_2018_us_nation_20m", "cb_2024_us_nation_20m.shp"))

nat_data <- st_transform(nat_data, crs = "ESRI:102003")

export <- data |> 
  select(STATENAM)

# Filtering out Territories and adding fill categories

data <- data |> 
  filter(str_detect(STATENAM, "Territory") == FALSE) |> 
  mutate(fill = case_when(str_detect(str_to_lower(STATENAM), "oregon|california|minnesota|iowa|wisconsin|illinois|michigan|indiana|ohio|pennsylvania|new york|connecticut|rhode island|massachusetts|vermont|new hampshire|maine") == TRUE ~ "LINCOLN (Republican)",
                          str_detect(str_to_lower(STATENAM), "texas|arkansas|louisiana|mississippi|alabama|florida|georgia|south carolina|north carolina|maryland|delaware") == TRUE ~ "BRECKINRIDGE\n(Southern Democrat)",
                          str_detect(str_to_lower(STATENAM), "tennessee|kentucky|virginia") == TRUE ~ "BELL (Constitutional Union)\n",
                          str_detect(str_to_lower(STATENAM), "missouri") == TRUE ~ "DOUGLAS (Democrat)\n"),
         display_label = case_when(str_to_lower(STATENAM) == "oregon" ~ "ORE.",
                                   str_to_lower(STATENAM) == "california" ~ "CALIF.",
                                   str_to_lower(STATENAM) == "minnesota" ~ "MINN.",
                                   str_to_lower(STATENAM) == "missouri" ~ "MO",
                                   str_to_lower(STATENAM) == "arkansas" ~ "ARK",
                                   str_to_lower(STATENAM) == "wisconsin" ~ "WIS",
                                   str_to_lower(STATENAM) == "illinois" ~ "ILL",
                                   str_to_lower(STATENAM) == "kentucky" ~ "KY",
                                   str_to_lower(STATENAM) == "tennessee" ~ "TENN",
                                   str_to_lower(STATENAM) == "mississippi" ~ "MISS",
                                   str_to_lower(STATENAM) == "indiana" ~ "IND",
                                   str_to_lower(STATENAM) == "alabama" ~ "ALA",
                                   str_to_lower(STATENAM) == "georgia" ~ "GA",
                                   str_to_lower(STATENAM) == "south carolina" ~ "S C",
                                   str_to_lower(STATENAM) == "north carolina" ~ "N C",
                                   str_to_lower(STATENAM) == "virginia" ~ "VA",
                                   str_to_lower(STATENAM) == "pennsylvania" ~ "PA",
                                   str_to_lower(STATENAM) == "new york" ~ "N Y",
                                   str_to_lower(STATENAM) == "maine" ~ "ME",
                                   str_to_lower(STATENAM) == "texas" ~ "TEXAS",
                                   str_to_lower(STATENAM) == "iowa" ~ "IOWA",
                                   str_to_lower(STATENAM) == "ohio" ~ "OHIO",
                                   TRUE ~ NA))

center <- data |> 
  st_centroid(geometry)

# Splitting NJ in half.
bbox <- data |> 
  filter(STATENAM == "New Jersey") |> 
  st_bbox()

mid_y <- (bbox["ymin"] + bbox["ymax"]) / 2

area_sf <- data |> 
  filter(STATENAM == "New Jersey")

# Southern half
south_rect <- st_polygon(list(rbind(
  c(bbox["xmin"], bbox["ymin"]),
  c(bbox["xmax"], bbox["ymin"]),
  c(bbox["xmax"], mid_y),
  c(bbox["xmin"], mid_y),
  c(bbox["xmin"], bbox["ymin"])
))) |> st_sfc(crs = st_crs(area_sf))

# Northern half
north_rect <- st_polygon(list(rbind(
  c(bbox["xmin"], mid_y),
  c(bbox["xmax"], mid_y),
  c(bbox["xmax"], bbox["ymax"]),
  c(bbox["xmin"], bbox["ymax"]),
  c(bbox["xmin"], mid_y)
))) |> st_sfc(crs = st_crs(area_sf))

south_half <- st_intersection(area_sf, south_rect) |> 
  mutate(fill = "DOUGLAS (Democrat)\n")
north_half <- st_intersection(area_sf, north_rect) |> 
  mutate(fill = "LINCOLN (Republican)")

data <- data |> 
  filter(STATENAM != "New Jersey") |> 
  rbind(south_half, north_half)

# Non-centered Text

text <- tibble(
  display_label = c("Territories", "MICH", "LA", "FLA", "VT", "N H", "MASS", "R I", "CONN", "N J", "DEL", "MD"), 
  lon = c(-104.648205, -84.769446, -92.760411, -81.711175, -73.538872, -71.729551, -69.309585, -69.648833, -69.852381, -71.80770, -71.729551, -71.887867),
  lat = c(42.466877, 42.901996, 31.887790, 28.390717, 45.808824, 46.232851, 42.299517, 40.566550, 39.552821, 38.653845, 37.460749, 35.588940)
)



# Ensuring that DC is on the same reference system as the map and that the projection is cylindrical 

text <- st_as_sf(text, coords = c("lon", "lat"), crs = 4326)

text <- st_transform(text, crs = "ESRI:102003")

# Drawing lines that connect labels to their states

line1 <- matrix(c(-72.658674, 45.113467, -73.538872, 45.808824), ncol = 2, byrow = TRUE)
line2 <- matrix(c(-71.456692, 45.371045, -71.729551, 46.232851), ncol = 2, byrow = TRUE)
line3 <- matrix(c(-71.343103, 42.309418, -69.309585, 42.299517), ncol = 2, byrow = TRUE)
line4 <- matrix(c(-71.357567, 41.328848, -69.648833, 40.566550), ncol = 2, byrow = TRUE)
line5 <- matrix(c(-72.468094, 41.092960, -69.852381, 39.552821), ncol = 2, byrow = TRUE)
line6 <- matrix(c(-73.905246, 39.890767, -71.80770, 38.653845), ncol = 2, byrow = TRUE)
line7 <- matrix(c(-74.806732, 38.667115, -71.729551, 37.460749), ncol = 2, byrow = TRUE)
line8 <- matrix(c(-75.061687, 38.171640, -71.887867, 35.588940), ncol = 2, byrow = TRUE)

lines <- st_sfc(
  st_linestring(line1),
  st_linestring(line2),
  st_linestring(line3),
  st_linestring(line4),
  st_linestring(line5),
  st_linestring(line6),
  st_linestring(line7),
  st_linestring(line8),
  crs = 4326
)

# Create sf object
lines_sf <- st_sf(
  id = 1:8,  # optional identifier
  geometry = lines
)

lines_sf <- st_transform(lines_sf, crs = "ESRI:102003")


# Plotting Map
map <- ggplot() +
  geom_sf(data = lines_sf) +
  geom_sf_pattern(aes(fill = fct_relevel(fill, "LINCOLN (Republican)", "BRECKINRIDGE\n(Southern Democrat)", "DOUGLAS (Democrat)\n", "BELL (Constitutional Union)\n"),
                      pattern = fct_relevel(fill, "LINCOLN (Republican)", "BRECKINRIDGE\n(Southern Democrat)", "DOUGLAS (Democrat)\n", "BELL (Constitutional Union)\n")),
                  pattern_spacing = 0.01,
                  pattern_density = 0.3,
                  data = data |>
                    filter(STATENAM != "District of Columbia")) +
  geom_sf_pattern(aes(fill = fct_relevel(fill, "LINCOLN (Republican)", "BRECKINRIDGE\n(Southern Democrat)", "DOUGLAS (Democrat)\n", "BELL (Constitutional Union)\n"),
                      pattern = fct_relevel(fill, "LINCOLN (Republican)", "BRECKINRIDGE\n(Southern Democrat)", "DOUGLAS (Democrat)\n", "BELL (Constitutional Union)\n")),
                  pattern_spacing = 0.005,
                  pattern_density = 0.2,
                  data = data |>
                    filter(fill == "BELL (Constitutional Union)\n")) +
  geom_sf_label(aes(label = display_label),
                data = center,
                size = 8) +
  geom_sf_label(aes(label = display_label),
                data = text |> 
                  filter(display_label != "Territories"),
                size = 8) +
  geom_sf_label(aes(label = display_label),
                data = text |> 
                  filter(display_label == "Territories"),
                size = 12,
                label.size = 0) +
  geom_sf(fill = NA, color = "black", data = nat_data) +
  coord_sf(
    crs = st_crs(5070),
    xlim = c(-2500000, 2500000),
    ylim = c(200000, 3250000),
    expand = FALSE
  ) +
  guides(fill = guide_legend(nrow = 2, byrow = TRUE, title = "", position = "bottom",
                             theme = theme(legend.text = element_text(size = 24),
                                           legend.key.width = unit(4, "cm"))),
         pattern = guide_legend(nrow = 2, byrow = TRUE, title = "", position = "bottom",
                                theme = theme(legend.text = element_text(size = 24),
                                              legend.key.width = unit(4, "cm")))) +
  scale_pattern_manual(values = c("LINCOLN (Republican)" ="stripe",
                                  "BELL (Constitutional Union)\n" = "circle",
                                  "BRECKINRIDGE\n(Southern Democrat)" = "crosshatch",
                                  "DOUGLAS (Democrat)\n" = "none")) +
  scale_fill_manual(values = c("LINCOLN (Republican)" = "white",
                               "BELL (Constitutional Union)\n" = "lightgray",
                               "BRECKINRIDGE\n(Southern Democrat)" = "darkgray",
                               "DOUGLAS (Democrat)\n" = "black")) +
  annotate("text", x = 0, y = 3125000, label = "1860", size = 24, hjust = 0.5) +
  annotate("text",
           x = -1500000, y = 300000,
           label = "Created with data from: IPUMS NHGIS, University of Minnesota, www.nhgis.org", size = 16/.pt) +
  theme_void()

# Saving map

png(here::here("Slow Reveal Recreations", "secondary-election-map", "recreated-imgs", "01_full_unmasked.png"),
    width = 2400,
    height = 1800)

map

dev.off()

# 02: Map without fill

# Plotting Map
map <- ggplot() +
  geom_sf(data = lines_sf) +
  geom_sf(data = data,
          fill = "white") +
  # geom_sf_pattern(aes(fill = fct_relevel(fill, "LINCOLN (Republican)", "BRECKINRIDGE\n(Southern Democrat)", "DOUGLAS (Democrat)\n", "BELL (Constitutional Union)\n"),
  #                     pattern = fct_relevel(fill, "LINCOLN (Republican)", "BRECKINRIDGE\n(Southern Democrat)", "DOUGLAS (Democrat)\n", "BELL (Constitutional Union)\n")),
  #                 pattern_spacing = 0.01,
  #                 pattern_density = 0.3,
  #                 data = data |> 
  #                   filter(STATENAM != "District of Columbia")) +
  # geom_sf_pattern(aes(fill = fct_relevel(fill, "LINCOLN (Republican)", "BRECKINRIDGE\n(Southern Democrat)", "DOUGLAS (Democrat)\n", "BELL (Constitutional Union)\n"),
  #                     pattern = fct_relevel(fill, "LINCOLN (Republican)", "BRECKINRIDGE\n(Southern Democrat)", "DOUGLAS (Democrat)\n", "BELL (Constitutional Union)\n")),
  #                 pattern_spacing = 0.005,
  #                 pattern_density = 0.2,
  #                 data = data |> 
  #                   filter(fill == "BELL (Constitutional Union)\n")) +
  geom_sf_label(aes(label = display_label),
                data = center,
                size = 8) +
  geom_sf_label(aes(label = display_label),
                data = text |> 
                  filter(display_label != "Territories"),
                size = 8) +
  geom_sf_label(aes(label = display_label),
                data = text |> 
                  filter(display_label == "Territories"),
                size = 12,
                label.size = 0) +
  geom_sf(fill = NA, color = "black", data = nat_data) +
  coord_sf(
    crs = st_crs(5070),
    xlim = c(-2500000, 2500000),
    ylim = c(200000, 3250000),
    expand = FALSE
  ) +
  # guides(fill = guide_legend(nrow = 2, byrow = TRUE, title = "", position = "bottom", 
  #                            theme = theme(legend.text = element_text(size = 24),
  #                                          legend.key.width = unit(4, "cm"))),
  #        pattern = guide_legend(nrow = 2, byrow = TRUE, title = "", position = "bottom", 
  #                               theme = theme(legend.text = element_text(size = 24),
  #                                             legend.key.width = unit(4, "cm")))) +
  # scale_pattern_manual(values = c("LINCOLN (Republican)" ="stripe",
  #                                 "BELL (Constitutional Union)\n" = "circle",
  #                                 "BRECKINRIDGE\n(Southern Democrat)" = "crosshatch",
  #                                 "DOUGLAS (Democrat)\n" = "none")) +
  # scale_fill_manual(values = c("LINCOLN (Republican)" = "white",
  #                              "BELL (Constitutional Union)\n" = "lightgray",
  #                              "BRECKINRIDGE\n(Southern Democrat)" = "darkgray",
  #                              "DOUGLAS (Democrat)\n" = "black")) +
  annotate("text", x = 0, y = 3125000, label = "1860", size = 24, hjust = 0.5) +
  # annotate("text",
  #          x = -1500000, y = 300000, 
  #          label = "Created with data from: IPUMS NHGIS, University of Minnesota, www.nhgis.org", size = 16/.pt) +
  theme_void()

# Saving map

png(here::here("Slow Reveal Recreations", "secondary-election-map", "recreated-imgs", "02_no_colors.png"),
    width = 2400,
    height = 1800)

map

dev.off()

# 03: Map with fill

# Plotting Map
map <- ggplot() +
  geom_sf(data = lines_sf) +
  geom_sf(data = data,
          fill = "white") +
  geom_sf_pattern(aes(fill = fct_relevel(fill, "LINCOLN (Republican)", "BRECKINRIDGE\n(Southern Democrat)", "DOUGLAS (Democrat)\n", "BELL (Constitutional Union)\n"),
                      pattern = fct_relevel(fill, "LINCOLN (Republican)", "BRECKINRIDGE\n(Southern Democrat)", "DOUGLAS (Democrat)\n", "BELL (Constitutional Union)\n")),
                  pattern_spacing = 0.01,
                  pattern_density = 0.3,
                  data = data |>
                    filter(STATENAM != "District of Columbia"),
                  show.legend = FALSE) +
  geom_sf_pattern(aes(fill = fct_relevel(fill, "LINCOLN (Republican)", "BRECKINRIDGE\n(Southern Democrat)", "DOUGLAS (Democrat)\n", "BELL (Constitutional Union)\n"),
                      pattern = fct_relevel(fill, "LINCOLN (Republican)", "BRECKINRIDGE\n(Southern Democrat)", "DOUGLAS (Democrat)\n", "BELL (Constitutional Union)\n")),
                  pattern_spacing = 0.005,
                  pattern_density = 0.2,
                  data = data |>
                    filter(fill == "BELL (Constitutional Union)\n"),
                  show.legend = FALSE) +
  geom_sf_label(aes(label = display_label),
                data = center,
                size = 8) +
  geom_sf_label(aes(label = display_label),
                data = text |> 
                  filter(display_label != "Territories"),
                size = 8) +
  geom_sf_label(aes(label = display_label),
                data = text |> 
                  filter(display_label == "Territories"),
                size = 12,
                label.size = 0) +
  geom_sf(fill = NA, color = "black", data = nat_data) +
  coord_sf(
    crs = st_crs(5070),
    xlim = c(-2500000, 2500000),
    ylim = c(200000, 3250000),
    expand = FALSE
  ) +
  guides(fill = element_blank(),
         pattern = element_blank()) +
  scale_pattern_manual(values = c("LINCOLN (Republican)" ="stripe",
                                  "BELL (Constitutional Union)\n" = "circle",
                                  "BRECKINRIDGE\n(Southern Democrat)" = "crosshatch",
                                  "DOUGLAS (Democrat)\n" = "none")) +
  scale_fill_manual(values = c("LINCOLN (Republican)" = "white",
                               "BELL (Constitutional Union)\n" = "lightgray",
                               "BRECKINRIDGE\n(Southern Democrat)" = "darkgray",
                               "DOUGLAS (Democrat)\n" = "black")) +
  annotate("text", x = 0, y = 3125000, label = "1860", size = 24, hjust = 0.5) +
  # annotate("text",
  #          x = -1500000, y = 300000, 
  #          label = "Created with data from: IPUMS NHGIS, University of Minnesota, www.nhgis.org", size = 16/.pt) +
  theme(legend.position = "none") +
  theme_void()

# Saving map

png(here::here("Slow Reveal Recreations", "secondary-election-map", "recreated-imgs", "03_map_with_colors.png"),
    width = 2400,
    height = 1800)

map

dev.off()

