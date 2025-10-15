#
# FILE:
# 1890_state_members.R
#
# DESCRIPTION
# 35. Constituents of the Population of the states and territories: 1890
# https://www.loc.gov/resource/g3701gm.gct00010/?sp=32&r=-0.224,0.078,0.91,0.429,0
#
#
# AUTHORS:
#   Alex Gichuki (main code)
# Ian Curtis (2023, code to save plots)


# setup
library(tidyverse)
library(showtext)
library(forcats)
library(cowplot)
library(ggpubr)
library(scales)

# Adding the fonts
font_add_google("Dynalight", "Dynalight")
font_add_google("Puritan", "Puritan")
showtext_auto()

# creating the data frame
# nwnp = Native White of Native Parents
# nwfp = Native White of Foreign Parents
# fw = Foreign White

nwnp <- c(20.2, 23, 25, 32, 33, 37, 38, 38, 39.5, 40.5, 40.5, 41, 42, 42.5, 43, 43.5,
          46, 47.5, 48, 48.5, 49, 50, 52, 53, 53.5, 54, 55, 55.5, 56, 58, 58, 62,
          63, 63.5, 64, 64.5, 65, 67, 67.5, 68.5, 69, 69.5, 72, 75, 76, 77, 77, 
          83, 87)

nwfp <- c(33.8, 40, 43, 27, 40, 8, 1, 35, 27.5, 0.7, 23.5, 19, 30, 22, 27.5, 29,
          13, 26, 26, 4, 26, 23, 1, 1, 20, 23.5, 15, 27, 23, 19, 2.5, 20, 8, 21.5,
          0.5, 10, 16, 14, 18.5, 2, 16, 16, 2, 7, 11, 14, 8, 7.5, 5.5)

fw <- c(45, 36, 31, 26, 26, 5, 1, 26, 30, 0.8, 28, 31.5, 26, 31, 27, 25, 8, 23, 21,
        4, 22, 23, 1, 2, 22, 18, 9, 16, 18, 19, 2, 14, 6, 11, 0.5, 9, 14.5, 17.5,
        12.5, 1.5, 9, 11, 1, 5, 12, 6, 5.3, 6.5, 2.5)

colored <- c(1, 1, 1, 15, 1, 50, 60, 1, 3, 58, 8, 8.5, 2, 4.5, 2.5, 2.5, 33, 3.5,
             5, 43.5, 3, 4, 46, 44, 4.5, 4.5, 21, 1.5, 3, 4, 37.5, 4, 23, 4, 35,
             16.5, 4.5, 1.5, 1.5, 28, 6, 3.5, 2.5, 13, 1, 3, 9.7, 3, 5)

city <- c(rep("WEST VIRGINIA", 4),  rep("OKLAHOMA", 4), rep("NEW MEXICO", 4), rep("INDIANA", 4), 
          rep("MAINE", 4), rep("KENTUCKY", 4),rep("TENNESSEE", 4), rep("KANSAS", 4), 
          rep("MISSOURI", 4), rep("ARKANSAS", 4), rep("VERMONT", 4), rep("NEW HAMPSHIRE", 4),
          rep("OREGON", 4), rep("DELAWARE", 4), rep("NORTH CAROLINA", 4), rep("OHIO", 4), 
          rep("TEXAS", 4), rep("PENNSYLVANIA", 4), rep("VIRGINIA", 4), 
          rep("COLORADO", 4), rep("NEBRASKA", 4), rep("IOWA", 4), rep("MARYLAND", 4), 
          rep("IDAHO", 4), rep("WASHINGTON", 4), rep("ALABAMA", 4), rep("GEORGIA", 4), 
          rep("WYOMING", 4), rep("ILLINOIS", 4), rep("FLORIDA", 4), rep("NEW JERSEY", 4), 
          rep("CONNECTICUT", 4), rep("DISTRICT OF COLUMBIA", 4), rep("MICHIGAN", 4), rep("MASSACHUSETTS", 4), 
          rep("MONTANA", 4), rep("NEW YORK", 4), rep("CALIFORNIA", 4), rep("ARIZONA", 4), 
          rep("MISSISSIPPI", 4), rep("RHODE ISLAND", 4), rep("SOUTH DAKOTA", 4), rep("SOUTH CAROLINA", 4), 
          rep("LOUISIANA", 4), rep("UTAH", 4), rep("NEVADA", 4), rep("WISCONSIN", 4), 
          rep("MINNESOTA", 4), rep("NORTH DAKOTA", 4))

