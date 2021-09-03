library(tidyverse)
library(readxl)
library(scales)
library(grid)

#reading data in
detroit <- read_xlsx(here::here("Everything","Detroit Pop Graph","DetroitPopData.xlsx"))

################# Part 1 #################

#full graph

ggplot(detroit, aes(x = Year, y = Population)) + 
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

################# Part 2 #################

#everything masked

ggplot(detroit, aes(x = Year, y = Population)) + 
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

################# Part 3 #################

#only x axis revealed

ggplot(detroit, aes(x = Year, y = Population)) + 
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

################# Part 4 #################

#x and y axis revealed

ggplot(detroit, aes(x = Year, y = Population)) + 
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
