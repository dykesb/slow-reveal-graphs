# Special Request from Tammy based on image18-1 using data obtained from Census.gov for 1970.


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

Per <- c(30.5, 36.8, 29.8, 25.9, 26.2, 15.3, 18.5, 22.1, 71.08, 18.3, 15.8, 12.5, 17.8, 14.3, 7.2, 10.3, 3.9)

df <- data.frame(States, Per)
x_axis_text <- c("          Per cent.", 0, 10, 20, 30, 40, 50, 60, 70)


# plotting the graph
ggplot(df, aes(x = Per, y = reorder(States, -Per))) +
  geom_bar(stat = "identity", width = 0.4, fill = "gray21") +
  scale_y_discrete(limits=rev) +
  scale_x_continuous(label = x_axis_text, expand = c(0,0), position = "top", 
                     limits = c(-15, 75), breaks = seq(-10, 70, by = 10)) +
  labs(title = "PROPORTION OF NEGROES TO TOTAL POPULATION IN 1970\n") +
  geom_vline(xintercept = 0:75 , linetype="solid", 
             color = "gray21", linewidth = 0.6) +
  geom_vline(xintercept = c(10,20,30,40,50,60,70), linetype="solid", 
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

ggsave(here::here("special-requests", "02_negro_prop_1970.png"))
