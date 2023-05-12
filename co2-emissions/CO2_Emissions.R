#
# FILE:
#  co2_emissions.R
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

emissions <- read_xlsx(here::here("co2-emissions","co2_emissions_data.xlsx"))

data1 <- subset(emissions, Entity == c("China", "India", "United States", "United Kingdom"))

data2 <- subset(emissions, Entity == c("France", "Russia", "United States", "United Kingdom"))

df1 <- subset(data1, Year == 2019)

df2 <- subset(data2, Year == 2019)

## FIGURE 2: RECREATED GRAPHIC

#recreating US, UK, China, India Graph 
fig02 <- ggplot(data1, aes(x = Year, y = Emissions/1000000000, group = Entity, color = Entity)) +
  geom_line() + 
  geom_text(data = df1, aes(label = Entity)) +
  scale_color_manual(values = c("#cf0a66", "#883039", "#3c4e66", "#6d3e91")) +
  scale_x_continuous(breaks = c(1750, 1800, 1850, 1900, 1950, 2019), 
                     limits = c(1750, 2019), expand = c(0,0)) +
  scale_y_continuous(breaks = seq(0, 10, 2), limits = c(0,10),
                     expand = c(0,0), labels = c("0", "2 billion t", "4 billion t",
                                                 "6 billion t", "8 billion t", "10 billion t")) +
  labs(title = "Annual CO2 emissions", 
       subtitle = "Carbon dioxide (CO2) emissions from the burning of fossil fuels for energy and cement\n
                   production. Land use change is not included.") +
  theme_bw() + 
  theme(panel.border = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line(linetype = "dashed"),
        plot.margin = margin(40,15,10,10),
        plot.title = element_text(hjust = -0.09, vjust = 10, family = "Times New Roman", size = 18, color = "#555555"),
        plot.subtitle = element_text(hjust = -0.2, vjust = 15, size = 10, color = "#555555"),
        axis.title.y = element_blank(),
        axis.title.x = element_blank(),
        axis.line.x = element_line(color = "#999999"),
        axis.ticks.x = element_line(color = "#999999"),
        axis.ticks.y = element_line(color = "#dddddd"),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 11),
        legend.position = "none") + 
  coord_cartesian(clip = "off")

ggsave(here::here("co2-emissions", "fig02_ciuu_full_unmasked.png"), fig02, device = "png")

## FIGURE 1: Y-AXIS MASKED

#concealing y-axis and labels 
fig01 <- ggplot(data1, aes(x = Year, y = Emissions/1000000000, group = Entity, color = Entity)) +
  geom_line() + 
  geom_text(data = df1, aes(label = Entity), color = "white") +
  scale_color_manual(values = c("#cf0a66", "#883039", "#3c4e66", "#6d3e91")) +
  scale_x_continuous(breaks = c(1750, 1800, 1850, 1900, 1950, 2019), 
                     limits = c(1750, 2019), expand = c(0,0)) +
  scale_y_continuous(breaks = seq(0, 10, 2), limits = c(0,10),
                     expand = c(0,0), labels = c("0", "2 billion t", "4 billion t",
                                                 "6 billion t", "8 billion t", "10 billion t")) +
  labs(title = "Annual CO2 emissions", 
       subtitle = "Carbon dioxide (CO2) emissions from the burning of fossil fuels for energy and cement\n
                   production. Land use change is not included.") +
  theme_bw() + 
  theme(panel.border = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line(linetype = "dashed"),
        plot.margin = margin(40,15,10,10),
        plot.title = element_text(hjust = -0.09, vjust = 10, family = "Times New Roman", size = 18, color = "#555555"),
        plot.subtitle = element_text(hjust = -0.2, vjust = 15, size = 10, color = "#555555"),
        axis.title.y = element_blank(),
        axis.title.x = element_blank(),
        axis.line.x = element_line(color = "#999999"),
        axis.ticks.x = element_line(color = "#999999"),
        axis.ticks.y = element_line(color = "#dddddd"),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 11, color = "white"),
        legend.position = "none") + 
  coord_cartesian(clip = "off")

ggsave(here::here("co2-emissions", "fig01_ciuu_yaxis_masked.png"), fig01, device = "png")


## FIGURE 7: RECREATED GRAPHIC FOR FRUU

