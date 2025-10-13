library(tidyverse)
library(showtext)
library(readxl)
library(grid)
library(magick)
library(ggpubr)

#
# FILE:
# Human Population Growth and Density.R
#
# DESCRIPTION:
# This code is for the Human Population Growth and Density graph and map from Global Education   
# Project Earth. The png's include different graphs for the slow reveal.  
# Source: https://www.theglobaleducationproject.org/earth/global-ecology/human-population-growth-by-region
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC
# 1: FULLY CONCEALED GRAPHIC
# 2: REVEAL YEAR
# 3: REVEAL POPULATION
# 4: REVEAL MAP
#
# AUTHORS:
#   Robert Bilyk
#

font_add_google(name = "Roboto Slab", family = "Main")
font_add_google(name = "PT Sans Narrow", regular.wt=700, family = "Title")
showtext_auto()


world <- read_xlsx(here::here("Original Plot Work", "Human Population Growth and Density", "popg.xlsx")) 

world$Region <- world$Region %>%
  factor(levels = c("world", "asia", "africa", "europe", "lam", "nam", "oceania"))

## N: RECREATED GRAPHIC

graph <- ggplot(world, aes(x=Year, y=Rate, group=Region))+
  geom_line(aes(color=Region)) + 
  geom_area(aes(fill=Region))+
  theme(legend.position="none",
        plot.background = element_rect(color = "#c8eaf3",fill ="#c8eaf3"),
        panel.background = element_rect(color = "#c8eaf3", fill = "#c8eaf3"),
        axis.text = element_text(color = "#c8eaf3"),
        axis.title = element_text(color = "#c8eaf3"),
        axis.ticks = element_line(color = "#c8eaf3"),
        panel.grid = element_blank())+
  scale_color_manual(values = c("#d2bf95","#eec072","#5c3021","#fff2bd","#905739","#8b8989","#746660")) +
  scale_fill_manual(values = c("#d2bf95","#eec072","#5c3021","#fff2bd","#905739","#8b8989","#746660"))

gap <- ggplot() + theme_void() + theme(plot.background = element_rect(color = "#c8eaf3", fill="#c8eaf3"))

png(here::here("Original Plot Work", "Human Population Growth and Density", "tempgraph.png"),width=1100,height=700)

ggarrange(gap,
          ggarrange(gap, graph, gap, ncol=3, widths = c(.07, 1, .09)),
          gap,
          nrow = 3, heights = c(.15, 1, .1))

dev.off()


original <- image_read(here::here("Original Plot Work", "Human Population Growth and Density", "tempgraph.png"))
minimap <- image_read(here::here("Original Plot Work", "Human Population Growth and Density", "minimap.png"))


img <- image_draw(original)

segments(x0=138,y0=584, x1=138, y1=550, lwd = 1, lty = "solid")
segments(x0=162,y0=584, x1=162, y1=570, lwd = 1, lty = "solid")
segments(x0=186,y0=584, x1=186, y1=560, lwd = 1, lty = "solid")
segments(x0=210,y0=584, x1=210, y1=570, lwd = 1, lty = "solid")
segments(x0=234,y0=584, x1=234, y1=550, lwd = 1, lty = "solid")
segments(x0=258,y0=584, x1=258, y1=570, lwd = 1, lty = "solid")
segments(x0=282,y0=584, x1=282, y1=560, lwd = 1, lty = "solid")
segments(x0=306,y0=584, x1=306, y1=570, lwd = 1, lty = "solid")
segments(x0=330,y0=584, x1=330, y1=550, lwd = 1, lty = "solid")
segments(x0=354,y0=584, x1=354, y1=570, lwd = 1, lty = "solid")
segments(x0=388,y0=584, x1=388, y1=560, lwd = 1, lty = "solid")
segments(x0=414,y0=584, x1=414, y1=570, lwd = 1, lty = "solid")
segments(x0=438,y0=584, x1=438, y1=550, lwd = 1, lty = "solid")
segments(x0=462,y0=584, x1=462, y1=570, lwd = 1, lty = "solid")
segments(x0=486,y0=584, x1=486, y1=560, lwd = 1, lty = "solid")
segments(x0=510,y0=584, x1=510, y1=570, lwd = 1, lty = "solid")
segments(x0=534,y0=584, x1=534, y1=550, lwd = 1, lty = "solid")
segments(x0=558,y0=584, x1=558, y1=570, lwd = 1, lty = "solid")
segments(x0=582,y0=584, x1=582, y1=560, lwd = 1, lty = "solid")
segments(x0=606,y0=584, x1=606, y1=570, lwd = 1, lty = "solid")
segments(x0=630,y0=584, x1=630, y1=550, lwd = 1, lty = "solid")
segments(x0=654,y0=584, x1=654, y1=570, lwd = 1, lty = "solid")
segments(x0=678,y0=584, x1=678, y1=560, lwd = 1, lty = "solid")
segments(x0=702,y0=584, x1=702, y1=570, lwd = 1, lty = "solid")
segments(x0=726,y0=584, x1=726, y1=550, lwd = 1, lty = "solid")
segments(x0=750,y0=584, x1=750, y1=570, lwd = 1, lty = "solid")
segments(x0=774,y0=584, x1=774, y1=560, lwd = 1, lty = "solid")
segments(x0=798,y0=584, x1=798, y1=570, lwd = 1, lty = "solid")
segments(x0=822,y0=584, x1=822, y1=550, lwd = 1, lty = "solid")
segments(x0=846,y0=584, x1=846, y1=570, lwd = 1, lty = "solid")
segments(x0=870,y0=584, x1=870, y1=560, lwd = 1, lty = "solid")
segments(x0=894,y0=584, x1=894, y1=570, lwd = 1, lty = "solid")
segments(x0=918,y0=584, x1=918, y1=550, lwd = 1, lty = "solid")
segments(x0=942,y0=584, x1=942, y1=570, lwd = 1, lty = "solid")
segments(x0=967,y0=584, x1=967, y1=120, lwd = 1, lty = "solid")
segments(x0=115,y0=584, x1=967, y1=584, lwd = 1, lty = "solid")
segments(x0=115,y0=584, x1=115, y1=510, lwd = 1, lty = "solid")
segments(x0=115,y0=512, x1=120, y1=512, lwd = 1, lty = "solid")
segments(x0=115,y0=537, x1=120, y1=537, lwd = 1, lty = "solid")
segments(x0=115,y0=562, x1=120, y1=562, lwd = 1, lty = "solid")

