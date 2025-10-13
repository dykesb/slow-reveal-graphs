#
# FILE:
#  gannett_race_increase.R
#
# DESCRIPTION:
# This code is for the Rates of Increase of White and Negro Population Graph from Henry Gannett. The png's show the various stages of revealing the graphs.  
# Most graph code was taken from Alex's work: https://github.com/gichukia/Slow-Reveal/blob/main/image%209%20Slow%20Reveal.R  
# Source: https://www.loc.gov/resource/rbaapc.10601/?sp=9
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC
# 1: FULLY CONCEALED GRAPHIC
# 2: REVEAL YEAR
# 3: REVEAL PERCENTS1
# 4: REVEAL PERCENTS2
#
# AUTHORS:
#   Alex & Robert Bilyk (main code)
#   Ian Curtis (2023, code to save plots)


library(ggplot2)
library(tidyverse)
library(ggalt)
library(showtext)

#### FIGURE 5: RECREATED GRAPHIC ####

# loading fonts
font_add_google("Dynalight", "Dynalight")
font_add_google("Puritan", "Puritan")
showtext_auto()


#creating the data frame
df <- data.frame(years = c(1,2,3,4,5,6,7,8,9,10),
                 white = c(35.76, 36.12, 34.12, 34.03, 34.72, 37.74, 37.69, 24.76, 29.22, 26.68),
                 negro = c(32.33, 37.50, 28.59, 31.44, 23.40, 26.63, 22.07, 9.86, 34.38, 13.51)
)

# interpolation with splines
spline_int1 <- as.data.frame(spline(df$years, df$white))
spline_int2 <- as.data.frame(spline(df$years, df$negro))

# x axis labels
x_axis_text <- c("1790-1800", "1800-1810", "1810-1820", "1820-1830", "1830-1840", 
                 "1840-1840", "1850-1860", "1860-1870", "1870-1880", "1880-1890")


png(here::here("gannett-race-increase", "05_full_unmasked.png"),width=1200,height=600)

ggplot(df) + 
  geom_point(aes(x = years, y = white), size = 0.7) +
  geom_line(data = spline_int1, aes(x = x, y = y), linewidth = 1.3) +
  geom_point(aes(x = years, y = negro), size = 0.7) +
  geom_line(data = spline_int2, aes(x = x, y = y), linewidth = 1.3) +
  geom_vline(xintercept = 0:10 , linetype = "solid", 
             color = "gray21", linewidth = 0.6) +
  geom_hline(yintercept = 0:49, linetype = "solid", 
             color = "gray21", linewidth = 0.6) +
  scale_x_continuous(labels = x_axis_text, limits = c(0,10), expand = c(0, 0),
                     breaks = seq(1, 10)) + 
  scale_y_continuous(limits = c(0,49), expand = c(0, 0)) +
  labs(title =  "Rates of Increase of White and Negro Population.",
       subtitle = "Per Cent.") +
  labs(x = NULL, y = NULL) +
  annotate('text', x = 5, y = 36, label = "White", family = "Dynalight", size = 6, angle = 15) +
  annotate('text', x = 7.1, y = 23, label = "Colored", family = "Dynalight", size = 6, angle = -57,) +
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 13, angle = 90),
        axis.text.y = element_text(colour = "gray21", 
                                   face = "bold.italic", family = "Puritan", size = 13)) +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", family = "Puritan", colour = "gray21", 
                                  size = 17),
        plot.subtitle = element_text(hjust = 0, face = "italic", family = "Puritan")) +
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(1,1,1.5,1.2, "cm"))

dev.off()


#### FIGURE 1: FULLY CONCEALED GRAPHIC ####

png(here::here("gannett-race-increase", "01_full_masked.png"),width=1200,height=600)

ggplot(df) + 
  geom_point(aes(x = years, y = white), size = 0.7) +
  geom_line(data = spline_int1, aes(x = x, y = y), linewidth = 1.3) +
  geom_point(aes(x = years, y = negro), size = 0.7) +
  geom_line(data = spline_int2, aes(x = x, y = y), linewidth = 1.3) +
  geom_vline(xintercept = 0:10 , linetype = "solid", 
             color = "gray21", linewidth = 0.6) +
  geom_hline(yintercept = 0:49, linetype = "solid", 
             color = "gray21", linewidth = 0.6) +
  scale_x_continuous(labels = x_axis_text, limits = c(0,10), expand = c(0, 0),
                     breaks = seq(1, 10)) + 
  scale_y_continuous(limits = c(0,49), expand = c(0, 0)) +
  labs(title =  "Rates of Increase of White and Negro Population.",
       subtitle = "Per Cent.") +
  labs(x = NULL, y = NULL) +
  theme(axis.text.x = element_text(colour = "white", 
                                   face = "bold", family = "Puritan", size = 13, angle = 90),
        axis.text.y = element_text(colour = "white", 
                                   face = "bold.italic", family = "Puritan", size = 13)) +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", family = "Puritan", colour = "white", 
                                  size = 17),
        plot.subtitle = element_text(hjust = 0, face = "italic", family = "Puritan", color="white")) +
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(1,1,1.5,1.2, "cm"))

