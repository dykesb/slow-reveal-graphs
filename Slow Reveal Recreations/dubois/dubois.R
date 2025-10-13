#
# FILE:
#  dubois.R
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
library(showtext)
library(forcats)
library(extrafont)
# font_import()
# loadfonts(device = "win")

dubois <- read_xlsx(here::here("dubois", "dubois_data.xlsx"))

# fac <- factor(dubois, levels = c("Virginia", "South Carolina", "Texas", "North Carolina", "Georgia", "Mississippi", "Tennessee", "Louisiana", "Arkansas"))

dubois$States <- as.factor(dubois$States)

font_add_google(name = "Jura", family = "Jura")

font_add_google(name = "Merriweather", family = "Merriweather")

df <- filter(dubois, Category == "OWNERS")

showtext_auto()

## FIGURE 5: RECREATED GRAPHIC

#recreating whole graph
fig05 <- ggplot(dubois, aes(x = Percent, y = fct_rev(fct_inorder(States)), fill = Category)) + 
  geom_col(color = "#191713", width = 0.45) +  
  annotate("text", x = 95, y = 9, label = "27%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 8, label = "18%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 7, label = "22%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 6, label = "19%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 5, label = "12%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 4, label = "13%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 3, label = "20%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 2, label = "12%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 1, label = "21%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 90, y = 9.5, label = "OWNERS.", color = "#71614c", family = "Jura") +
  annotate("text", x = 50, y = 9.5, label = "TENANTS.", color = "#71614c", family = "Jura") +
  labs(title = "Negro landholders in various States of the United States.",
       subtitle = "Proprietaires fonciers Negres dans plusieurs Etats",
       tag = "Done by Atlanta University") +
  scale_x_reverse() +
  scale_fill_manual(values = c("#dbc7b4", "#191713")) +
  theme_bw() +
  theme(axis.text.x = element_blank(),
        axis.title.x = element_blank(), 
        axis.ticks.x = element_blank()) + 
  theme(axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(), 
        axis.text.y = element_text(family = "Merriweather", hjust = 0, size = 6, color = "#372811")) + 
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "#dbc7b4", color = "#dbc7b4"),
        plot.background = element_rect(fill = "#dbc7b4", color = "#dbc7b4"), 
        plot.title = element_text(family = "Merriweather", color = "#5e4b37", hjust = 0.5, vjust = 20, size = 12),
        plot.subtitle = element_text(family = "Merriweather", color = "#5e4b37", hjust = 0.5, vjust = 25, size = 8),
        plot.margin = margin(35,15,5,5),
        plot.tag = element_text(family = "Merriweather", color = "#5e4b37", hjust = -120, size = 6),
        plot.tag.position = "top",
        legend.position = "none") + 
  coord_cartesian(clip = "off")

ggsave(here::here("dubois", "fig05_full_unmasked.png"), fig05, width = 5, units = "in", scale = 0.6, device = "png")

## FIGURE 1: FULLY MASKED