segments(x0=967,y0=557, x1=972, y1=557, lwd = 1, lty = "solid")
segments(x0=967,y0=527, x1=972, y1=527, lwd = 1, lty = "solid")
segments(x0=967,y0=497, x1=972, y1=497, lwd = 1, lty = "solid")
segments(x0=967,y0=467, x1=972, y1=467, lwd = 1, lty = "solid")
segments(x0=967,y0=437, x1=972, y1=437, lwd = 1, lty = "solid")
segments(x0=967,y0=407, x1=972, y1=407, lwd = 1, lty = "solid")
segments(x0=967,y0=377, x1=972, y1=377, lwd = 1, lty = "solid")
segments(x0=967,y0=347, x1=972, y1=347, lwd = 1, lty = "solid")
segments(x0=967,y0=317, x1=972, y1=317, lwd = 1, lty = "solid")
segments(x0=967,y0=287, x1=972, y1=287, lwd = 1, lty = "solid")
segments(x0=967,y0=257, x1=972, y1=257, lwd = 1, lty = "solid")
segments(x0=967,y0=227, x1=972, y1=227, lwd = 1, lty = "solid")
segments(x0=967,y0=197, x1=972, y1=197, lwd = 1, lty = "solid")
segments(x0=967,y0=172, x1=972, y1=172, lwd = 1, lty = "solid")
segments(x0=967,y0=145, x1=972, y1=145, lwd = 1, lty = "solid")
segments(x0=967,y0=120, x1=972, y1=120, lwd = 1, lty = "solid")

text(138, 596, "1000", family = "Main", cex = 1.75, col = "black")
text(258, 596, "1200", family = "Main", cex = 1.75, col = "black")
text(330, 596, "1300", family = "Main", cex = 1.75, col = "black")
text(414, 596, "1400", family = "Main", cex = 1.75, col = "black")
text(510, 596, "1500", family = "Main", cex = 1.75, col = "black")
text(582, 596, "1600", family = "Main", cex = 1.75, col = "black")
text(678, 596, "1700", family = "Main", cex = 1.75, col = "black")
text(774, 596, "1800", family = "Main", cex = 1.75, col = "black")
text(870, 596, "1900", family = "Main", cex = 1.75, col = "black")
text(967, 596, "2019", family = "Main", cex = 1.75, col = "black")

text(103, 584, "0.0", family = "Main", cex = 1, col = "black")
text(103, 562, "0.5", family = "Main", cex = 1, col = "black")
text(103, 537, "1.0", family = "Main", cex = 1, col = "black")
text(103, 512, "1.5", family = "Main", cex = 1, col = "black")

text(982, 557, "0.5", family = "Main", cex = 1, col = "black")
text(982, 527, "1.0", family = "Main", cex = 1, col = "black")
text(982, 497, "1.5", family = "Main", cex = 1, col = "black")
text(982, 467, "2.0", family = "Main", cex = 1, col = "black")
text(982, 437, "2.5", family = "Main", cex = 1, col = "black")
text(982, 407, "3.0", family = "Main", cex = 1, col = "black")
text(982, 377, "3.5", family = "Main", cex = 1, col = "black")
text(982, 347, "4.0", family = "Main", cex = 1, col = "black")
text(982, 317, "4.5", family = "Main", cex = 1, col = "black")
text(982, 287, "5.0", family = "Main", cex = 1, col = "black")
text(982, 257, "5.5", family = "Main", cex = 1, col = "black")
text(982, 227, "6.0", family = "Main", cex = 1, col = "black")
text(982, 197, "6.5", family = "Main", cex = 1, col = "black")
text(982, 171, "7.0", family = "Main", cex = 1, col = "black")
text(982, 144, "7.5", family = "Main", cex = 1, col = "black")
text(982, 115, "8.0", family = "Main", cex = 1, col = "black")

text(85, 598, "Year", family = "Main", cex = 1.5, col = "black")
text(1027, 590, "Oceania", family = "Main", cex = 1.5, col = "black")
text(1040, 570, "N. America", family = "Main", cex = 1.5, col = "black")
text(1039, 545, "L. America", family = "Main", cex = 1.5, col = "black")
text(1022, 490, "Europe", family = "Main", cex = 1.5, col = "black")
text(1021, 445, "Africa", family = "Main", cex = 1.5, col = "black")
text(1017, 330, "Asia", family = "Main", cex = 1.5, col = "black")

segments(x0=967,y0=582, x1=991, y1=587, lwd = 1.25, lty = "solid")
segments(x0=967,y0=569, x1=991, y1=570, lwd = 1.25, lty = "solid")
segments(x0=967,y0=547, x1=991, y1=547, lwd = 1.25, lty = "solid")
segments(x0=967,y0=490, x1=991, y1=490, lwd = 1.25, lty = "solid")
segments(x0=967,y0=447, x1=991, y1=447, lwd = 1.25, lty = "solid")
segments(x0=967,y0=331, x1=991, y1=331, lwd = 1.25, lty = "solid")

text(104, 460, "Billions", family = "Main", cex = 1.75, srt=90, col = "black")

segments(x0=0,y0=615, x1=1100, y1=610, lwd = 2, lty = "solid")
text(545, 635, "The World at Six Billion: Population Division of the Department of Economic and Social Affairs of the United Nations Secretariat, World Population", family = "Main", cex = 1.25, col = "black")
text(553, 650, "Prospects: The 2004 Revision and World Urbanization Prospects: The 2003 Revision: http://esa.un.org/unpp: 'The Determinants and Consequences of", family = "Main", cex = 1.25, col = "black")
text(515, 665, "Population Trends, Vol. 1' (United Nations, New York). United Nations. 'World Population Prospects':www.geohive.com/global/: 2019 data;", family = "Main", cex = 1.25, col = "black")
text(290, 680, "ourworldindata.org/grapher/world-population-by-world-region-post-1820", family = "Main", cex = 1.25, col = "black")


