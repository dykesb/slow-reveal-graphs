library(tidyverse)
library(readxl)
library(scales)
library(grid)

#reading data in
terror <- read_xlsx(here::here("Everything","Terrorism Graph","Terrorism Data.xlsx"))

df <- terror %>%
  slice(which.max(Year))

################# Part 1 #################

#full graph

ggplot(terror, aes(x = Year, y = Deaths)) + 
  geom_line(color = "#3c4e66") + 
  geom_point(color = "#3c4e66", size = 0.6) + 
  scale_x_continuous(breaks = c(1990, 1995, 2000, 2005, 2010, 2015, 2017), limits = c(1990, 2017), expand = c(0,0)) + #breaks format manually specifies break values
  scale_y_continuous(breaks = seq(0, 2500, 500), limits = c(0, 3000), expand = c(0,0), label = comma) + 
  labs(title = "Deaths from conflict and terrorism, 1990 to 2017",
       subtitle = "Total combined number of deaths from conflict (civil conflict and war between states) and terrorism",
       x = " ", y = " ") + #\n in subtitle puts everything after it on new line
  geom_text(data = df, aes(label = "United States"), vjust = -0.3, hjust = -0.05, size = 2.5, color = "#3c4e66") + 
  theme_bw() + 
  theme(panel.border = element_blank()) + #removes border
  theme(panel.grid.minor = element_blank()) + #removes minor grid lines
  theme(panel.grid.major.x = element_blank()) + #removes major x grid lines
  theme(panel.grid.major.y = element_line(linetype = "dashed")) + #changes y grid lines to dashed
  theme(axis.line.x = element_line(color = "#cccccc")) +
  theme(axis.ticks.y = element_blank()) + 
  theme(axis.ticks.x = element_line(color = "#cccccc")) +
  theme(plot.title.position = "plot") + 
  theme(plot.title = element_text(family = "Times New Roman", size = 15, color = "#555555")) + 
  theme(plot.subtitle = element_text(family = "Times New Roman", size = 9, color = "#555555")) +
  theme(plot.margin = margin(10, 80, 10, 5)) + 
  coord_cartesian(clip = 'off') #stops points (and text) from being cropped by axes

################# Part 2 #################

#everything masked

ggplot(terror, aes(x = Year, y = Deaths)) + 
  geom_line(color = "#3c4e66") + 
  geom_point(color = "#3c4e66", size = 0.6) + 
  scale_x_continuous(breaks = c(1990, 1995, 2000, 2005, 2010, 2015, 2017), limits = c(1990, 2017), expand = c(0,0)) + #breaks format manually specifies break values
  scale_y_continuous(breaks = seq(0, 2500, 500), limits = c(0, 3000), expand = c(0,0), label = comma) + 
  labs(title = " ",
       subtitle = " ",
       x = " ", y = " ") + #\n in subtitle puts everything after it on new line
  #geom_text(data = df, aes(label = "United States"), vjust = -0.3, hjust = -0.05, size = 3.5, color = "#3c4e66") + 
  theme_bw() + 
  theme(panel.border = element_blank()) + #removes border
  theme(panel.grid.minor = element_blank()) + #removes minor grid lines
  theme(panel.grid.major.x = element_blank()) + #removes major x grid lines
  theme(panel.grid.major.y = element_line(linetype = "dashed")) + #changes y grid lines to dashed
  theme(axis.line.x = element_line(color = "#cccccc")) +
  theme(axis.ticks = element_blank()) + 
  theme(axis.text = element_text(color = "white")) +
  theme(plot.title.position = "plot") + 
  theme(plot.title = element_text(family = "Times New Roman", size = 17, color = "#555555")) + 
  theme(plot.subtitle = element_text(family = "Times New Roman", size = 12, color = "#555555")) +
  theme(plot.margin = margin(10, 80, 10, 5)) + 
  coord_cartesian(clip = 'off') #stops points (and text) from being cropped by axes

################# Part 3 #################

#x axis revealed