#concealing everything
fig01 <- ggplot(dubois, aes(x = Percent, y = fct_rev(fct_inorder(States)), fill = Category)) + 
  geom_col(color = "#191713", width = 0.45) +  
  #annotate("text", x = 95, y = 9, label = "27%", size = 3.5, family = "Jura", color = "#71614c") +
  #annotate("text", x = 95, y = 8, label = "18%", size = 3.5, family = "Jura", color = "#71614c") +
  #annotate("text", x = 95, y = 7, label = "22%", size = 3.5, family = "Jura", color = "#71614c") +
  #annotate("text", x = 95, y = 6, label = "19%", size = 3.5, family = "Jura", color = "#71614c") +
  #annotate("text", x = 95, y = 5, label = "12%", size = 3.5, family = "Jura", color = "#71614c") +
  #annotate("text", x = 95, y = 4, label = "13%", size = 3.5, family = "Jura", color = "#71614c") +
  #annotate("text", x = 95, y = 3, label = "20%", size = 3.5, family = "Jura", color = "#71614c") +
  #annotate("text", x = 95, y = 2, label = "12%", size = 3.5, family = "Jura", color = "#71614c") +
  #annotate("text", x = 95, y = 1, label = "21%", size = 3.5, family = "Jura", color = "#71614c") +
  #annotate("text", x = 90, y = 9.5, label = "OWNERS.", color = "#71614c", family = "Jura") +
  #annotate("text", x = 50, y = 9.5, label = "TENANTS.", color = "#71614c", family = "Jura") +
  labs(title = " ",
       subtitle = " ",
       tag = " ") +
  scale_x_reverse() +
  scale_fill_manual(values = c("#dbc7b4", "#191713")) +
  theme_bw() +
  theme(axis.text.x = element_blank(),
        axis.title.x = element_blank(), 
        axis.ticks.x = element_blank()) + 
  theme(axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(), 
        axis.text.y = element_text(family = "Merriweather", hjust = 0, size = 6, color = "#dbc7b4")) + 
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "#dbc7b4", color = "#dbc7b4"),
        plot.background = element_rect(fill = "#dbc7b4", color = "#dbc7b4"), 
        plot.title = element_text(family = "Merriweather", color = "#5e4b37", hjust = 0.5, vjust = 20, size = 12),
        plot.subtitle = element_text(family = "Merriweather", color = "#5e4b37", hjust = 0.5, vjust = 25, size = 8),
        plot.margin = margin(35,15,5,5),
        plot.tag = element_text(family = "Merriweather", color = "#5e4b37", hjust = -120, size = 6),
        plot.tag.position = "top",
        legend.position = "none") + 
  coord_cartesian(clip = "off")

ggsave(here::here("dubois", "fig01_full_masked.png"), fig01, width = 5, units = "in", scale = 0.6, device = "png")

## FIGURE 2: PERCENTAGES UNMASKED

#revealing percentages
fig02 <- ggplot(dubois, aes(x = Percent, y = fct_rev(fct_inorder(States)), fill = Category)) + 
  geom_col(color = "#191713", width = 0.45) +  
  annotate("text", x = 95, y = 9, label = "27%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 8, label = "18%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 7, label = "22%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 6, label = "19%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 5, label = "12%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 4, label = "13%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 3, label = "20%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 2, label = "12%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 1, label = "21%", size = 3.5, family = "Jura", color = "#71614c") +
  #annotate("text", x = 90, y = 9.5, label = "OWNERS.", color = "#71614c", family = "Jura") +
  #annotate("text", x = 50, y = 9.5, label = "TENANTS.", color = "#71614c", family = "Jura") +
labs(title = " ",
     subtitle = " ",
     tag = " ") +
  scale_x_reverse() +
  scale_fill_manual(values = c("#dbc7b4", "#191713")) +
  theme_bw() +
  theme(axis.text.x = element_blank(),
        axis.title.x = element_blank(), 
        axis.ticks.x = element_blank()) + 
  theme(axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(), 
        axis.text.y = element_text(family = "Merriweather", hjust = 0, size = 6, color = "#dbc7b4")) + 
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "#dbc7b4", color = "#dbc7b4"),
        plot.background = element_rect(fill = "#dbc7b4", color = "#dbc7b4"), 
        plot.title = element_text(family = "Merriweather", color = "#5e4b37", hjust = 0.5, vjust = 20, size = 12),
        plot.subtitle = element_text(family = "Merriweather", color = "#5e4b37", hjust = 0.5, vjust = 25, size = 8),
        plot.margin = margin(35,15,5,5),
        plot.tag = element_text(family = "Merriweather", color = "#5e4b37", hjust = -120, size = 6),
        plot.tag.position = "top",
        legend.position = "none") + 
  coord_cartesian(clip = "off")

ggsave(here::here("dubois", "fig02_pct_unmasked.png"), fig02, width = 5, units = "in", scale = 0.6, device = "png")

## FIGURE 3: STATES UNMASKED