grid.raster(minimap, .45, .6, height = .53)
text(550, 50, "HUMAN POPULATION GROWTH AND DENSITY", family = "Title", cex = 4, col = "#7d4f0b")

dev.off()

image_write(img, path = here::here("Original Plot Work", "Human Population Growth and Density", "5 Human Population Growth and Density.png"), format = "png")

## 1: FULLY CONCEALED GRAPHIC

graph <- ggplot(world, aes(x=Year, y=Rate, group=Region))+
  geom_line(aes(color=Region)) + 
  geom_area(aes(fill=Region))+
  theme(legend.position="none",
        plot.background = element_rect(color = "#c8eaf3",fill ="#c8eaf3"),
        panel.background = element_rect(color = "#c8eaf3", fill = "#c8eaf3"),
        axis.text = element_text(color = "#c8eaf3"),
        axis.title = element_text(color = "#c8eaf3"),
        axis.ticks = element_line(color = "#c8eaf3"),
        panel.grid = element_blank())+
  scale_color_manual(values = c("#d2bf95","#eec072","#5c3021","#fff2bd","#905739","#8b8989","#746660")) +
  scale_fill_manual(values = c("#d2bf95","#eec072","#5c3021","#fff2bd","#905739","#8b8989","#746660"))

gap <- ggplot() + theme_void() + theme(plot.background = element_rect(color = "#c8eaf3", fill="#c8eaf3"))

png(here::here("Original Plot Work", "Human Population Growth and Density", "tempgraph.png"),width=1100,height=700)

ggarrange(gap,
          ggarrange(gap, graph, gap, ncol=3, widths = c(.07, 1, .09)),
          gap,
          nrow = 3, heights = c(.15, 1, .1))

dev.off()


original <- image_read(here::here("Original Plot Work", "Human Population Growth and Density", "tempgraph.png"))
minimap <- image_read(here::here("Original Plot Work", "Human Population Growth and Density", "minimap.png"))


img <- image_draw(original)

segments(x0=138,y0=584, x1=138, y1=550, lwd = 1, lty = "solid")
segments(x0=162,y0=584, x1=162, y1=570, lwd = 1, lty = "solid")
segments(x0=186,y0=584, x1=186, y1=560, lwd = 1, lty = "solid")
segments(x0=210,y0=584, x1=210, y1=570, lwd = 1, lty = "solid")
segments(x0=234,y0=584, x1=234, y1=550, lwd = 1, lty = "solid")
segments(x0=258,y0=584, x1=258, y1=570, lwd = 1, lty = "solid")
segments(x0=282,y0=584, x1=282, y1=560, lwd = 1, lty = "solid")
segments(x0=306,y0=584, x1=306, y1=570, lwd = 1, lty = "solid")
segments(x0=330,y0=584, x1=330, y1=550, lwd = 1, lty = "solid")
segments(x0=354,y0=584, x1=354, y1=570, lwd = 1, lty = "solid")
segments(x0=388,y0=584, x1=388, y1=560, lwd = 1, lty = "solid")
segments(x0=414,y0=584, x1=414, y1=570, lwd = 1, lty = "solid")
segments(x0=438,y0=584, x1=438, y1=550, lwd = 1, lty = "solid")
segments(x0=462,y0=584, x1=462, y1=570, lwd = 1, lty = "solid")
segments(x0=486,y0=584, x1=486, y1=560, lwd = 1, lty = "solid")
segments(x0=510,y0=584, x1=510, y1=570, lwd = 1, lty = "solid")
segments(x0=534,y0=584, x1=534, y1=550, lwd = 1, lty = "solid")
segments(x0=558,y0=584, x1=558, y1=570, lwd = 1, lty = "solid")
segments(x0=582,y0=584, x1=582, y1=560, lwd = 1, lty = "solid")
segments(x0=606,y0=584, x1=606, y1=570, lwd = 1, lty = "solid")
segments(x0=630,y0=584, x1=630, y1=550, lwd = 1, lty = "solid")
segments(x0=654,y0=584, x1=654, y1=570, lwd = 1, lty = "solid")
segments(x0=678,y0=584, x1=678, y1=560, lwd = 1, lty = "solid")
segments(x0=702,y0=584, x1=702, y1=570, lwd = 1, lty = "solid")
segments(x0=726,y0=584, x1=726, y1=550, lwd = 1, lty = "solid")
segments(x0=750,y0=584, x1=750, y1=570, lwd = 1, lty = "solid")
segments(x0=774,y0=584, x1=774, y1=560, lwd = 1, lty = "solid")
segments(x0=798,y0=584, x1=798, y1=570, lwd = 1, lty = "solid")
segments(x0=822,y0=584, x1=822, y1=550, lwd = 1, lty = "solid")
segments(x0=846,y0=584, x1=846, y1=570, lwd = 1, lty = "solid")
segments(x0=870,y0=584, x1=870, y1=560, lwd = 1, lty = "solid")
segments(x0=894,y0=584, x1=894, y1=570, lwd = 1, lty = "solid")
segments(x0=918,y0=584, x1=918, y1=550, lwd = 1, lty = "solid")
segments(x0=942,y0=584, x1=942, y1=570, lwd = 1, lty = "solid")
segments(x0=967,y0=584, x1=967, y1=120, lwd = 1, lty = "solid")
segments(x0=115,y0=584, x1=967, y1=584, lwd = 1, lty = "solid")
segments(x0=115,y0=584, x1=115, y1=510, lwd = 1, lty = "solid")
segments(x0=115,y0=512, x1=120, y1=512, lwd = 1, lty = "solid")
segments(x0=115,y0=537, x1=120, y1=537, lwd = 1, lty = "solid")
segments(x0=115,y0=562, x1=120, y1=562, lwd = 1, lty = "solid")

