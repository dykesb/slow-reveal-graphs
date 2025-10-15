#
# FILE:
#  image_inventory.R
#
# DESCRIPTION:
#
# R script for getting a list of all the images present in the "Slow Reveal" folder.
# The end goal is to identify each image against the "Graphics for R Recreation" spreadsheet.
#

# AUTHORS:
#   Louis Cousino (main code)
#

# Loading Libraries
library(tidyverse)
library(googledrive)
library(googlesheets4)

folders_keep <- drive_ls(as_id("1Go86WBzhvpVPcvMHJ1QO1EFbsnhEq_sN"), recursive = TRUE)

folders <- folders_keep |> 
  mutate(asset_type = map(row_number(), ~ folders_keep[[3]][[.x]][["mimeType"]])) |> 
  filter(str_detect(asset_type, "folder") == TRUE)

images <- folders_keep |> 
  mutate(asset_type = map(row_number(), ~ folders_keep[[3]][[.x]][["mimeType"]])) |> 
  filter(str_detect(asset_type, "image") == TRUE)

images <- images |> 
  mutate(parent_id = map(row_number(), ~ folders_keep[[3]][[.x]][["parents"]][[1]]),
         parent_name = map(parent_id, ~ as.list(drive_get(as_id(.x)))),
         parent_name = map(row_number(), ~ parent_name[[.x]][[3]][[1]][["name"]]))

download <- images |> 
  mutate(name = str_c(str_pad(row_number(), width = 3, pad = "0"), "_", name))

# Downloading images

for (i in 1:nrow(download)) {
  
  drive_download(as_id(download$id[i]), path = str_c(here::here("helper-functions", "compare_img"), "/", download$name[i]))
  
}
  

test <- drive_get(as_id("1Go86WBzhvpVPcvMHJ1QO1EFbsnhEq_sN"))