value <- c(87, 5.5, 2.5, 5, 83, 7.5, 6.5, 3, 77, 8, 5.3, 9.7, 77, 14, 6, 3, 76, 
           11, 12, 1, 75, 7, 5, 13, 72, 2, 1, 25, 69.5, 16, 11, 3.5, 69, 16, 9, 6, 
           68.5, 2, 1.5, 28, 67.5, 18.5, 12.5, 1.5, 67, 14, 17.5, 1.5, 65, 16, 14.5, 
           4.5, 64.5, 10, 9, 16.5, 64, 0.5, 0.5, 35, 63.5, 21.5, 11, 4, 63, 8, 6, 
           23, 62, 20, 14, 4, 58, 2.5, 2, 37.5, 58, 19, 19, 4, 56, 23, 18, 3, 55.5, 
           27, 16, 1.5, 55, 15, 9, 21, 54, 23.5, 18, 4.5, 53.5, 20, 22, 4.5, 53, 1, 
           2, 44, 52, 1, 1, 46, 50, 23, 23, 4, 49, 26, 22, 3,48.5, 4, 4, 43.5, 48, 
           26, 21, 5, 47.5, 26, 23, 3.5, 46, 13, 8, 33, 43.5, 29, 25, 2.5, 43, 
           27.5, 27, 2.5, 42.5, 22, 31, 4.5, 42, 30, 26, 2, 41, 19, 31.5, 8.5,
           40.5, 23.5, 28, 8, 40.5, 0.7, 0.8, 58, 39.5, 27.5, 30, 3, 38, 35, 26, 1,
           38, 1, 1, 60, 37, 8, 5, 50, 33, 40, 26, 1, 32, 27, 26, 15, 25, 43, 31, 1, 
           23, 40, 36, 1, 20.2, 33.8, 45, 1)


people <- rep(c("nwnp", "nwfp", "fw", "colored"), 49)

df <- data.frame(city, nwnp, nwfp, fw, colored)

DF <- data.frame(city, people, value)

df$city <- factor(df$city, levels = unique(df$city))

# Creating the 100% Stacked bar chart
plot <- ggplot(DF, aes(x = value, y = fct_inorder(city), 
                       fill = people)) +
  geom_bar(stat = "identity", color = "black", width = 0.5) +
  scale_x_continuous(name = "PER CENT",  expand = expansion(mult = c(0.1,0)), position = "top", 
                     breaks = seq(0, 100, by = 10)) +
  scale_y_discrete(expand = c(0,0)) +
  geom_vline(xintercept = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100), linetype="solid", 
             color = "gray21", linewidth = .6) +
  labs(y = NULL) +
  labs(title = "35. CONSTITUENTS OF THE POPULATIONS OF THE STATES AND TERRITORIES: 1890",
       subtitle = " ") +
  theme(plot.title = element_text(hjust = 0.2, family = "Puritan", size = 30))+
  theme(axis.text.x = element_text(colour = "gray21",
                                   face = "bold", family = "Puritan", size = 26),
        axis.text.y = element_text(colour = "gray21", hjust = 0, 
                                   face = "bold", family = "Puritan", size = 26)) +
  guides(fill=guide_legend(ncol = 2)) +
  theme(legend.position = "none") +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) +
  theme(axis.title.x = element_text(colour = "gray21", 
                                    face = "bold", family = "Puritan", size = 26, hjust = 0.5)) +
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "#EFD8AF", colour = "#EFD8AF"),
        plot.background = element_rect(fill = "#EFD8AF", colour = "#EFD8AF")) + 
  theme(plot.margin = margin(0.5,1,0.5,1, "cm")) +
  scale_fill_manual(values = c("#A17F63", "#8E8B62", "#DB9B6B", "#E5B97A"))

# Creating a custom legend
legendDF <- data.frame(group = c("A", "B", "C", "D"),
                       xmin = c(1.0, 4.0, 1.0, 4.0),
                       xmax = c(1.4, 4.4, 1.4, 4.4),
                       ymin = c(0.6, 0.6, 0.5, 0.5), 
                       ymax = c(0.65, 0.65, 0.55, 0.55))


legendPlot <- ggplot(legendDF, aes(x = NULL, y = NULL, xmin = xmin, xmax = xmax, 
                                   ymin = ymin, ymax = ymax, fill = group)) +
  geom_rect(color = "black") +
  xlim(-3, 6) +
  ylim(0.45, 0.72) +
  scale_fill_manual(values = c("#E5B97A", "#8E8B62", "#DB9B6B", "#A17F63")) +
  annotate("text", x = -0.4, y = 0.625, label = "NATIVE WHITE OF NATIVE PARENTS", family = "Puritan", size = 9) +
  annotate("text", x = 3.4, y = 0.625, label = "FOREIGN WHITE", family = "Puritan", size = 9) +
  annotate("text", x = -0.4, y = 0.525, label = "NATIVE WHITE OF FOREIGN PARENTS", family = "Puritan", size = 9) +
  annotate("text", x = 3.4, y = 0.525, label = "COLORED", family = "Puritan", size = 9) +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank()) +
  theme(legend.position = "none",
        plot.background = element_rect(fill = "#EFD8AF", color = "#EFD8AF"))