segments(x0=967,y0=557, x1=972, y1=557, lwd = 1, lty = "solid")
segments(x0=967,y0=527, x1=972, y1=527, lwd = 1, lty = "solid")
segments(x0=967,y0=497, x1=972, y1=497, lwd = 1, lty = "solid")
segments(x0=967,y0=467, x1=972, y1=467, lwd = 1, lty = "solid")
segments(x0=967,y0=437, x1=972, y1=437, lwd = 1, lty = "solid")
segments(x0=967,y0=407, x1=972, y1=407, lwd = 1, lty = "solid")
segments(x0=967,y0=377, x1=972, y1=377, lwd = 1, lty = "solid")
segments(x0=967,y0=347, x1=972, y1=347, lwd = 1, lty = "solid")
segments(x0=967,y0=317, x1=972, y1=317, lwd = 1, lty = "solid")
segments(x0=967,y0=287, x1=972, y1=287, lwd = 1, lty = "solid")
segments(x0=967,y0=257, x1=972, y1=257, lwd = 1, lty = "solid")
segments(x0=967,y0=227, x1=972, y1=227, lwd = 1, lty = "solid")
segments(x0=967,y0=197, x1=972, y1=197, lwd = 1, lty = "solid")
segments(x0=967,y0=172, x1=972, y1=172, lwd = 1, lty = "solid")
segments(x0=967,y0=145, x1=972, y1=145, lwd = 1, lty = "solid")
segments(x0=967,y0=120, x1=972, y1=120, lwd = 1, lty = "solid")



segments(x0=0,y0=615, x1=1100, y1=610, lwd = 2, lty = "solid")

dev.off()

image_write(img, path = here::here("Original Plot Work", "Human Population Growth and Density", "1 Human Population Growth and Density.png"), format = "png")

## 2: REVEAL YEAR

graph <- ggplot(world, aes(x=Year, y=Rate, group=Region))+
  geom_line(aes(color=Region)) + 
  geom_area(aes(fill=Region))+
  theme(legend.position="none",
        plot.background = element_rect(color = "#c8eaf3",fill ="#c8eaf3"),
        panel.background = element_rect(color = "#c8eaf3", fill = "#c8eaf3"),
        axis.text = element_text(color = "#c8eaf3"),
        axis.title = element_text(color = "#c8eaf3"),
        axis.ticks = element_line(color = "#c8eaf3"),
        panel.grid = element_blank())+
  scale_color_manual(values = c("#d2bf95","#eec072","#5c3021","#fff2bd","#905739","#8b8989","#746660")) +
  scale_fill_manual(values = c("#d2bf95","#eec072","#5c3021","#fff2bd","#905739","#8b8989","#746660"))

gap <- ggplot() + theme_void() + theme(plot.background = element_rect(color = "#c8eaf3", fill="#c8eaf3"))

png(here::here("Original Plot Work", "Human Population Growth and Density", "tempgraph.png"),width=1100,height=700)

ggarrange(gap,
          ggarrange(gap, graph, gap, ncol=3, widths = c(.07, 1, .09)),
          gap,
          nrow = 3, heights = c(.15, 1, .1))

dev.off()


original <- image_read(here::here("Original Plot Work", "Human Population Growth and Density", "tempgraph.png"))
minimap <- image_read(here::here("Original Plot Work", "Human Population Growth and Density", "minimap.png"))


img <- image_draw(original)

segments(x0=138,y0=584, x1=138, y1=550, lwd = 1, lty = "solid")
segments(x0=162,y0=584, x1=162, y1=570, lwd = 1, lty = "solid")
segments(x0=186,y0=584, x1=186, y1=560, lwd = 1, lty = "solid")
segments(x0=210,y0=584, x1=210, y1=570, lwd = 1, lty = "solid")
segments(x0=234,y0=584, x1=234, y1=550, lwd = 1, lty = "solid")
segments(x0=258,y0=584, x1=258, y1=570, lwd = 1, lty = "solid")
segments(x0=282,y0=584, x1=282, y1=560, lwd = 1, lty = "solid")
segments(x0=306,y0=584, x1=306, y1=570, lwd = 1, lty = "solid")
segments(x0=330,y0=584, x1=330, y1=550, lwd = 1, lty = "solid")
segments(x0=354,y0=584, x1=354, y1=570, lwd = 1, lty = "solid")
segments(x0=388,y0=584, x1=388, y1=560, lwd = 1, lty = "solid")
segments(x0=414,y0=584, x1=414, y1=570, lwd = 1, lty = "solid")
segments(x0=438,y0=584, x1=438, y1=550, lwd = 1, lty = "solid")
segments(x0=462,y0=584, x1=462, y1=570, lwd = 1, lty = "solid")
segments(x0=486,y0=584, x1=486, y1=560, lwd = 1, lty = "solid")
segments(x0=510,y0=584, x1=510, y1=570, lwd = 1, lty = "solid")
segments(x0=534,y0=584, x1=534, y1=550, lwd = 1, lty = "solid")
segments(x0=558,y0=584, x1=558, y1=570, lwd = 1, lty = "solid")
segments(x0=582,y0=584, x1=582, y1=560, lwd = 1, lty = "solid")
segments(x0=606,y0=584, x1=606, y1=570, lwd = 1, lty = "solid")
segments(x0=630,y0=584, x1=630, y1=550, lwd = 1, lty = "solid")
segments(x0=654,y0=584, x1=654, y1=570, lwd = 1, lty = "solid")
segments(x0=678,y0=584, x1=678, y1=560, lwd = 1, lty = "solid")
segments(x0=702,y0=584, x1=702, y1=570, lwd = 1, lty = "solid")
segments(x0=726,y0=584, x1=726, y1=550, lwd = 1, lty = "solid")
segments(x0=750,y0=584, x1=750, y1=570, lwd = 1, lty = "solid")
segments(x0=774,y0=584, x1=774, y1=560, lwd = 1, lty = "solid")
segments(x0=798,y0=584, x1=798, y1=570, lwd = 1, lty = "solid")
segments(x0=822,y0=584, x1=822, y1=550, lwd = 1, lty = "solid")
segments(x0=846,y0=584, x1=846, y1=570, lwd = 1, lty = "solid")
segments(x0=870,y0=584, x1=870, y1=560, lwd = 1, lty = "solid")
segments(x0=894,y0=584, x1=894, y1=570, lwd = 1, lty = "solid")
segments(x0=918,y0=584, x1=918, y1=550, lwd = 1, lty = "solid")
segments(x0=942,y0=584, x1=942, y1=570, lwd = 1, lty = "solid")
segments(x0=967,y0=584, x1=967, y1=120, lwd = 1, lty = "solid")
segments(x0=115,y0=584, x1=967, y1=584, lwd = 1, lty = "solid")
segments(x0=115,y0=584, x1=115, y1=510, lwd = 1, lty = "solid")
segments(x0=115,y0=512, x1=120, y1=512, lwd = 1, lty = "solid")
segments(x0=115,y0=537, x1=120, y1=537, lwd = 1, lty = "solid")
segments(x0=115,y0=562, x1=120, y1=562, lwd = 1, lty = "solid")

