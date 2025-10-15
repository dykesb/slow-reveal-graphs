#
# FILE:
# gannett_most_populous_cities_d3_processing.R
#
# DESCRIPTION:
# This code provides the processing for the data used in creating the D3 interactive graphic.


#
# AUTHORS:
#   Louis Cousino (2025, main code)


library(tidyverse)


data <- readxl::read_excel(here::here("Slow Reveal Recreations", "gannett-most-populous-cities-12th-census", "data.xlsx"))

cities_states <- read.csv(here::here("Slow Reveal Recreations", "gannett-most-populous-cities-12th-census", "cities_states.csv"))


processed_data <- data |> 
  # filter(Census %in% c(1,2)) |> 
  mutate(City = str_to_lower(City),
         City = str_replace(City, "_\\d$", ""),
         x_place = Census * 1.85,
         right_lim = x_place - 0.55,
         left_lim = x_place + 0.55,
         Rank2 = Rank,
         xmin_grob = (x_place + 0.7)*-1,
         xmax_grob = (x_place - 0.7)*-1,
         ymin_grob = (Rank - 0.4)*-1,
         ymax_grob = (Rank + 0.4)*-1,
         raster_name = str_replace(str_to_lower(City), "[ .]+", "_"),
         City = str_to_upper(City))


processed_data <- processed_data |>
  left_join(cities_states, by = join_by("raster_name" == "city")) |> 
  mutate(City = case_when(City == "PORTLAND OREGON" ~ "PORTLAND",
                     TRUE ~ City),
         toolcity = str_to_title(City),
         toolcensus = toOrdinal::toOrdinal(Census),
         toolrank = toOrdinal::toOrdinal(Rank)) |> 
  arrange(City, Census) |> 
  group_by(City) |> 
  mutate(toolchange = lag(Rank) - Rank,
         firstcensus = min(Census),
         firstcensus = case_when(is.na(toolchange) == FALSE ~ str_c("<br>First Appearance: ", toOrdinal::toOrdinal(firstcensus), " Census"),
                                 TRUE ~ ""),
         toolchange = case_when(is.na(toolchange) == TRUE ~ "First Appearance",
                                TRUE ~ str_c("Rank Change from Last Census: ", toolchange)),
         tooltext = str_c("City: ", toolcity, ", ", state, "<br>Census: ", toolcensus, "<br>Rank: ", toolrank, "<br>", toolchange, firstcensus)) |> 
  ungroup() |> 
  arrange(Census, Rank) |> 
  pivot_longer(cols = c(right_lim,left_lim),
               names_to = "limit",
               values_to = "limits_val")

processed_data |> 
  write_csv(here::here("Slow Reveal Recreations", "gannett-most-populous-cities-12th-census", "D3 Files", "processed_data_v2.csv"))
