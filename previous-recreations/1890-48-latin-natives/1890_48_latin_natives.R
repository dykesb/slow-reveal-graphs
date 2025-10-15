#
# FILE:
# 1890_latin_natives.R
#
# DESCRIPTION:
# Foreign born population, by States and Territories: 1890
# https://www.loc.gov/resource/g3701gm.gct00010/?sp=35&r=-0.084,0.075,0.95,0.448,0

#
# AUTHORS:
#   Alex Gichuki (main code)
# Ian Curtis (2023, code to save plots)


#setup
library(tidyverse)
library(showtext)

# FONTS
font_add_google("Dynalight", "Dynalight")
font_add_google("Puritan", "Puritan")
showtext_auto()

# DATAFRAME
States <- c("NEW YORK", "CALIFORNIA", "PENNSYLVANIA", "NEW JERSEY", "LOUISIANA", "ILLINOIS",
            "MASSACHUSETTS", "OHIO")

Per <- c(80, 43, 38, 22, 20, 19.5, 19, 18)


df <- data.frame(States, Per)


# x axis labels
x_axis_text <- c(" ", " STATES.", " ",  " ", "100,000", " ", "200,000", " ")


# Plotting the graph
ggplot(df, aes(x = Per, y = reorder(States, -Per))) +
  geom_bar(stat = "identity", width = 0.5, fill = "gray21") +
  scale_y_discrete(limits=rev) +
  scale_x_continuous(labels = x_axis_text, expand = c(0,0), position = "top", 
                     limits = c(-80, 250), breaks = seq(-100, 250, by = 50)) +
  labs(title = "48. NUMBER OF NATIVES OF THE LATIN NATIONS, BY \nSTATES: 1890.") +
  geom_vline(xintercept = c(0, 50, 100, 150, 200, 250), linetype="solid", 
             color = "gray21", linewidth = 1.2) +
  labs(y = NULL, x = NULL) +
  theme(plot.title = element_text(hjust = 0.5, family = "Puritan", size = 25),
        plot.subtitle = element_text(hjust = 1, family = "Puritan"))+
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 20),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05,
                                   margin = margin(l = 50, r = -70), colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 20
        )) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white"))



ggsave(filename = here::here("1890-latin-natives", "01_full_unmasked.png"), height = 4, width = 5, units = "in")

