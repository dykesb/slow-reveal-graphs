#
# FILE:
# 1890_scandinavian_natives.R
#
# DESCRIPTION
# 62. Percentage of Aliens in the total foreign born of each specified nativity

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

# dataframe
Countries <- c("CHINA", "ITALY", "HUNGARY", "AUSTRIA", "RUSSIA", "MEXICO", "POLAND", "BELGIUM",
               "FRANCE", "CANADA", "SWEDEN", "DENMARK", "SWITZERLAND", "GREAT BRITAIN", "NORWAY",
               "HOLLAND", "BOHEMIA", "GERMANY", "IRELAND")


Per <- c(89, 39, 37, 25, 23, 22.5, 20.5, 17, 16, 15.5, 15, 13.5, 13, 11, 10.5, 10.3, 10.2, 7.5, 7)

df <- data.frame(Countries, Per)

# x axis labels
x_axis_text <- c("COUNTRIES", " ", 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, " ")

# creating the plot
ggplot(df, aes(x = Per, y = reorder(Countries, -Per))) +
  geom_bar(stat = "identity", width = 0.5, fill = "gray21") +
  scale_y_discrete(limits=rev) +
  scale_x_continuous(labels = x_axis_text, expand = c(0,0), position = "top", 
                     limits = c(-20.5, 110), breaks = seq(-10, 110, by = 10)) +
  labs(title = "PERCENTAGE OF ALIENS IN THE TOTAL FOREIGN BORN OF EACH SPECIFIED NATIVITY.",
       subtitle = "PerCent.") +
  geom_vline(xintercept = c(0,10,20,30,40,50,60,70,80,90,100,110), linetype="solid", 
             color = "gray21", linewidth = 1.2) +
  labs(y = NULL, x = NULL) +
  theme(plot.title = element_text(hjust = 0.5, family = "Puritan", size = 25),
        plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 20))+
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 20),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05,
                                   margin = margin(l = 50, r = -45), colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 20
        )) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white"))


ggsave(filename = here::here("1890-foreign-aliens", "01_full_unmasked.png"), height = 4, width = 5, units = "in")