#recreating US, UK, France, Russia Graph 
fig07 <- ggplot(data2, aes(x = Year, y = Emissions/1000000000, group = Entity, color = Entity)) +
  geom_line() + 
  geom_text(data = df2, aes(label = Entity), hjust = -0.1) +
  scale_color_manual(values = c("#c76c32", "#845ca2", "#24958f", "#d31f73")) +
  scale_x_continuous(breaks = c(1750, 1800, 1850, 1900, 1950, 2019), 
                     limits = c(1750, 2019), expand = c(0,0)) +
  scale_y_continuous(breaks = seq(0, 6, 1), limits = c(0,6),
                     expand = c(0,0), labels = c("0", "1 billion t", "2 billion t", "3 billion t",
                                                 "4 billion t", "5 billion t", "6 billion t")) +
  labs(title = "Annual CO2 emissions", 
       subtitle = "Carbon dioxide (CO2) emissions from the burning of fossil fuels for energy and cement\n
                   production. Land use change is not included.") +
  theme_bw() + 
  theme(panel.border = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line(linetype = "dashed"),
        plot.margin = margin(40,45,10,10),
        plot.title = element_text(hjust = -0.09, vjust = 10, family = "Times New Roman", size = 18, color = "#555555"),
        plot.subtitle = element_text(hjust = -0.45, vjust = 15, size = 10, color = "#555555"),
        axis.title.y = element_blank(),
        axis.title.x = element_blank(),
        axis.line.x = element_line(color = "#999999"),
        axis.ticks.x = element_line(color = "#999999"),
        axis.ticks.y = element_line(color = "#dddddd"),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 11),
        legend.position = "none") + 
  coord_cartesian(clip = "off")

ggsave(here::here("co2-emissions", "fig07_fruu_full_unmasked.png"), fig07, device = "png")

## FIGURE 3: FULLY MASKED

