#
# FILE:
#  eugenics.R
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

eugenics <- read_xlsx(here::here("eugenics","eugenics_data.xlsx")) %>% 
  mutate(Group = case_when(
    Percent <= 100 ~ 1,
    Percent <= 141 ~ 2,
    Percent <= 300 ~ 3,
    Percent > 300  ~ 4 
  ))

font_add_google(name = "IM Fell English", "IM Fell", db_cache = FALSE)

font_add_google(name = "Rajdhani", family = "Rajdhani")

font_add_google(name = "Romanesco", family = "Romanesco", db_cache = FALSE)

showtext_auto()

## FIGURE 9: RECREATED GRAPHIC

#recreating whole graph

fig09 <- ggplot(eugenics, aes(x = Percent, y = reorder(Country, -Percent))) + 
  geom_col(color = "white", fill = "#3a4247", width = 0.6,
           position = "dodge") + 
  geom_rect(ymin = 1.7, ymax = 2.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_rect(ymin = 0.7, ymax = 1.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_vline(xintercept = 100, linewidth = 0.2) +
  geom_text(aes(label = Label), size = 8, family = "IM Fell", fontface = "italic", hjust = -0.05, color = "#3a4247") + #keep size = 2 for when export image
  coord_cartesian(clip = "off") +
  scale_y_discrete(expand = c(0.03,0.03)) + 
  scale_x_continuous(breaks = seq(0,300,10), expand = c(0,0), labels = c("0", " ", "20", " ", "40", " ", "60", " ", "80", " ", "100", " ", "120", " ", "140", " ", "160", " ", "180", " ", "200", " ", "220", " ", "240", " ", "260", " ", "280", " ", "300"), sec.axis = dup_axis()) +
  labs(title = "ALL TYPES OF SOCIAL INADEQUACY", 
       subtitle = "Including feeblemindedness, insanity, crime, epilepsy, tuberculosis, blindness\ndeafness, deformity and dependency. Based on analysis of the popu-\nlation of 445 state and federal custodial institutions.",
       x = "Per cent of Quota Fulfillment", y = " ", tag = "Relative Social Inadequacy of the Several Nativity Groups \nand Immigrant Races in the United States") +
  theme_bw() + 
  theme(panel.border = element_blank()) + 
  theme(panel.grid = element_blank()) + 
  theme(axis.text.y = element_blank()) + 
  theme(axis.text.x = element_text(family = "IM Fell", size = 30)) +
  theme(axis.ticks.y = element_blank()) +
  theme(axis.ticks.length = unit(-0.05, "cm")) +
  theme(axis.line.x = element_line(color = "#3a4247", linewidth = 0.3)) + 
  theme(plot.subtitle = element_text(hjust = 0.5, vjust = 1.9, size = 30, family = "IM Fell", face = "italic", color = "#3a4247", lineheight = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5, family = "Rajdhani", face = "bold", size = 55, color = "#3a4247")) +
  theme(axis.title.x.bottom = element_blank()) + 
  theme(axis.title.x.top = element_text(hjust = -0.01, family = "IM Fell", face = "italic", size = 25, color = "#3a4247")) +
  theme(plot.tag.position = c(0.5, 1.1),
        plot.tag = element_text(size = 30, family = "IM Fell", face = "italic", vjust = 1, color = "#3a4247", lineheight = 0.5)) +
  theme(plot.margin = margin(60, 80, 30, 60)) + 
  theme(plot.background = element_rect(fill = "#eefaff", color = "#eefaff")) + 
  theme(panel.background = element_rect(fill = "#eefaff", color = "#eefaff"))

ggsave(here::here("eugenics", "09_full_unmasked.png"), fig09)

## FIGURE 1: FULLY MASKED

#concealing everything
fig01 <- ggplot(eugenics, aes(x = Percent, y = reorder(Country, -Percent))) + 
  geom_col(color = "white", fill = "#3a4247", width = 0.6,
           position = "dodge") + 
  geom_rect(ymin = 1.7, ymax = 2.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_rect(ymin = 0.7, ymax = 1.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_vline(xintercept = 100, linewidth = 0.2) +
  geom_text(aes(label = Label), size = 2, family = "IM Fell", fontface = "italic", hjust = -0.05, color = "#eefaff") + #keep size = 2 for when export image
  coord_cartesian(clip = "off") +
  scale_y_discrete(expand = c(0.03,0.03)) + 
  scale_x_continuous(breaks = seq(0,300,10), expand = c(0,0), labels = c("0", " ", "20", " ", "40", " ", "60", " ", "80", " ", "100", " ", "120", " ", "140", " ", "160", " ", "180", " ", "200", " ", "220", " ", "240", " ", "260", " ", "280", " ", "300"), sec.axis = dup_axis()) +
  labs(title = "ALL TYPES OF SOCIAL INADEQUACY", 
       subtitle = "Including feeblemindedness, insanity, crime, epilepsy, tuberculosis, blindness\ndeafness, deformity and dependency. Based on analysis of the popu-\nlation of 445 state and federal custodial institutions.",
       x = "Per cent of Quota Fulfillment", y = " ", tag = "Relative Social Inadequacy of the Several Nativity Groups \nand Immigrant Races in the United States") +
  theme_bw() + 
  theme(panel.border = element_blank()) + 
  theme(panel.grid = element_blank()) + 
  theme(axis.text.y = element_blank()) + 
  theme(axis.text.x = element_text(family = "IM Fell", color = "#eefaff", size = 30)) +
  theme(axis.ticks.y = element_blank()) +
  theme(axis.ticks.length = unit(-0.05, "cm")) +
  theme(axis.line.x = element_line(color = "#3a4247", linewidth = 0.3)) + 
  theme(plot.subtitle = element_text(hjust = 0.5, vjust = 1.9, size = 30, family = "IM Fell", face = "italic", color = "#eefaff", lineheight = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5, family = "Rajdhani", face = "bold", size = 55, color = "#eefaff")) +
  theme(axis.title.x.bottom = element_blank()) + 
  theme(axis.title.x.top = element_text(hjust = -0.01, family = "IM Fell", face = "italic", size = 25, color = "#eefaff")) +
  theme(plot.tag.position = c(0.5, 1.1),
        plot.tag = element_text(size = 30, family = "IM Fell", face = "italic", vjust = 0.7, color = "#eefaff", lineheight = 0.5)) +
  theme(plot.margin = margin(60, 80, 30, 60)) + 
  theme(plot.background = element_rect(fill = "#eefaff", color = "#eefaff")) + 
  theme(panel.background = element_rect(fill = "#eefaff", color = "#eefaff"))

ggsave(here::here("eugenics", "01_full_masked.png"), fig01)

## FIGURE 2: TITLE UNMASKED

#revealing title
fig02 <- ggplot(eugenics, aes(x = Percent, y = reorder(Country, -Percent))) + 
  geom_col(color = "white", fill = "#3a4247", width = 0.6,
           position = "dodge") + 
  geom_rect(ymin = 1.7, ymax = 2.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_rect(ymin = 0.7, ymax = 1.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_vline(xintercept = 100, linewidth = 0.2) +
  geom_text(aes(label = Label), size = 2.3, family = "IM Fell", fontface = "italic", hjust = -0.05, color = "#eefaff") + #keep size = 2 for when export image
  coord_cartesian(clip = "off") +
  scale_y_discrete(expand = c(0.03,0.03)) + 
  scale_x_continuous(breaks = seq(0,300,10), expand = c(0,0), labels = c("0", " ", "20", " ", "40", " ", "60", " ", "80", " ", "100", " ", "120", " ", "140", " ", "160", " ", "180", " ", "200", " ", "220", " ", "240", " ", "260", " ", "280", " ", "300"), sec.axis = dup_axis()) +
  labs(title = "ALL TYPES OF SOCIAL INADEQUACY", 
       subtitle = "Including feeblemindedness, insanity, crime, epilepsy, tuberculosis, blindness\ndeafness, deformity and dependency. Based on analysis of the popu-\nlation of 445 state and federal custodial institutions.",
       x = "Per cent of Quota Fulfillment", y = " ", tag = "Relative Social Inadequacy of the Several Nativity Groups \nand Immigrant Races in the United States") +
  theme_bw() + 
  theme(panel.border = element_blank()) + 
  theme(panel.grid = element_blank()) + 
  theme(axis.text.y = element_blank()) + 
  theme(axis.text.x = element_text(family = "IM Fell", color = "#eefaff", size = 30)) +
  theme(axis.ticks.y = element_blank()) +
  theme(axis.ticks.length = unit(-0.05, "cm")) +
  theme(axis.line.x = element_line(color = "#3a4247", linewidth = 0.3)) + 
  theme(plot.subtitle = element_text(hjust = 0.5, vjust = 1.9, size = 30, family = "IM Fell", face = "italic", color = "#eefaff")) +
  theme(plot.title = element_text(hjust = 0.5, family = "Rajdhani", face = "bold", size = 55, color = "#3a4247", lineheight = 0.5)) +
  theme(axis.title.x.bottom = element_blank()) + 
  theme(axis.title.x.top = element_text(hjust = -0.01, family = "IM Fell", face = "italic", size = 35, color = "#eefaff")) +
  theme(plot.tag.position = c(0.5, 1.1),
        plot.tag = element_text(size = 30, family = "IM Fell", face = "italic", vjust = 1.2, color = "#3a4247", lineheight = 0.5)) +
  theme(plot.margin = margin(60, 80, 30, 60)) + 
  theme(plot.background = element_rect(fill = "#eefaff", color = "#eefaff")) + 
  theme(panel.background = element_rect(fill = "#eefaff", color = "#eefaff"))

ggsave(here::here("eugenics", "02_title_unmasked.png"), fig02)

## FIGURE 3: SUBTITLE UNMASKED

#revealing subtitle
fig03 <- ggplot(eugenics, aes(x = Percent, y = reorder(Country, -Percent))) + 
  geom_col(color = "white", fill = "#3a4247", width = 0.6,
           position = "dodge") + 
  geom_rect(ymin = 1.7, ymax = 2.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_rect(ymin = 0.7, ymax = 1.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_vline(xintercept = 100, linewidth = 0.2) +
  geom_text(aes(label = Label), size = 2.3, family = "IM Fell", fontface = "italic", hjust = -0.05, color = "#eefaff") + #keep size = 2 for when export image
  coord_cartesian(clip = "off") +
  scale_y_discrete(expand = c(0.03,0.03)) + 
  scale_x_continuous(breaks = seq(0,300,10), expand = c(0,0), labels = c("0", " ", "20", " ", "40", " ", "60", " ", "80", " ", "100", " ", "120", " ", "140", " ", "160", " ", "180", " ", "200", " ", "220", " ", "240", " ", "260", " ", "280", " ", "300"), sec.axis = dup_axis()) +
  labs(title = "ALL TYPES OF SOCIAL INADEQUACY", 
       subtitle = "Including feeblemindedness, insanity, crime, epilepsy, tuberculosis, blindness\ndeafness, deformity and dependency. Based on analysis of the popu-\nlation of 445 state and federal custodial institutions.",
       x = "Per cent of Quota Fulfillment", y = " ", tag = "Relative Social Inadequacy of the Several Nativity Groups \nand Immigrant Races in the United States") +
  theme_bw() + 
  theme(panel.border = element_blank()) + 
  theme(panel.grid = element_blank()) + 
  theme(axis.text.y = element_blank()) + 
  theme(axis.text.x = element_text(family = "IM Fell", color = "#eefaff", size = 30)) +
  theme(axis.ticks.y = element_blank()) +
  theme(axis.ticks.length = unit(-0.05, "cm")) +
  theme(axis.line.x = element_line(color = "#3a4247", linewidth = 0.3)) + 
  theme(plot.subtitle = element_text(hjust = 0.5, vjust = 1.9, size = 30, family = "IM Fell", face = "italic", color = "#3a4247", lineheight = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5, family = "Rajdhani", face = "bold", size = 55, color = "#3a4247")) +
  theme(axis.title.x.bottom = element_blank()) + 
  theme(axis.title.x.top = element_text(hjust = -0.01, family = "IM Fell", face = "italic", size = 35, color = "#eefaff")) +
  theme(plot.tag.position = c(0.5, 1.1),
        plot.tag = element_text(size = 30, family = "IM Fell", face = "italic", vjust = 1.2, color = "#3a4247", lineheight = 0.5)) +
  theme(plot.margin = margin(60, 80, 30, 60)) + 
  theme(plot.background = element_rect(fill = "#eefaff", color = "#eefaff")) + 
  theme(panel.background = element_rect(fill = "#eefaff", color = "#eefaff"))

ggsave(here::here("eugenics", "03_subtitle_unmasked.png"), fig03)

## FIGURE 4: X-AXIS UNMASKED

#revealing x-axis
fig04 <- ggplot(eugenics, aes(x = Percent, y = reorder(Country, -Percent))) + 
  geom_col(color = "white", fill = "#3a4247", width = 0.6,
           position = "dodge") + 
  geom_rect(ymin = 1.7, ymax = 2.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_rect(ymin = 0.7, ymax = 1.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_vline(xintercept = 100, linewidth = 0.2) +
  geom_text(aes(label = Label), size = 2.3, family = "IM Fell", fontface = "italic", hjust = -0.05, color = "#eefaff") + #keep size = 2 for when export image
  coord_cartesian(clip = "off") +
  scale_y_discrete(expand = c(0.03,0.03)) + 
  scale_x_continuous(breaks = seq(0,300,10), expand = c(0,0), labels = c("0", " ", "20", " ", "40", " ", "60", " ", "80", " ", "100", " ", "120", " ", "140", " ", "160", " ", "180", " ", "200", " ", "220", " ", "240", " ", "260", " ", "280", " ", "300"), sec.axis = dup_axis()) +
  labs(title = "ALL TYPES OF SOCIAL INADEQUACY", 
       subtitle = "Including feeblemindedness, insanity, crime, epilepsy, tuberculosis, blindness\ndeafness, deformity and dependency. Based on analysis of the popu-\nlation of 445 state and federal custodial institutions.",
       x = "Per cent of Quota Fulfillment", y = " ", tag = "Relative Social Inadequacy of the Several Nativity Groups \nand Immigrant Races in the United States") +
  theme_bw() + 
  theme(panel.border = element_blank()) + 
  theme(panel.grid = element_blank()) + 
  theme(axis.text.y = element_blank()) + 
  theme(axis.text.x = element_text(family = "IM Fell", color = "#3a4247", size = 30)) +
  theme(axis.ticks.y = element_blank()) +
  theme(axis.ticks.length = unit(-0.05, "cm")) +
  theme(axis.line.x = element_line(color = "#3a4247", linewidth = 0.3)) + 
  theme(plot.subtitle = element_text(hjust = 0.5, vjust = 1.9, size = 30, family = "IM Fell", face = "italic", color = "#3a4247", lineheight = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5, family = "Rajdhani", face = "bold", size = 55, color = "#3a4247")) +
  theme(axis.title.x.bottom = element_blank()) + 
  theme(axis.title.x.top = element_text(hjust = -0.01, family = "IM Fell", face = "italic", size = 35, color = "#eefaff")) +
  theme(plot.tag.position = c(0.5, 1.1),
        plot.tag = element_text(size = 30, family = "IM Fell", face = "italic", vjust = 1.2, color = "#3a4247", lineheight = 0.5)) +
  theme(plot.margin = margin(60, 80, 30, 60)) + 
  theme(plot.background = element_rect(fill = "#eefaff", color = "#eefaff")) + 
  theme(panel.background = element_rect(fill = "#eefaff", color = "#eefaff"))

ggsave(here::here("eugenics", "04_xaxis_unmasked.png"), fig04)

## FIGURE 5: LABEL UNMASKED

#revealing per cent quota
fig05 <- ggplot(eugenics, aes(x = Percent, y = reorder(Country, -Percent))) + 
  geom_col(color = "white", fill = "#3a4247", width = 0.6,
           position = "dodge") + 
  geom_rect(ymin = 1.7, ymax = 2.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_rect(ymin = 0.7, ymax = 1.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_vline(xintercept = 100, linewidth = 0.2) +
  geom_text(aes(label = Label), size = 2.3, family = "IM Fell", fontface = "italic", hjust = -0.05, color = "#eefaff") + #keep size = 2 for when export image
  coord_cartesian(clip = "off") +
  scale_y_discrete(expand = c(0.03,0.03)) + 
  scale_x_continuous(breaks = seq(0,300,10), expand = c(0,0), labels = c("0", " ", "20", " ", "40", " ", "60", " ", "80", " ", "100", " ", "120", " ", "140", " ", "160", " ", "180", " ", "200", " ", "220", " ", "240", " ", "260", " ", "280", " ", "300"), sec.axis = dup_axis()) +
  labs(title = "ALL TYPES OF SOCIAL INADEQUACY", 
       subtitle = "Including feeblemindedness, insanity, crime, epilepsy, tuberculosis, blindness\ndeafness, deformity and dependency. Based on analysis of the popu-\nlation of 445 state and federal custodial institutions.",
       x = "Per cent of Quota Fulfillment", y = " ", tag = "Relative Social Inadequacy of the Several Nativity Groups \nand Immigrant Races in the United States") +
  theme_bw() + 
  theme(panel.border = element_blank()) + 
  theme(panel.grid = element_blank()) + 
  theme(axis.text.y = element_blank()) + 
  theme(axis.text.x = element_text(family = "IM Fell", color = "#3a4247", linewidth = 30)) +
  theme(axis.ticks.y = element_blank()) +
  theme(axis.ticks.length = unit(-0.05, "cm")) +
  theme(axis.line.x = element_line(color = "#3a4247", linewidth = 0.3, size = 30)) + 
  theme(plot.subtitle = element_text(hjust = 0.5, vjust = 1.9, size = 30, family = "IM Fell", face = "italic", color = "#3a4247", lineheight = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5, family = "Rajdhani", face = "bold", size = 55, color = "#3a4247")) +
  theme(axis.title.x.bottom = element_blank()) + 
  theme(axis.title.x.top = element_text(hjust = -0.01, family = "IM Fell", face = "italic", size = 35, color = "#3a4247")) +
  theme(plot.tag.position = c(0.5, 1.1),
        plot.tag = element_text(size = 30, family = "IM Fell", face = "italic", vjust = 1.2, color = "#3a4247", lineheight = 0.5)) +
  theme(plot.margin = margin(60, 80, 30, 60)) + 
  theme(plot.background = element_rect(fill = "#eefaff", color = "#eefaff")) + 
  theme(panel.background = element_rect(fill = "#eefaff", color = "#eefaff"))

ggsave(here::here("eugenics", "05_quota_unmasked.png"), fig05)

## FIGURE 6: COUNTRIES GROUP 1 UNMASKED

#revealing first group of countries
fig06 <- ggplot(eugenics, aes(x = Percent, y = reorder(Country, -Percent))) + 
  geom_col(color = "white", fill = "#3a4247", width = 0.6,
           position = "dodge") + 
  geom_rect(ymin = 1.7, ymax = 2.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_rect(ymin = 0.7, ymax = 1.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_vline(xintercept = 100, linewidth = 0.2) +
  geom_text(data = eugenics %>% filter(Group == 1), aes(label = Label), size = 8, family = "IM Fell", fontface = "italic", hjust = -0.05, color = "#3a4247") + #keep size = 2 for when export image
  coord_cartesian(clip = "off") +
  scale_y_discrete(expand = c(0.03,0.03)) + 
  scale_x_continuous(breaks = seq(0,300,10), expand = c(0,0), labels = c("0", " ", "20", " ", "40", " ", "60", " ", "80", " ", "100", " ", "120", " ", "140", " ", "160", " ", "180", " ", "200", " ", "220", " ", "240", " ", "260", " ", "280", " ", "300"), sec.axis = dup_axis()) +
  labs(title = "ALL TYPES OF SOCIAL INADEQUACY", 
       subtitle = "Including feeblemindedness, insanity, crime, epilepsy, tuberculosis, blindness\ndeafness, deformity and dependency. Based on analysis of the popu-\nlation of 445 state and federal custodial institutions.",
       x = "Per cent of Quota Fulfillment", y = " ", tag = "Relative Social Inadequacy of the Several Nativity Groups \nand Immigrant Races in the United States") +
  theme_bw() + 
  theme(panel.border = element_blank()) + 
  theme(panel.grid = element_blank()) + 
  theme(axis.text.y = element_blank()) + 
  theme(axis.text.x = element_text(family = "IM Fell", size = 30)) +
  theme(axis.ticks.y = element_blank()) +
  theme(axis.ticks.length = unit(-0.05, "cm")) +
  theme(axis.line.x = element_line(color = "#3a4247", linewidth = 0.3)) + 
  theme(plot.subtitle = element_text(hjust = 0.5, vjust = 1.9, size = 30, family = "IM Fell", face = "italic", color = "#3a4247", lineheight = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5, family = "Rajdhani", face = "bold", size = 55, color = "#3a4247")) +
  theme(axis.title.x.bottom = element_blank()) + 
  theme(axis.title.x.top = element_text(hjust = -0.01, family = "IM Fell", face = "italic", size = 35, color = "#3a4247")) +
  theme(plot.tag.position = c(0.5, 1.1),
        plot.tag = element_text(size = 30, family = "IM Fell", face = "italic", vjust = 1.2, color = "#3a4247", lineheight = 0.5)) +
  theme(plot.margin = margin(60, 80, 30, 60)) + 
  theme(plot.background = element_rect(fill = "#eefaff", color = "#eefaff")) + 
  theme(panel.background = element_rect(fill = "#eefaff", color = "#eefaff"))

ggsave(here::here("eugenics", "06_group1_unmasked.png"), fig06)

## FIGURE 7: COUNTRIES GROUP 2 UNMASKED

#revealing first and second groups of countries
fig07 <- ggplot(eugenics, aes(x = Percent, y = reorder(Country, -Percent))) + 
  geom_col(color = "white", fill = "#3a4247", width = 0.6,
           position = "dodge") + 
  geom_rect(ymin = 1.7, ymax = 2.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_rect(ymin = 0.7, ymax = 1.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_vline(xintercept = 100, linewidth = 0.2) +
  geom_text(data = eugenics %>% filter(Group <= 2), aes(label = Label), size = 8, family = "IM Fell", fontface = "italic", hjust = -0.05, color = "#3a4247") + #keep size = 2 for when export image
  coord_cartesian(clip = "off") +
  scale_y_discrete(expand = c(0.03,0.03)) + 
  scale_x_continuous(breaks = seq(0,300,10), expand = c(0,0), labels = c("0", " ", "20", " ", "40", " ", "60", " ", "80", " ", "100", " ", "120", " ", "140", " ", "160", " ", "180", " ", "200", " ", "220", " ", "240", " ", "260", " ", "280", " ", "300"), sec.axis = dup_axis()) +
  labs(title = "ALL TYPES OF SOCIAL INADEQUACY", 
       subtitle = "Including feeblemindedness, insanity, crime, epilepsy, tuberculosis, blindness\ndeafness, deformity and dependency. Based on analysis of the popu-\nlation of 445 state and federal custodial institutions.",
       x = "Per cent of Quota Fulfillment", y = " ", tag = "Relative Social Inadequacy of the Several Nativity Groups \nand Immigrant Races in the United States") +
  theme_bw() + 
  theme(panel.border = element_blank()) + 
  theme(panel.grid = element_blank()) + 
  theme(axis.text.y = element_blank()) + 
  theme(axis.text.x = element_text(family = "IM Fell", size = 30)) +
  theme(axis.ticks.y = element_blank()) +
  theme(axis.ticks.length = unit(-0.05, "cm")) +
  theme(axis.line.x = element_line(color = "#3a4247", linewidth = 0.3)) + 
  theme(plot.subtitle = element_text(hjust = 0.5, vjust = 1.9, size = 30, family = "IM Fell", face = "italic", color = "#3a4247", lineheight = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5, family = "Rajdhani", face = "bold", size = 55, color = "#3a4247")) +
  theme(axis.title.x.bottom = element_blank()) + 
  theme(axis.title.x.top = element_text(hjust = -0.01, family = "IM Fell", face = "italic", size = 35, color = "#3a4247")) +
  theme(plot.tag.position = c(0.5, 1.1),
        plot.tag = element_text(size = 30, family = "IM Fell", face = "italic", vjust = 1.2, color = "#3a4247", lineheight = 0.5)) +
  theme(plot.margin = margin(60, 80, 30, 60)) + 
  theme(plot.background = element_rect(fill = "#eefaff", color = "#eefaff")) + 
  theme(panel.background = element_rect(fill = "#eefaff", color = "#eefaff"))

ggsave(here::here("eugenics", "07_group2_unmasked.png"), fig07)

## FIGURE 8: COUNTRIES GROUP 3 UNMASKED

#revealing first, second, and third groups of countries
fig08 <- ggplot(eugenics, aes(x = Percent, y = reorder(Country, -Percent))) + 
  geom_col(color = "white", fill = "#3a4247", width = 0.6,
           position = "dodge") + 
  geom_rect(ymin = 1.7, ymax = 2.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_rect(ymin = 0.7, ymax = 1.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_vline(xintercept = 100, linewidth = 0.2) +
  geom_text(data = eugenics %>% filter(Group <= 3), aes(label = Label), size = 8, family = "IM Fell", fontface = "italic", hjust = -0.05, color = "#3a4247") + #keep size = 2 for when export image
  coord_cartesian(clip = "off") +
  scale_y_discrete(expand = c(0.03,0.03)) + 
  scale_x_continuous(breaks = seq(0,300,10), expand = c(0,0), labels = c("0", " ", "20", " ", "40", " ", "60", " ", "80", " ", "100", " ", "120", " ", "140", " ", "160", " ", "180", " ", "200", " ", "220", " ", "240", " ", "260", " ", "280", " ", "300"), sec.axis = dup_axis()) +
  labs(title = "ALL TYPES OF SOCIAL INADEQUACY", 
       subtitle = "Including feeblemindedness, insanity, crime, epilepsy, tuberculosis, blindness\ndeafness, deformity and dependency. Based on analysis of the popu-\nlation of 445 state and federal custodial institutions.",
       x = "Per cent of Quota Fulfillment", y = " ", tag = "Relative Social Inadequacy of the Several Nativity Groups \nand Immigrant Races in the United States") +
  theme_bw() + 
  theme(panel.border = element_blank()) + 
  theme(panel.grid = element_blank()) + 
  theme(axis.text.y = element_blank()) + 
  theme(axis.text.x = element_text(family = "IM Fell", size = 30)) +
  theme(axis.ticks.y = element_blank()) +
  theme(axis.ticks.length = unit(-0.05, "cm")) +
  theme(axis.line.x = element_line(color = "#3a4247", linewidth = 0.3)) + 
  theme(plot.subtitle = element_text(hjust = 0.5, vjust = 1.9, size = 30, family = "IM Fell", face = "italic", color = "#3a4247", lineheight = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5, family = "Rajdhani", face = "bold", size = 55, color = "#3a4247")) +
  theme(axis.title.x.bottom = element_blank()) + 
  theme(axis.title.x.top = element_text(hjust = -0.01, family = "IM Fell", face = "italic", size = 35, color = "#3a4247")) +
  theme(plot.tag.position = c(0.5, 1.1),
        plot.tag = element_text(size = 30, family = "IM Fell", face = "italic", vjust = 1.2, color = "#3a4247", lineheight = 0.5)) +
  theme(plot.margin = margin(60, 80, 30, 60)) + 
  theme(plot.background = element_rect(fill = "#eefaff", color = "#eefaff")) + 
  theme(panel.background = element_rect(fill = "#eefaff", color = "#eefaff"))

ggsave(here::here("eugenics", "08_group3_unmasked.png"), fig08)
