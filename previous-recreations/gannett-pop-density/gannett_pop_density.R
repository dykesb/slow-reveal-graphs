#
# FILE:
#  gannett_pop_density.R
#
# DESCRIPTION:
# This code is for the State Population Density by Year Graph from Henry Gannett. The pngs show the graphs in various stages of slow reveal.  
# Most graph code was taken from Connor's work: https://github.com/connormcnamee/1890-Population-Density/blob/main/Inhabitants_Per_Sq_Mile.R  
# Source: https://www.loc.gov/resource/g3701gm.gct00010/?sp=8&r=0.858,0.601,0.58,0.913,1
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC
# 1: FULLY CONCEALED GRAPHIC
# 2: REVEAL DENSITY
# 3: REVEAL YEAR
#
# AUTHORS:
#   Connor & Robert Bilyk (main code)
#   Ian Curtis (2023, code to save plots)


library(tidyverse)
library(showtext)
library(srtools)



#### FIGURE 4: RECREATED GRAPHIC ####

font_add_google("Puritan", "Puritan")
showtext_auto()

Censuses <- c("1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890")
Population <- c(3929214,5308483,7239881,9633822,12866020,17069453,23191876,31443321,38558371,50155783,62622250)
Density <- c(4.75,6.41,3.62,4.82,6.25,8.29,7.78,10.39,12.74,16.58,20.70)
Urban_Pop <- c(119748,201806,315653,467252,856512,1449569,2896539,4645000,7538000,10794000,17446000)
Population_Density <- tibble(Censuses, Population, Density, Urban_Pop)

Mod_Total_Population <- Population_Density %>% 
  mutate(New_censuses = as.character(Censuses)) %>% 
  select(New_censuses, Density)


png(here::here("gannett-pop-density", "04_full_unmasked.png"), width=420,height=550)

ggplot(Mod_Total_Population) +
  annotate("segment", x = seq(0,20,2), xend = seq(0,20,2), y = 0, yend = 11.38) +
  annotate("segment", x = -2, xend = 22, y = 11.38, yend = 11.38) +
  geom_col(aes(y = New_censuses, x = Density), width = .4, color = "#1a1e19", fill = "#100e05") +
  labs(y = NULL, x = NULL, title = "Number of Inhabitants to the Square Mile \nat Each Census: 1790 to 1890") +
  scale_y_discrete(limits = rev) +
  scale_x_continuous(breaks = seq(0,20,2), position = "top", limit = c(-2,22)) +
  theme_linedraw() +
  coord_cartesian(xlim = c(-.5,20.85), ylim = c(1, 11.15)) +
  theme(axis.title = element_text(size = 9, family = "serif"),
        axis.text = element_text(size = 7.5, family = "serif"),
        plot.title = element_text(size = 13, family = "Puritan", hjust = .5, vjust = -3),
        axis.title.y = element_text(hjust = .5),
        axis.ticks = element_blank(),
        axis.text.y = element_text(size = 7.5, vjust = .75, margin = margin(r = -26)),
        axis.text.x.top = element_text(margin = margin(b = -16.5, t = 15)),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.x = element_blank(),
        aspect.ratio = 1.2,
        panel.background = element_rect(fill = "#f1d9b5"),
        plot.background = element_rect(fill = "#f1d9b5")
  )

dev.off()


#### FIGURE 1: FULLY CONCEALED GRAPHIC ####

png(here::here("gannett-pop-density", "01_full_unmasked.png"), width=420,height=550)

ggplot(Mod_Total_Population) +
  annotate("segment", x = seq(0,20,2), xend = seq(0,20,2), y = 0, yend = 11.38) +
  annotate("segment", x = -2, xend = 22, y = 11.38, yend = 11.38) +
  geom_col(aes(y = New_censuses, x = Density), width = .4, color = "#1a1e19", fill = "#100e05") +
  labs(y = NULL, x = NULL, title = "Number of Inhabitants to the Square Mile \nat Each Census: 1790 to 1890") +
  scale_y_discrete(limits = rev) +
  scale_x_continuous(breaks = seq(0,20,2), position = "top", limit = c(-2,22)) +
  theme_linedraw() +
  coord_cartesian(xlim = c(-.5,20.85), ylim = c(1, 11.15)) +
  theme(axis.title = element_text(size = 9, family = "serif"),
        axis.text = element_text(size = 7.5, family = "serif"),
        plot.title = element_text(size = 13, family = "Puritan", hjust = .5, vjust = -3),
        axis.title.y = element_text(hjust = .5),
        axis.ticks = element_blank(),
        axis.text.y = element_text(size = 7.5, vjust = .75, margin = margin(r = -26)),
        axis.text.x.top = element_text(margin = margin(b = -16.5, t = 15)),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.x = element_blank(),
        aspect.ratio = 1.2,
        panel.border = element_rect(fill = NA, linewidth = 1.05),
        panel.background = element_rect(fill = "#f1d9b5"),
        plot.background = element_rect(fill = "#f1d9b5")
        
  ) +
  hide(c("xtext", "ytext", "title"), colour = "#f1d9b5")

