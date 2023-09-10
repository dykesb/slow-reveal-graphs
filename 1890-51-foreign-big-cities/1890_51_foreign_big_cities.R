#
# FILE:
# 1890_foreign_big_cities.R
#
# DESCRIPTION:
# Foreign born population, by States and Territories: 1890
# https://www.loc.gov/resource/g3701gm.gct00010/?sp=35&r=-0.084,0.075,0.95,0.448,0
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

# dataframe
Countries <- c("ITALY", "RUSSIA", "POLAND", "IRELAND", "BOHEMIA", "AUSTRIA", "GERMANY", "FRANCE", "HUNGARY",
               "GREAT BRITAIN", "CHINA", "CANADA", "NORWAY AND SWEDEN", "UNITES STATES")

Per <- c(59, 58, 57, 56, 48, 47.5, 46.5, 45.5, 45, 41, 40.5, 31, 26, 19)


df <- data.frame(Countries, Per)

# x axis labels
x_axis_text <- c("       COUNTRIES.", 0, 10, 20, 30, 40, 50, " ")


# creating the plot
ggplot(df, aes(x = Per, y = reorder(Countries, -Per))) +
  geom_bar(stat = "identity", width = 0.5, fill = "gray21") +
  scale_y_discrete(limits=rev) +
  scale_x_continuous(labels = x_axis_text, expand = c(0,0), position = "top", 
                     limits = c(-13.5, 60), breaks = seq(-10, 60, by = 10)) +
  labs(title = "51. PERCENTAGE OF EACH NATIVITY IN CITIES OF 25,000 INHABITANTS OR MORE: 1890.",
       subtitle = "PerCent.") +
  geom_vline(xintercept = c(0,10,20,30,40,50,60), linetype="solid", 
             color = "gray21", linewidth = 1.2) +
  labs(y = NULL, x = NULL) +
  theme(plot.title = element_text(hjust = 0.5, family = "Puritan", size = 25),
        plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 20))+
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 20),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05,
                                   margin = margin(l = 50, r = -70), colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 20)) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white"))



ggsave(filename = here::here("1890-foreign-big-cities", "01_full_unmasked.png"), height = 4, width = 5, units = "in")