# Creating a filler plot for masking

fillerPlot <- ggplot(legendDF, aes(x = NULL, y = NULL, xmin = xmin, xmax = xmax, 
                                   ymin = ymin, ymax = ymax, fill = group)) +
  geom_rect(color = "#EFD8AF") +
  xlim(-3, 6) +
  ylim(0.45, 0.72) +
  scale_fill_manual(values = c("#EFD8AF", "#EFD8AF", "#EFD8AF", "#EFD8AF")) +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank()) +
  theme(legend.position = "none",
        plot.background = element_rect(fill = "#EFD8AF", color = "#EFD8AF"))

# Combining the plot and the legend
plot35 <- ggarrange(plot, legendPlot, ncol = 1, nrow = 2,
                    widths = c(2,2),
                    heights = c(10,1))

# Saving the plot with custom dimensions
# ggsave(here::here("1890-state-members", "01_full_unmasked.png"),
#        plot35, height = 10, width = 7, bg = "white")

png(here::here("Slow Reveal Recreations", "1890-35-state-members", "recreated-imgs", "01_full_unmasked.png"),
    width = 2100,
    height = 3000)

plot35

dev.off()

# 02: Fully Masked

# Creating the 100% Stacked bar chart
plot <- ggplot(DF, aes(x = value, y = fct_inorder(city), 
                       fill = people)) +
  geom_bar(stat = "identity", color = "black", width = 0.5) +
  scale_x_continuous(name = "PER CENT",  expand = expansion(mult = c(0.1,0)), position = "top", 
                     breaks = seq(0, 100, by = 10)) +
  scale_y_discrete(expand = c(0,0)) +
  geom_vline(xintercept = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100), linetype="solid", 
             color = "black", linewidth = .6) +
  labs(y = NULL) +
  labs(title = "",
       subtitle = " ") +
  theme(plot.title = element_text(hjust = 0.2, family = "Puritan", size = 30))+
  theme(axis.text.x = element_text(colour = "#EFD8AF",
                                   face = "bold", family = "Puritan", size = 26),
        axis.text.y = element_text(colour = "#EFD8AF", hjust = 0, 
                                   face = "bold", family = "Puritan", size = 26)) +
  guides(fill=guide_legend(ncol = 2)) +
  theme(legend.position = "none") +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) +
  theme(axis.title.x = element_text(colour = "#EFD8AF", 
                                    face = "bold", family = "Puritan", size = 26, hjust = 0.5)) +
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "#EFD8AF", colour = "#EFD8AF"),
        plot.background = element_rect(fill = "#EFD8AF", colour = "#EFD8AF")) + 
  theme(plot.margin = margin(0.5,1,0.5,1, "cm")) +
  scale_fill_manual(values = c("#A17F63", "#8E8B62", "#DB9B6B", "#E5B97A"))

plot35 <- ggarrange(plot, fillerPlot, ncol = 1, nrow = 2,
                    widths = c(2,2),
                    heights = c(10,1))


png(here::here("Slow Reveal Recreations", "1890-35-state-members", "recreated-imgs", "02_full_masked.png"),
    width = 2100,
    height = 3000)

plot35

dev.off()

# 03: Cities Added

# Creating the 100% Stacked bar chart
plot <- ggplot(DF, aes(x = value, y = fct_inorder(city), 
                       fill = people)) +
  geom_bar(stat = "identity", color = "black", width = 0.5) +
  scale_x_continuous(name = "PER CENT",  expand = expansion(mult = c(0.1,0)), position = "top", 
                     breaks = seq(0, 100, by = 10)) +
  scale_y_discrete(expand = c(0,0)) +
  geom_vline(xintercept = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100), linetype="solid", 
             color = "black", linewidth = .6) +
  labs(y = NULL) +
  labs(title = "",
       subtitle = " ") +
  theme(plot.title = element_text(hjust = 0.2, family = "Puritan", size = 30))+
  theme(axis.text.x = element_text(colour = "#EFD8AF",
                                   face = "bold", family = "Puritan", size = 26),
        axis.text.y = element_text(colour = "gray21", hjust = 0, 
                                   face = "bold", family = "Puritan", size = 26)) +
  guides(fill=guide_legend(ncol = 2)) +
  theme(legend.position = "none") +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) +
  theme(axis.title.x = element_text(colour = "#EFD8AF", 
                                    face = "bold", family = "Puritan", size = 26, hjust = 0.5)) +
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "#EFD8AF", colour = "#EFD8AF"),
        plot.background = element_rect(fill = "#EFD8AF", colour = "#EFD8AF")) + 
  theme(plot.margin = margin(0.5,1,0.5,1, "cm")) +
  scale_fill_manual(values = c("#A17F63", "#8E8B62", "#DB9B6B", "#E5B97A"))

