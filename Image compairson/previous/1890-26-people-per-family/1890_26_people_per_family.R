#
# FILE:
# 1890_people_per_family.R
#
# DESCRIPTION
# 26. Number of persons to a family, by states and territories: 1890

# https://www.loc.gov/resource/g3701gm.gct00010/?sp=24&r=0.06,0.407,1.218,0.575,0
#
#
# AUTHORS:
#   Alex Gichuki (main code)
# Ian Curtis (2023, code to save plots)

#setup
library(tidyverse)
library(showtext)

# fonts
font_add_google("Dynalight", "Dynalight")
font_add_google("Puritan", "Puritan")
showtext_auto()

states <- c("TEXAS", "VIRGINIA", "WEST VIRGINIA", "UTAH", 'MISSISSIPPI', "TENNESSEE", "ARKANSAS",
            "ALABAMA", "NORTH CAROLINA", "MINNESOTA", "DIST. OF COL.", 'KENTUCKY', "LOUISIANA",
            "GEORGIA", "MARYLAND", "SOUTH CAROLINA", "NEBRASKA", "MISSOURI", "WISCONSIN", 
            "WYOMING", "PENNSYLVANIA", "WASHINGTON", "CALIFORNIA", "ILLINOIS", "IOWA", "OREGON",
            "COLORADO", "FLORIDA", "DELAWARE", "MONTANA", "KANSAS", "NORTH DAKOTA", "INDIANA", 
            "NEW JERSEY", "OHIO", "SOUTH DAKOTA", "MASSACHUSETTS", "IDAHO", "RHODE ISLAND", 
            "MICHIGAN", "NEW YORK", "CONNECTICUT", "NEVADA", "ARIZONA", "MAINE", "VERMONT", 
            "NEW MEXICO", "NEW HAMPSHIRE", "OKLAHOMA")

#number of persons per family
num <- c(5.49, 5.48, 5.45, 5.37, 5.36, 5.31, 5.30, 5.29, 5.28, 5.26, 5.25, 5.24, 5.23, 5.22, 5.19,
         5.18, 5.16, 5.07, 5.05, 5.01, 4.95, 4.93, 4.92, 4.91, 4.90, 4.89, 4.83, 4.82, 4.80, 4.75,
         4.74, 4.70, 4.69, 4.68, 4.67, 4.66, 4.63, 4.62, 4.60, 4.59, 4.57, 4.55, 4.45, 4.36, 4.35,
         4.30, 4.26, 4.25, 4.10)

#creating the data frame
df <- data.frame(states, num)

#the x axis labels
x_axis_text <- c("              STATES.", "", 1, 2, 3, 4, 5, "")

#plotting the graph
ggplot(df, aes(x = num, y = reorder(states, -num))) +
  geom_bar(stat = "identity", width = 0.4, fill = "gray21") +
  scale_y_discrete(limits=rev) +
  scale_x_continuous(labels = x_axis_text, expand = c(0,0), position = "top",
                     limits = c(-1, 6), breaks = c(-1,0,1,2,3,4,5,6)) +
  labs(title = "26. NUMBER OF PERSONS TO A FAMILY, BY STATES AND TERRITORIES: 1890.") +
  geom_vline(xintercept = c(0,1,2,3,4,5), linetype="solid", 
             color = "gray21", linewidth = 0.8) +
  labs(y = NULL, x = NULL) +
  annotate("segment", x = seq(-1,6), xend = seq(-1,6), y = 0, yend = 51) +
  #annotate("segment", x = -1, xend = 6, y = 0, yend = 51) +
  theme(plot.title = element_text(hjust = 0.5, family = "Puritan", size = 30),
        plot.subtitle = element_text(hjust = 1, family = "Puritan", size = 25))+
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 20),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05,
                                   margin = margin(l = 40, r = -79), colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 20)) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(1,1,1.5,1.2, "cm"))

ggsave(here::here("1890-people-per-family", "01_full_unmasked.png"))