#revealing states
fig03 <- ggplot(dubois, aes(x = Percent, y = fct_rev(fct_inorder(States)), fill = Category)) + 
  geom_col(color = "#191713", width = 0.45) +  
  annotate("text", x = 95, y = 9, label = "27%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 8, label = "18%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 7, label = "22%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 6, label = "19%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 5, label = "12%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 4, label = "13%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 3, label = "20%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 2, label = "12%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 1, label = "21%", size = 3.5, family = "Jura", color = "#71614c") +
  #annotate("text", x = 90, y = 9.5, label = "OWNERS.", color = "#71614c", family = "Jura") +
  #annotate("text", x = 50, y = 9.5, label = "TENANTS.", color = "#71614c", family = "Jura") +
  labs(title = " ",
       subtitle = " ",
       tag = " ") +
  scale_x_reverse() +
  scale_fill_manual(values = c("#dbc7b4", "#191713")) +
  theme_bw() +
  theme(axis.text.x = element_blank(),
        axis.title.x = element_blank(), 
        axis.ticks.x = element_blank()) + 
  theme(axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(), 
        axis.text.y = element_text(family = "Merriweather", hjust = 0, size = 6, color = "#372811")) + 
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "#dbc7b4", color = "#dbc7b4"),
        plot.background = element_rect(fill = "#dbc7b4", color = "#dbc7b4"), 
        plot.title = element_text(family = "Merriweather", color = "#5e4b37", hjust = 0.5, vjust = 20, size = 12),
        plot.subtitle = element_text(family = "Merriweather", color = "#5e4b37", hjust = 0.5, vjust = 25, size = 8),
        plot.margin = margin(35,15,5,5),
        plot.tag = element_text(family = "Merriweather", color = "#5e4b37", hjust = -120, size = 6),
        plot.tag.position = "top",
        legend.position = "none") + 
  coord_cartesian(clip = "off")

ggsave(here::here("dubois", "fig03_states_masked.png"), fig03, width = 5, units = "in", scale = 0.6, device = "png")


## FIGURE 4: LABELS UNMASKED

#revealing tenants and owners labels
fig04 <- ggplot(dubois, aes(x = Percent, y = fct_rev(fct_inorder(States)), fill = Category)) + 
  geom_col(color = "#191713", width = 0.45) +  
  annotate("text", x = 95, y = 9, label = "27%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 8, label = "18%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 7, label = "22%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 6, label = "19%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 5, label = "12%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 4, label = "13%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 3, label = "20%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 2, label = "12%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 1, label = "21%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 90, y = 9.5, label = "OWNERS.", color = "#71614c", family = "Jura") +
  annotate("text", x = 50, y = 9.5, label = "TENANTS.", color = "#71614c", family = "Jura") +
  labs(title = " ",
       subtitle = " ",
       tag = " ") +
  scale_x_reverse() +
  scale_fill_manual(values = c("#dbc7b4", "#191713")) +
  theme_bw() +
  theme(axis.text.x = element_blank(),
        axis.title.x = element_blank(), 
        axis.ticks.x = element_blank()) + 
  theme(axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(), 
        axis.text.y = element_text(family = "Merriweather", hjust = 0, size = 6, color = "#372811")) + 
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "#dbc7b4", color = "#dbc7b4"),
        plot.background = element_rect(fill = "#dbc7b4", color = "#dbc7b4"), 
        plot.title = element_text(family = "Merriweather", color = "#5e4b37", hjust = 0.5, vjust = 20, size = 12),
        plot.subtitle = element_text(family = "Merriweather", color = "#5e4b37", hjust = 0.5, vjust = 25, size = 8),
        plot.margin = margin(35,15,5,5),
        plot.tag = element_text(family = "Merriweather", color = "#5e4b37", hjust = -120, size = 6),
        plot.tag.position = "top",
        legend.position = "none") + 
  coord_cartesian(clip = "off")

ggsave(here::here("dubois", "fig04_labels_unmasked.png"), fig04, width = 5, units = "in", scale = 0.6, device = "png")