segments(x0=967,y0=557, x1=972, y1=557, lwd = 1, lty = "solid")
segments(x0=967,y0=527, x1=972, y1=527, lwd = 1, lty = "solid")
segments(x0=967,y0=497, x1=972, y1=497, lwd = 1, lty = "solid")
segments(x0=967,y0=467, x1=972, y1=467, lwd = 1, lty = "solid")
segments(x0=967,y0=437, x1=972, y1=437, lwd = 1, lty = "solid")
segments(x0=967,y0=407, x1=972, y1=407, lwd = 1, lty = "solid")
segments(x0=967,y0=377, x1=972, y1=377, lwd = 1, lty = "solid")
segments(x0=967,y0=347, x1=972, y1=347, lwd = 1, lty = "solid")
segments(x0=967,y0=317, x1=972, y1=317, lwd = 1, lty = "solid")
segments(x0=967,y0=287, x1=972, y1=287, lwd = 1, lty = "solid")
segments(x0=967,y0=257, x1=972, y1=257, lwd = 1, lty = "solid")
segments(x0=967,y0=227, x1=972, y1=227, lwd = 1, lty = "solid")
segments(x0=967,y0=197, x1=972, y1=197, lwd = 1, lty = "solid")
segments(x0=967,y0=172, x1=972, y1=172, lwd = 1, lty = "solid")
segments(x0=967,y0=145, x1=972, y1=145, lwd = 1, lty = "solid")
segments(x0=967,y0=120, x1=972, y1=120, lwd = 1, lty = "solid")

text(138, 596, "1000", family = "Main", cex = 1.75, col = "black")
text(258, 596, "1200", family = "Main", cex = 1.75, col = "black")
text(330, 596, "1300", family = "Main", cex = 1.75, col = "black")
text(414, 596, "1400", family = "Main", cex = 1.75, col = "black")
text(510, 596, "1500", family = "Main", cex = 1.75, col = "black")
text(582, 596, "1600", family = "Main", cex = 1.75, col = "black")
text(678, 596, "1700", family = "Main", cex = 1.75, col = "black")
text(774, 596, "1800", family = "Main", cex = 1.75, col = "black")
text(870, 596, "1900", family = "Main", cex = 1.75, col = "black")
text(967, 596, "2019", family = "Main", cex = 1.75, col = "black")

text(85, 598, "Year", family = "Main", cex = 1.5, col = "black")

segments(x0=0,y0=615, x1=1100, y1=610, lwd = 2, lty = "solid")

dev.off()

image_write(img, path = here::here("Original Plot Work", "Human Population Growth and Density", "2 Human Population Growth and Density.png"), format = "png")

## 3: REVEAL POPULATION

graph <- ggplot(world, aes(x=Year, y=Rate, group=Region))+
  geom_line(aes(color=Region)) + 
  geom_area(aes(fill=Region))+
  theme(legend.position="none",
        plot.background = element_rect(color = "#c8eaf3",fill ="#c8eaf3"),
        panel.background = element_rect(color = "#c8eaf3", fill = "#c8eaf3"),
        axis.text = element_text(color = "#c8eaf3"),
        axis.title = element_text(color = "#c8eaf3"),
        axis.ticks = element_line(color = "#c8eaf3"),
        panel.grid = element_blank())+
  scale_color_manual(values = c("#d2bf95","#eec072","#5c3021","#fff2bd","#905739","#8b8989","#746660")) +
  scale_fill_manual(values = c("#d2bf95","#eec072","#5c3021","#fff2bd","#905739","#8b8989","#746660"))

gap <- ggplot() + theme_void() + theme(plot.background = element_rect(color = "#c8eaf3", fill="#c8eaf3"))

png(here::here("Original Plot Work", "Human Population Growth and Density", "tempgraph.png"),width=1100,height=700)

ggarrange(gap,
          ggarrange(gap, graph, gap, ncol=3, widths = c(.07, 1, .09)),
          gap,
          nrow = 3, heights = c(.15, 1, .1))

dev.off()


original <- image_read(here::here("Original Plot Work", "Human Population Growth and Density", "tempgraph.png"))
minimap <- image_read(here::here("Original Plot Work", "Human Population Growth and Density", "minimap.png"))


img <- image_draw(original)

