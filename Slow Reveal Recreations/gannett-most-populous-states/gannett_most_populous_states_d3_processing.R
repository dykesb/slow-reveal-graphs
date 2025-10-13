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


data <- readxl::read_excel(here::here("Slow Reveal Recreations", "gannett-most-populous-states", "data.xlsx"))

processed_data <- data |> 
  # filter(Census %in% c(1,2)) |> 
  mutate(State = str_replace(str_to_lower(State), "_", " "),
         x_place = Census * 2,
         right_lim = x_place - 0.55,
         left_lim = x_place + 0.55,
         Rank2 = Rank,
         xmin_grob = (x_place + 0.7)*-1,
         xmax_grob = (x_place - 0.7)*-1,
         ymin_grob = (Rank - 0.4)*-1,
         ymax_grob = (Rank + 0.4)*-1,
         raster_name = str_replace(str_to_lower(State), "[ .]+", "_"),
         State = (str_to_upper(State)))


processed_data <- processed_data |>
  mutate(toolState = case_when(State == "DISTRICT OF_COLUMBIA" ~ "District of Columbia",
                               TRUE ~ str_to_title(State)),
         toolcensus = toOrdinal::toOrdinal(Census),
         toolrank = toOrdinal::toOrdinal(Rank)) |> 
  arrange(State, Census) |> 
  group_by(State) |> 
  mutate(toolchange = lag(Rank) - Rank,
         firstcensus = min(Census),
         firstcensus = case_when(is.na(toolchange) == FALSE ~ str_c("<br>First Appearance: ", toOrdinal::toOrdinal(firstcensus), " Census"),
                                 TRUE ~ ""),
         toolchange = case_when(is.na(toolchange) == TRUE ~ "First Appearance",
                                TRUE ~ str_c("Rank Change from Last Census: ", toolchange)),
         tooltext = str_c("State: ", toolState, "<br>Census: ", toolcensus, "<br>Rank: ", toolrank, "<br>", toolchange, firstcensus)) |> 
  ungroup() |> 
  arrange(Census, Rank) |> 
  pivot_longer(cols = c(right_lim,left_lim),
               names_to = "limit",
               values_to = "limits_val")

processed_data |> 
  write_csv(here::here("Slow Reveal Recreations", "gannett-most-populous-states", "D3 Files", "processed_data_v1.csv"))
