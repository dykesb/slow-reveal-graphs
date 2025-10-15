#
# FILE:
#  alcohol_imports.R
#
# DESCRIPTION:
# Line chart from The Alcoholic Republic by W.J Rorabaugh showing imports per capita of rum, coffee, and tea in the US.
# 
# https://archive.org/details/alcoholicrepubli0000rora/page/100/mode/2up?q=101


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

data <- readxl::read_xlsx(here::here("Slow Reveal Recreations", "alcohol-imports", "data.xlsx"))

#### FIGURE N: RECREATED GRAPHIC

# Update "N" above once a slow-reveal order has been developed

png(here::here("Slow Reveal Recreations", "alcohol-imports", "recreated-imgs", "01-full.png"), width=848, height=746)

data |> 
  ggplot(aes(x = year)) + 
  geom_line(aes(y = rum),
            linewidth = 1.5,
            linetype = "dashed") +
  geom_line(aes(y = coffee),
            linewidth = 1.5,
            linetype = "solid") +
  geom_line(aes(y = tea),
            linewidth = 1.5,
            linetype = "dotted") +
  geom_rect(aes(xmin = 1790, xmax = 1850, ymin = 0, ymax = 6.4005),
            fill = NA, color = "black", linewidth = 1.05) +
  scale_x_continuous(breaks = seq(1790,1850,10),
                     minor_breaks = seq(1790,1850,10),
                     limits = c(1790,1850),
                     expand = expansion(mult = c(0,0))) +
  scale_y_continuous(breaks = seq(0.8,6.4,0.8),
                     limits = c(0, 6.4),
                     expand = expansion(mult = c(0,0)),
                     sec.axis = sec_axis(breaks = seq(0.2,1.6,0.2),
                                         name = "Gallons of Rum")) +
  labs(title = "WHISKEY FEED",
       x = "Chart 4.1. <b>NET IMPORTS<b/> per <b>CAPTIA<b/>",
       y = "Pounds of Tea and Coffee") +
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


dev.off()

source(here::here("helper-functions", "google_push.R"))

# Uploading to Google drive and updating the Google sheet.

data_literacy_upload("alcohol-import")