segments(x0=138,y0=584, x1=138, y1=550, lwd = 1, lty = "solid")
segments(x0=162,y0=584, x1=162, y1=570, lwd = 1, lty = "solid")
segments(x0=186,y0=584, x1=186, y1=560, lwd = 1, lty = "solid")
segments(x0=210,y0=584, x1=210, y1=570, lwd = 1, lty = "solid")
segments(x0=234,y0=584, x1=234, y1=550, lwd = 1, lty = "solid")
segments(x0=258,y0=584, x1=258, y1=570, lwd = 1, lty = "solid")
segments(x0=282,y0=584, x1=282, y1=560, lwd = 1, lty = "solid")
segments(x0=306,y0=584, x1=306, y1=570, lwd = 1, lty = "solid")
segments(x0=330,y0=584, x1=330, y1=550, lwd = 1, lty = "solid")
segments(x0=354,y0=584, x1=354, y1=570, lwd = 1, lty = "solid")
segments(x0=388,y0=584, x1=388, y1=560, lwd = 1, lty = "solid")
segments(x0=414,y0=584, x1=414, y1=570, lwd = 1, lty = "solid")
segments(x0=438,y0=584, x1=438, y1=550, lwd = 1, lty = "solid")
segments(x0=462,y0=584, x1=462, y1=570, lwd = 1, lty = "solid")
segments(x0=486,y0=584, x1=486, y1=560, lwd = 1, lty = "solid")
segments(x0=510,y0=584, x1=510, y1=570, lwd = 1, lty = "solid")
segments(x0=534,y0=584, x1=534, y1=550, lwd = 1, lty = "solid")
segments(x0=558,y0=584, x1=558, y1=570, lwd = 1, lty = "solid")
segments(x0=582,y0=584, x1=582, y1=560, lwd = 1, lty = "solid")
segments(x0=606,y0=584, x1=606, y1=570, lwd = 1, lty = "solid")
segments(x0=630,y0=584, x1=630, y1=550, lwd = 1, lty = "solid")
segments(x0=654,y0=584, x1=654, y1=570, lwd = 1, lty = "solid")
segments(x0=678,y0=584, x1=678, y1=560, lwd = 1, lty = "solid")
segments(x0=702,y0=584, x1=702, y1=570, lwd = 1, lty = "solid")
segments(x0=726,y0=584, x1=726, y1=550, lwd = 1, lty = "solid")
segments(x0=750,y0=584, x1=750, y1=570, lwd = 1, lty = "solid")
segments(x0=774,y0=584, x1=774, y1=560, lwd = 1, lty = "solid")
segments(x0=798,y0=584, x1=798, y1=570, lwd = 1, lty = "solid")
segments(x0=822,y0=584, x1=822, y1=550, lwd = 1, lty = "solid")
segments(x0=846,y0=584, x1=846, y1=570, lwd = 1, lty = "solid")
segments(x0=870,y0=584, x1=870, y1=560, lwd = 1, lty = "solid")
segments(x0=894,y0=584, x1=894, y1=570, lwd = 1, lty = "solid")
segments(x0=918,y0=584, x1=918, y1=550, lwd = 1, lty = "solid")
segments(x0=942,y0=584, x1=942, y1=570, lwd = 1, lty = "solid")
segments(x0=967,y0=584, x1=967, y1=120, lwd = 1, lty = "solid")
segments(x0=115,y0=584, x1=967, y1=584, lwd = 1, lty = "solid")
segments(x0=115,y0=584, x1=115, y1=510, lwd = 1, lty = "solid")
segments(x0=115,y0=512, x1=120, y1=512, lwd = 1, lty = "solid")
segments(x0=115,y0=537, x1=120, y1=537, lwd = 1, lty = "solid")
segments(x0=115,y0=562, x1=120, y1=562, lwd = 1, lty = "solid")

segments(x0=967,y0=557, x1=972, y1=557, lwd = 1, lty = "solid")
segments(x0=967,y0=527, x1=972, y1=527, lwd = 1, lty = "solid")
segments(x0=967,y0=497, x1=972, y1=497, lwd = 1, lty = "solid")
segments(x0=967,y0=467, x1=972, y1=467, lwd = 1, lty = "solid")
segments(x0=967,y0=437, x1=972, y1=437, lwd = 1, lty = "solid")
segments(x0=967,y0=407, x1=972, y1=407, lwd = 1, lty = "solid")
segments(x0=967,y0=377, x1=972, y1=377, lwd = 1, lty = "solid")
segments(x0=967,y0=347, x1=972, y1=347, lwd = 1, lty = "solid")
segments(x0=967,y0=317, x1=972, y1=317, lwd = 1, lty = "solid")
segments(x0=967,y0=287, x1=972, y1=287, lwd = 1, lty = "solid")
segments(x0=967,y0=257, x1=972, y1=257, lwd = 1, lty = "solid")
segments(x0=967,y0=227, x1=972, y1=227, lwd = 1, lty = "solid")
segments(x0=967,y0=197, x1=972, y1=197, lwd = 1, lty = "solid")
segments(x0=967,y0=172, x1=972, y1=172, lwd = 1, lty = "solid")
segments(x0=967,y0=145, x1=972, y1=145, lwd = 1, lty = "solid")
segments(x0=967,y0=120, x1=972, y1=120, lwd = 1, lty = "solid")

text(138, 596, "1000", family = "Main", cex = 1.75, col = "black")
text(258, 596, "1200", family = "Main", cex = 1.75, col = "black")
text(330, 596, "1300", family = "Main", cex = 1.75, col = "black")
text(414, 596, "1400", family = "Main", cex = 1.75, col = "black")
text(510, 596, "1500", family = "Main", cex = 1.75, col = "black")
text(582, 596, "1600", family = "Main", cex = 1.75, col = "black")
text(678, 596, "1700", family = "Main", cex = 1.75, col = "black")
text(774, 596, "1800", family = "Main", cex = 1.75, col = "black")
text(870, 596, "1900", family = "Main", cex = 1.75, col = "black")
text(967, 596, "2019", family = "Main", cex = 1.75, col = "black")

text(103, 584, "0.0", family = "Main", cex = 1, col = "black")
text(103, 562, "0.5", family = "Main", cex = 1, col = "black")
text(103, 537, "1.0", family = "Main", cex = 1, col = "black")
text(103, 512, "1.5", family = "Main", cex = 1, col = "black")

text(982, 557, "0.5", family = "Main", cex = 1, col = "black")
text(982, 527, "1.0", family = "Main", cex = 1, col = "black")
text(982, 497, "1.5", family = "Main", cex = 1, col = "black")
text(982, 467, "2.0", family = "Main", cex = 1, col = "black")
text(982, 437, "2.5", family = "Main", cex = 1, col = "black")
text(982, 407, "3.0", family = "Main", cex = 1, col = "black")
text(982, 377, "3.5", family = "Main", cex = 1, col = "black")
text(982, 347, "4.0", family = "Main", cex = 1, col = "black")
text(982, 317, "4.5", family = "Main", cex = 1, col = "black")
text(982, 287, "5.0", family = "Main", cex = 1, col = "black")
text(982, 257, "5.5", family = "Main", cex = 1, col = "black")
text(982, 227, "6.0", family = "Main", cex = 1, col = "black")
text(982, 197, "6.5", family = "Main", cex = 1, col = "black")
text(982, 171, "7.0", family = "Main", cex = 1, col = "black")
text(982, 144, "7.5", family = "Main", cex = 1, col = "black")
text(982, 115, "8.0", family = "Main", cex = 1, col = "black")

text(85, 598, "Year", family = "Main", cex = 1.5, col = "black")


