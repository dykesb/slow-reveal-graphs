#
# FILE:
#  file_move.R
#
# DESCRIPTION:
#
# R script for reorganizing slow-reveal file system. 
# This will be a one-off for updating the old repository.
#

# AUTHORS:
#   Louis Cousino (main code)
#
# Loading Libraries
library(tidyverse)
library(googledrive)
library(googlesheets4)

# Getting files from GitHub download.

recreated_folders <- list.dirs("C:/Users/Louis/Downloads/slow-reveal-graphs-main",
                               recursive = FALSE)

metadata <- data.frame(NA, NA)

colnames(metadata) <- c("folder", "ID")

# Creating a "recreated-imgs" folder

for (i in 1:length(recreated_folders)){
  
  if (dir.exists(str_c(as.character(recreated_folders[i]), "/recreated-imgs")) == FALSE){
    
    dir.create(str_c(as.character(recreated_folders[i]), "/recreated-imgs"))
    
  } else {
    
    print(as.character(recreated_folders[i]))
    
    warning("Folder already exists")
    
  }
  
  recreated_images <- list.files(as.character(recreated_folders[i])) |> 
    keep(~grepl("\\.png$", .x))
  
  # Moving recreated images to new folder
  
  for (j in 1:length(recreated_images)) {
    
    
    file.rename(from = str_c(as.character(recreated_folders[i]), "/",recreated_images[j]),
                to = str_c(as.character(recreated_folders[i]), "/recreated-imgs/",recreated_images[j]))
    
    
  }
  
  # Creating ID files
  
  
  if (file.exists(str_c(as.character(recreated_folders[i]), "/recreate-id.txt")) == FALSE){
    
    file.create(str_c(as.character(recreated_folders[i]), "/recreate-id.txt"))
    
    write(i, str_c(as.character(recreated_folders[i]), "/recreate-id.txt"))
    
  } else {
    
    print(as.character(recreated_folders[i]))
    
    warning("ID file already exists")
    
  }
  
  metadata <- metadata |> 
    add_row(
      
      folder = as.character(recreated_folders[i]),
      ID = as.numeric(i)
      
    )
  
  
}

source(here::here("helper-functions","google_push.R"))

files_to_push <- c(
  "1890-01-03-urban-pop",
  "1890-08-state-pop-density",
  "1890-21-state-urban-pop",
  "1890-22-census",
  "1890-26-people-per-family",
  "1890-34-total-pop-elements",
  "1890-35-state-members",
  "1890-36-city-members",
  "1890-37-state-foreign-pop",
  "1890-38-white-foreign-parentage",
  "1890-41-foreign-born-nativity",
  "1890-42-germanic-natives",
  "1890-43-ireland-natives",
  "1890-44-britain-natives",
  "1890-44-canada-natives",
  "1890-46-scandinavian-natives",
  "1890-47-slav-natives",
  "1890-48-latin-natives",
  "1890-51-foreign-big-cities",
  "1890-62-foreign-aliens",
  "1890-negro-pop-density",
  "1903-Census_Gannett-Bar-Density_Population_1700-1900",
  "1917-victory-map",
  "2015-pop-advisories",
  "agricultural-revolution",
  "animal-domestication",
  "Annual_Consumption_of_Alcohol",
  "archeology-domestication",
  "army-mortality-causes",
  "cholera-map",
  "co2-emissions",
  "consumption-mortality",
  "crimean-war-mortality",
  "crude-oil",
  "denmark-norway-imports",
  "detroit-pop",
  "dubois",
  "dubois-albany",
  "dubois-us-negroes",
  "education-funding",
  "eugenics",
  "europe-population",
  "gannett-census-pops",
  "gannett-negro-prop",
  "gannett-pop-density",
  "gannett-race-elements-total",
  "gannett-race-increase",
  "hull-house-map-combined",
  "hull-house-map1",
  "hull-house-wage",
  "important-legislation",
  "imports-exports",
  "iraqi-oil-exports",
  "iraqi-oil-types",
  "labor-force",
  "march-to-moscow",
  "may2020-unemployment-by-state",
  "migration-rate-maps",
  "napoleon-russia-invasion",
  "negro-illiteracy",
  "negro-pop-prop",
  "oil-production-goals",
  "pop-growth-density",
  "race-by-year-state",
  "race-pop-rates",
  "redlining",
  "rural-pop-rates",
  "slave-voyage",
  "special-requests",
  "St Louis Red Lining Table",
  "state-migration",
  "terrorism",
  "total-black-white-pop",
  "Total_and_Urban_Population_at_Each_Census_1790-1900",
  "tuberculosis-mortality",
  "tuberculosis-mortality-country",
  "tulsa-massacre",
  "type-region-migration",
  "us-fiscal",
  "usa-negro-mortality",
  "vote",
  "voting",
  "white-negro-elements",
  "women-suffrage-timeline",
  "world-geo-histogram"
)

files_uploaded <- data_literacy_upload(files_to_push)
