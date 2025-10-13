#
# FILE:
# 1860_enslaved_persons_dist.R
#
# DESCRIPTION:
# This code is for the "Map showing the distribution of the slave population of the 
# southern states of the United States. Compiled from the census of 1860" The png shows the final recreated graph.  
# Source: https://www.loc.gov/resource/g3861e.cw0013200/
#
# SLOW REVEAL ORDER:
#   
#
# AUTHORS:
#   Louis Cousino (main code)

library(tidyverse)
library(sf)

data <- read_xlsx(here::here("Slow Reveal Recreations", "1860-enslaved-persons-dist","data","county_percentages.xlsx"))
shape_file <- read_xlsx(here::here("Slow Reveal Recreations", "1860-enslaved-persons-dist","data","us1860.shx"))

font_add_google(name = "Libre Baskerville", family = "Main")
showtext_auto()

#### FIGURE 01: FULLY UNMASKED ####

### Panel A ###

# png(here::here("Slow Reveal Recreations", "1860-enslaved-persons-dist", "recreated-imgs", "01_1860_enslaved_persons_dist.png"),width=900,height=900)
shape_file |> 
  mutate(centroids = st_centroid(geometry),
         label_x = st_coordinates(centroids)[ ,1],
         label_y = st_coordinates(centroids)[ ,2]) |> 
  filter(STATE %in% c("Maryland", "Kentucky", "Missouri", "North Carolina", "Tennessee","Virginia", "Arkansas", "South Carolina", "Georgia", "Alabama", "Mississippi", "Louisiana", "Florida", "Texas")) |> 
  ggplot() +
  geom_sf() +
  geom_text(aes(x = label_x, y = label_y, label = COUNTY))

# dev.off()

### Uploading Charts ###

source(here::here("helper-functions", "google_push.R"))

# data_literacy_upload("1860-enslaved-persons-dist")
