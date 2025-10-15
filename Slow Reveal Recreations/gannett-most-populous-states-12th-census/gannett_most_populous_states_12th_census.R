#
# FILE:
# gannett_census_pops.R
#
# DESCRIPTION:
# This code is for the Rank of Most Populous States by Census Graph from Henry Gannett. The png's show the various stages of revealing the graphs. 
# Source: https://www.loc.gov/resource/g3701gm.gct00010/?sp=10&r=0.255,0.446,0.355,0.314,0
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC

#
# AUTHORS:
#   Louis Cousino (2025, main code)
#   Ian Curtis (2023, code to save plots)


library(tidyverse)
library(showtext)
library(png)
library(grid)

data <- readxl::read_excel(here::here("Slow Reveal Recreations", "gannett-most-populous-states-12th-census", "data.xlsx"))

# Importing PNG emblems

emblems_import <- function(import_list) {
  
  # Initializing list names
  return_list <- list()
  
  emblem_names <- c()
  
  for (i in 1:length(import_list)) {
    
    import <- readPNG(here::here("Slow Reveal Recreations", "gannett-most-populous-states-12th-census", "state-emblems", str_c(as.character(import_list[i]), ".png")))
    
    raster <- rasterGrob(import, interpolate = TRUE)
    
    # Assigning raster image to list
    return_list[[i]] <- raster
    
    # Assigning emblem name to list
    emblem_names[i] <- import_list[i]
  }
  
  # Renaming lists to correspond to names
  names(return_list) <- emblem_names
  
  return(return_list)
  
}

state_list <- data |> 
  distinct(State) |> 
  pull(State)

raster_grob <- emblems_import(state_list)

data <- data |> 
  mutate(State = str_to_lower(State),
         Census = Census * 2,
         right_lim = Census - 0.675,
         left_lim = Census + 0.675,
         Rank2 = Rank,
         xmin_grob = (Census + 0.7)*-1,
         xmax_grob = (Census - 0.7)*-1,
         ymin_grob = (Rank - 0.4)*-1,
         ymax_grob = (Rank + 0.4)*-1,
         raster_name = str_replace(str_to_lower(State), "[ .]+", "_"))



# Calculating emblem placement

# Assigning appropriate location for the emblems

placement_list <- list()

for (i in 1:nrow(data)) {
  
  placement_list[[i]] <- c(
    
    xmin = data[i,9],
    xmax = data[i,10],
    ymin = data[i,11],
    ymax = data[i,12]
    
  )
  
  placement_list[[i]][[5]] <- raster_grob[[as.character(data[i,13])]]
  
  
}

# Converting grobs into geoms

emblem_placement <- list()

placement_function <- function(g, xmn, xmx, ymn, ymx) {
  
  # Creating annotations based on arguments
  annotation <- annotation_custom(grob = g, xmin = xmn, xmax = xmx, ymin = ymn, ymax = ymx)
  
  # Returning annotations
  return(annotation)
}

for (i in 1:nrow(data)) {
  
  emblem_placement[[i]] <- placement_function(placement_list[[i]][[5]], 
                                              placement_list[[i]][[1]],
                                              placement_list[[i]][[2]], 
                                              placement_list[[i]][[3]],
                                              placement_list[[i]][[4]])
  
}

# Calculating position of end points
data <- data  |> 
  pivot_longer(cols = c(right_lim,left_lim),
               names_to = "limit",
               values_to = "limits_val")

# Modifying Labels
data <- data |> 
  mutate(State = str_replace_all(str_to_upper(State), "_", " "))

# Setting column labels

text <- tibble(label = character(),
               sublabel = character(),
               x = numeric(),
               y = numeric(),
               ysub = numeric())

for (i in 1:12) {
  text[i, 1] <- str_c(i, "TH CENSUS.")
  text[i, 2] <- str_c((i*10) + 1780)
  text[i ,3] <- i*2
  text[i, 4] <- 0.75
  text[i, 5] <- 0.25
  
}


#### FIGURE 1: RECREATED GRAPHIC ####

png(here::here("Slow Reveal Recreations", "gannett-most-populous-states-12th-census", "recreated-imgs", "01_full_unmasked.png"),width=9468,height=6262)

