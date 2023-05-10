library(tidyverse)
library(readxl)
library(scales)

emissions <- read_xlsx(here::here("co2-emissions","annual_co2_emissions.xlsx"))

data1 <- subset(emissions, Entity == c("China", "India", "United States", "United Kingdom"))

data2 <- subset(emissions, Entity == c("France", "Russia", "United States", "United Kingdom"))

df1 <- subset(data1, Year == 2019)

df2 <- subset(data2, Year == 2019)

################# Part 1 #################

#recreating US, UK, China, India Graph 
ggplot(data1, aes(x = Year, y = Emissions/1000000000, group = Entity, color = Entity)) +
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

################# Part 2 #################

#concealing y-axis and labels 
ggplot(data1, aes(x = Year, y = Emissions/1000000000, group = Entity, color = Entity)) +
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
        plot.subtitle = element_text(hjust = -0.45, vjust = 15, size = 10, color = "#555555"),
        axis.title.y = element_blank(),
        axis.title.x = element_blank(),
        axis.line.x = element_line(color = "#999999"),
        axis.ticks.x = element_line(color = "#999999"),
        axis.ticks.y = element_line(color = "#dddddd"),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 11, color = "white"),
        legend.position = "none") + 
  coord_cartesian(clip = "off")

################# Part 3 #################

#recreating US, UK, France, Russia Graph 
ggplot(data2, aes(x = Year, y = Emissions/1000000000, group = Entity, color = Entity)) +
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

################# Part 4 #################

#concealing everything
ggplot(data2, aes(x = Year, y = Emissions/1000000000, group = Entity, color = Entity)) +
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

################# Part 5 #################

#revealing x-axis
ggplot(data2, aes(x = Year, y = Emissions/1000000000, group = Entity, color = Entity)) +
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

################# Part 6 #################

#revealing y-axis
ggplot(data2, aes(x = Year, y = Emissions/1000000000, group = Entity, color = Entity)) +
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

################# Part 7 #################

#revealing line labels
ggplot(data2, aes(x = Year, y = Emissions/1000000000, group = Entity, color = Entity)) +
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
