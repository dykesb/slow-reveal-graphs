library(tidyverse)
library(readxl)
library(scales)
library(grid)
library(ggrepel)
library(showtext)

eugenics <- read_xlsx(here::here("Everything","Eugenics_Graph","EugenicsData.xlsx"))

font_add_google(name = "IM Fell English", "IM Fell", db_cache = FALSE)

font_add_google(name = "Rajdhani", family = "Rajdhani")

font_add_google(name = "Romanesco", family = "Romanesco", db_cache = FALSE)

showtext_auto()

df1 <- data.frame(Label = c("SWITZERLAND", "JAPAN", "NATIVE WHITE, BOTH PARENTS NATIVE BORN",
        "AMERICAN NEGRO", "AUSTRIA-HUNGARY", "UNITED STATES, ALL NATIVE-BORN REGARDLESS OF RACE AND COLOR", 
        "CANADA", "RUMANIA"))

################# Part 1 #################

#recreating whole graph

ggplot(eugenics, aes(x = Percent, y = reorder(Country, -Percent))) + 
  geom_col(color = "white", fill = "#3a4247", width = 0.6,
           position = "dodge") + 
  geom_rect(ymin = 1.7, ymax = 2.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_rect(ymin = 0.7, ymax = 1.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_vline(xintercept = 100, size = 0.2) +
  geom_text(aes(label = Label), size = 2.3, family = "IM Fell", fontface = "italic", hjust = -0.05, color = "#3a4247") + #keep size = 2 for when export image
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
  theme(axis.text.x = element_text(family = "IM Fell")) +
  theme(axis.ticks.y = element_blank()) +
  theme(axis.ticks.length = unit(-0.05, "cm")) +
  theme(axis.line.x = element_line(color = "#3a4247", size = 0.3)) + 
  theme(plot.subtitle = element_text(hjust = 0.5, vjust = 1.9, size = 8, family = "IM Fell", face = "italic", color = "#3a4247")) +
  theme(plot.title = element_text(vjust = 1.5, family = "Rajdhani", face = "bold", size = 20, color = "#3a4247")) +
  theme(axis.title.x.bottom = element_blank()) + 
  theme(axis.title.x.top = element_text(hjust = -0.01, family = "IM Fell", face = "italic", size = 8, color = "#3a4247")) +
  theme(plot.tag.position = c(0.5, 1.1),
        plot.tag = element_text(size = 10, family = "IM Fell", face = "italic", vjust = 2.1, color = "#3a4247")) +
  theme(plot.margin = margin(60, 80, 30, 80)) + 
  theme(plot.background = element_rect(fill = "#eefaff", color = "#eefaff")) + 
  theme(panel.background = element_rect(fill = "#eefaff", color = "#eefaff"))

################# Part 2 #################

#concealing everything
ggplot(eugenics, aes(x = Percent, y = reorder(Country, -Percent))) + 
  geom_col(color = "white", fill = "#3a4247", width = 0.6,
           position = "dodge") + 
  geom_rect(ymin = 1.7, ymax = 2.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_rect(ymin = 0.7, ymax = 1.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_vline(xintercept = 100, size = 0.2) +
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
  theme(axis.text.x = element_text(family = "IM Fell", color = "#eefaff")) +
  theme(axis.ticks.y = element_blank()) +
  theme(axis.ticks.length = unit(-0.05, "cm")) +
  theme(axis.line.x = element_line(color = "#3a4247", size = 0.3)) + 
  theme(plot.subtitle = element_text(hjust = 0.5, vjust = 1.9, size = 8, family = "IM Fell", face = "italic", color = "#eefaff")) +
  theme(plot.title = element_text(vjust = 1.5, family = "Rajdhani", face = "bold", size = 20, color = "#eefaff")) +
  theme(axis.title.x.bottom = element_blank()) + 
  theme(axis.title.x.top = element_text(hjust = -0.01, family = "IM Fell", face = "italic", size = 8, color = "#eefaff")) +
  theme(plot.tag.position = c(0.5, 1.1),
        plot.tag = element_text(size = 10, family = "IM Fell", face = "italic", vjust = 2.1, color = "#eefaff")) +
  theme(plot.margin = margin(60, 80, 30, 80)) + 
  theme(plot.background = element_rect(fill = "#eefaff", color = "#eefaff")) + 
  theme(panel.background = element_rect(fill = "#eefaff", color = "#eefaff"))

################# Part 3 #################

#revealing title
ggplot(eugenics, aes(x = Percent, y = reorder(Country, -Percent))) + 
  geom_col(color = "white", fill = "#3a4247", width = 0.6,
           position = "dodge") + 
  geom_rect(ymin = 1.7, ymax = 2.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_rect(ymin = 0.7, ymax = 1.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_vline(xintercept = 100, size = 0.2) +
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
  theme(axis.text.x = element_text(family = "IM Fell", color = "#eefaff")) +
  theme(axis.ticks.y = element_blank()) +
  theme(axis.ticks.length = unit(-0.05, "cm")) +
  theme(axis.line.x = element_line(color = "#3a4247", size = 0.3)) + 
  theme(plot.subtitle = element_text(hjust = 0.5, vjust = 1.9, size = 8, family = "IM Fell", face = "italic", color = "#eefaff")) +
  theme(plot.title = element_text(vjust = 1.5, family = "Rajdhani", face = "bold", size = 20, color = "#3a4247")) +
  theme(axis.title.x.bottom = element_blank()) + 
  theme(axis.title.x.top = element_text(hjust = -0.01, family = "IM Fell", face = "italic", size = 8, color = "#eefaff")) +
  theme(plot.tag.position = c(0.5, 1.1),
        plot.tag = element_text(size = 10, family = "IM Fell", face = "italic", vjust = 2.1, color = "#3a4247")) +
  theme(plot.margin = margin(60, 80, 30, 80)) + 
  theme(plot.background = element_rect(fill = "#eefaff", color = "#eefaff")) + 
  theme(panel.background = element_rect(fill = "#eefaff", color = "#eefaff"))

################# Part 4 #################

#revealing subtitle
ggplot(eugenics, aes(x = Percent, y = reorder(Country, -Percent))) + 
  geom_col(color = "white", fill = "#3a4247", width = 0.6,
           position = "dodge") + 
  geom_rect(ymin = 1.7, ymax = 2.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_rect(ymin = 0.7, ymax = 1.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_vline(xintercept = 100, size = 0.2) +
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
  theme(axis.text.x = element_text(family = "IM Fell", color = "#eefaff")) +
  theme(axis.ticks.y = element_blank()) +
  theme(axis.ticks.length = unit(-0.05, "cm")) +
  theme(axis.line.x = element_line(color = "#3a4247", size = 0.3)) + 
  theme(plot.subtitle = element_text(hjust = 0.5, vjust = 1.9, size = 8, family = "IM Fell", face = "italic", color = "#3a4247")) +
  theme(plot.title = element_text(vjust = 1.5, family = "Rajdhani", face = "bold", size = 20, color = "#3a4247")) +
  theme(axis.title.x.bottom = element_blank()) + 
  theme(axis.title.x.top = element_text(hjust = -0.01, family = "IM Fell", face = "italic", size = 8, color = "#eefaff")) +
  theme(plot.tag.position = c(0.5, 1.1),
        plot.tag = element_text(size = 10, family = "IM Fell", face = "italic", vjust = 2.1, color = "#3a4247")) +
  theme(plot.margin = margin(60, 80, 30, 80)) + 
  theme(plot.background = element_rect(fill = "#eefaff", color = "#eefaff")) + 
  theme(panel.background = element_rect(fill = "#eefaff", color = "#eefaff"))

################# Part 5 #################

#revealing x-axis
ggplot(eugenics, aes(x = Percent, y = reorder(Country, -Percent))) + 
  geom_col(color = "white", fill = "#3a4247", width = 0.6,
           position = "dodge") + 
  geom_rect(ymin = 1.7, ymax = 2.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_rect(ymin = 0.7, ymax = 1.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_vline(xintercept = 100, size = 0.2) +
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
  theme(axis.text.x = element_text(family = "IM Fell", color = "#3a4247")) +
  theme(axis.ticks.y = element_blank()) +
  theme(axis.ticks.length = unit(-0.05, "cm")) +
  theme(axis.line.x = element_line(color = "#3a4247", size = 0.3)) + 
  theme(plot.subtitle = element_text(hjust = 0.5, vjust = 1.9, size = 8, family = "IM Fell", face = "italic", color = "#3a4247")) +
  theme(plot.title = element_text(vjust = 1.5, family = "Rajdhani", face = "bold", size = 20, color = "#3a4247")) +
  theme(axis.title.x.bottom = element_blank()) + 
  theme(axis.title.x.top = element_text(hjust = -0.01, family = "IM Fell", face = "italic", size = 8, color = "#eefaff")) +
  theme(plot.tag.position = c(0.5, 1.1),
        plot.tag = element_text(size = 10, family = "IM Fell", face = "italic", vjust = 2.1, color = "#3a4247")) +
  theme(plot.margin = margin(60, 80, 30, 80)) + 
  theme(plot.background = element_rect(fill = "#eefaff", color = "#eefaff")) + 
  theme(panel.background = element_rect(fill = "#eefaff", color = "#eefaff"))

################# Part 6 #################

#revealing per cent quota
ggplot(eugenics, aes(x = Percent, y = reorder(Country, -Percent))) + 
  geom_col(color = "white", fill = "#3a4247", width = 0.6,
           position = "dodge") + 
  geom_rect(ymin = 1.7, ymax = 2.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_rect(ymin = 0.7, ymax = 1.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_vline(xintercept = 100, size = 0.2) +
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
  theme(axis.text.x = element_text(family = "IM Fell", color = "#3a4247")) +
  theme(axis.ticks.y = element_blank()) +
  theme(axis.ticks.length = unit(-0.05, "cm")) +
  theme(axis.line.x = element_line(color = "#3a4247", size = 0.3)) + 
  theme(plot.subtitle = element_text(hjust = 0.5, vjust = 1.9, size = 8, family = "IM Fell", face = "italic", color = "#3a4247")) +
  theme(plot.title = element_text(vjust = 1.5, family = "Rajdhani", face = "bold", size = 20, color = "#3a4247")) +
  theme(axis.title.x.bottom = element_blank()) + 
  theme(axis.title.x.top = element_text(hjust = -0.01, family = "IM Fell", face = "italic", size = 8, color = "#3a4247")) +
  theme(plot.tag.position = c(0.5, 1.1),
        plot.tag = element_text(size = 10, family = "IM Fell", face = "italic", vjust = 2.1, color = "#3a4247")) +
  theme(plot.margin = margin(60, 80, 30, 80)) + 
  theme(plot.background = element_rect(fill = "#eefaff", color = "#eefaff")) + 
  theme(panel.background = element_rect(fill = "#eefaff", color = "#eefaff"))

################# Part 7 #################

#revealing some countries
ggplot(eugenics, aes(x = Percent, y = reorder(Country, -Percent))) + 
  geom_col(color = "white", fill = "#3a4247", width = 0.6,
           position = "dodge") + 
  geom_rect(ymin = 1.7, ymax = 2.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_rect(ymin = 0.7, ymax = 1.3, xmin = 305, xmax = 315, color = "black", fill = "#eefaff", size = 0.3) +
  geom_vline(xintercept = 100, size = 0.2) +
  geom_text(data = df1, aes(label = Label), size = 2.3, family = "IM Fell", fontface = "italic", hjust = -0.05, color = "#eefaff") + #keep size = 2 for when export image
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
  theme(axis.text.x = element_text(family = "IM Fell", color = "#3a4247")) +
  theme(axis.ticks.y = element_blank()) +
  theme(axis.ticks.length = unit(-0.05, "cm")) +
  theme(axis.line.x = element_line(color = "#3a4247", size = 0.3)) + 
  theme(plot.subtitle = element_text(hjust = 0.5, vjust = 1.9, size = 8, family = "IM Fell", face = "italic", color = "#3a4247")) +
  theme(plot.title = element_text(vjust = 1.5, family = "Rajdhani", face = "bold", size = 20, color = "#3a4247")) +
  theme(axis.title.x.bottom = element_blank()) + 
  theme(axis.title.x.top = element_text(hjust = -0.01, family = "IM Fell", face = "italic", size = 8, color = "#3a4247")) +
  theme(plot.tag.position = c(0.5, 1.1),
        plot.tag = element_text(size = 10, family = "IM Fell", face = "italic", vjust = 2.1, color = "#3a4247")) +
  theme(plot.margin = margin(60, 80, 30, 80)) + 
  theme(plot.background = element_rect(fill = "#eefaff", color = "#eefaff")) + 
  theme(panel.background = element_rect(fill = "#eefaff", color = "#eefaff"))