data |> 
  ggplot() +
  geom_line(aes(x = -limits_val, y = -Rank2, group = State),
            linewidth = 2,
            alpha = 0.7) +
  lims(x = c(-13*2, 0)) + 
  emblem_placement + 
  geom_text(aes(x = -Census,
                y = -Rank,
                label = State),
            fontface = "bold",
            size = 40/.pt,
            data = data |>
              filter(label == 1)) +
  geom_text(aes(x = -Census + 1,
                y = -Rank,
                label = State,
                hjust = 0),
            fontface = "bold",
            size = 40/.pt,
            data = data |>
              filter(offset == "right")) +
  geom_text(aes(x = -Census - 2,
                y = -Rank,
                label = State,
                hjust = 0),
            fontface = "bold",
            size = 40/.pt,
            data = data |>
              filter(offset == "left")) +
  geom_text(aes(x = -x,
                y = y,
                label = label),
            fontface = "bold",
            size = 40/.pt,
            data = text) +
  geom_text(aes(x = -x,
                y = ysub,
                label = sublabel),
            fontface = "bold",
            size = 40/.pt,
            data = text) +
  geom_text(x = -12,
            y = 2.25,
            label = "9. RANK OF STATES AND TERRIRORIES AT EACH CENSUS: 1790 - 1890.",
            size = 88/.pt) +
  geom_text(x = -1,
            y = 2.5,
            label = "PLATE 2.",
            size = 22/.pt) +
  geom_text(x = -1,
            y = -52,
            label = "JULIUS BIEN & CO. LITH. N. Y.",
            size = 22/.pt) +
  theme(line = element_blank(),
        panel.background = element_rect(fill = "#f1d9b5"),
        plot.background = element_rect(fill = "#f1d9b5"),
        plot.title = element_blank())



dev.off()

#### FIGURE 2: CONCEALED GRAPHIC ####

png(here::here("Slow Reveal Recreations", "gannett-most-populous-states-12th-census", "recreated-imgs", "02_masked.png"),width=9468,height=6262)

data |> 
  ggplot() +
  geom_line(aes(x = -limits_val, y = -Rank2, group = State),
            linewidth = 2,
            alpha = 0.7) +
  lims(x = c(-13*2, 0)) + 
  emblem_placement + 
  geom_text(aes(x = -Census,
                y = -Rank,
                label = State),
            fontface = "bold",
            size = 40/.pt,
            alpha = 0,
            data = data |>
              filter(label == 1)) +
  geom_text(aes(x = -Census + 1,
                y = -Rank,
                label = State,
                hjust = 0),
            fontface = "bold",
            size = 40/.pt,
            alpha = 0,
            data = data |>
              filter(offset == "right",
                     Census == 2)) +
  geom_text(aes(x = -Census - 2,
                y = -Rank,
                label = State,
                hjust = 0),
            fontface = "bold",
            size = 40/.pt,
            alpha = 0,
            data = data |>
              filter(offset == "left")) +
  geom_text(aes(x = -x,
                y = y,
                label = label),
            fontface = "bold",
            size = 40/.pt,
            alpha = 0,
            data = text) +
  geom_text(aes(x = -x,
                y = ysub,
                label = sublabel),
            fontface = "bold",
            size = 40/.pt,
            alpha = 0,
            data = text) +
  geom_text(x = -12,
            y = 2.25,
            label = "9. RANK OF STATES AND TERRIRORIES AT EACH CENSUS: 1790 - 1890.",
            size = 88/.pt,
            alpha = 0) +
  geom_text(x = -1,
            y = 2.5,
            label = "PLATE 2.",
            size = 22/.pt) +
  geom_text(x = -1,
            y = -52,
            label = "JULIUS BIEN & CO. LITH. N. Y.",
            size = 22/.pt) +
  theme(line = element_blank(),
        panel.background = element_rect(fill = "#f1d9b5"),
        plot.background = element_rect(fill = "#f1d9b5"),
        plot.title = element_blank())



dev.off()

#### FIGURE 3: CONCEALED GRAPHIC ####

png(here::here("Slow Reveal Recreations", "gannett-most-populous-states-12th-census", "recreated-imgs", "03_masked.png"),width=9468,height=6262)

