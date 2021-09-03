library(tidyverse)
library(readxl)
library(scales)
library(data.table)

#reading data in
unemploy <- read_xlsx(here::here("Everything","May 2020 Unemployment by State Graph","State Unemployment Rate.xlsx"))

################# Part 1 #################

#creating original, full graph

#unhighlighted color = #F9B0B2
#highlighted color = #ED1C24

smallest <- unemploy %>%
  slice(which.min(Rate)) #creating subset of data with just smallest rate

largest <- unemploy %>%
  slice(which.max(Rate)) #creating subset of data with largest rate

#reorder function orders chart from smallest to greatest values
ggplot(data = unemploy, aes(x = reorder(State, Rate), y = Rate/100,
       fill = factor(ifelse(State %in% c("Nebraska", "Nevada"),"Highlighted","Normal")))) + #makes it possible to only highlight navada and nebraska
  geom_col(width = 0.6, show.legend = FALSE) + #show legend = false removes area legend
  geom_text(data = smallest, color = "#808080", aes(x = State, y = Rate/100 + 0.01, label = sprintf("%0.1f", round(Rate, digits = 3)))) + #Gets percentage over smallest bar
  geom_text(data = largest, color = "#808080", aes(x = State, y = Rate/100 + 0.01, label = sprintf("%0.1f", round(Rate, digits = 3)))) + #gets percentage over largest bar
  labs(title = "May 2020 unemployment rate by state", x = " ", y = " ") + 
  scale_fill_manual(name = "area", values=c("#ED1C24","#F9B0B2")) + #assigns colors to bars
  scale_x_discrete(expand = c(0,1.2)) +
  scale_y_continuous(labels = label_percent(accuracy = 0.1), breaks = seq(0, 0.30, 0.10), limits = c(0, 0.30), expand = c(0,0)) +
  theme_bw() + 
  theme(panel.border = element_blank()) +
  theme(axis.line.y = element_blank()) +
  theme(panel.grid.minor = element_blank()) + 
  theme(panel.grid.major.x = element_blank()) + 
  theme(axis.ticks = element_blank()) +
  theme(axis.line.x = element_line(color = "black")) +
  theme(axis.text.x = element_text(angle = 90, face = "bold", vjust = 0.5, hjust = 1.0)) + #angle rotates x labels 90 degrees
  theme(axis.text.y = element_text(hjust = 1.0, size = 10)) + 
  theme(plot.title = element_text(face = "bold", size = 16, vjust = 3, hjust = 0.081)) + #hjust and vjust adjust title horizontally and vertically
  theme(plot.title.position = "plot") + 
  theme(plot.margin = margin(15, 10, 10, 10)) #makes the upper margin larger so title isn't cut off
  
