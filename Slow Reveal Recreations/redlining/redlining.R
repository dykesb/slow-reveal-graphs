#
# FILE:
#  redlining.R
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
library(ggrepel)
library(showtext)

redlining <- read_xlsx(here::here("redlining","redlining_data.xlsx"))

font_add_google(name = "Merriweather", family = "Merriweather")

font_add_google(name = "Prompt", family = "Prompt")

df <- redlining %>%
  slice(which.max(Year))

showtext_auto()

################# Part 1 #################

#recreating whole graph

fig06 <- ggplot(redlining, aes(x = Year, y = Percent, group = Group, color = Group)) + 
  geom_line(size = 0.6) + 
  geom_point(data = redlining %>% filter(Year == last(Year)), size = 1.6) +
  geom_text(data = redlining %>% filter(Year == last(Year)), aes(label = Group),
            color = "black", hjust = -1.5, size = 10) +
  scale_y_continuous(breaks = seq(0, 40, 10), limits = c(0, 46),
                     expand = c(0,0), labels = c("0", "10", "20", "30","40" = "40 % black")) + 
  scale_x_continuous(breaks = seq(1910, 2012, 10), expand = c(0,0)) + 
  scale_color_manual(values = c("#87bb5a", "#8ac1c2", "#e6d25b", "#ea9397")) +
  labs(title = "Redlined Neighborhoods Have the Highest\nShare of Black Residents", 
       subtitle = "D-rated neighborhoods were considered 'hazardous,' A-rated\nneighborhoods the 'best.'", 
       caption = "Data from 149 cities mapped by the Home Owners' Loan Corporation in the 1930s.\nSource: 'The Effects of the 1930s HOLC Redlining Maps' by D. Aaronson, D. Hartley, B. Mazumder") +
  theme_bw() + 
  theme(axis.ticks.y = element_blank(), 
        axis.ticks.length.x = unit(.20, "cm"), 
        axis.line.x = element_line(color = "black", linewidth = 0.3),
        axis.title = element_blank(),
        axis.text.y = element_text(hjust = 1, size = 30),
        axis.text.x = element_text(size = 25),
        panel.grid.minor = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.border = element_blank(), 
        plot.margin = margin(30,30,20,10), 
        plot.title = element_text(size = 40, vjust = 6, family = "Prompt", color = "#515151", lineheight = 0.5),
        plot.subtitle = element_text(family = "Merriweather", size = 30, 
                                     color = "#616161", vjust = 5, lineheight = 0.5),
        plot.caption = element_text(color = "#a3a3a3", hjust = 0, vjust = -3, size = 20, lineheight = 0.5),
        legend.position = "none") +
  coord_cartesian(clip = "off")

ggsave(here::here("redlining", "06_full_unmasked.png"), fig06)