data |> 
  ggplot() +
  geom_line(aes(x = -limits_val, y = -Rank2, group = State),
            linewidth = 2,
            alpha = 0.7) +
  lims(x = c(-13*2, 0)) + 
  emblem_placement + 
  geom_text(aes(x = -Census,
                y = -Rank,
                label = State),
            fontface = "bold",
            size = 40/.pt,
            alpha = 0,
            data = data |>
              filter(label == 1)) +
  geom_text(aes(x = -Census + 1,
                y = -Rank,
                label = State,
                hjust = 0),
            fontface = "bold",
            size = 40/.pt,
            alpha = 1,
            data = data |>
              filter(offset == "right",
                     Census == 2)) +
  geom_text(aes(x = -Census - 2,
                y = -Rank,
                label = State,
                hjust = 0),
            fontface = "bold",
            size = 40/.pt,
            alpha = 0,
            data = data |>
              filter(offset == "left")) +
  geom_text(aes(x = -x,
                y = y,
                label = label),
            fontface = "bold",
            size = 40/.pt,
            alpha = 0,
            data = text) +
  geom_text(aes(x = -x,
                y = ysub,
                label = sublabel),
            fontface = "bold",
            size = 40/.pt,
            alpha = 0,
            data = text) +
  geom_text(x = -12,
            y = 2.25,
            label = "9. RANK OF STATES AND TERRIRORIES AT EACH CENSUS: 1790 - 1890.",
            size = 88/.pt,
            alpha = 0) +
  geom_text(x = -1,
            y = 2.5,
            label = "PLATE 2.",
            size = 22/.pt) +
  geom_text(x = -1,
            y = -52,
            label = "JULIUS BIEN & CO. LITH. N. Y.",
            size = 22/.pt) +
  theme(line = element_blank(),
        panel.background = element_rect(fill = "#f1d9b5"),
        plot.background = element_rect(fill = "#f1d9b5"),
        plot.title = element_blank())



dev.off()

#### FIGURE 4: CONCEALED GRAPHIC ####

png(here::here("Slow Reveal Recreations", "gannett-most-populous-states-12th-census", "recreated-imgs", "04_masked.png"),width=9468,height=6262)

data |> 
  ggplot() +
  geom_line(aes(x = -limits_val, y = -Rank2, group = State),
            linewidth = 2,
            alpha = 0.7) +
  lims(x = c(-13*2, 0)) + 
  emblem_placement + 
  geom_text(aes(x = -Census,
                y = -Rank,
                label = State),
            fontface = "bold",
            size = 40/.pt,
            alpha = 0,
            data = data |>
              filter(label == 1)) +
  geom_text(aes(x = -Census + 1,
                y = -Rank,
                label = State,
                hjust = 0),
            fontface = "bold",
            size = 40/.pt,
            alpha = 1,
            data = data |>
              filter(offset == "right",
                     Census == 2)) +
  geom_text(aes(x = -Census - 2,
                y = -Rank,
                label = State,
                hjust = 0),
            fontface = "bold",
            size = 40/.pt,
            alpha = 0,
            data = data |>
              filter(offset == "left")) +
  geom_text(aes(x = -x,
                y = y,
                label = label),
            fontface = "bold",
            size = 40/.pt,
            alpha = 1,
            data = text) +
  geom_text(aes(x = -x,
                y = ysub,
                label = sublabel),
            fontface = "bold",
            size = 40/.pt,
            alpha = 1,
            data = text) +
  geom_text(x = -12,
            y = 2.25,
            label = "9. RANK OF STATES AND TERRIRORIES AT EACH CENSUS: 1790 - 1890.",
            size = 88/.pt,
            alpha = 0) +
  geom_text(x = -1,
            y = 2.5,
            label = "PLATE 2.",
            size = 22/.pt) +
  geom_text(x = -1,
            y = -52,
            label = "JULIUS BIEN & CO. LITH. N. Y.",
            size = 22/.pt) +
  theme(line = element_blank(),
        panel.background = element_rect(fill = "#f1d9b5"),
        plot.background = element_rect(fill = "#f1d9b5"),
        plot.title = element_blank())



dev.off()

#### FIGURE 5: CONCEALED GRAPHIC ####