ggplot(terror, aes(x = Year, y = Deaths)) + 
  geom_line(color = "#3c4e66") + 
  geom_point(color = "#3c4e66", size = 0.6) + 
  scale_x_continuous(breaks = c(1990, 1995, 2000, 2005, 2010, 2015, 2017), limits = c(1990, 2017), expand = c(0,0)) + #breaks format manually specifies break values
  scale_y_continuous(breaks = seq(0, 2500, 500), limits = c(0, 3000), expand = c(0,0), label = comma) + 
  labs(title = " ",
       subtitle = " ",
       x = " ", y = " ") + #\n in subtitle puts everything after it on new line
  #geom_text(data = df, aes(label = "United States"), vjust = -0.3, hjust = -0.05, size = 3.5, color = "#3c4e66") + 
  theme_bw() + 
  theme(panel.border = element_blank()) + #removes border
  theme(panel.grid.minor = element_blank()) + #removes minor grid lines
  theme(panel.grid.major.x = element_blank()) + #removes major x grid lines
  theme(panel.grid.major.y = element_line(linetype = "dashed")) + #changes y grid lines to dashed
  theme(axis.line.x = element_line(color = "#cccccc")) +
  theme(axis.ticks.y = element_blank()) + 
  theme(axis.text.y = element_text(color = "white")) + 
  theme(plot.title.position = "plot") + 
  theme(plot.title = element_text(family = "Times New Roman", size = 17, color = "#555555")) + 
  theme(plot.subtitle = element_text(family = "Times New Roman", size = 12, color = "#555555")) +
  theme(plot.margin = margin(10, 80, 10, 5)) + 
  coord_cartesian(clip = 'off') #stops points (and text) from being cropped by axes

################# Part 4 #################

#y and x axis revealed

ggplot(terror, aes(x = Year, y = Deaths)) + 
  geom_line(color = "#3c4e66") + 
  geom_point(color = "#3c4e66", size = 0.6) + 
  scale_x_continuous(breaks = c(1990, 1995, 2000, 2005, 2010, 2015, 2017), limits = c(1990, 2017), expand = c(0,0)) + #breaks format manually specifies break values
  scale_y_continuous(breaks = seq(0, 2500, 500), limits = c(0, 3000), expand = c(0,0), label = comma) + 
  labs(title = " ",
       subtitle = " ",
       x = " ", y = " ") + #\n in subtitle puts everything after it on new line
  #geom_text(data = df, aes(label = "United States"), vjust = -0.3, hjust = -0.05, size = 3.5, color = "#3c4e66") + 
  theme_bw() + 
  theme(panel.border = element_blank()) + #removes border
  theme(panel.grid.minor = element_blank()) + #removes minor grid lines
  theme(panel.grid.major.x = element_blank()) + #removes major x grid lines
  theme(panel.grid.major.y = element_line(linetype = "dashed")) + #changes y grid lines to dashed
  theme(axis.line.x = element_line(color = "#cccccc")) +
  theme(axis.ticks.y = element_blank()) + 
  theme(plot.title.position = "plot") + 
  theme(plot.title = element_text(family = "Times New Roman", size = 17, color = "#555555")) + 
  theme(plot.subtitle = element_text(family = "Times New Roman", size = 12, color = "#555555")) +
  theme(plot.margin = margin(10, 80, 10, 5)) + 
  coord_cartesian(clip = 'off') #stops points (and text) from being cropped by axes

################# Part 5 #################

#x and y axes + points + united states text revealed

ggplot(terror, aes(x = Year, y = Deaths)) + 
  geom_line(color = "#3c4e66") + 
  geom_point(color = "#3c4e66", size = 0.6) + 
  scale_x_continuous(breaks = c(1990, 1995, 2000, 2005, 2010, 2015, 2017), limits = c(1990, 2017), expand = c(0,0)) + #breaks format manually specifies break values
  scale_y_continuous(breaks = seq(0, 2500, 500), limits = c(0, 3000), expand = c(0,0), label = comma) + 
  labs(title = " ",
       subtitle = " ",
       x = " ", y = " ") + #\n in subtitle puts everything after it on new line
  geom_text(data = df, aes(label = "United States"), vjust = -0.3, hjust = -0.05, size = 3.5, color = "#3c4e66") + 
  theme_bw() + 
  theme(panel.border = element_blank()) + #removes border
  theme(panel.grid.minor = element_blank()) + #removes minor grid lines
  theme(panel.grid.major.x = element_blank()) + #removes major x grid lines
  theme(panel.grid.major.y = element_line(linetype = "dashed")) + #changes y grid lines to dashed
  theme(axis.line.x = element_line(color = "#cccccc")) +
  theme(axis.ticks.y = element_blank()) + 
  theme(plot.title.position = "plot") + 
  theme(plot.title = element_text(family = "Times New Roman", size = 17, color = "#555555")) + 
  theme(plot.subtitle = element_text(family = "Times New Roman", size = 12, color = "#555555")) +
  theme(plot.margin = margin(10, 80, 10, 5)) + 
  coord_cartesian(clip = 'off') #stops points (and text) from being cropped by axes
