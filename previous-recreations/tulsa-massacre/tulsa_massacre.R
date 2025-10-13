#
# FILE:
#  tulsa_massacre.R
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

library(magick)
library(tidyverse)
library(readxl)
library(aptheme)
library(scales)
# library(extrafont)
# font_import()
# loadfonts()

tulsa <- read_xlsx(here::here("tulsa-massacre", "tulsa_massacre_data.xlsx"))

tulsa_low <- filter(tulsa, Loss == 444000, Type == "PRESENT-DAY VALUE")

tulsa_high <- filter(tulsa, Loss > 500000)

tulsa_rest <- filter(tulsa, Loss > 29000, Type == "LOSSES")

dat <- data.frame(y = letters[1:10], x = 1:10) #assigns numerical values to categorical y var

name_label <- data.frame(Type = c("LOSSES"), label = c("NAME")) #sets up NAME label

tulsa <- tulsa %>% mutate(Name = fct_reorder(Name, Loss))

ggplot(tulsa, aes(x = Loss, y = reorder(Name, Loss))) + 
  geom_col(data = tulsa, aes(x = Background, y = reorder(Name, Background)), color = "#e5e5e5", fill = "#e5e5e5", width = 0.5) +
  geom_col(color = "#ffd8a2", fill = "#ffd8a2", width = 0.5) + 
  #annotate("segment", x = -Inf, xend = Inf, y = Inf, yend = Inf) +
  geom_text(data = tulsa_high, aes(label = dollar(Loss)), family = "URWGothic", size = 3, hjust = 1.1) +
  geom_text(data = tulsa_low, aes(label = dollar(Loss)), family = "URWGothic", size = 3, hjust = -0.12) +
  geom_text(data = tulsa_rest, aes(label = dollar(Loss)), family = "URWGothic", size = 3, hjust = 1.1) +
  labs(title = " ", subtitle = " ", y = " ", tag = "NAME", caption = ' ') + #tag adds the name label
  facet_wrap(~ Type, scales = "free_x") + 
  scale_y_discrete(labels = c("Elliott & Hooker, Clothiers and Dry Goods" = "Elliott & Hooker, Clothiers and Dry\nGoods")) +
  theme_bw() +
  theme_ap() +
  theme(plot.title = element_text(size = 15, face = "bold", vjust = 7.5, family = "URWGothic", hjust = -0.81)) +
  theme(plot.subtitle = element_text(vjust = 9, hjust = 2.2, size = 10, family = "URWGothic")) + 
  theme(plot.caption = element_text(family = "URWGothic", hjust = -2.18, vjust = -1.9)) +
  theme(plot.margin = margin(30, 10, 30, 0)) +
  theme(plot.background = element_rect(fill = "#f5f5f5", color = "#f5f5f5")) + 
  theme(plot.tag.position = c(0.043,0.87)) + #adjusts the horizontal and vertical position of the tag (name)
  theme(plot.tag = element_text(size = 10, family = "URWGothic")) + #adjusts the physical appearance of the tag
  theme(axis.ticks = element_blank()) + 
  theme(axis.text.x = element_blank()) +
  theme(axis.text.y = element_text(hjust = 0, color = "black", family = "URWGothic")) +
  theme(axis.title.x = element_blank()) + 
  theme(panel.border = element_blank()) + 
  theme(panel.grid.major = element_blank()) + 
  theme(strip.background = element_blank()) + 
  theme(strip.text = element_text(size = 10, family = "URWGothic", color = "black", hjust = 0.02, vjust = 2)) + 
  geom_hline(yintercept = 1.5, color = "#e5e5e5", linewidth = 0.5, linetype = "dotted") + #all of these add dotted lines at the specified y values
  geom_hline(yintercept = 2.5, color = "#e5e5e5", linewidth = 0.5, linetype = "dotted") +
  geom_hline(yintercept = 3.5, color = "#e5e5e5", linewidth = 0.5, linetype = "dotted") + 
  geom_hline(yintercept = 4.5, color = "#e5e5e5", linewidth = 0.5, linetype = "dotted") +
  geom_hline(yintercept = 5.5, color = "#e5e5e5", linewidth = 0.5, linetype = "dotted") + 
  geom_hline(yintercept = 6.5, color = "#e5e5e5", linewidth = 0.5, linetype = "dotted") + 
  geom_hline(yintercept = 7.5, color = "#e5e5e5", linewidth = 0.5, linetype = "dotted") + 
  geom_hline(yintercept = 8.5, color = "#e5e5e5", linewidth = 0.5, linetype = "dotted") + 
  geom_hline(yintercept = 9.5, color = "#e5e5e5", linewidth = 0.5, linetype = "dotted") + 
  geom_hline(yintercept = 10.5, color = "black", linewidth = 0.3) + 
  coord_cartesian(clip = "off")

ggsave("fig01_full_unmasked.png")