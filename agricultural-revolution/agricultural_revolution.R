#
# FILE:
#  agricultural_revolution.R
#
# DESCRIPTION:
#  Brief description of the plot, including original source/citation
#
# SLOW REVEAL ORDER:
#   1. List
#   2. Out
#   ...
#   n. Order
#
# AUTHORS:
#   Lauryn Davis (main code)
#   Ian Curtis (2023, code to save plots)

library(ggtext)
library(ggrepel)
library(showtext)
library(googlesheets4)
library(extrafont)
library(grid)
library(magick)
library(tidyverse)

font_add(family="Open", regular =	"OpenSans-Bold.ttf")
showtext_auto()

data <- read_csv(here::here("agricultural-revolution", "agricultural_revolution_data.csv"))

x_label <- c("12,000 BCE", "10,000 BCE", "8000 BCE", "6500 BCE", "5000 BCE", "4000 BCE", "3000 BCE", "2000 BCE", "1000 BCE")

## FIGURE X: TEMPLATE PLOT

picture <- image_graph(width = 480, height = 450)
annotation_custom2 <- 
  function (grob, xmin = -Inf, xmax = Inf, ymin = -Inf, ymax =Inf, data) 
  {
    layer(data = data, stat = StatIdentity, position = PositionIdentity, 
          geom = ggplot2:::GeomCustomAnn, 
          inherit.aes = TRUE, params = list(grob = grob, 
                                            xmin = xmin, xmax = xmax, 
                                            ymin = ymin, ymax = ymax))
  }

(ggplot(data) +geom_line(aes(x = year_levels, y = amount), color= "black", size= 1.5)+
    scale_y_continuous(breaks = c(0,10,20,30,40,50,60), limits= c(0,61), expand= expansion(mult=c(0,0))) + scale_x_continuous(breaks = c(0, .1,.2,.3,.4,.5,.6,.7,.8,.9), limits= c(0,1), expand= expansion(mult=c(-0.02,0)))+ theme_classic()+
    theme(legend.position= "none",                                             
          #axis.line.x=element_line(size=.5),  
          axis.line.x = element_line(size= 1),
          axis.title = element_blank(),
          axis.ticks.y= element_line(size=.7),
          axis.ticks.length=unit(.25, "cm"),
          axis.ticks.x= element_blank(),
          axis.line.y= element_line(size=1),
          panel.grid.major.x= element_blank(),
          panel.grid.minor.x= element_blank(),
          panel.grid.major.y= element_line(color="black", size=.15),
          panel.grid.minor.y= element_blank(),
          axis.text.x= element_blank(),
          axis.text.y = element_blank(),
          plot.margin=unit(c(2,.7,3,.1), "cm"),
    ))
dev.off()
temp <- image_draw(picture)
segments(x0=50, x1=50, y0=365, y1=360, lwd = 2, lty = "solid")+
  segments(x0=100, x1=100, y0=365, y1=360, lwd = 2, lty = "solid")+
  
  segments(x0=150, x1=150, y0=365, y1=360, lwd = 2, lty = "solid")+
  
  segments(x0=200, x1=200, y0=365, y1=360, lwd = 2, lty = "solid")+
  
  segments(x0=250, x1=250, y0=365, y1=360, lwd = 2, lty = "solid")+
  
  segments(x0=300, x1=300, y0=365, y1=360, lwd = 2, lty = "solid")+
  segments(x0=350, x1=350, y0=365, y1=360, lwd = 2, lty = "solid")+
  
  
  segments(x0=400, x1=400, y0=365, y1=360, lwd = 2, lty = "solid")+
  segments(x0=450, x1=450, y0=365, y1=360, lwd = 2, lty = "solid")+
  
  segments(x0=503, x1=503, y0=365, y1=360, lwd = 2, lty = "solid")+
  
  
  
  dev.off()
image_write(temp, path = here::here('agricultural-revolution', "template.png"), format = "png")

#ggsave('line.png', height = 2, width =3)


## FIGURE 1: FULLY MASKED

plot1 <- image_read(here::here('agricultural-revolution', "01_full_masked.png"))

picture <- image_graph(width = 1550, height = 1000)

ggplot()+theme_void()

dev.off()
fig01 <- image_draw(picture)

