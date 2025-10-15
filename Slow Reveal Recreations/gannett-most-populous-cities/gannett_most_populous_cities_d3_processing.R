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


data <- readxl::read_excel(here::here("Slow Reveal Recreations", "gannett-most-populous-cities", "data.xlsx"))

cities_states <- read.csv(here::here("Slow Reveal Recreations", "gannett-most-populous-cities", "cities_states.csv"))

processed_data <- data |> 
  # filter(Census %in% c(1,2)) |> 
  mutate(City = str_to_lower(City),
         Census = Census * 2,
         right_lim = Census - 0.55,
         left_lim = Census + 0.55,
         Rank2 = Rank,
         xmin_grob = (Census + 0.7)*-1,
         xmax_grob = (Census - 0.7)*-1,
         ymin_grob = (Rank - 0.4)*-1,
         ymax_grob = (Rank + 0.4)*-1,
         raster_name = str_replace(str_to_lower(City), "[ .]+", "_"),
         City = case_when(City == "memphis_2" ~ "memphis",
                          TRUE ~ City),
         City = str_to_upper(City),
         toolcity = str_to_title(City),
         toolcensus = toOrdinal::toOrdinal(Census/2),
         toolrank = toOrdinal::toOrdinal(Rank))


processed_data <- processed_data |>
  left_join(cities_states, by = join_by("raster_name" == "city")) |> 
  arrange(City, Census) |> 
  group_by(City) |> 
  mutate(state = case_when(City == "MEMPHIS" ~ "TN",
                           TRUE ~ state),
         toolchange = lag(Rank) - Rank,
         firstcensus = min(Census/2),
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
  write_csv(here::here("Slow Reveal Recreations", "gannett-most-populous-cities", "D3 Files", "processed_data_v1.csv"))