plot35 <- ggarrange(plot, fillerPlot, ncol = 1, nrow = 2,
                    widths = c(2,2),
                    heights = c(10,1))


png(here::here("Slow Reveal Recreations", "1890-35-state-members", "recreated-imgs", "03_cities_added.png"),
    width = 2100,
    height = 3000)

plot35

dev.off()

# 04: X-Axis Labels Added

# Creating the 100% Stacked bar chart
plot <- ggplot(DF, aes(x = value, y = fct_inorder(city), 
                       fill = people)) +
  geom_bar(stat = "identity", color = "black", width = 0.5) +
  scale_x_continuous(name = "PER CENT",  expand = expansion(mult = c(0.1,0)), position = "top", 
                     breaks = seq(0, 100, by = 10)) +
  scale_y_discrete(expand = c(0,0)) +
  geom_vline(xintercept = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100), linetype="solid", 
             color = "black", linewidth = .6) +
  labs(y = NULL) +
  labs(title = "",
       subtitle = " ") +
  theme(plot.title = element_text(hjust = 0.2, family = "Puritan", size = 30))+
  theme(axis.text.x = element_text(colour = "gray21",
                                   face = "bold", family = "Puritan", size = 26),
        axis.text.y = element_text(colour = "gray21", hjust = 0, 
                                   face = "bold", family = "Puritan", size = 26)) +
  guides(fill=guide_legend(ncol = 2)) +
  theme(legend.position = "none") +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) +
  theme(axis.title.x = element_text(colour = "gray21", 
                                    face = "bold", family = "Puritan", size = 26, hjust = 0.5)) +
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "#EFD8AF", colour = "#EFD8AF"),
        plot.background = element_rect(fill = "#EFD8AF", colour = "#EFD8AF")) + 
  theme(plot.margin = margin(0.5,1,0.5,1, "cm")) +
  scale_fill_manual(values = c("#A17F63", "#8E8B62", "#DB9B6B", "#E5B97A"))

plot35 <- ggarrange(plot, fillerPlot, ncol = 1, nrow = 2,
                    widths = c(2,2),
                    heights = c(10,1))


png(here::here("Slow Reveal Recreations", "1890-35-state-members", "recreated-imgs", "04_x_axis_added.png"),
    width = 2100,
    height = 3000)

plot35

dev.off()

# 05: Title Added

# Creating the 100% Stacked bar chart
plot <- ggplot(DF, aes(x = value, y = fct_inorder(city), 
                       fill = people)) +
  geom_bar(stat = "identity", color = "black", width = 0.5) +
  scale_x_continuous(name = "PER CENT",  expand = expansion(mult = c(0.1,0)), position = "top", 
                     breaks = seq(0, 100, by = 10)) +
  scale_y_discrete(expand = c(0,0)) +
  geom_vline(xintercept = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100), linetype="solid", 
             color = "black", linewidth = .6) +
  labs(y = NULL) +
  labs(title = "35. CONSTITUENTS OF THE POPULATIONS OF THE STATES AND TERRITORIES: 1890",
       subtitle = " ") +
  theme(plot.title = element_text(hjust = 0.2, family = "Puritan", size = 30))+
  theme(axis.text.x = element_text(colour = "gray21",
                                   face = "bold", family = "Puritan", size = 26),
        axis.text.y = element_text(colour = "gray21", hjust = 0, 
                                   face = "bold", family = "Puritan", size = 26)) +
  guides(fill=guide_legend(ncol = 2)) +
  theme(legend.position = "none") +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) +
  theme(axis.title.x = element_text(colour = "gray21", 
                                    face = "bold", family = "Puritan", size = 26, hjust = 0.5)) +
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "#EFD8AF", colour = "#EFD8AF"),
        plot.background = element_rect(fill = "#EFD8AF", colour = "#EFD8AF")) + 
  theme(plot.margin = margin(0.5,1,0.5,1, "cm")) +
  scale_fill_manual(values = c("#A17F63", "#8E8B62", "#DB9B6B", "#E5B97A"))

plot35 <- ggarrange(plot, fillerPlot, ncol = 1, nrow = 2,
                    widths = c(2,2),
                    heights = c(10,1))


png(here::here("Slow Reveal Recreations", "1890-35-state-members", "recreated-imgs", "05_title_added.png"),
    width = 2100,
    height = 3000)

plot35

dev.off()