dev.off()


#### FIGURE 2: REVEAL YEAR ####

png(here::here("gannett-pop-density", "02_ylabel_unmasked.png"), width=420,height=550)

ggplot(Mod_Total_Population) +
  annotate("segment", x = seq(0,20,2), xend = seq(0,20,2), y = 0, yend = 11.38) +
  annotate("segment", x = -2, xend = 22, y = 11.38, yend = 11.38) +
  geom_col(aes(y = New_censuses, x = Density), width = .4, color = "#1a1e19", fill = "#100e05") +
  labs(y = NULL, x = NULL, title = "Number of Inhabitants to the Square Mile \nat Each Census: 1790 to 1890") +
  scale_y_discrete(limits = rev) +
  scale_x_continuous(breaks = seq(0,20,2), position = "top", limit = c(-2,22)) +
  theme_linedraw() +
  coord_cartesian(xlim = c(-.5,20.85), ylim = c(1, 11.15)) +
  theme(axis.title = element_text(size = 9, family = "serif"),
        axis.text = element_text(size = 7.5, family = "serif"),
        plot.title = element_text(size = 13, family = "Puritan", hjust = .5, vjust = -3),
        axis.title.y = element_text(hjust = .5),
        axis.ticks = element_blank(),
        axis.text.y = element_text(size = 7.5, vjust = .75, margin = margin(r = -26)),
        axis.text.x.top = element_text(margin = margin(b = -16.5, t = 15)),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.x = element_blank(),
        aspect.ratio = 1.2,
        panel.border = element_rect(fill = NA, linewidth = 1.05),
        panel.background = element_rect(fill = "#f1d9b5"),
        plot.background = element_rect(fill = "#f1d9b5")
        
  ) +
  hide(c("xtext", "title"), colour = "#f1d9b5")

dev.off()


#### FIGURE 3: REVEAL DENSITY ####

png(here::here("gannett-pop-density", "03_xlabel_unmasked.png"), width=420,height=550)

ggplot(Mod_Total_Population) +
  annotate("segment", x = seq(0,20,2), xend = seq(0,20,2), y = 0, yend = 11.38) +
  annotate("segment", x = -2, xend = 22, y = 11.38, yend = 11.38) +
  geom_col(aes(y = New_censuses, x = Density), width = .4, color = "#1a1e19", fill = "#100e05") +
  labs(y = NULL, x = NULL, title = "Number of Inhabitants to the Square Mile \nat Each Census: 1790 to 1890") +
  scale_y_discrete(limits = rev) +
  scale_x_continuous(breaks = seq(0,20,2), position = "top", limit = c(-2,22)) +
  theme_linedraw() +
  coord_cartesian(xlim = c(-.5,20.85), ylim = c(1, 11.15)) +
  theme(axis.title = element_text(size = 9, family = "serif"),
        axis.text = element_text(size = 7.5, family = "serif"),
        plot.title = element_text(size = 13, family = "Puritan", hjust = .5, vjust = -3),
        axis.title.y = element_text(hjust = .5),
        axis.ticks = element_blank(),
        axis.text.y = element_text(size = 7.5, vjust = .75, margin = margin(r = -26)),
        axis.text.x.top = element_text(margin = margin(b = -16.5, t = 15)),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.x = element_blank(),
        aspect.ratio = 1.2,
        panel.border = element_rect(fill = NA, linewidth = 1.05),
        panel.background = element_rect(fill = "#f1d9b5"),
        plot.background = element_rect(fill = "#f1d9b5")
        
  ) +
  hide(c("title"), colour = "#f1d9b5")

dev.off()






