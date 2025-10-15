#
# FILE:
# gannett_race_elements_total.R
#
# DESCRIPTION:
# This code is for the Proportion of the Total Population and White and Negro Elements Graph from Henry Gannett. The png's show the various stages of revealing the graphs. 
# Most graph code was taken from Alex's work: https://github.com/gichukia/Slow-Reveal/blob/main/image%2010_1.R  
# Source: https://www.loc.gov/resource/rbaapc.10601/?sp=10  
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC
# 1: FULLY CONCEALED GRAPHIC
# 2: REVEAL POPULATION
# 3: REVEAL YEAR
# 4: REVEAL TITLE
#
# AUTHORS:
#   Alex & Robert Bilyk (main code)
#   Ian Curtis (2023, code to save plots)

library(tidyverse)
library(showtext)


#### FIGURE 5: RECREATED GRAPHIC ####

# Required fonts
font_add_google("Dynalight", "Dynalight")
font_add_google("Puritan", "Puritan")
showtext_auto()



# Creating a dataset
year <- c(rep("1790", 2), rep("1800", 2), rep("1810", 2), rep("1820", 2),
          rep("1830", 2), rep("1840", 2), rep("1850", 2), rep("1860", 2),
          rep("1870", 2), rep("1880", 2), rep("1890", 2))

condition <- rep(c("black","white"), 11)

value <- c(1, 3, 1.4, 3.8, 1.5, 5.7, 1.9, 8, 2.5, 10.3, 3.0, 14, 3.5, 19.6,
           4.5, 27, 4.9, 33.6, 6.5, 43.6, 7.5, 55)

df <- data.frame(year, condition, value)

year2 <- c("1790", "1800", "1810", "1820","1830",
           "1840", "1850","1860","1870",
           "1880", "1890")

value2 <- c(4, 5.2, 7.2, 9.9, 12.8, 17, 23.1, 31.5, 38.5, 50.1, 62.5)

df2 <- data.frame(year2, value2)

x_axis_text <- c("", 0, 10, 20, 30, 40, 50, 60, "")



png(here::here("gannett-race-elements-total", "05_full_unmasked.png"),width=900,height=700)

ggplot(df, aes(fill = condition, x = value, y = reorder(year, -value)))  +
  geom_vline(xintercept = 0:70 , linetype="solid", 
             color = "gray21", linewidth = 0.6) +
  geom_vline(xintercept = c(10,20,30,40,50,60,70), linetype="solid", 
             color = "gray21", linewidth = 1.2) +
  geom_col(position = position_stack(reverse = TRUE), colour = "black", width = 0.5) +
  scale_fill_manual(values = c("black", "white")) +
  scale_y_discrete() +
  scale_x_continuous(labels = x_axis_text, expand = c(0,0), position = "top", limits = c(-8,70), 
                     breaks = seq(-10, 70, by = 10)) +
  labs(title = "TOTAL POPULATION AND WHITE AND NEGRO ELEMENTS.",
       subtitle = "PLATE I.") +
  labs(y = NULL, x = "Millions.") +
  theme(plot.title = element_text(hjust = 0.5, family = "Puritan", size = 15),
        plot.subtitle = element_text(hjust = 1, family = "Puritan")) +
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Dynalight", size = 15),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05,
                                   margin = margin(l = 40, r = -60), colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 12)) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) +
  theme(legend.position = "none") +
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white"))

dev.off()


#### FIGURE 1: FULLY CONCEALED GRAPHIC ####

png(here::here("gannett-race-elements-total", "01_full_masked.png"),width=900,height=700)

ggplot(df2, aes(x = value2, y = reorder(year2, -value2), fill="white"))  +
  geom_vline(xintercept = 0:70 , linetype="solid", 
             color = "gray21", linewidth = 0.6) +
  geom_vline(xintercept = c(10,20,30,40,50,60,70), linetype="solid", 
             color = "gray21", linewidth = 1.2) +
  geom_col(position = position_stack(reverse = TRUE), colour = "black", width = 0.5) +
  scale_fill_manual(values = c("white", "white")) +
  scale_y_discrete() +
  scale_x_continuous(labels = x_axis_text, expand = c(0,0), position = "top", limits = c(-8,70), 
                     breaks = seq(-10, 70, by = 10)) +
  labs(title = "TOTAL POPULATION AND WHITE AND NEGRO ELEMENTS.",
       subtitle = "PLATE I.") +
  labs(y = NULL, x = "Millions.") +
  theme(plot.title = element_text(hjust = 0.5, family = "Puritan", size = 15, color="white"),
        plot.subtitle = element_text(hjust = 1, family = "Puritan", color="white")) +
  theme(axis.text.x = element_text(colour = "white", 
                                   face = "bold", family = "Dynalight", size = 15),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05,
                                   margin = margin(l = 40, r = -60), colour = "white", 
                                   face = "bold", family = "Puritan", size = 12)) +
  theme(axis.title.x = element_text(color="white")) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) +
  theme(legend.position = "none") +
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white"))

