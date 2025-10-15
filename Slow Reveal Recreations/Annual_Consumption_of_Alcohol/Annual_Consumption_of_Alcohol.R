#
# FILE:
#  Annual_Consumption_of_Alcohol.R
#
# DESCRIPTION:
# Line chart from The Alcoholic Republic by W.J Rorabaugh showing the per capita consumption of alcohol in the US.
# 
# https://archive.org/details/alcoholicrepubli0000rora/page/8/mode/2up


# SLOW REVEAL ORDER:
#   1. 
#
# AUTHORS:
#   Louis Cousino (main code)
#   

library(tidyverse)
library(ggtext)
library(showtext)

font_add_google("Merriweather", "merriweather")
showtext_auto()

data <- readxl::read_xlsx(here::here("Slow Reveal Recreations", "Annual_Consumption_of_Alcohol", "data.xlsx"))

#### FIGURE N: RECREATED GRAPHIC

# Update "N" above once a slow-reveal order has been developed

png(here::here("Slow Reveal Recreations", "Annual_Consumption_of_Alcohol", "recreated-imgs", "full.png"), width=848, height=746)
dummy_plot <- data |> 
  ggplot(aes(x = year, y = total_abs)) + 
  geom_line(linewidth = 1.5,
            data = data |> 
              filter(year >= 1790)) +
  geom_line(linewidth = 1.5,
            linetype = "dashed",
            data = data |> 
              filter(year <= 1795)) +
  geom_rect(aes(xmin = 1710, xmax = 1975, ymin = 0, ymax = 5.0005),
            fill = NA, color = "black", linewidth = 1.05) +
  scale_x_continuous(breaks = seq(1720,1970,50),
                     minor_breaks = seq(1720,1970,10),
                     limits = c(1710,1975),
                     expand = expansion(mult = c(0,0))) +
  scale_y_continuous(breaks = seq(1,5,1),
                     limits = c(0,5.1),
                     expand = expansion(mult = c(0,0))) +
  labs(x = "Chart 1.2. <b>ANNUAL COMSUMPTION</b> of <b>ALCOHOL <br> CONTAINED </b> in <b>ALL ALCOHOLIC BEVERAGES </b> <br>per <b>CAPITA </b>, in <b>U.S. GALLONS. </b>") +
  guides(x = guide_axis(minor.ticks = TRUE)) +
  theme(axis.minor.ticks.length.x.bottom = unit(-15, "pt"),
        axis.text = element_text(size = 12),
        axis.text.x = element_text(margin = margin(t = 10)),
        axis.text.y = element_text(margin = margin(r = 10)),
        axis.ticks = element_line(linewidth = 1.05),
        axis.ticks.length = unit(-15, "pt"),
        axis.title.x = ggtext::element_markdown(size = 18, margin = margin(25)),
        axis.title.y = element_blank(),
        panel.background = element_blank(),
        plot.margin = margin(25,25,25,25),
        text = element_text(family = "merriweather"))

print(dummy_plot)

dev.off()

source(here::here("helper-functions", "google_push.R"))

# Uploading to Google drive and updating the Google sheet.

data_literacy_upload("Annual_Consumption_of_Alcohol")