grid.raster(plot1, .365, .60, height =.85)
text(520,900, "Created for the New York K-12 Social Studies Toolkit by Agate Publishing, Inc., 2015.", cex = 2.2, col = "white")+
  text(305,940, "Adapted from Colin McEvedy and Richard Jones", cex = 2.2, col = 'white')+
  text(793,940, substitute(italic("Atlas of World Population History.")), cex = 2.2, col = "white")+
  text(1255,940, "New York: Facts on File, 1978: pp. 342-351.", cex = 2.2, col = "white")+
  text(177,725, "12,000 BCE", cex = 1.9,  srt = 50, col='white')+
  text(265,725, "10,000 BCE", cex = 1.9,  srt = 50, col='white')+
  text(372,720, "8000 BCE", cex = 1.9,  srt = 50, col='white')+
  text(462,720, "6500 BCE", cex = 1.9,  srt = 50, col='white')+
  text(560,720, "5000 BCE", cex = 1.9,  srt = 50, col='white')+
  text(650,720, "4000 BCE", cex = 1.9,  srt = 50, col='white')+
  text(747,720, "3000 BCE", cex = 1.9,  srt = 50, col='white')+
  text(845,720, "2000 BCE", cex = 1.9,  srt = 50, col='white')+
  text(937,720, "1000 BCE", cex = 1.9,  srt = 50, col='white')+
  
  text(105,650, '0', cex = 1.9, col='white')+
  text(100,558, '10', cex = 1.9, col='white')+
  text(100,463, '20', cex = 1.9, col='white')+
  text(100,368, '30', cex = 1.9, col='white')+
  text(100,278, '40', cex = 1.9, col='white')+
  text(100,183, '50', cex = 1.9, col='white')+
  text(100,90, '60', cex = 1.9, col='white')+
  
  text(575,790, substitute(bold("Time")), cex = 2.1, col='white')+
  text(60,370, "Population", col='white',cex = 2.1,  srt = 90)+
  text(575,50, "World Population Growth, 12,000-1,000 BCE",col='white', cex = 2.3)




dev.off()
image_write(fig01, path = here::here('agricultural-revolution', "01_full_masked.png"), format = "png")


## FIGURE 2: REVEAL X AXIS

ggplot()+theme_void()

dev.off()
fig02 <- image_draw(picture)

grid.raster(plot1, .365, .60, height =.85)
text(520,900, "Created for the New York K-12 Social Studies Toolkit by Agate Publishing, Inc., 2015.", cex = 2.2, col = "white")+
  text(305,940, "Adapted from Colin McEvedy and Richard Jones", cex = 2.2, col = 'white')+
  text(793,940, substitute(italic("Atlas of World Population History.")), cex = 2.2, col = "white")+
  text(1255,940, "New York: Facts on File, 1978: pp. 342-351.", cex = 2.2, col = "white")+
  text(177,725, "12,000 BCE", cex = 1.9,  srt = 50)+
  text(265,725, "10,000 BCE", cex = 1.9,  srt = 50)+
  text(372,720, "8000 BCE", cex = 1.9,  srt = 50)+
  text(462,720, "6500 BCE", cex = 1.9,  srt = 50)+
  text(560,720, "5000 BCE", cex = 1.9,  srt = 50)+
  text(650,720, "4000 BCE", cex = 1.9,  srt = 50)+
  text(747,720, "3000 BCE", cex = 1.9,  srt = 50)+
  text(845,720, "2000 BCE", cex = 1.9,  srt = 50)+
  text(937,720, "1000 BCE", cex = 1.9,  srt = 50)+
  
  text(105,650, '0', cex = 1.9, col='white')+
  text(100,558, '10', cex = 1.9, col='white')+
  text(100,463, '20', cex = 1.9, col='white')+
  text(100,368, '30', cex = 1.9, col='white')+
  text(100,278, '40', cex = 1.9, col='white')+
  text(100,183, '50', cex = 1.9, col='white')+
  text(100,90, '60', cex = 1.9, col='white')+
  
  text(575,790, substitute(bold("Time")), cex = 2.1)+
  text(60,370, "Population", col='white',cex = 2.1,  srt = 90)+
  text(575,50, "World Population Growth, 12,000-1,000 BCE",col='white', cex = 2.3)




dev.off()
image_write(fig02, path = here::here('agricultural-revolution', "02_xaxis_unmasked.png"), format = "png")


## FIGURE 3: REVEAL Y AXIS

ggplot()+theme_void()

dev.off()
fig03 <- image_draw(picture)

grid.raster(plot1, .365, .60, height =.85)
text(520,900, "Created for the New York K-12 Social Studies Toolkit by Agate Publishing, Inc., 2015.", cex = 2.2, col = "white")+
  text(305,940, "Adapted from Colin McEvedy and Richard Jones", cex = 2.2, col = 'white')+
  text(793,940, substitute(italic("Atlas of World Population History.")), cex = 2.2, col = "white")+
  text(1255,940, "New York: Facts on File, 1978: pp. 342-351.", cex = 2.2, col = "white")+
  text(177,725, "12,000 BCE", cex = 1.9,  srt = 50)+
  text(265,725, "10,000 BCE", cex = 1.9,  srt = 50)+
  text(372,720, "8000 BCE", cex = 1.9,  srt = 50)+
  text(462,720, "6500 BCE", cex = 1.9,  srt = 50)+
  text(560,720, "5000 BCE", cex = 1.9,  srt = 50)+
  text(650,720, "4000 BCE", cex = 1.9,  srt = 50)+
  text(747,720, "3000 BCE", cex = 1.9,  srt = 50)+
  text(845,720, "2000 BCE", cex = 1.9,  srt = 50)+
  text(937,720, "1000 BCE", cex = 1.9,  srt = 50)+
  
  text(105,650, '0', cex = 1.9)+
  text(100,558, '10', cex = 1.9)+
  text(100,463, '20', cex = 1.9)+
  text(100,368, '30', cex = 1.9)+
  text(100,278, '40', cex = 1.9)+
  text(100,183, '50', cex = 1.9)+
  text(100,90, '60', cex = 1.9)+
  
  text(575,790, substitute(bold("Time")), cex = 2.1)+
  text(60,370, "Population", col='white',cex = 2.1,  srt = 90)+
  text(575,50, "World Population Growth, 12,000-1,000 BCE",col='white', cex = 2.3)




