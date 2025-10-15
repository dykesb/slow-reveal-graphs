#
# FILE:
#  1903-Census_Gannett-Bar-Density_Population_1700-1900.R
#
# DESCRIPTION:
# Two graphs from the Statistical atlas of the United States, based upon the results of the eleventh census. One showing population density over the first 11 censuses, and another showing the urban vs total population over the first 11 censuses
# 
# https://fraser.stlouisfed.org/title/statistical-atlas-5588/population-574188


# SLOW REVEAL ORDER:
#   1. 
#
# AUTHORS:
#   Louis Cousino (main code)
#   

library(tidyverse)
library(cowplot)
library(ggtext)
library(showtext)

source(here::here("helper-functions", "gannett_theme.R"))

font_add_google(name = "Morticia NF ", family = "Morticia NF")
showtext_auto()

atlas <- readxl::read_xlsx(here::here("data", "Statistics_Atlas_17.xlsx"))

atlas <- atlas |> 
  mutate(Urban_Pop = case_when(is.na(Urban_Pop) == TRUE ~ 0,
                               TRUE ~ Urban_Pop),
         Urban_Pop = (Urban_Pop/8.86)*80,
         Pop_Density = (Pop_Density/2.875)*26,
         Urban_Pop_Prop = (Urban_Pop_Prop/3.89)*35,
         Year = as.character(Year),
         Total_Pop = ((Total_Pop/8.86)*80)-Urban_Pop)

#### FIGURE N: RECREATED GRAPHIC

# Update "N" above once a slow-reveal order has been developed
png(here::here("1903-Census_Gannett-Bar-Density_Population_1700-1900", "recreated-imgs", "full.png"), width=900, height=500)
atlas |> 
  ggplot(aes(y = fct_reorder(Year, as.numeric(Year), .desc = TRUE), x = Pop_Density)) +
  geom_col(color = "black", fill = "black",
           width = 0.5) +
  scale_x_continuous(breaks = seq(0,26,2), expand = expansion(mult = c(0,0)),
                     limits = c(0,26),
                     position = "top") +
  scale_y_discrete(expand = expansion(mult = c(0,0))) +
  labs(title = "2. DENSITY OF POPULATION AT EACH CENSUS.", 
       subtitle = "EXCLUDING ALASKA AND HAWAII",
       x = "MILLIONS", 
       y = "") +
  gannett_theme 
  # If original background color is desired:
  # theme(plot.background = element_rect(fill = "#ede0c1"))
dev.off()


#### FIGURE 1: 