segments(x0=967,y0=582, x1=991, y1=587, lwd = 1.25, lty = "solid")
segments(x0=967,y0=569, x1=991, y1=570, lwd = 1.25, lty = "solid")
segments(x0=967,y0=547, x1=991, y1=547, lwd = 1.25, lty = "solid")
segments(x0=967,y0=490, x1=991, y1=490, lwd = 1.25, lty = "solid")
segments(x0=967,y0=447, x1=991, y1=447, lwd = 1.25, lty = "solid")
segments(x0=967,y0=331, x1=991, y1=331, lwd = 1.25, lty = "solid")

segments(x0=0,y0=615, x1=1100, y1=610, lwd = 2, lty = "solid")

dev.off()

image_write(img, path = here::here("Original Plot Work", "Human Population Growth and Density", "3 Human Population Growth and Density.png"), format = "png")

## 4: REVEAL MAP

graph <- ggplot(world, aes(x=Year, y=Rate, group=Region))+
  geom_line(aes(color=Region)) + 
  geom_area(aes(fill=Region))+
  theme(legend.position="none",
        plot.background = element_rect(color = "#c8eaf3",fill ="#c8eaf3"),
        panel.background = element_rect(color = "#c8eaf3", fill = "#c8eaf3"),
        axis.text = element_text(color = "#c8eaf3"),
        axis.title = element_text(color = "#c8eaf3"),
        axis.ticks = element_line(color = "#c8eaf3"),
        panel.grid = element_blank())+
  scale_color_manual(values = c("#d2bf95","#eec072","#5c3021","#fff2bd","#905739","#8b8989","#746660")) +
  scale_fill_manual(values = c("#d2bf95","#eec072","#5c3021","#fff2bd","#905739","#8b8989","#746660"))

gap <- ggplot() + theme_void() + theme(plot.background = element_rect(color = "#c8eaf3", fill="#c8eaf3"))

png(here::here("Original Plot Work", "Human Population Growth and Density", "tempgraph.png"),width=1100,height=700)

ggarrange(gap,
          ggarrange(gap, graph, gap, ncol=3, widths = c(.07, 1, .09)),
          gap,
          nrow = 3, heights = c(.15, 1, .1))

dev.off()


original <- image_read(here::here("Original Plot Work", "Human Population Growth and Density", "tempgraph.png"))
minimap <- image_read(here::here("Original Plot Work", "Human Population Growth and Density", "minimap.png"))


img <- image_draw(original)

segments(x0=138,y0=584, x1=138, y1=550, lwd = 1, lty = "solid")
segments(x0=162,y0=584, x1=162, y1=570, lwd = 1, lty = "solid")
segments(x0=186,y0=584, x1=186, y1=560, lwd = 1, lty = "solid")
segments(x0=210,y0=584, x1=210, y1=570, lwd = 1, lty = "solid")
segments(x0=234,y0=584, x1=234, y1=550, lwd = 1, lty = "solid")
segments(x0=258,y0=584, x1=258, y1=570, lwd = 1, lty = "solid")
segments(x0=282,y0=584, x1=282, y1=560, lwd = 1, lty = "solid")
segments(x0=306,y0=584, x1=306, y1=570, lwd = 1, lty = "solid")
segments(x0=330,y0=584, x1=330, y1=550, lwd = 1, lty = "solid")
segments(x0=354,y0=584, x1=354, y1=570, lwd = 1, lty = "solid")
segments(x0=388,y0=584, x1=388, y1=560, lwd = 1, lty = "solid")
segments(x0=414,y0=584, x1=414, y1=570, lwd = 1, lty = "solid")
segments(x0=438,y0=584, x1=438, y1=550, lwd = 1, lty = "solid")
segments(x0=462,y0=584, x1=462, y1=570, lwd = 1, lty = "solid")
segments(x0=486,y0=584, x1=486, y1=560, lwd = 1, lty = "solid")
segments(x0=510,y0=584, x1=510, y1=570, lwd = 1, lty = "solid")
segments(x0=534,y0=584, x1=534, y1=550, lwd = 1, lty = "solid")
segments(x0=558,y0=584, x1=558, y1=570, lwd = 1, lty = "solid")
segments(x0=582,y0=584, x1=582, y1=560, lwd = 1, lty = "solid")
segments(x0=606,y0=584, x1=606, y1=570, lwd = 1, lty = "solid")
segments(x0=630,y0=584, x1=630, y1=550, lwd = 1, lty = "solid")
segments(x0=654,y0=584, x1=654, y1=570, lwd = 1, lty = "solid")
segments(x0=678,y0=584, x1=678, y1=560, lwd = 1, lty = "solid")
segments(x0=702,y0=584, x1=702, y1=570, lwd = 1, lty = "solid")
segments(x0=726,y0=584, x1=726, y1=550, lwd = 1, lty = "solid")
segments(x0=750,y0=584, x1=750, y1=570, lwd = 1, lty = "solid")
segments(x0=774,y0=584, x1=774, y1=560, lwd = 1, lty = "solid")
segments(x0=798,y0=584, x1=798, y1=570, lwd = 1, lty = "solid")
segments(x0=822,y0=584, x1=822, y1=550, lwd = 1, lty = "solid")
segments(x0=846,y0=584, x1=846, y1=570, lwd = 1, lty = "solid")
segments(x0=870,y0=584, x1=870, y1=560, lwd = 1, lty = "solid")
segments(x0=894,y0=584, x1=894, y1=570, lwd = 1, lty = "solid")
segments(x0=918,y0=584, x1=918, y1=550, lwd = 1, lty = "solid")
segments(x0=942,y0=584, x1=942, y1=570, lwd = 1, lty = "solid")
segments(x0=967,y0=584, x1=967, y1=120, lwd = 1, lty = "solid")
segments(x0=115,y0=584, x1=967, y1=584, lwd = 1, lty = "solid")
segments(x0=115,y0=584, x1=115, y1=510, lwd = 1, lty = "solid")
segments(x0=115,y0=512, x1=120, y1=512, lwd = 1, lty = "solid")
segments(x0=115,y0=537, x1=120, y1=537, lwd = 1, lty = "solid")
segments(x0=115,y0=562, x1=120, y1=562, lwd = 1, lty = "solid")

