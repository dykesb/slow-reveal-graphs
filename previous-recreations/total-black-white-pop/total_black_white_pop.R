#
# FILE:
# total_black_white_pop.R
#
# DESCRIPTION:
# This code is the Total White and Black Population from 1900 to 1970. The png's show the various stages of revealing the graphs.  
# Most graph code was taken from Alex's work: https://github.com/gichukia/Slow-Reveal/blob/main/1900-1970.R
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC
# 1: FULLY CONCEALED GRAPHIC
# 2: REVEAL POPULATION
#
# AUTHORS:
#   Alex & Robert Bilyk (main code)
#   Ian Curtis (2023, code to save plots)

library(tidyverse)
library(showtext)


#### FIGURE 3: RECREATED GRAPHIC ####

# Loading required fonts
font_add_google("Dynalight", "Dynalight")

font_add_google("Puritan", "Puritan")
showtext_auto()


#Creating a dataset
year <- c(rep("1900", 2), rep("1910", 2), rep("1920", 2), rep("1930", 2),
          rep("1940", 2), rep("1950", 2), rep("1960", 2), rep("1970", 2))

condition <- rep(c("black","white"), 8)          

value <- c(8.83, 57.97, 9.83, 71.90, 10.46, 84.36, 11.89, 98.395, 12.87, 105.35, 15.04, 119.899,
           18.87, 139.96, 22.58, 155.17)

df <- data.frame(year, condition, value)

x_axis_text <- c("", 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, "")

year2 <- c("1900","1910","1920","1930","1940",
           "1950","1960","1970")
value2 <- c(66.8, 81.73, 94.82, 110.285, 118.22, 134.939, 158.83, 177.75)

zero <- c(.01, .02, .03, .04, .05, .06, .07, .08)

df2 <- data.frame(year2, value2, zero)


png(here::here("total-black-white-pop", "03_full_unmasked.png"),width=1000,height=600)

ggplot(df, aes(fill = condition, x = value, y = reorder(year, -value)))  +
  geom_vline(xintercept = 0:180 , linetype="solid", 
             color = "gray21", linewidth = 0.6) +
  geom_vline(xintercept = seq(0, 180, by = 10), linetype="solid", 
             color = "gray21", linewidth = 1.2) +
  geom_col(position = position_stack(reverse = TRUE), colour = "black", width = 0.5) +
  scale_fill_manual(values = c("black", "white")) +
  scale_y_discrete() +
  scale_x_continuous(labels = x_axis_text, expand = c(0,0), position = "top", limits = c(-10,180), 
                     breaks = seq(-10, 180, by = 10)) +
  labs(title = "TOTAL WHITE AND BLACK POPULATION.",
       subtitle = "1900 - 1970") +
  labs(y = NULL, x = "Millions.") +
  theme(plot.title = element_text(hjust = 0.5, family = "Puritan", size = 15),
        plot.subtitle = element_text(hjust = 0.5, family = "Puritan")) +
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Dynalight", size = 15),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05,
                                   margin = margin(l = 40, r = -50), colour = "gray21", 
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

png(here::here("total-black-white-pop", "01_full_masked.png"),width=1000,height=600)

ggplot(df2, aes(x = zero, y = reorder(year2, -zero)))  +
  geom_vline(xintercept = 0:180 , linetype="solid", 
             color = "gray21", linewidth = 0.6) +
  geom_vline(xintercept = seq(0, 180, by = 10), linetype="solid", 
             color = "gray21", linewidth = 1.2) +
  geom_col(position = position_stack(reverse = TRUE), colour = "black", width = 0.5) +
  scale_fill_manual(values = c("black", "white")) +
  scale_y_discrete() +
  scale_x_continuous(labels = x_axis_text, expand = c(0,0), position = "top", limits = c(-10,180), 
                     breaks = seq(-10, 180, by = 10)) +
  labs(title = "TOTAL WHITE AND BLACK POPULATION.",
       subtitle = "1900 - 1970") +
  labs(y = NULL, x = "Millions.") +
  theme(plot.title = element_text(hjust = 0.5, family = "Puritan", size = 15),
        plot.subtitle = element_text(hjust = 0.5, family = "Puritan")) +
  theme(axis.text.x = element_text(colour = "white", 
                                   face = "bold", family = "Dynalight", size = 15),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05,
                                   margin = margin(l = 40, r = -50), colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 12),
        axis.title.x = element_text(color="white")) +
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

png(here::here("total-black-white-pop", "02_pop_unmasked.png"),width=1000,height=600)

ggplot(df2, aes(x = value2, y = reorder(year2, -value2)))  +
  geom_vline(xintercept = 0:180 , linetype="solid", 
             color = "gray21", linewidth = 0.6) +
  geom_vline(xintercept = seq(0, 180, by = 10), linetype="solid", 
             color = "gray21", linewidth = 1.2) +
  geom_col(position = position_stack(reverse = TRUE), colour = "black", fill="white", width = 0.5) +
  scale_fill_manual(values = c("black", "white")) +
  scale_y_discrete() +
  scale_x_continuous(labels = x_axis_text, expand = c(0,0), position = "top", limits = c(-10,180), 
                     breaks = seq(-10, 180, by = 10)) +
  labs(title = "TOTAL WHITE AND BLACK POPULATION.",
       subtitle = "1900 - 1970") +
  labs(y = NULL, x = "Millions.") +
  theme(plot.title = element_text(hjust = 0.5, family = "Puritan", size = 15),
        plot.subtitle = element_text(hjust = 0.5, family = "Puritan")) +
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Dynalight", size = 15),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05,
                                   margin = margin(l = 40, r = -50), colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 12),
        axis.title.x = element_text(color="gray21")) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) +
  theme(legend.position = "none") +
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white"))

dev.off()






