#
# FILE:
#  detroit_pop.R
#
# DESCRIPTION:
#  Brief description of the plot, including original source/citation
#
# SLOW REVEAL ORDER:
#   1. List
#   2. Out
#   ...
#   n. Order
#
# AUTHORS:
#   Ellie (2021, main code)
#   Ian Curtis (2023, code to save plots)

library(tidyverse)
library(readxl)
library(scales)
library(grid)

#reading data in
detroit <- read_xlsx(here::here("detroit-pop", "detroit_pop_data.xlsx"))

## FIGURE 4: RECREATED GRAPHIC

#full graph

fig04 <- ggplot(detroit, aes(x = Year, y = Population)) + 
  geom_line(color = "#006ab5", size = 0.8) + 
  scale_y_continuous(breaks = seq(0, 1200000, 200000), limits = c(0, 1200000), 
                     expand = c(0.02,0), label = comma) +
  scale_x_continuous(breaks = seq(1990, 2015, 5), limits = c(1990, 2017), expand = c(0.02, 0)) + 
  labs(title = "Population of Detroit, 1990-2017", 
       y = " ", x = " ") + 
  theme_bw() + 
  theme(panel.border = element_blank()) + 
  theme(panel.grid.minor = element_blank()) + 
  theme(axis.ticks = element_blank()) + 
  theme(plot.title.position = "plot") + 
  theme(plot.title = element_text(size = 17, vjust = 2, hjust = 0.05)) + 
  theme(axis.text.y = element_text(color = "black")) + 
  theme(axis.text.x = element_text(color = "black", size = 10))

ggsave(here::here("detroit-pop", "fig04_full_unmasked.png"), fig04, device = "png")

## FIGURE 1: RECREATED GRAPHIC

#everything masked

fig01 <- ggplot(detroit, aes(x = Year, y = Population)) + 
  geom_line(color = "#006ab5", size = 0.8) + 
  scale_y_continuous(breaks = seq(0, 1200000, 200000), limits = c(0, 1200000), 
                     expand = c(0.02,0), label = comma) +
  scale_x_continuous(breaks = seq(1990, 2015, 5), limits = c(1990, 2017), expand = c(0.02, 0)) + 
  labs(title = " ", 
       y = " ", x = " ") + 
  theme_bw() + 
  theme(panel.border = element_blank()) + 
  theme(panel.grid.minor = element_blank()) + 
  theme(axis.ticks = element_blank()) + 
  theme(plot.title.position = "plot") + 
  theme(plot.title = element_text(size = 17, vjust = 2, hjust = 0.05)) + 
  theme(axis.text.y = element_text(color = "white")) + 
  theme(axis.text.x = element_text(color = "white"))

ggsave(here::here("detroit-pop", "fig01_full_masked.png"), fig01, device = "png")

## FIGURE 2: X-AXIS UNMASKED

#only x axis revealed

fig02 <- ggplot(detroit, aes(x = Year, y = Population)) + 
  geom_line(color = "#006ab5", size = 0.8) + 
  scale_y_continuous(breaks = seq(0, 1200000, 200000), limits = c(0, 1200000), 
                     expand = c(0.02,0), label = comma) +
  scale_x_continuous(breaks = seq(1990, 2015, 5), limits = c(1990, 2017), expand = c(0.02, 0)) + 
  labs(title = " ", 
       y = " ", x = " ") + 
  theme_bw() + 
  theme(panel.border = element_blank()) + 
  theme(panel.grid.minor = element_blank()) + 
  theme(axis.ticks = element_blank()) + 
  theme(plot.title.position = "plot") + 
  theme(plot.title = element_text(size = 17, vjust = 2, hjust = 0.05)) + 
  theme(axis.text.x = element_text(color = "black")) + 
  theme(axis.text.y = element_text(color = "white"))

ggsave(here::here("detroit-pop", "fig02_xaxis_unmasked.png"), fig02, device = "png")

## FIGURE 3: Y-AXIS UNMASKED

#x and y axis revealed

fig03 <- ggplot(detroit, aes(x = Year, y = Population)) + 
  geom_line(color = "#006ab5", size = 0.8) + 
  scale_y_continuous(breaks = seq(0, 1200000, 200000), limits = c(0, 1200000), 
                     expand = c(0.02,0), label = comma) +
  scale_x_continuous(breaks = seq(1990, 2015, 5), limits = c(1990, 2017), expand = c(0.02, 0)) + 
  labs(title = " ", 
       y = " ", x = " ") + 
  theme_bw() + 
  theme(panel.border = element_blank()) + 
  theme(panel.grid.minor = element_blank()) + 
  theme(axis.ticks = element_blank()) + 
  theme(plot.title.position = "plot") + 
  theme(plot.title = element_text(size = 17, vjust = 2, hjust = 0.05)) + 
  theme(axis.text.y = element_text(color = "black")) + 
  theme(axis.text.x = element_text(color = "black", size = 10))

ggsave(here::here("detroit-pop", "fig03_yaxis_unmasked.png"), fig03, device = "png")
