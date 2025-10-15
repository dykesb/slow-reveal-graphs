#
# FILE:
# 1890_negro_pop_prop.R
#
# DESCRIPTION
# Proportion of negroes to the total population in 1890
# https://www.loc.gov/resource/rbaapc.10601/?sp=18
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


States <- c("South Carolina............", "Mississipi.....................", 
            "Lousiana......................", "Georgia.........................", 
            "Alabama........................", "Florida...........................",
            "Virginia..........................", "North Carolina.............", 
            "District of Columbia...", "Arkansas.......................", 
            "Tennessee....................", "Texas.............................",
            "Maryland.......................", "Delaware.......................", 
            "Kentucky......................", "Missouri........................", 
            "West Virginia................")

Per <- c(60, 58, 50, 47, 45, 42.5, 38, 35, 33, 27, 24, 22, 21, 17, 14, 6, 4)

df <- data.frame(States, Per)
x_axis_text <- c("                  Per cent.", 0, 10, 20, 30, 40, 50, 60)

ggplot(df, aes(x = Per, y = reorder(States, -Per))) +
  geom_bar(stat = "identity", width = 0.4, fill = "gray21") +
  scale_y_discrete(limits=rev) +
  scale_x_continuous(labels = x_axis_text, expand = c(0,0), position = "top", 
                     limits = c(-11.5, 65), breaks = seq(-10, 60, by = 10)) +
  labs(title = "PROPORTION OF NEGROES TO TOTAL POPULATION IN 1890",
       subtitle = bquote("PLATE"~V.^a)) +
  geom_vline(xintercept = 0:65 , linetype="solid", 
             color = "gray21", linewidth = 0.6) +
  geom_vline(xintercept = c(10,20,30,40,50,60), linetype="solid", 
             color = "gray21", linewidth = 1.2) +
  labs(y = NULL, x = NULL) +
  theme(plot.title = element_text(hjust = 0.5, family = "Puritan", size = 30),
        plot.subtitle = element_text(hjust = 1, family = "Puritan", size = 20))+
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 25),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05,
                                   margin = margin(l = 40, r = -100), colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 25)) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white"))


ggsave(here::here("negro-pop-prop", "01_1890_full_unmasked.png"))
