#
# FILE:
# 18908_city_members.R
#
# DESCRIPTION:
# https://www.loc.gov/resource/g3701gm.gct00010/?sp=32&r=-0.224,0.078,0.91,0.429,0
#
#
# AUTHORS:
#   Alex Gichuki (main code)
# Ian Curtis (2023, code to save plots)


#setup
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

nwnp <- c(12.5, 18, 21, 21, 21, 22, 23, 24, 25, 26, 27, 27, 29, 30, 30, 30, 31,
          33, 36, 37, 39, 40, 43, 47, 49, 51, 53, 54)

nwfp <- c(48.5, 39, 46, 27, 27, 42, 36, 38, 40, 42, 45, 51, 37, 33, 40, 20, 37,
          30, 37, 30, 19, 21, 26, 12, 23, 22, 24, 20)

fw <- c(38.5, 41, 22.5, 42, 42, 35.5, 40, 37, 32, 25, 23, 21.5, 30, 34, 29, 14, 
        29, 36.5, 23, 27, 24, 35, 15, 18, 24.5, 22, 14, 14)

colored <- c(0.5, 2, 0.5, 10, 10, 0.5, 1, 1, 3, 7, 5, 0.5, 4, 3, 1, 26, 3, 0.5, 
             4, 6, 18, 4, 16, 33, 3.5, 5, 9, 12)


city <- c(rep("KANSAS CITY", 4),  rep("INDIANAPOLIS", 4), rep("DENVER", 4), rep("OMAHA", 4),
          rep("WASHINGTON", 4), rep("BALTIMORE", 4), rep("PHILADELPHIA", 4), rep("LOUISVILLE", 4),
          rep("PROVIDENCE", 4),  rep("ALLEGHANY", 4), rep("MINNEAPOLIS", 4), rep("NEWARK", 4),
          rep("NEW ORLEANS", 4),  rep("ROCHESTER", 4),  rep("BOSTON", 4),rep("PITTSBURG", 4),
          rep("BROOKLYN", 4), rep("CINCINNATI", 4), rep("ST. LOUIS", 4), rep("JERSEY CITY", 4),
          rep("CLEVELAND", 4), rep("ST. PAUL", 4), rep("BUFFALO", 4), rep("SAN FRANCISCO", 4),
          rep("DETROIT", 4), rep("CHICAGO", 4), rep("NEW YORK", 4), rep("MILWAUKEE", 4))

value <- c(54, 20, 14, 12, 53, 24, 14, 9, 51, 22, 22, 5, 49, 23, 24.5, 3.5, 47, 12, 8, 33, 43,
           26, 15, 16, 40, 21, 35, 4, 39, 19, 24, 18, 37, 30, 27, 6, 36, 37, 23, 4, 33, 30, 36.5, 
           0.5, 31, 37, 29, 3, 30, 30, 14, 26, 30, 40, 29, 1, 30, 33, 34, 3, 29, 37, 30, 4,
           27, 51, 21.5, 0.5, 27, 45, 23, 5, 26, 42, 25, 7, 25, 40, 32, 3, 24, 38, 37, 1, 
           23, 36, 40, 1, 22, 42, 35.5, 0.5, 21, 27, 42, 10, 21, 27, 42, 10, 21, 56, 22.5, 0.5,
           18, 39, 41, 2, 12.5, 48.5, 38.5, 0.5)

people <- rep(c("nwnp", "nwfp", "fw", "colored"), 28)

df <- data.frame(city, nwnp, nwfp, fw, colored)

DF <- data.frame(city, people, value)

df$city <- factor(df$city, levels = unique(df$city))


# Creating the 100% Stacked bar chart
plot<- ggplot(DF, aes(x = value, y = fct_inorder(city), 
                      fill = people)) +
  geom_bar(stat = "identity", color = "black", width = 0.5) +
  scale_x_continuous(name = "PER CENT",  expand = c(0,0), position = "top", 
                     breaks = seq(0, 100, by = 10)) +
  scale_y_discrete(expand = c(0,0)) +
  geom_vline(xintercept = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100), linetype="solid", 
             color = "gray21", linewidth = .6) +
  labs(y = NULL) +
  labs(title = "36. CONSTITUENTS OF THE POPULATIONS OF THE GREAT CITIES: 1890",
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
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) + 
  theme(plot.margin = margin(0.5,0.5,0.5,0.5, "cm")) +
  scale_fill_manual(values = c("#7a7876", "#3f623f", "#Bf7f4a", "#F0e89f"))

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
  scale_fill_manual(values = c("#F0e89f", "#3f623f", "#Bf7f4a", "#7a7876")) +
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
  theme(legend.position = "none")

# Combining the plot and the legend
plot36 <- ggarrange(plot, legendPlot, ncol = 1, nrow = 2,
                    widths = c(2,2),
                    heights = c(10,1))

# Saving the plot with custom dimensions
ggsave(here::here("1890-city-members", "01_full_unmasked.png"),
       plot36, height = 10, width = 7, bg = "white")




