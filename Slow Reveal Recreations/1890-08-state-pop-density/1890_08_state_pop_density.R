#
# FILE:
# 1890_state_pop_density.R
#
# DESCRIPTION:
# This code is for the 1890 State Population Density Graph from Henry Gannett. The png's show the various stages of revealing the graphs.
# Source: https://www.loc.gov/resource/g3701gm.gct00010/?sp=11&r=-0.031,0.456,1.866,1.186,0
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC
# 1: FULLY CONCEALED GRAPHIC
# 2: REVEAL DENSITY
# 3: REVEAL STATES
#
# AUTHORS:
#   Robert Bilyk (main code)
# Ian Curtis (code to save plots)


library(tidyverse)
library(showtext)
library(readxl)
library(grid)


font_add_google(name = "Courier Prime", family = "Main")
showtext_auto()

data <- read_xlsx(here::here("1890-state-pop-density", "1890_state_pop_density_data.xlsx")) %>%
  arrange(desc(Density)) %>% 
  mutate(State = toupper(State))


#### FIGURE 4: FULLY UNMASKED ####

png(here::here("1890-state-pop-density", "04_full_unmasked.png"),width=500,height=800)

ggplot(data, mapping = aes(x = Density, y = fct_rev(fct_inorder(State)))) +
  geom_col(color = "black", fill = "black", width = .45) +
  scale_x_continuous(position= "top" ,limits = c(0,325), breaks = seq(25,325,25)) +
  theme(axis.text.x = element_text(family = "Main", color = "black", size = 8),
        axis.title.x = element_blank(),
        axis.text.y = element_text(family = "Main", color = "black", hjust = 0, size = 8),
        axis.ticks.y = element_blank(),
        axis.title.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_line( color = "black", linewidth = .25),
        plot.background = element_rect(fill = "#f1d9b5"),
        plot.title = element_blank(),
        panel.background = element_blank(),
        plot.margin = margin(20,10,10,10))

grid.draw(segmentsGrob(x0 = 0.005, x1 = 0.005, y0 = 0.012, y1 = 0.98))
grid.draw(segmentsGrob(x0 = 0.977, x1 = 0.977, y0 = 0.012, y1 = 0.98))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.2, y0 = 0.012, y1 = 0.98))
grid.draw(segmentsGrob(x0 = 0.005, x1 = 0.977, y0 = 0.96, y1 = 0.96))
grid.draw(segmentsGrob(x0 = 0.005, x1 = 0.977, y0 = 0.98, y1 = 0.98))
grid.draw(segmentsGrob(x0 = 0.005, x1 = 0.977, y0 = 0.012, y1 = 0.012))
grid.draw(textGrob("STATES.", x=.11,y=.969, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("8. NUMBER OF INHABITANTS TO THE SQUARE MILE, BY STATES AND TERRITORIES: 1890", x=.5, y=.99, gp=gpar(fontsize=7, fontfamily="Main")))

dev.off()


#### FIGURE 1: FULLY MASKED ####


png(here::here("1890-state-pop-density", "01_full_masked.png"),width=500,height=800)

ggplot(data, mapping = aes(x = Density, y = fct_rev(fct_inorder(State)))) +
  geom_col(color = "black", fill = "black", width = .45) +
  scale_x_continuous(position= "top" ,limits = c(0,325), breaks = seq(25,325,25)) +
  theme(axis.text.x = element_text(family = "Main", color = "#f1d9b5", size = 8),
        axis.title.x = element_blank(),
        axis.text.y = element_text(family = "Main", color = "#f1d9b5", hjust = 0, size = 8),
        axis.ticks.y = element_blank(),
        axis.title.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_line( color = "black", linewidth = .25),
        plot.background = element_rect(fill = "#f1d9b5"),
        plot.title = element_blank(),
        panel.background = element_blank(),
        plot.margin = margin(20,10,10,10))

grid.draw(segmentsGrob(x0 = 0.977, x1 = 0.977, y0 = 0.012, y1 = 0.96))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.2, y0 = 0.012, y1 = 0.96))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.977, y0 = 0.96, y1 = 0.96))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.977, y0 = 0.012, y1 = 0.012))

dev.off()


#### FIGURE 2: REVEAL DENSITY ####

png(here::here("1890-state-pop-density", "02_xaxis_unmasked.png"),width=500,height=800)

ggplot(data, mapping = aes(x = Density, y = fct_rev(fct_inorder(State)))) +
  geom_col(color = "black", fill = "black", width = .45) +
  scale_x_continuous(position= "top" ,limits = c(0,325), breaks = seq(25,325,25)) +
  theme(axis.text.x = element_text(family = "Main", color = "black", size = 8),
        axis.title.x = element_blank(),
        axis.text.y = element_text(family = "Main", color = "#f1d9b5", hjust = 0, size = 8),
        axis.ticks.y = element_blank(),
        axis.title.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_line( color = "black", linewidth = .25),
        plot.background = element_rect(fill = "#f1d9b5"),
        plot.title = element_blank(),
        panel.background = element_blank(),
        plot.margin = margin(20,10,10,10))

grid.draw(segmentsGrob(x0 = 0.977, x1 = 0.977, y0 = 0.012, y1 = 0.98))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.2, y0 = 0.012, y1 = 0.98))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.977, y0 = 0.96, y1 = 0.96))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.977, y0 = 0.98, y1 = 0.98))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.977, y0 = 0.012, y1 = 0.012))

dev.off()


#### FIGURE 3: REVEAL STATES ####

png(here::here("1890-state-pop-density", "03_states_unmasked.png"),width=500,height=800)

ggplot(data, mapping = aes(x = Density, y = fct_rev(fct_inorder(State)))) +
  geom_col(color = "black", fill = "black", width = .45) +
  scale_x_continuous(position= "top" ,limits = c(0,325), breaks = seq(25,325,25)) +
  theme(axis.text.x = element_text(family = "Main", color = "black", size = 8),
        axis.title.x = element_blank(),
        axis.text.y = element_text(family = "Main", color = "black", hjust = 0, size = 8),
        axis.ticks.y = element_blank(),
        axis.title.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_line( color = "black", linewidth = .25),
        plot.background = element_rect(fill = "#f1d9b5"),
        plot.title = element_blank(),
        panel.background = element_blank(),
        plot.margin = margin(20,10,10,10))

grid.draw(segmentsGrob(x0 = 0.005, x1 = 0.005, y0 = 0.012, y1 = 0.98))
grid.draw(segmentsGrob(x0 = 0.977, x1 = 0.977, y0 = 0.012, y1 = 0.98))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.2, y0 = 0.012, y1 = 0.98))
grid.draw(segmentsGrob(x0 = 0.005, x1 = 0.977, y0 = 0.96, y1 = 0.96))
grid.draw(segmentsGrob(x0 = 0.005, x1 = 0.977, y0 = 0.98, y1 = 0.98))
grid.draw(segmentsGrob(x0 = 0.005, x1 = 0.977, y0 = 0.012, y1 = 0.012))
grid.draw(textGrob("STATES.", x=.11,y=.969, gp=gpar(fontsize=8, fontfamily="Main")))

dev.off()


