#
# FILE:
# race_pop_rates.R
#
# DESCRIPTION
# Image 9 of Statistics of the Negroes in the United States,
# https://www.loc.gov/resource/rbaapc.10601/?sp=9
#
#
# AUTHORS:
#   Alex Gichuki (main code)
# Ian Curtis (2023, code to save plots)





# Gannett vs Dubois: Rates of Increase



# setup
library(ggplot2)
library(tidyverse)
library(ggalt)
library(showtext)

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


#### Figure 1: full masked ####

fig01 <- ggplot(df) + 
  geom_point(aes(x = years, y = white), size = 0.7) +
  geom_line(data = spline_int1, aes(x = x, y = y), linewidth = 1.3) +
  geom_point(aes(x = years, y = negro), size = 0.7) +
  geom_line(data = spline_int2, aes(x = x, y = y), linewidth = 1.3) +
  geom_vline(xintercept = 0:10 , linetype = "solid", 
             color = "gray21", linewidth = 0.6) +
  geom_hline(yintercept = 0:49, linetype = "solid", 
             color = "gray21", linewidth = 0.6) +
  scale_x_continuous(labels = NULL, limits = c(0,10), expand = c(0, 0),
                     breaks = seq(1, 10)) + 
  scale_y_continuous(labels = NULL, limits = c(0,49), expand = c(0, 0)) +
  labs(x = NULL, y = NULL) +
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

ggsave(here::here("race-pop-rates", "01_full_masked.png"), fig01)


# TOMORROW START HERE

#### Figure 2: Add x axis ####
fig02 <- ggplot(df) + 
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
  scale_y_continuous(labels = NULL, limits = c(0,49), expand = c(0, 0)) +
  labs(x = NULL, y = NULL) +
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 25, angle = 90),
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

ggsave(here::here("race-pop-rates", "02_xaxis_unmasked.png"), fig02)


#### Figure 3: Y axis revealed ####
fig03 <- ggplot(df) + 
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
  labs(x = NULL, y = NULL) +
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 25, angle = 90),
        axis.text.y = element_text(colour = "gray21", 
                                   face = "bold.italic", family = "Puritan", size = 25)) +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", family = "Puritan", colour = "gray21", 
                                  size = 17),
        plot.subtitle = element_text(hjust = 0, face = "italic", family = "Puritan")) +
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(1,1,1.5,1.2, "cm"))

ggsave(here::here("race-pop-rates", "03_yaxis_unmasked.png"), fig03)


#### Figure 4: Y label unmasked ####

fig04 <- ggplot(df) + 
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
  labs(title =  NULL,
       subtitle = "Per Cent.") +
  labs(x = NULL, y = NULL) +
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 25, angle = 90),
        axis.text.y = element_text(colour = "gray21", 
                                   face = "bold.italic", family = "Puritan", size = 25)) +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", family = "Puritan", colour = "gray21", 
                                  size = 17),
        plot.subtitle = element_text(hjust = 0, face = "italic", family = "Puritan", size = 25)) +
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(1,1,1.5,1.2, "cm"))

ggsave(here::here("race-pop-rates", "04_ylabel_unmasked.png"), fig04)


#### Figure 5: Title revealed ####

fig05 <- ggplot(df) + 
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
                                   face = "bold", family = "Puritan", size = 25, angle = 90),
        axis.text.y = element_text(colour = "gray21", 
                                   face = "bold.italic", family = "Puritan", size = 25)) +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", family = "Puritan", colour = "gray21", 
                                  size = 35),
        plot.subtitle = element_text(hjust = 0, face = "italic", family = "Puritan", size = 25)) +
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(1,1,1.5,1.2, "cm"))

ggsave(here::here("race-pop-rates", "05_title_unmasked.png"), fig05)


#### Figure 6: add white label ####

fig06 <- ggplot(df) + 
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
  annotate('text', x = 5, y = 36, label = "White", family = "Dynalight", size = 20, angle = 15) +
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 25, angle = 90),
        axis.text.y = element_text(colour = "gray21", 
                                   face = "bold.italic", family = "Puritan", size = 25)) +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", family = "Puritan", colour = "gray21", 
                                  size = 35),
        plot.subtitle = element_text(hjust = 0, face = "italic", family = "Puritan", size = 25)) +
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(1,1,1.5,1.2, "cm"))

ggsave(here::here("race-pop-rates", "06_white_unmasked.png"), fig06)


#### Figure 7: full unmasked ####

fig07 <- ggplot(df) + 
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
  annotate('text', x = 5, y = 36, label = "White", family = "Dynalight", size = 20, angle = 15) +
  annotate('text', x = 7.1, y = 23, label = "Colored", family = "Dynalight", size = 20, angle = -57,) +
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 25, angle = 90),
        axis.text.y = element_text(colour = "gray21", 
                                   face = "bold.italic", family = "Puritan", size = 25)) +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", family = "Puritan", colour = "gray21", 
                                  size = 35),
        plot.subtitle = element_text(hjust = 0, face = "italic", family = "Puritan", size = 25)) +
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(1,1,1.5,1.2, "cm"))

ggsave(here::here("race-pop-rates", "07_full_unmasked.png"), fig07)



