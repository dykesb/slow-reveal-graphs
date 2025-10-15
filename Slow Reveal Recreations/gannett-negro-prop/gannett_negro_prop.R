#
# FILE:
#  gannett_negro_prop.R
#
# DESCRIPTION:
# This code is for the Proportion of the Negro Element to the Total Population Graph from Henry Gannett. The png's show the various stages of revealing the graphs.
# Most graph code was taken from Alex's work: https://github.com/gichukia/Slow-Reveal/blob/main/image%2010_2.R  
# Source: https://www.loc.gov/resource/rbaapc.10601/?sp=10
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC
# 1: FULLY CONCEALED GRAPHIC
# 2: REVEAL YEAR
#
# AUTHORS:
#   Alex & Robert Bilyk (main code)
#   Ian Curtis (2023, code to save plots)

library(tidyverse)
library(showtext)


#### FIGURE 3: RECREATED GRAPHIC ####

# Loading the required fonts
font_add_google("Dynalight", "Dynalight")
font_add_google("Puritan", "Puritan")
showtext_auto()

# creating a dataframe
percent <- c(12, 13, 12.8, 15, 15.8, 16.9, 18, 18.2, 19, 18.7, 19.1)
year <- c("1890", "1880", "1870", "1860", "1850", "1840", "1830", "1820", "1810", "1800", "1790")
df1 = data.frame(percent, year)

x_axis_text <- c(0, 10, 20)


# full graph

png(here::here("gannett-negro-prop", "03_full_unmasked.png"),width=900,height=700)

ggplot(df1, aes(x = percent, y = year)) +
  geom_bar(stat = "identity", width = 0.4, fill = "gray21") +
  scale_y_discrete(expand = c(0,0), limits = rev) +
  scale_x_continuous(labels = x_axis_text, expand = c(0,0), position = "top",
                     breaks = seq(0, 20, by = 10)) +
  labs(title = "PLATE II.",
       subtitle = "PROPORTION OF THE NEGRO ELEMENT TO THE TOTAL \nPOPULATION") +
  geom_vline(xintercept = 0:20 , linetype = "solid", 
             color = "gray21", linewidth = 0.6) +
  geom_vline(xintercept = c(10,20), linetype = "solid", 
             color = "gray21", linewidth = 1.2) +
  labs(x = "Per Cent.", y = NULL) +
  theme(plot.title = element_text(hjust = 1, face = "bold",family = "Puritan", colour = "gray21"),
        plot.subtitle = element_text(hjust = 0.5, face = "bold", family = "Puritan", size = 15))+
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Dynalight", size = 13),
        axis.text.y = element_text(colour = "gray21", 
                                   face = "bold.italic", family = "Dynalight", size = 13)) +
  theme(axis.ticks.y = element_blank(), 
        axis.title.x = element_text(color = "gray21", family = "Puritan", hjust = 1)) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white"))

dev.off()


#### FIGURE 1: FULLY CONCEALED GRAPHIC ####

png(here::here("gannett-negro-prop", "01_full_masked.png"),width=900,height=700)

ggplot(df1, aes(x = percent, y = year)) +
  geom_bar(stat = "identity", width = 0.4, fill = "gray21") +
  scale_y_discrete(expand = c(0,0), limits = rev) +
  scale_x_continuous(labels = x_axis_text, expand = c(0,0), position = "top",
                     breaks = seq(0, 20, by = 10)) +
  labs(title = "PLATE II.",
       subtitle = "PROPORTION OF THE NEGRO ELEMENT TO THE TOTAL \nPOPULATION") +
  geom_vline(xintercept = 0:20 , linetype = "solid", 
             color = "gray21", linewidth = 0.6) +
  geom_vline(xintercept = c(10,20), linetype = "solid", 
             color = "gray21", linewidth = 1.2) +
  labs(x = "Per Cent.", y = NULL) +
  theme(plot.title = element_text(hjust = 1, face = "bold",family = "Puritan", colour = "white"),
        plot.subtitle = element_text(hjust = 0.5, face = "bold", family = "Puritan", size = 15, color = "white"))+
  theme(axis.text.x = element_text(colour = "white", 
                                   face = "bold", family = "Dynalight", size = 13),
        axis.text.y = element_text(colour = "white", 
                                   face = "bold.italic", family = "Dynalight", size = 13)) +
  theme(axis.ticks.y = element_blank(), 
        axis.title.x = element_text(color = "white", family = "Puritan", hjust = 1)) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white"))

dev.off()


#### FIGURE 2: REVEAL YEAR ####

png(here::here("gannett-negro-prop", "02_year_unmasked.png"),width=900,height=700)

ggplot(df1, aes(x = percent, y = year)) +
  geom_bar(stat = "identity", width = 0.4, fill = "gray21") +
  scale_y_discrete(expand = c(0,0), limits = rev) +
  scale_x_continuous(labels = x_axis_text, expand = c(0,0), position = "top",
                     breaks = seq(0, 20, by = 10)) +
  labs(title = "PLATE II.",
       subtitle = "PROPORTION OF THE NEGRO ELEMENT TO THE TOTAL \nPOPULATION") +
  geom_vline(xintercept = 0:20 , linetype = "solid", 
             color = "gray21", linewidth = 0.6) +
  geom_vline(xintercept = c(10,20), linetype = "solid", 
             color = "gray21", linewidth = 1.2) +
  labs(x = "Per Cent.", y = NULL) +
  theme(plot.title = element_text(hjust = 1, face = "bold",family = "Puritan", colour = "white"),
        plot.subtitle = element_text(hjust = 0.5, face = "bold", family = "Puritan", size = 15, color = "white"))+
  theme(axis.text.x = element_text(colour = "white", 
                                   face = "bold", family = "Dynalight", size = 13),
        axis.text.y = element_text(colour = "gray21", 
                                   face = "bold.italic", family = "Dynalight", size = 13)) +
  theme(axis.ticks.y = element_blank(), 
        axis.title.x = element_text(color = "white", family = "Puritan", hjust = 1)) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white"))

dev.off()





