#
# FILE:
#  1890_census.R
#
# DESCRIPTION:
#  Population of urban to total population, by States and Territories - 
# historical: 1790 - 1890
# Original Source: https://www.loc.gov/resource/g3701gm.gct00010/?sp=19&r=-1.046,-0.008,3.091,1.424,0

# SLOW REVEAL ORDER:
#   1. Completely masked 
#   2. Y-axis revealed
#   3. X-axis revealed
#   4. Y-axis title revealed
#   5. Title revealed
#
# AUTHORS:
#   Lauryn Davis (last edit 3/25/23)
#   Ian Curtis (2023, code to save plots)


library(tidyverse)
library(grid)
library(rlang)
library(ggtext)
library(showtext)
library(extrafont)
library(grid)
library(magick)

pop_colors<- c('black')
font_files() %>% tibble() %>% filter(str_detect(family, "Roboto")) %>% pull(file)
names(pdfFonts())
font_add(family = "Rokkitt1", regular = "Rokkitt-Regular.ttf")
font_add(family = "Playball", regular = "Playball-Regular.ttf")
font_add(family = "Rokkitt", regular = "RobotoCondensed-Light.ttf")
font_add_google(name = "Barlow Condensed", family = "Circle")

showtext_auto()
arrow <- image_read(here::here("1890-census", "arrow.png"))
plot(as.raster(arrow))
type_levels= c("All")
year_levels <- c('1790', '1800', '1810', '1820', '1830', '1840', '1850', '1860', '1870', '1880', '1890')

firstbar <- read_csv(here::here("1890-census", "1890_census_data.csv"))

## FIGURE 1: FULLY MASKED

firstbar <- firstbar %>% 
  mutate(vote_type = factor(vote_type, levels = type_levels),
         pop_group = factor(pop_group, levels = year_levels),
         fill = factor(fill, levels = pop_colors))
picture <- image_graph(width = 590, height = 290)
annotation_custom2 <- 
  function (grob, xmin = -Inf, xmax = Inf, ymin = -Inf, ymax =Inf, data) 
  {
    layer(data = data, stat = StatIdentity, position = PositionIdentity, 
          geom = ggplot2:::GeomCustomAnn, 
          inherit.aes = TRUE, params = list(grob = grob, 
                                            xmin = xmin, xmax = xmax, 
                                            ymin = ymin, ymax = ymax))
  }
ggplot(firstbar, aes(x = pop_group, 
                     y = amount, fill=fill, label=''))+
  geom_col(color = "black", size= .01, width=.55) + scale_fill_manual(labels= '', values= pop_colors, name = "") +
  
  theme_classic()+
  theme( panel.grid = element_blank(),
         panel.grid.major = element_blank(),
         panel.grid.minor = element_blank(),
         axis.ticks = element_blank(),
         axis.line.y = element_blank(),
         axis.text.y=element_blank(),
         #axis.text.y= element_text(color='black', family='Rokkitt', size=12),
         axis.text.x=element_blank(),
         axis.title=element_blank(),
         axis.line.x = element_blank(),
         legend.position='none',
         plot.margin = unit(c(1.5,4.3,0,3.9), "cm"))+ scale_y_continuous(limits= c(0,101), expand=c(0,0)) + scale_x_discrete(expand=c(0,3)) + coord_flip()
