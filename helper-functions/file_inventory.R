#
# FILE:
#  file_inventory.R
#
# DESCRIPTION:
#
# R script for inventorying current files and their IDs
#
# AUTHORS:
#   Louis Cousino (main code)
#

library(tidyverse)

# Getting list of folders

folders <- list.dirs(here::here("Slow Reveal Recreations"),
                     recursive = FALSE) |> 
  as.data.frame()

files <- folders |> 
  map(~{
    tibble(
      files = list.files(.x, pattern = "recreate-id.txt", full.names = TRUE)
    )
  }) |> 
  bind_rows()

files <- files |> 
  rowwise() |>
  mutate(id = readLines(as.character(files), warn = FALSE),
         files = str_replace(files, "/recreate-id.txt", ""))
