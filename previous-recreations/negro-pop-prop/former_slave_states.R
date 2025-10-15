#
# FILE:
# 1890_scandinavian_natives.R
#
# DESCRIPTION:
# 46. Number of Natives of the Scandinavian Nations, by States and Territories: 1890
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

#creating a dataframe
percent <- c(30.9, 32.6, 32.3, 34.3, 35.4, 36.7, 37.5, 36.9, 36.5, 35, 35.3)
year <- c("1890", "1880", "1870", "1860", "1850", "1840", "1830", "1820", "1810", "1800", "1790")
df = data.frame(percent, year)

#plotting the graph
ggplot(df, aes(x = percent, y = year)) +
  geom_bar(stat = "identity", width = 0.4, fill = "gray21") +
  scale_y_discrete(expand = c(0,0), limits = rev) +
  scale_x_continuous(expand = c(0,0), position = "top") +
  labs(title = "Proportion which negroes of former slave states bore to \npopulation of those states.",
       subtitle = "PLATE IV.") +
  geom_vline(xintercept = 0:40 , linetype="solid", 
             color = "gray21", linewidth = 0.6) +
  geom_vline(xintercept = c(10,20,30,40), linetype="solid", 
             color = "gray21", linewidth = 1.2) +
  labs(x = "Per Cent", y = NULL) +
  theme(plot.title = element_text(hjust = 0.5, face = "bold",family = "Puritan", colour = "gray21", size = 30),
        plot.subtitle = element_text(hjust = 1, family = "Puritan", size = 25))+
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Dynalight", size = 25),
        axis.text.y = element_text(colour = "gray21", 
                                   face = "bold.italic", family = "Dynalight", size = 25)) +
  theme(axis.ticks.y = element_blank(),
        axis.title.x = element_text(color = "gray21", family = "Puritan", size = 25)) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white"))


ggsave(here::here("negro-pop-prop", "01_former_slave_states_full_unmasked.png"))
