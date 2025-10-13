#
# FILE:
#  image_compare.R
#
# DESCRIPTION:
#
# R script comparing images from the old inventory of recreations and the
# current GIT repository.
#
# AUTHORS:
#   Louis Cousino (main code)
#

# Loading packages

library(tidyverse)
library(magick)
library(opencv)


# Enumerating images from the previous re-creations
previous <- list.files(here::here("Image compairson", "previous"), full.names = TRUE, recursive = TRUE) |> 
  as_tibble() |> 
  # filter(str_detect(value, "\\.png|\\.jpg")) |> 
  mutate(folder_path = str_replace(value, ".*previous", ""),
         parsed_path = str_extract_all(folder_path, "(?<=/)[^/]+(?=/?)"),
         no_of_child_levels = map(parsed_path, ~ length(.x)),
         folder = map(parsed_path, ~ .x[1]),
         folder = str_replace_all(folder, "-", " "),
         file = map(parsed_path, ~ .x[2])) |> 
  filter(no_of_child_levels < 3) |> # If a file is in the third level of a folder, then it is not the recreated image we're interested in.
  group_by(folder) |> 
  distinct(folder)

# Enumerating images from the current GIT repo and cleaning
current <- list.files(here::here("Slow Reveal Recreations"), full.names = TRUE, recursive = TRUE) |> 
  as_tibble() |> 
  filter(str_detect(value, "\\.png|\\.jpg")) |>
  mutate(number = str_pad(row_number(), width = 3, pad = "0"))

current <- current |> 
  mutate(path = str_extract_all(value, "(?<=/)[^/]+(?=/?)"),
         folder = map(path, ~ .x[length(.x) - 2]),
         folder = str_replace_all(folder, "-", " "),
         file = map(path, ~ .x[length(.x)]),
         ) |> 
  group_by(folder) |> 
  filter(str_detect(file, "full_unmasked|full_reveal")) |> 
  slice_head(n = 1) |> 
  ungroup()



list_to_bind <- list()

for (i in 1:nrow(current)) {
  
  list_to_bind[[i]] <- tibble(
    previous_folder = previous$folder,
    # previous_path = previous$value,
    # previous_number = previous$number,
    # current_path = rep(current$value[i], times = nrow(previous)),
    # current_number = rep(current$number[i], times = nrow(previous)),
    current_folder = rep(current$folder[i], times = nrow(previous)),
    # current_file = rep(current$file[i], times = nrow(previous)),
    match = 0,
    pct_match = 0
  )
  
}

examine <- list_to_bind |> 
  bind_rows()


for (i in 1:nrow(examine)) {
  
  count <- 0 # Setting initial match count to 0
  
  for (j in 1:(str_count(examine$previous_folder[i], boundary("word")))) {
    
    target_word <- str_extract_all(examine$previous_folder[i], boundary("word"))[[1]][j] # This parses the current string into its constituent words and then pulls them one at a time.
    
    if (str_detect(examine$current_folder[i], str_c("(?<!\\w)", target_word, "(?!\\w)")) == TRUE) {
      
      count <- count + 1
      
    }
    
  }
  
  examine$match[i] <- count
  examine$pct_match[i] <- count/(str_count(examine$previous_folder[i], boundary("word")))
  
}

examine_filtered <- examine |> 
  filter(pct_match >= 0.6) |> 
  mutate(folder_match = case_when(pct_match == 1 ~ "Y",
                                 TRUE ~ ""))

exact_match <- examine_filtered |> 
  filter(folder_match == "Y") |> 
  pull(current_folder) |> 
  as_tibble()

# Removing that matching folders from the overall list.

non_match <- examine |> 
  anti_join(exact_match, by = join_by("current_folder" == "value"))

non_match <- non_match |> 
  anti_join(exact_match, by = join_by("previous_folder" == "value"))

# Cleaning non-matching list

non_match <- non_match |> 
  select(ends_with("folder")) |> 
  pivot_longer(cols = everything()) |> 
  distinct(value, .keep_all = TRUE) |> 
  rename("source" = name,
         "folder" = value) |>
  mutate(source = str_replace_all(source, "_folder", "")) |> 
  arrange(source)