segments(x0=967,y0=557, x1=972, y1=557, lwd = 1, lty = "solid")
segments(x0=967,y0=527, x1=972, y1=527, lwd = 1, lty = "solid")
segments(x0=967,y0=497, x1=972, y1=497, lwd = 1, lty = "solid")
segments(x0=967,y0=467, x1=972, y1=467, lwd = 1, lty = "solid")
segments(x0=967,y0=437, x1=972, y1=437, lwd = 1, lty = "solid")
segments(x0=967,y0=407, x1=972, y1=407, lwd = 1, lty = "solid")
segments(x0=967,y0=377, x1=972, y1=377, lwd = 1, lty = "solid")
segments(x0=967,y0=347, x1=972, y1=347, lwd = 1, lty = "solid")
segments(x0=967,y0=317, x1=972, y1=317, lwd = 1, lty = "solid")
segments(x0=967,y0=287, x1=972, y1=287, lwd = 1, lty = "solid")
segments(x0=967,y0=257, x1=972, y1=257, lwd = 1, lty = "solid")
segments(x0=967,y0=227, x1=972, y1=227, lwd = 1, lty = "solid")
segments(x0=967,y0=197, x1=972, y1=197, lwd = 1, lty = "solid")
segments(x0=967,y0=172, x1=972, y1=172, lwd = 1, lty = "solid")
segments(x0=967,y0=145, x1=972, y1=145, lwd = 1, lty = "solid")
segments(x0=967,y0=120, x1=972, y1=120, lwd = 1, lty = "solid")

text(138, 596, "1000", family = "Main", cex = 1.75, col = "black")
text(258, 596, "1200", family = "Main", cex = 1.75, col = "black")
text(330, 596, "1300", family = "Main", cex = 1.75, col = "black")
text(414, 596, "1400", family = "Main", cex = 1.75, col = "black")
text(510, 596, "1500", family = "Main", cex = 1.75, col = "black")
text(582, 596, "1600", family = "Main", cex = 1.75, col = "black")
text(678, 596, "1700", family = "Main", cex = 1.75, col = "black")
text(774, 596, "1800", family = "Main", cex = 1.75, col = "black")
text(870, 596, "1900", family = "Main", cex = 1.75, col = "black")
text(967, 596, "2019", family = "Main", cex = 1.75, col = "black")

text(103, 584, "0.0", family = "Main", cex = 1, col = "black")
text(103, 562, "0.5", family = "Main", cex = 1, col = "black")
text(103, 537, "1.0", family = "Main", cex = 1, col = "black")
text(103, 512, "1.5", family = "Main", cex = 1, col = "black")

text(982, 557, "0.5", family = "Main", cex = 1, col = "black")
text(982, 527, "1.0", family = "Main", cex = 1, col = "black")
text(982, 497, "1.5", family = "Main", cex = 1, col = "black")
text(982, 467, "2.0", family = "Main", cex = 1, col = "black")
text(982, 437, "2.5", family = "Main", cex = 1, col = "black")
text(982, 407, "3.0", family = "Main", cex = 1, col = "black")
text(982, 377, "3.5", family = "Main", cex = 1, col = "black")
text(982, 347, "4.0", family = "Main", cex = 1, col = "black")
text(982, 317, "4.5", family = "Main", cex = 1, col = "black")
text(982, 287, "5.0", family = "Main", cex = 1, col = "black")
text(982, 257, "5.5", family = "Main", cex = 1, col = "black")
text(982, 227, "6.0", family = "Main", cex = 1, col = "black")
text(982, 197, "6.5", family = "Main", cex = 1, col = "black")
text(982, 171, "7.0", family = "Main", cex = 1, col = "black")
text(982, 144, "7.5", family = "Main", cex = 1, col = "black")
text(982, 115, "8.0", family = "Main", cex = 1, col = "black")

text(85, 598, "Year", family = "Main", cex = 1.5, col = "black")
text(1027, 590, "Oceania", family = "Main", cex = 1.5, col = "black")
text(1040, 570, "N. America", family = "Main", cex = 1.5, col = "black")
text(1039, 545, "L. America", family = "Main", cex = 1.5, col = "black")
text(1022, 490, "Europe", family = "Main", cex = 1.5, col = "black")
text(1021, 445, "Africa", family = "Main", cex = 1.5, col = "black")
text(1017, 330, "Asia", family = "Main", cex = 1.5, col = "black")

segments(x0=967,y0=582, x1=991, y1=587, lwd = 1.25, lty = "solid")
segments(x0=967,y0=569, x1=991, y1=570, lwd = 1.25, lty = "solid")
segments(x0=967,y0=547, x1=991, y1=547, lwd = 1.25, lty = "solid")
segments(x0=967,y0=490, x1=991, y1=490, lwd = 1.25, lty = "solid")
segments(x0=967,y0=447, x1=991, y1=447, lwd = 1.25, lty = "solid")
segments(x0=967,y0=331, x1=991, y1=331, lwd = 1.25, lty = "solid")

text(104, 460, "Billions", family = "Main", cex = 1.75, srt=90, col = "black")

segments(x0=0,y0=615, x1=1100, y1=610, lwd = 2, lty = "solid")
text(545, 635, "The World at Six Billion: Population Division of the Department of Economic and Social Affairs of the United Nations Secretariat, World Population", family = "Main", cex = 1.25, col = "black")
text(553, 650, "Prospects: The 2004 Revision and World Urbanization Prospects: The 2003 Revision: http://esa.un.org/unpp: 'The Determinants and Consequences of", family = "Main", cex = 1.25, col = "black")
text(515, 665, "Population Trends, Vol. 1' (United Nations, New York). United Nations. 'World Population Prospects':www.geohive.com/global/: 2019 data;", family = "Main", cex = 1.25, col = "black")
text(290, 680, "ourworldindata.org/grapher/world-population-by-world-region-post-1820", family = "Main", cex = 1.25, col = "black")


grid.raster(minimap, .45, .6, height = .53)

dev.off()

image_write(img, path = here::here("Original Plot Work", "Human Population Growth and Density", "4 Human Population Growth and Density.png"), format = "png")