dev.off()


#### FIGURE 2: REVEAL YEARS ####

png(here::here("gannett-race-increase", "02_xlabel_unmasked.png"),width=1200,height=600)

ggplot(df) + 
  geom_point(aes(x = years, y = white), size = 0.7) +
  geom_line(data = spline_int1, aes(x = x, y = y), linewidth = 1.3) +
  geom_point(aes(x = years, y = negro), size = 0.7) +
  geom_line(data = spline_int2, aes(x = x, y = y), linewidth = 1.3) +
  geom_vline(xintercept = 0:10 , linetype = "solid", 
             color = "gray21", linewidth = 0.6) +
  geom_hline(yintercept = 0:49, linetype = "solid", 
             color = "gray21", linewidth = 0.6) +
  scale_x_continuous(labels = x_axis_text, limits = c(0,10), expand = c(0, 0),
                     breaks = seq(1, 10)) + 
  scale_y_continuous(limits = c(0,49), expand = c(0, 0)) +
  labs(title =  "Rates of Increase of White and Negro Population.",
       subtitle = "Per Cent.") +
  labs(x = NULL, y = NULL) +
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 13, angle = 90),
        axis.text.y = element_text(colour = "white", 
                                   face = "bold.italic", family = "Puritan", size = 13)) +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", family = "Puritan", colour = "white", 
                                  size = 17),
        plot.subtitle = element_text(hjust = 0, face = "italic", family = "Puritan", color="white")) +
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(1,1,1.5,1.2, "cm"))

dev.off()


#### FIGURE 3: REVEAL PERCENTS1 ####

png(here::here("gannett-race-increase", "03_ylabel_unmasked.png"),width=1200,height=600)

ggplot(df) + 
  geom_point(aes(x = years, y = white), size = 0.7) +
  geom_line(data = spline_int1, aes(x = x, y = y), linewidth = 1.3) +
  geom_point(aes(x = years, y = negro), size = 0.7) +
  geom_line(data = spline_int2, aes(x = x, y = y), linewidth = 1.3) +
  geom_vline(xintercept = 0:10 , linetype = "solid", 
             color = "gray21", linewidth = 0.6) +
  geom_hline(yintercept = 0:49, linetype = "solid", 
             color = "gray21", linewidth = 0.6) +
  scale_x_continuous(labels = x_axis_text, limits = c(0,10), expand = c(0, 0),
                     breaks = seq(1, 10)) + 
  scale_y_continuous(limits = c(0,49), expand = c(0, 0)) +
  labs(title =  "Rates of Increase of White and Negro Population.",
       subtitle = "Per Cent.") +
  labs(x = NULL, y = NULL) +
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 13, angle = 90),
        axis.text.y = element_text(colour = "gray21", 
                                   face = "bold.italic", family = "Puritan", size = 13)) +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", family = "Puritan", colour = "white", 
                                  size = 17),
        plot.subtitle = element_text(hjust = 0, face = "italic", family = "Puritan", color="black")) +
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(1,1,1.5,1.2, "cm"))

dev.off()


#### FIGURE 4: REVEAL PERCENTS2 ####

png(here::here("gannett-race-increase", "04_whitelabel_unmasked.png"),width=1200,height=600)

ggplot(df) + 
  geom_point(aes(x = years, y = white), size = 0.7) +
  geom_line(data = spline_int1, aes(x = x, y = y), size = 1.3) +
  geom_point(aes(x = years, y = negro), size = 0.7) +
  geom_line(data = spline_int2, aes(x = x, y = y), size = 1.3) +
  geom_vline(xintercept = 0:10 , linetype = "solid", 
             color = "gray21", size = 0.6) +
  geom_hline(yintercept = 0:49, linetype = "solid", 
             color = "gray21", size = 0.6) +
  scale_x_continuous(labels = x_axis_text, limits = c(0,10), expand = c(0, 0),
                     breaks = seq(1, 10)) + 
  scale_y_continuous(limits = c(0,49), expand = c(0, 0)) +
  labs(title =  "Rates of Increase of White and Negro Population.",
       subtitle = "Per Cent.") +
  labs(x = NULL, y = NULL) +
  annotate('text', x = 5, y = 36, label = "White", family = "Dynalight", size = 6, angle = 15) +
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 13, angle = 90),
        axis.text.y = element_text(colour = "gray21", 
                                   face = "bold.italic", family = "Puritan", size = 13)) +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", family = "Puritan", colour = "white", 
                                  size = 17),
        plot.subtitle = element_text(hjust = 0, face = "italic", family = "Puritan", color="black")) +
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(1,1,1.5,1.2, "cm"))

dev.off()