dev.off()


#### FIGURE 2: REVEAL POPULATION ####

png(here::here("gannett-race-elements-total", "02_xlabel_unmasked.png"),width=900,height=700)

ggplot(df2, aes(x = value2, y = reorder(year2, -value2), fill="white"))  +
  geom_vline(xintercept = 0:70 , linetype="solid", 
             color = "gray21", linewidth = 0.6) +
  geom_vline(xintercept = c(10,20,30,40,50,60,70), linetype="solid", 
             color = "gray21", linewidth = 1.2) +
  geom_col(position = position_stack(reverse = TRUE), colour = "black", width = 0.5) +
  scale_fill_manual(values = c("white", "white")) +
  scale_y_discrete() +
  scale_x_continuous(labels = x_axis_text, expand = c(0,0), position = "top", limits = c(-8,70), 
                     breaks = seq(-10, 70, by = 10)) +
  labs(title = "TOTAL POPULATION",
       subtitle = "PLATE I.") +
  labs(y = NULL, x = "Millions.") +
  theme(plot.title = element_text(hjust = 0.29, family = "Puritan", size = 15, color="black"),
        plot.subtitle = element_text(hjust = 1, family = "Puritan", color="white")) +
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Dynalight", size = 15),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05,
                                   margin = margin(l = 40, r = -60), colour = "white", 
                                   face = "bold", family = "Puritan", size = 12)) +
  theme(axis.title.x = element_text(color="black")) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) +
  theme(legend.position = "none") +
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white"))

dev.off()


#### FIGURE 3: REVEAL YEAR ####

png(here::here("gannett-race-elements-total", "03_ylabel_unmasked.png"),width=900,height=700)

ggplot(df2, aes(x = value2, y = reorder(year2, -value2), fill="white"))  +
  geom_vline(xintercept = 0:70 , linetype="solid", 
             color = "gray21", linewidth = 0.6) +
  geom_vline(xintercept = c(10,20,30,40,50,60,70), linetype="solid", 
             color = "gray21", linewidth = 1.2) +
  geom_col(position = position_stack(reverse = TRUE), colour = "black", width = 0.5) +
  scale_fill_manual(values = c("white", "white")) +
  scale_y_discrete() +
  scale_x_continuous(labels = x_axis_text, expand = c(0,0), position = "top", limits = c(-8,70), 
                     breaks = seq(-10, 70, by = 10)) +
  labs(title = "TOTAL POPULATION",
       subtitle = "PLATE I.") +
  labs(y = NULL, x = "Millions.") +
  theme(plot.title = element_text(hjust = 0.29, family = "Puritan", size = 15, color="black"),
        plot.subtitle = element_text(hjust = 1, family = "Puritan", color="white")) +
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Dynalight", size = 15),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05,
                                   margin = margin(l = 40, r = -60), colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 12)) +
  theme(axis.title.x = element_text(color="black")) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) +
  theme(legend.position = "none") +
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white"))

dev.off()


#### FIGURE 4: REVEAL TITLE ####

png(here::here("gannett-race-elements-total", "04_title_unmasked.png"),width=900,height=700)

ggplot(df2, aes(x = value2, y = reorder(year2, -value2), fill="white"))  +
  geom_vline(xintercept = 0:70 , linetype="solid", 
             color = "gray21", linewidth = 0.6) +
  geom_vline(xintercept = c(10,20,30,40,50,60,70), linetype="solid", 
             color = "gray21", linewidth = 1.2) +
  geom_col(position = position_stack(reverse = TRUE), colour = "black", width = 0.5) +
  scale_fill_manual(values = c("white", "white")) +
  scale_y_discrete() +
  scale_x_continuous(labels = x_axis_text, expand = c(0,0), position = "top", limits = c(-8,70), 
                     breaks = seq(-10, 70, by = 10)) +
  labs(title = "TOTAL POPULATION AND WHITE AND NEGRO ELEMENTS.",
       subtitle = "PLATE I.") +
  labs(y = NULL, x = "Millions.") +
  theme(plot.title = element_text(hjust = 0.5, family = "Puritan", size = 15),
        plot.subtitle = element_text(hjust = 1, family = "Puritan", color="gray21")) +
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Dynalight", size = 15),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05,
                                   margin = margin(l = 40, r = -60), colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 12)) +
  theme(axis.title.x = element_text(color="black")) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) +
  theme(legend.position = "none") +
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white"))

dev.off()