png(here::here("Slow Reveal Recreations", "gannett-most-populous-states-12th-census", "recreated-imgs", "05_masked.png"),width=9468,height=6262)

data |> 
  ggplot() +
  geom_line(aes(x = -limits_val, y = -Rank2, group = State),
            linewidth = 2,
            alpha = 0.7) +
  lims(x = c(-13*2, 0)) + 
  emblem_placement + 
  geom_text(aes(x = -Census,
                y = -Rank,
                label = State),
            fontface = "bold",
            size = 40/.pt,
            alpha = 0,
            data = data |>
              filter(label == 1)) +
  geom_text(aes(x = -Census + 1,
                y = -Rank,
                label = State,
                hjust = 0),
            fontface = "bold",
            size = 40/.pt,
            alpha = 1,
            data = data |>
              filter(offset == "right",
                     Census == 2)) +
  geom_text(aes(x = -Census - 2,
                y = -Rank,
                label = State,
                hjust = 0),
            fontface = "bold",
            size = 40/.pt,
            alpha = 0,
            data = data |>
              filter(offset == "left")) +
  geom_text(aes(x = -x,
                y = y,
                label = label),
            fontface = "bold",
            size = 40/.pt,
            alpha = 1,
            data = text) +
  geom_text(aes(x = -x,
                y = ysub,
                label = sublabel),
            fontface = "bold",
            size = 40/.pt,
            alpha = 1,
            data = text) +
  geom_text(x = -12,
            y = 2.25,
            label = "9. RANK OF STATES AND TERRIRORIES AT EACH CENSUS: 1790 - 1890.",
            size = 88/.pt,
            alpha = 1) +
  geom_text(x = -1,
            y = 2.5,
            label = "PLATE 2.",
            size = 22/.pt) +
  geom_text(x = -1,
            y = -52,
            label = "JULIUS BIEN & CO. LITH. N. Y.",
            size = 22/.pt) +
  theme(line = element_blank(),
        panel.background = element_rect(fill = "#f1d9b5"),
        plot.background = element_rect(fill = "#f1d9b5"),
        plot.title = element_blank())



dev.off()

#### FIGURE 6: CONCEALED GRAPHIC ####

png(here::here("Slow Reveal Recreations", "gannett-most-populous-states-12th-census", "recreated-imgs", "06_masked.png"),width=9468,height=6262)

data |> 
  ggplot() +
  geom_line(aes(x = -limits_val, y = -Rank2, group = State),
            linewidth = 2,
            alpha = 0.7) +
  lims(x = c(-13*2, 0)) + 
  emblem_placement + 
  geom_text(aes(x = -Census,
                y = -Rank,
                label = State),
            fontface = "bold",
            size = 40/.pt,
            alpha = 0,
            data = data |>
              filter(label == 1)) +
  geom_text(aes(x = -Census + 1,
                y = -Rank,
                label = State,
                hjust = 0),
            fontface = "bold",
            size = 40/.pt,
            alpha = 1,
            data = data |>
              filter(offset == "right",
                     Census == 2)) +
  geom_text(aes(x = -Census - 2,
                y = -Rank,
                label = State,
                hjust = 0),
            fontface = "bold",
            size = 40/.pt,
            alpha = 1,
            data = data |>
              filter(offset == "left")) +
  geom_text(aes(x = -x,
                y = y,
                label = label),
            fontface = "bold",
            size = 40/.pt,
            alpha = 1,
            data = text) +
  geom_text(aes(x = -x,
                y = ysub,
                label = sublabel),
            fontface = "bold",
            size = 40/.pt,
            alpha = 1,
            data = text) +
  geom_text(x = -12,
            y = 2.25,
            label = "9. RANK OF STATES AND TERRIRORIES AT EACH CENSUS: 1790 - 1890.",
            size = 88/.pt,
            alpha = 1) +
  geom_text(x = -1,
            y = 2.5,
            label = "PLATE 2.",
            size = 22/.pt) +
  geom_text(x = -1,
            y = -52,
            label = "JULIUS BIEN & CO. LITH. N. Y.",
            size = 22/.pt) +
  theme(line = element_blank(),
        panel.background = element_rect(fill = "#f1d9b5"),
        plot.background = element_rect(fill = "#f1d9b5"),
        plot.title = element_blank())



dev.off()