#concealing everything
fig03 <- ggplot(data2, aes(x = Year, y = Emissions/1000000000, group = Entity, color = Entity)) +
  geom_line() + 
  geom_text(data = df2, aes(label = Entity), hjust = -0.1, color = "white") +
  scale_color_manual(values = c("#c76c32", "#845ca2", "#24958f", "#d31f73")) +
  scale_x_continuous(breaks = c(1750, 1800, 1850, 1900, 1950, 2019), 
                     limits = c(1750, 2019), expand = c(0,0)) +
  scale_y_continuous(breaks = seq(0, 6, 1), limits = c(0,6),
                     expand = c(0,0), labels = c("0", "1 billion t", "2 billion t", "3 billion t",
                                                 "4 billion t", "5 billion t", "6 billion t")) +
  labs(title = "Annual CO2 emissions", 
       subtitle = "Carbon dioxide (CO2) emissions from the burning of fossil fuels for energy and cement\n
                   production. Land use change is not included.") +
  theme_bw() + 
  theme(panel.border = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line(linetype = "dashed"),
        plot.margin = margin(40,45,10,10),
        plot.title = element_text(hjust = -0.09, vjust = 10, family = "Times New Roman", size = 18, color = "white"),
        plot.subtitle = element_text(hjust = -0.45, vjust = 15, size = 10, color = "white"),
        axis.title.y = element_blank(),
        axis.title.x = element_blank(),
        axis.line.x = element_line(color = "#999999"),
        axis.ticks.x = element_line(color = "#999999"),
        axis.ticks.y = element_line(color = "#dddddd"),
        axis.text.x = element_text(size = 10, color = "white"),
        axis.text.y = element_text(size = 11, color = "white"),
        legend.position = "none") + 
  coord_cartesian(clip = "off") 

ggsave(here::here("co2-emissions", "fig03_fruu_full_masked.png"), fig03, device = "png")

## FIGURE 4: RECREATED GRAPHIC FOR FRUU

#revealing x-axis
fig04 <- ggplot(data2, aes(x = Year, y = Emissions/1000000000, group = Entity, color = Entity)) +
  geom_line() + 
  geom_text(data = df2, aes(label = Entity), hjust = -0.1, color = "white") +
  scale_color_manual(values = c("#c76c32", "#845ca2", "#24958f", "#d31f73")) +
  scale_x_continuous(breaks = c(1750, 1800, 1850, 1900, 1950, 2019), 
                     limits = c(1750, 2019), expand = c(0,0)) +
  scale_y_continuous(breaks = seq(0, 6, 1), limits = c(0,6),
                     expand = c(0,0), labels = c("0", "1 billion t", "2 billion t", "3 billion t",
                                                 "4 billion t", "5 billion t", "6 billion t")) +
  labs(title = "Annual CO2 emissions", 
       subtitle = "Carbon dioxide (CO2) emissions from the burning of fossil fuels for energy and cement\n
                   production. Land use change is not included.") +
  theme_bw() + 
  theme(panel.border = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line(linetype = "dashed"),
        plot.margin = margin(40,45,10,10),
        plot.title = element_text(hjust = -0.09, vjust = 10, family = "Times New Roman", size = 18, color = "white"),
        plot.subtitle = element_text(hjust = -0.45, vjust = 15, size = 10, color = "white"),
        axis.title.y = element_blank(),
        axis.title.x = element_blank(),
        axis.line.x = element_line(color = "#999999"),
        axis.ticks.x = element_line(color = "#999999"),
        axis.ticks.y = element_line(color = "#dddddd"),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 11, color = "white"),
        legend.position = "none") + 
  coord_cartesian(clip = "off")

ggsave(here::here("co2-emissions", "fig04_fruu_xaxis_unmasked.png"), fig04, device = "png")

## FIGURE 5: Y-AXIS UNMASKED

#revealing y-axis
fig05 <- ggplot(data2, aes(x = Year, y = Emissions/1000000000, group = Entity, color = Entity)) +
  geom_line() + 
  geom_text(data = df2, aes(label = Entity), hjust = -0.1, color = "white") +
  scale_color_manual(values = c("#c76c32", "#845ca2", "#24958f", "#d31f73")) +
  scale_x_continuous(breaks = c(1750, 1800, 1850, 1900, 1950, 2019), 
                     limits = c(1750, 2019), expand = c(0,0)) +
  scale_y_continuous(breaks = seq(0, 6, 1), limits = c(0,6),
                     expand = c(0,0), labels = c("0", "1 billion t", "2 billion t", "3 billion t",
                                                 "4 billion t", "5 billion t", "6 billion t")) +
  labs(title = "Annual CO2 emissions", 
       subtitle = "Carbon dioxide (CO2) emissions from the burning of fossil fuels for energy and cement\n
                   production. Land use change is not included.") +
  theme_bw() + 
  theme(panel.border = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line(linetype = "dashed"),
        plot.margin = margin(40,45,10,10),
        plot.title = element_text(hjust = -0.09, vjust = 10, family = "Times New Roman", size = 18, color = "white"),
        plot.subtitle = element_text(hjust = -0.45, vjust = 15, size = 10, color = "white"),
        axis.title.y = element_blank(),
        axis.title.x = element_blank(),
        axis.line.x = element_line(color = "#999999"),
        axis.ticks.x = element_line(color = "#999999"),
        axis.ticks.y = element_line(color = "#dddddd"),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 11),
        legend.position = "none") + 
  coord_cartesian(clip = "off")

ggsave(here::here("co2-emissions", "fig05_fruu_yaxis_unmasked.png"), fig05, device = "png")

## FIGURE 6: LABELS UNMASKED

#revealing line labels
fig06 <- ggplot(data2, aes(x = Year, y = Emissions/1000000000, group = Entity, color = Entity)) +
  geom_line() + 
  geom_text(data = df2, aes(label = Entity), hjust = -0.1) +
  scale_color_manual(values = c("#c76c32", "#845ca2", "#24958f", "#d31f73")) +
  scale_x_continuous(breaks = c(1750, 1800, 1850, 1900, 1950, 2019), 
                     limits = c(1750, 2019), expand = c(0,0)) +
  scale_y_continuous(breaks = seq(0, 6, 1), limits = c(0,6),
                     expand = c(0,0), labels = c("0", "1 billion t", "2 billion t", "3 billion t",
                                                 "4 billion t", "5 billion t", "6 billion t")) +
  labs(title = "Annual CO2 emissions", 
       subtitle = "Carbon dioxide (CO2) emissions from the burning of fossil fuels for energy and cement\n
                   production. Land use change is not included.") +
  theme_bw() + 
  theme(panel.border = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line(linetype = "dashed"),
        plot.margin = margin(40,45,10,10),
        plot.title = element_text(hjust = -0.09, vjust = 10, family = "Times New Roman", size = 18, color = "white"),
        plot.subtitle = element_text(hjust = -0.45, vjust = 15, size = 10, color = "white"),
        axis.title.y = element_blank(),
        axis.title.x = element_blank(),
        axis.line.x = element_line(color = "#999999"),
        axis.ticks.x = element_line(color = "#999999"),
        axis.ticks.y = element_line(color = "#dddddd"),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 11),
        legend.position = "none") + 
  coord_cartesian(clip = "off")

ggsave(here::here("co2-emissions", "fig06_fruu_labels_unmasked.png"), fig06, device = "png")
