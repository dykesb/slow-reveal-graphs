# Special Request from Tammy based on image18-1 using data obtained from Census.gov for 1930.

#setup
library(tidyverse)
library(showtext)

# fonts
font_add_google("Dynalight", "Dynalight")
font_add_google("Puritan", "Puritan")
showtext_auto()

# creating a dataframe
States <- c("South Carolina............", "Mississipi.....................", 
            "Louisiana......................", "Georgia.........................", 
            "Alabama........................", "Florida...........................",
            "Virginia..........................", "North Carolina.............", 
            "District of Columbia...", "Arkansas.......................", 
            "Tennessee....................", "Texas.............................",
            "Maryland.......................", "Delaware.......................", 
            "Kentucky......................", "Missouri........................", 
            "West Virginia................")

Per <- c(45.6, 50.2, 36.9, 36.8, 35.7, 29.4, 26.8, 29.0, 27.1, 25.8, 18.3, 14.7, 16.9, 14.9, 8.6, 6.2, 6.6)

df <- data.frame(States, Per)
x_axis_text <- c("          Per cent.", 0, 10, 20, 30, 40, 50)


# plotting the graph
ggplot(df, aes(x = Per, y = reorder(States, -Per))) +
  geom_bar(stat = "identity", width = 0.4, fill = "gray21") +
  scale_y_discrete(limits=rev) +
  scale_x_continuous(label = x_axis_text, expand = c(0,0), position = "top", 
                     limits = c(-11.5, 55), breaks = seq(-10, 50, by = 10)) +
  labs(title = "PROPORTION OF NEGROES TO TOTAL POPULATION IN 1930\n") +
  geom_vline(xintercept = 0:55 , linetype="solid", 
             color = "gray21", linewidth = 0.6) +
  geom_vline(xintercept = c(10,20,30,40,50), linetype="solid", 
             color = "gray21", linewidth = 1.2) +
  labs(y = NULL, x = NULL) +
  theme(plot.title = element_text(hjust = 0.5, family = "Puritan", size = 30))+
  theme(axis.text.x = element_text(colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 20),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05,
                                   margin = margin(l = 40, r = -100), colour = "gray21", 
                                   face = "bold", family = "Puritan", size = 20)) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white"))

ggsave(here::here("special-requests", "01_negro_prop_1930.png"))