dev.off()
image_write(fig03, path = here::here('agricultural-revolution', "03_yaxis_unmasked.png"), format = "png")


## FIGURE 4: REVEAL Y AXIS LABEL

ggplot()+theme_void()

dev.off()
fig04 <- image_draw(picture)

grid.raster(plot1, .365, .60, height =.85)
text(520,900, "Created for the New York K-12 Social Studies Toolkit by Agate Publishing, Inc., 2015.", cex = 2.2, col = "white")+
  text(305,940, "Adapted from Colin McEvedy and Richard Jones", cex = 2.2, col = 'white')+
  text(793,940, substitute(italic("Atlas of World Population History.")), cex = 2.2, col = "white")+
  text(1255,940, "New York: Facts on File, 1978: pp. 342-351.", cex = 2.2, col = "white")+
  text(177,725, "12,000 BCE", cex = 1.9,  srt = 50)+
  text(265,725, "10,000 BCE", cex = 1.9,  srt = 50)+
  text(372,720, "8000 BCE", cex = 1.9,  srt = 50)+
  text(462,720, "6500 BCE", cex = 1.9,  srt = 50)+
  text(560,720, "5000 BCE", cex = 1.9,  srt = 50)+
  text(650,720, "4000 BCE", cex = 1.9,  srt = 50)+
  text(747,720, "3000 BCE", cex = 1.9,  srt = 50)+
  text(845,720, "2000 BCE", cex = 1.9,  srt = 50)+
  text(937,720, "1000 BCE", cex = 1.9,  srt = 50)+
  
  text(105,650, '0', cex = 1.9)+
  text(100,558, '10', cex = 1.9)+
  text(100,463, '20', cex = 1.9)+
  text(100,368, '30', cex = 1.9)+
  text(100,278, '40', cex = 1.9)+
  text(100,183, '50', cex = 1.9)+
  text(100,90, '60', cex = 1.9)+
  
  text(575,790, substitute(bold("Time")), cex = 2.1)+
  text(60,370, substitute(bold("Population")), cex = 2.1,  srt = 90)+
  text(575,50, "World Population Growth, 12,000-1,000 BCE",col='white', cex = 2.3)




dev.off()
image_write(fig04, path = here::here('agricultural-revolution', "04_yaxis_label_unmasked.png"), format = "png")


## FIGURE 5: REVEAL TITLE


ggplot()+theme_void()

dev.off()
fig05 <- image_draw(picture)

grid.raster(plot1, .365, .60, height =.85)
text(520,900, "Created for the New York K-12 Social Studies Toolkit by Agate Publishing, Inc., 2015.", cex = 2.2, col = "black")+
  text(305,940, "Adapted from Colin McEvedy and Richard Jones", cex = 2.2, col = "black")+
  text(793,940, substitute(italic("Atlas of World Population History.")), cex = 2.2, col = "black")+
  text(1255,940, "New York: Facts on File, 1978: pp. 342-351.", cex = 2.2, col = "black")+
  text(177,725, "12,000 BCE", cex = 1.9,  srt = 50)+
  text(265,725, "10,000 BCE", cex = 1.9,  srt = 50)+
  text(372,720, "8000 BCE", cex = 1.9,  srt = 50)+
  text(462,720, "6500 BCE", cex = 1.9,  srt = 50)+
  text(560,720, "5000 BCE", cex = 1.9,  srt = 50)+
  text(650,720, "4000 BCE", cex = 1.9,  srt = 50)+
  text(747,720, "3000 BCE", cex = 1.9,  srt = 50)+
  text(845,720, "2000 BCE", cex = 1.9,  srt = 50)+
  text(937,720, "1000 BCE", cex = 1.9,  srt = 50)+
  
  text(105,650, '0', cex = 1.9)+
  text(100,558, '10', cex = 1.9)+
  text(100,463, '20', cex = 1.9)+
  text(100,368, '30', cex = 1.9)+
  text(100,278, '40', cex = 1.9)+
  text(100,183, '50', cex = 1.9)+
  text(100,90, '60', cex = 1.9)+
  
  text(575,790, substitute(bold("Time")), cex = 2.1)+
  text(60,370, substitute(bold("Population")), cex = 2.1,  srt = 90)+
  text(575,50, substitute(bold("World Population Growth, 12,000-1,000 BCE")), cex = 2.3)




dev.off()
image_write(fig05, path = here::here('agricultural-revolution', "05_full_unmasked.png"), format = "png")