dev.off()
template <- image_draw(picture)
grid.raster(arrow, .13, .43, height = .65)+
  text(37,168, "MASS", cex = 2, col = "white", family = 'Rokkitt')+
  segments(x0=113, x1=113, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(118,60, "0%", cex = 1.5, col = "white", family = 'Rokkitt')+
  segments(x0=165, x1=165, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(169,60, "10%", cex = 1.5, col = "white", family = 'Rokkitt')+
  segments(x0=219, x1=219, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(224,60, "20%", cex = 1.5, col = "white", family = 'Rokkitt')+
  segments(x0=270, x1=270, y0=73, y1=255, lwd = 1, lty = "solid")+
  segments(x0=317, x1=317, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(273,60, "30%", cex = 1.5, col = "white", family = 'Rokkitt')+
  segments(x0=363, x1=363, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(320,60, "40%", cex = 1.5, col = "white", family = 'Rokkitt')+
  segments(x0=416, x1=416, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(365,60, "50%", cex = 1.5, col = "white", family = 'Rokkitt')+
  segments(x0=465, x1=465, y0=73, y1=145, lwd = 1, lty = "solid")
text(420,60, "60%", cex = 1.5, col = "white", family = 'Rokkitt')+
  text(468,60, "70%", cex = 1.5, col = "white", family = 'Rokkitt')+
  text(513,60, "80%", cex = 1.5, col = "white", family = 'Rokkitt')+
  
  text(280,40, "[Colorado, Nevada, and Florida are not shown, because these States had urban population in 1880 and 1800 only.]", cex = .85, col = "white", family = 'Rokkitt1')+
  text(20,20, "22.", cex = .8, col = 'white', family = 'Rokkitt1')+
  text(62,20, "PROPORTION", cex = .9, col = "white", family = 'Rokkitt1')+
  text(105,20, "OF", cex = .8, col = "white", family = 'Rokkitt1')+
  text(133,20, "URBAN", cex = .9, col = "white", family = 'Rokkitt1')+
  text(162,20, "TO", cex = .8, col = "white", family = 'Rokkitt1')+
  text(190,20, "TOTAL", cex = .9, col = "white", family = 'Rokkitt1')+
  text(245,20, "POPULATION,", cex = .9, col = "white", family = 'Rokkitt1')+
  text(288,20, "BY", cex = .8, col = "white", family = 'Rokkitt1')+
  text(315,20, "STATES", cex = .9, col = "white", family = 'Rokkitt1')+
  text(347,20, "AND", cex = .8, col = "white", family = 'Rokkitt1')+
  text(433,20, "TERRITORIES-HISTORICAL : ", cex = .9, col = "white", family = 'Rokkitt1')+
  text(530,20, "1790 TO 1890", cex = .8, col = "white", family = 'Rokkitt1')
dev.off()
image_write(fig01, path = here::here('1890-census', "01_full_masked.png"), format = "png")


## FIGURE 2: YEARS UNMASKED

picture <- image_graph(width = 590, height = 290)
annotation_custom2 <- 
  function (grob, xmin = -Inf, xmax = Inf, ymin = -Inf, ymax =Inf, data) 
  {
    layer(data = data, stat = StatIdentity, position = PositionIdentity, 
          geom = ggplot2:::GeomCustomAnn, 
          inherit.aes = TRUE, params = list(grob = grob, 
                                            xmin = xmin, xmax = xmax, 
                                            ymin = ymin, ymax = ymax))
  }
ggplot(firstbar, aes(x = pop_group, 
                     y = amount, fill=fill, label=''))+
  geom_col(color = "black", size= .01, width=.55) + scale_fill_manual(labels= '', values= pop_colors, name = "") +
  
  theme_classic()+
  theme( panel.grid = element_blank(),
         panel.grid.major = element_blank(),
         panel.grid.minor = element_blank(),
         axis.ticks = element_blank(),
         axis.line.y = element_blank(),
         axis.text.y= element_text(color='black', family='Rokkitt', size=12),
         axis.text.x=element_blank(),
         axis.title=element_blank(),
         axis.line.x = element_blank(),
         legend.position='none',
         plot.margin = unit(c(1.5,4.3,0,3), "cm"))+ scale_y_continuous(limits= c(0,101), expand=c(0,0)) + scale_x_discrete(expand=c(0,3)) + coord_flip()
dev.off()
fig02 <- image_draw(picture)
grid.raster(arrow, .13, .43, height = .65)+
  text(37,168, "MASS", cex = 2, col = "white", family = 'Rokkitt')+
  segments(x0=113, x1=113, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(118,60, "0%", cex = 1.5, col = "white", family = 'Rokkitt')+
  segments(x0=165, x1=165, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(169,60, "10%", cex = 1.5, col = "white", family = 'Rokkitt')+
  segments(x0=219, x1=219, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(224,60, "20%", cex = 1.5, col = "white", family = 'Rokkitt')+
  segments(x0=270, x1=270, y0=73, y1=255, lwd = 1, lty = "solid")+
  segments(x0=317, x1=317, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(273,60, "30%", cex = 1.5, col = "white", family = 'Rokkitt')+
  segments(x0=363, x1=363, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(320,60, "40%", cex = 1.5, col = "white", family = 'Rokkitt')+
  segments(x0=416, x1=416, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(365,60, "50%", cex = 1.5, col = "white", family = 'Rokkitt')+
  segments(x0=465, x1=465, y0=73, y1=145, lwd = 1, lty = "solid")
text(420,60, "60%", cex = 1.5, col = "white", family = 'Rokkitt')+
  text(468,60, "70%", cex = 1.5, col = "white", family = 'Rokkitt')+
  text(513,60, "80%", cex = 1.5, col = "white", family = 'Rokkitt')+
  
  text(280,40, "[Colorado, Nevada, and Florida are not shown, because these States had urban population in 1880 and 1800 only.]", cex = .85, col = "white", family = 'Rokkitt1')+
  text(20,20, "22.", cex = .8, col = 'white', family = 'Rokkitt1')+
  text(62,20, "PROPORTION", cex = .9, col = "white", family = 'Rokkitt1')+
  text(105,20, "OF", cex = .8, col = "white", family = 'Rokkitt1')+
  text(133,20, "URBAN", cex = .9, col = "white", family = 'Rokkitt1')+
  text(162,20, "TO", cex = .8, col = "white", family = 'Rokkitt1')+
  text(190,20, "TOTAL", cex = .9, col = "white", family = 'Rokkitt1')+
  text(245,20, "POPULATION,", cex = .9, col = "white", family = 'Rokkitt1')+
  text(288,20, "BY", cex = .8, col = "white", family = 'Rokkitt1')+
  text(315,20, "STATES", cex = .9, col = "white", family = 'Rokkitt1')+
  text(347,20, "AND", cex = .8, col = "white", family = 'Rokkitt1')+
  text(433,20, "TERRITORIES-HISTORICAL : ", cex = .9, col = "white", family = 'Rokkitt1')+
  text(530,20, "1790 TO 1890", cex = .8, col = "white", family = 'Rokkitt1')

dev.off()
image_write(fig02, path = here::here('1890-census', "02_years_unmasked.png"), format = "png")

## FIGURE 3: PERCENTS UNMASKED

picture <- image_graph(width = 590, height = 290)
annotation_custom2 <- 
  function (grob, xmin = -Inf, xmax = Inf, ymin = -Inf, ymax =Inf, data) 
  {
    layer(data = data, stat = StatIdentity, position = PositionIdentity, 
          geom = ggplot2:::GeomCustomAnn, 
          inherit.aes = TRUE, params = list(grob = grob, 
                                            xmin = xmin, xmax = xmax, 
                                            ymin = ymin, ymax = ymax))
  }
ggplot(firstbar, aes(x = pop_group, 
                     y = amount, fill=fill, label=''))+
  geom_col(color = "black", size= .01, width=.55) + scale_fill_manual(labels= '', values= pop_colors, name = "") +
  
  theme_classic()+
  theme( panel.grid = element_blank(),
         panel.grid.major = element_blank(),
         panel.grid.minor = element_blank(),
         axis.ticks = element_blank(),
         axis.line.y = element_blank(),
         axis.text.y= element_text(color='black', family='Rokkitt', size=12),
         axis.text.x=element_blank(),
         axis.title=element_blank(),
         axis.line.x = element_blank(),
         legend.position='none',
         plot.margin = unit(c(1.5,4.3,0,3), "cm"))+ scale_y_continuous(limits= c(0,101), expand=c(0,0)) + scale_x_discrete(expand=c(0,3)) + coord_flip()
dev.off()
fig03 <- image_draw(picture)
grid.raster(arrow, .13, .43, height = .65)+
  text(37,168, "MASS", cex = 2, col = "white", family = 'Rokkitt')+
  segments(x0=113, x1=113, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(118,60, "0%", cex = 1.5, col = "black", family = 'Rokkitt')+
  segments(x0=165, x1=165, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(169,60, "10%", cex = 1.5, col = "black", family = 'Rokkitt')+
  segments(x0=219, x1=219, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(224,60, "20%", cex = 1.5, col = "black", family = 'Rokkitt')+
  segments(x0=270, x1=270, y0=73, y1=255, lwd = 1, lty = "solid")+
  segments(x0=317, x1=317, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(273,60, "30%", cex = 1.5, col = "black", family = 'Rokkitt')+
  segments(x0=363, x1=363, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(320,60, "40%", cex = 1.5, col = "black", family = 'Rokkitt')+
  segments(x0=416, x1=416, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(365,60, "50%", cex = 1.5, col = "black", family = 'Rokkitt')+
  segments(x0=465, x1=465, y0=73, y1=145, lwd = 1, lty = "solid")+
  text(420,60, "60%", cex = 1.5, col = "black", family = 'Rokkitt')+
  text(468,60, "70%", cex = 1.5, col = "black", family = 'Rokkitt')+
  text(513,60, "80%", cex = 1.5, col = "black", family = 'Rokkitt')+
  
  text(280,40, "[Colorado, Nevada, and Florida are not shown, because these States had urban population in 1880 and 1800 only.]", cex = .85, col = "white", family = 'Rokkitt1')+
  text(20,20, "22.", cex = .8, col = 'white', family = 'Rokkitt1')+
  text(62,20, "PROPORTION", cex = .9, col = "white", family = 'Rokkitt1')+
  text(105,20, "OF", cex = .8, col = "white", family = 'Rokkitt1')+
  text(133,20, "URBAN", cex = .9, col = "white", family = 'Rokkitt1')+
  text(162,20, "TO", cex = .8, col = "white", family = 'Rokkitt1')+
  text(190,20, "TOTAL", cex = .9, col = "white", family = 'Rokkitt1')+
  text(245,20, "POPULATION,", cex = .9, col = "white", family = 'Rokkitt1')+
  text(288,20, "BY", cex = .8, col = "white", family = 'Rokkitt1')+
  text(315,20, "STATES", cex = .9, col = "white", family = 'Rokkitt1')+
  text(347,20, "AND", cex = .8, col = "white", family = 'Rokkitt1')+
  text(433,20, "TERRITORIES-HISTORICAL : ", cex = .9, col = "white", family = 'Rokkitt1')+
  text(530,20, "1790 TO 1890", cex = .8, col = "white", family = 'Rokkitt1')

dev.off()
image_write(fig03, path = here::here('1890-census', "03_percents_unmasked.png"), format = "png")


## FIGURE 4: STATE UNMASKED

picture <- image_graph(width = 590, height = 290)
annotation_custom2 <- 
  function (grob, xmin = -Inf, xmax = Inf, ymin = -Inf, ymax =Inf, data) 
  {
    layer(data = data, stat = StatIdentity, position = PositionIdentity, 
          geom = ggplot2:::GeomCustomAnn, 
          inherit.aes = TRUE, params = list(grob = grob, 
                                            xmin = xmin, xmax = xmax, 
                                            ymin = ymin, ymax = ymax))
  }
ggplot(firstbar, aes(x = pop_group, 
                     y = amount, fill=fill, label=''))+
  geom_col(color = "black", size= .01, width=.55) + scale_fill_manual(labels= '', values= pop_colors, name = "") +
  
  theme_classic()+
  theme( panel.grid = element_blank(),
         panel.grid.major = element_blank(),
         panel.grid.minor = element_blank(),
         axis.ticks = element_blank(),
         axis.line.y = element_blank(),
         axis.text.y= element_text(color='black', family='Rokkitt', size=12),
         axis.text.x=element_blank(),
         axis.title=element_blank(),
         axis.line.x = element_blank(),
         legend.position='none',
         plot.margin = unit(c(1.5,4.3,0,3), "cm"))+ scale_y_continuous(limits= c(0,101), expand=c(0,0)) + scale_x_discrete(expand=c(0,3)) + coord_flip()
dev.off()
fig04 <- image_draw(picture)
grid.raster(arrow, .13, .43, height = .65)+
  text(37,168, "MASS", cex = 2, col = "black", family = 'Rokkitt')+
  segments(x0=113, x1=113, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(118,60, "0%", cex = 1.5, col = "black", family = 'Rokkitt')+
  segments(x0=165, x1=165, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(169,60, "10%", cex = 1.5, col = "black", family = 'Rokkitt')+
  segments(x0=219, x1=219, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(224,60, "20%", cex = 1.5, col = "black", family = 'Rokkitt')+
  segments(x0=270, x1=270, y0=73, y1=255, lwd = 1, lty = "solid")+
  segments(x0=317, x1=317, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(273,60, "30%", cex = 1.5, col = "black", family = 'Rokkitt')+
  segments(x0=363, x1=363, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(320,60, "40%", cex = 1.5, col = "black", family = 'Rokkitt')+
  segments(x0=416, x1=416, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(365,60, "50%", cex = 1.5, col = "black", family = 'Rokkitt')+
  segments(x0=465, x1=465, y0=73, y1=145, lwd = 1, lty = "solid")+
  text(420,60, "60%", cex = 1.5, col = "black", family = 'Rokkitt')+
  text(468,60, "70%", cex = 1.5, col = "black", family = 'Rokkitt')+
  text(513,60, "80%", cex = 1.5, col = "black", family = 'Rokkitt')

text(280,40, "[Colorado, Nevada, and Florida are not shown, because these States had urban population in 1880 and 1800 only.]", cex = .85, col = "white", family = 'Rokkitt1')+
  text(20,20, "22.", cex = .8, col = 'white', family = 'Rokkitt1')+
  text(62,20, "PROPORTION", cex = .9, col = "white", family = 'Rokkitt1')+
  text(105,20, "OF", cex = .8, col = "white", family = 'Rokkitt1')+
  text(133,20, "URBAN", cex = .9, col = "white", family = 'Rokkitt1')+
  text(162,20, "TO", cex = .8, col = "white", family = 'Rokkitt1')+
  text(190,20, "TOTAL", cex = .9, col = "white", family = 'Rokkitt1')+
  text(245,20, "POPULATION,", cex = .9, col = "white", family = 'Rokkitt1')+
  text(288,20, "BY", cex = .8, col = "white", family = 'Rokkitt1')+
  text(315,20, "STATES", cex = .9, col = "white", family = 'Rokkitt1')+
  text(347,20, "AND", cex = .8, col = "white", family = 'Rokkitt1')+
  text(433,20, "TERRITORIES-HISTORICAL : ", cex = .9, col = "white", family = 'Rokkitt1')+
  text(530,20, "1790 TO 1890", cex = .8, col = "white", family = 'Rokkitt1')

dev.off()
image_write(fig04, path = here::here("1890-census", "04_state_unmasked.png"), format = "png")

## FIGURE 5: TITLE UNMASKED

picture <- image_graph(width = 590, height = 290)
annotation_custom2 <- 
  function (grob, xmin = -Inf, xmax = Inf, ymin = -Inf, ymax =Inf, data) 
  {
    layer(data = data, stat = StatIdentity, position = PositionIdentity, 
          geom = ggplot2:::GeomCustomAnn, 
          inherit.aes = TRUE, params = list(grob = grob, 
                                            xmin = xmin, xmax = xmax, 
                                            ymin = ymin, ymax = ymax))
  }
ggplot(firstbar, aes(x = pop_group, 
                     y = amount, fill=fill, label=''))+
  geom_col(color = "black", size= .01, width=.55) + scale_fill_manual(labels= '', values= pop_colors, name = "") +
  
  theme_classic()+
  theme( panel.grid = element_blank(),
         panel.grid.major = element_blank(),
         panel.grid.minor = element_blank(),
         axis.ticks = element_blank(),
         axis.line.y = element_blank(),
         axis.text.y= element_text(color='black', family='Rokkitt', size=12),
         axis.text.x=element_blank(),
         axis.title=element_blank(),
         axis.line.x = element_blank(),
         legend.position='none',
         plot.margin = unit(c(1.5,4.3,0,3), "cm"))+ scale_y_continuous(limits= c(0,101), expand=c(0,0)) + scale_x_discrete(expand=c(0,3)) + coord_flip()
dev.off()
fig05 <- image_draw(picture)
grid.raster(arrow, .13, .43, height = .65)+
  text(37,168, "MASS", cex = 2, col = "black", family = 'Rokkitt')+
  segments(x0=113, x1=113, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(118,60, "0%", cex = 1.5, col = "black", family = 'Rokkitt')+
  segments(x0=165, x1=165, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(169,60, "10%", cex = 1.5, col = "black", family = 'Rokkitt')+
  segments(x0=219, x1=219, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(224,60, "20%", cex = 1.5, col = "black", family = 'Rokkitt')+
  segments(x0=270, x1=270, y0=73, y1=255, lwd = 1, lty = "solid")+
  segments(x0=317, x1=317, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(273,60, "30%", cex = 1.5, col = "black", family = 'Rokkitt')+
  segments(x0=363, x1=363, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(320,60, "40%", cex = 1.5, col = "black", family = 'Rokkitt')+
  segments(x0=416, x1=416, y0=73, y1=255, lwd = 1, lty = "solid")+
  text(365,60, "50%", cex = 1.5, col = "black", family = 'Rokkitt')+
  segments(x0=465, x1=465, y0=73, y1=145, lwd = 1, lty = "solid")+
  text(420,60, "60%", cex = 1.5, col = "black", family = 'Rokkitt')+
  text(468,60, "70%", cex = 1.5, col = "black", family = 'Rokkitt')+
  text(513,60, "80%", cex = 1.5, col = "black", family = 'Rokkitt')

text(280,40, "[Colorado, Nevada, and Florida are not shown, because these States had urban population in 1880 and 1800 only.]", cex = .85, col = "black", family = 'Rokkitt1')+
  text(20,20, "22.", cex = .8, col = "black", family = 'Rokkitt1')+
  text(62,20, "PROPORTION", cex = .9, col = "black", family = 'Rokkitt1')+
  text(105,20, "OF", cex = .8, col = "black", family = 'Rokkitt1')+
  text(133,20, "URBAN", cex = .9, col = "black", family = 'Rokkitt1')+
  text(162,20, "TO", cex = .8, col = "black", family = 'Rokkitt1')+
  text(190,20, "TOTAL", cex = .9, col = "black", family = 'Rokkitt1')+
  text(245,20, "POPULATION,", cex = .9, col = "black", family = 'Rokkitt1')+
  text(288,20, "BY", cex = .8, col = "black", family = 'Rokkitt1')+
  text(315,20, "STATES", cex = .9, col = "black", family = 'Rokkitt1')+
  text(347,20, "AND", cex = .8, col = "black", family = 'Rokkitt1')+
  text(433,20, "TERRITORIES-HISTORICAL : ", cex = .9, col = "black", family = 'Rokkitt1')+
  text(530,20, "1790 TO 1890", cex = .8, col = "black", family = 'Rokkitt1')

dev.off()
image_write(fig05, path = here::here('1890-census', "05_full_unmasked.png"), format = "png")
