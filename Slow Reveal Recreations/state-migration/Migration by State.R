library(tidyverse)
library(usmap)
library(readxl)
library(showtext)
library(maps)
library(mapdata)
library(ggpubr)
library(magick)
library(grid)

#
# FILE:
# Migration by State.R
#
# DESCRIPTION:
# This code is for Migration by State Graph from the U.S. Census Bureau. The png's include  
# different graphs being created into the final png.  
# Source: https://www.census.gov/content/dam/Census/library/publications/2007/dec/7_migration.pdf (page 6)
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC
#
# AUTHORS:
#   Robert Bilyk
#

#importing fonts
font_add_google(name = "Barlow Condensed", family = "Circle")
font_add_google(name = "Roboto", regular.wt = 300, family = "Main")
font_add_google(name = "Roboto", regular.wt = 500, family = "Title")

showtext_auto()


#creating alaska png
png(here::here("Original Plot Work", "Migration by State", "Minor Areas", "alaska.png"),width=120,height=80)
alaska <- plot_usmap(
  regions = c("state"),
  include = c("Alaska"),
  color = "black",
  fill = "#f5f2e9") +
  theme(plot.background = element_rect(fill = "#e3f5ff", color = "#e3f5ff"))
alaska
dev.off()

#creating hawaii png
png(here::here("Original Plot Work", "Migration by State", "Minor Areas", "hawaii.png"),width=65,height=50)
hawaii <- plot_usmap(
  regions = c("state"),
  include = c("Hawaii"),
  color = "black",
  fill = "#f5f2e9") +
  theme(plot.background = element_rect(fill = "#e3f5ff", color = "#e3f5ff"))
hawaii
dev.off()

#creating pr png
pr <- ggplot2::map_data('world', 'puerto rico')

picture <- image_graph(width = 65, height = 50)
ggplot(pr, aes(x = long, y = lat, group = group)) +
  geom_polygon(color="black", fill="#c5c9cc") +
  theme_void()+
  theme(plot.background = element_rect(fill = "#e3f5ff", color = "#e3f5ff")) +
  theme(plot.margin = margin(21,18,21,13, "pt"))

dev.off()

image_write(picture, path = here::here("Original Plot Work", "Migration by State", "Minor Areas", "pr.png"), format = "png")


#creating baseline map
map <- map_data("state")
types <- read_xlsx(here::here("Original Plot Work", "Migration Rate Maps", "Migration 1935.xlsx"))
types$state <- tolower(types$state)

newmap <- map %>%
  inner_join(types, by = c("region" = "state")) %>%
  mutate(Type = coalesce(case_when(test == 1 ~ '30 to 108.6',
                                   test == 2 ~ '0.0 to 29.9',
                                   test == 3 ~ '-30.0 to -0.1',
                                   test == 4 ~ '-121.4 to -30.1',
  ))) 

newmap$Type <- factor(newmap$Type, levels=c("30 to 108.6", "0.0 to 29.9", "-30.0 to -0.1", "-121.4 to -30.1"))

map <- ggplot(data = newmap) + 
  geom_polygon(aes(x=long, y=lat, group=group),
               color="black",
               fill = "#f5f2e9",
               size = .5) +
  theme(legend.direction = "vertical",
        legend.title = element_blank()) +
  theme(axis.title = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        plot.title = element_text(size = 20, hjust = .5, family = "Title"),
        plot.margin = margin(30,10,10,10),
        plot.background = element_rect(fill = "white")) +
  guides(fill = guide_legend(nrow = 4))


#creating a gap graph and combining all maps into 1 image
gap <- ggplot() + theme_void()
png(here::here("Original Plot Work", "Migration by State", "Migration Rate Map Unfinished.png"),width=2600,height=3300)
print(ggarrange(gap,
                ggarrange(gap, map, gap, map, gap, ncol=5, widths = c(.01, 1, .01, 1, .01)), 
                gap,
                ggarrange(gap, map, gap, map, gap, ncol=5, widths = c(.01, 1, .01, 1, .01)),
                gap,
                nrow=5, heights =c(.3, 1, 1, 1, .7)))
dev.off()


#importing the unfinished image and alaska, hawaii, and pr pngs
original <- image_read(here::here("Original Plot Work", "Migration by State", "Migration Rate Map Unfinished.png"))
alaska <- image_read(here::here("Original Plot Work", "Migration by State", "Minor Areas", "alaska.png"))
hawaii <- image_read(here::here("Original Plot Work", "Migration by State", "Minor Areas", "hawaii.png"))
pr <- image_read(here::here("Original Plot Work", "Migration by State", "Minor Areas", "pr.png"))


## N: RECREATED GRAPHIC

#combining all images together and adding text
img <- image_draw(original)

#top left
text(165, 370, ".", cex = 45, family="Circle", col = "#00867c")
text(165, 470, ".", cex = 30, family="Circle", col = "#16a6ae")
text(170, 655, ".", cex = 45, family="Circle", col = "#00867c")
text(280, 465, ".", cex = 10, family="Circle", col = "#edbf90")
text(240, 600, ".", cex = 20, family="Circle", col = "#75ced7")
text(345, 610, ".", cex = 10, family="Circle", col = "#edbf90")
text(335, 750, ".", cex = 45, family="Circle", col = "#00867c")
text(380, 380, ".", cex = 20, family="Circle", col = "#fcc079")
text(420, 500, ".", cex = 20, family="Circle", col = "#fcc079")
text(460, 620, ".", cex = 30, family="Circle", col = "#16a6ae")
text(450, 750, ".", cex = 30, family="Circle", col = "#dc972f")
text(565, 370, ".", cex = 30, family="Circle", col = "#dc972f")
text(565, 455, ".", cex = 20, family="Circle", col = "#fcc079")
text(570, 540, ".", cex = 20, family="Circle", col = "#fcc079")
text(605, 630, ".", cex = 20, family="Circle", col = "#fcc079")
text(620, 715, ".", cex = 10, family="Circle", col = "#73c8ca")
text(585, 845, ".", cex = 45, family="Circle", col = "#00867c")
text(680, 410, ".", cex = 10, family="Circle", col = "#edbf90")
text(705, 535, ".", cex = 30, family="Circle", col = "#dc972f")
text(720, 635, ".", cex = 10, family="Circle", col = "#73c8ca")
text(720, 740, ".", cex = 10, family="Circle", col = "#edbf90")
text(720, 855, ".", cex = 20, family="Circle", col = "#fcc079")
text(770, 455, ".", cex = 10, family="Circle", col = "#edbf90")
text(785, 585, ".", cex = 45, family="Circle", col = "#ba7733")
text(930, 930, ".", cex = 45, family="Circle", col = "#00867c")
text(900, 800, ".", cex = 30, family="Circle", col = "#16a6ae")
text(835, 800, ".", cex = 30, family="Circle", col = "#dc972f")
text(775, 800, ".", cex = 20, family="Circle", col = "#fcc079")
text(840, 710, ".", cex = 10, family="Circle", col = "#73c8ca")
text(985, 720, ".", cex = 20, family="Circle", col = "#75ced7")
text(950, 770, ".", cex = 10, family="Circle", col = "#73c8ca")
text(995, 660, ".", cex = 30, family="Circle", col = "#16a6ae")
text(950, 630, ".", cex = 30, family="Circle", col = "#dc972f")
text(870, 660, ".", cex = 20, family="Circle", col = "#fcc079")
text(845, 585, ".", cex = 20, family="Circle", col = "#fcc079")
text(875, 495, ".", cex = 10, family="Circle", col = "#edbf90")
text(915, 580, ".", cex = 30, family="Circle", col = "#dc972f")
text(1010, 565, ".", cex = 45, family="Circle", col = "#ba7733")
text(1060, 500, ".", cex = 45, family="Circle", col = "#ba7733")
text(1035, 610, ".", cex = 45, family="Circle", col = "#00867c")
text(1025, 620, ".", cex = 30, family="Circle", col = "#dc972f")
text(1080, 580, ".", cex = 20, family="Circle", col = "#75ced7")
text(1115, 540, ".", cex = 20, family="Circle", col = "#75ced7")
text(1135, 540, ".", cex = 10, family="Circle", col = "#73c8ca")
text(1125, 520, ".", cex = 20, family="Circle", col = "#fcc079")
text(1115, 475, ".", cex = 10, family="Circle", col = "#73c8ca")
text(1135, 475, ".", cex = 20, family="Circle", col = "#75ced7")
text(1180, 430, ".", cex = 20, family="Circle", col = "#fcc079")

text(1060, 615, ".", cex = 10, family="Circle", col = "#73c8ca")

grid.raster(pr, .44, .67, height = .05)
grid.raster(hawaii, .06, .67, height = .05)
text(160, 1095, ".", cex = 10, family="Circle", col = "#edbf90")
grid.raster(alaska, .1, .95, height = .08)
text(295, 135, ".", cex = 10, family="Circle", col = "#73c8ca")


text(710, 1205, ".", cex = 45, family="Circle", col = "#00867c")
text(891, 1205, "100,000 to 574,000", family="Main", cex = 2.5, col = "black")
text(710, 1260, ".", cex = 30, family="Circle", col = "#16a6ae")
text(880, 1260, "50,000 to 99,999", family="Main", cex = 2.5, col = "black")
text(710, 1315, ".", cex = 20, family="Circle", col = "#75ced7")
text(880, 1315, "20,000 to 49,999", family="Main", cex = 2.5, col = "black")
text(710, 1365, ".", cex = 10, family="Circle", col = "#73c8ca")
text(845, 1365, "0 to 19,999", family="Main", cex = 2.5, col = "black")
text(710, 1405, ".", cex = 10, family="Circle", col = "#edbf90")
text(850, 1410, "-20,000 to -1", family="Main", cex = 2.5, col = "black")
text(710, 1445, ".", cex = 20, family="Circle", col = "#fcc079")
text(880, 1455, "-50,000 to -20,001", family="Main", cex = 2.5, col = "black")
text(710, 1490, ".", cex = 30, family="Circle", col = "#dc972f")
text(882, 1500, "-100,000 to -50,001", family="Main", cex = 2.5, col = "black")
text(710, 1545, ".", cex = 45, family="Circle", col = "#ba7733")
text(892, 1550, "-568,000 to -100,001", family="Main", cex = 2.5, col = "black")

text(860, 190, "Migration, 1965 to 1970", family="Title", cex = 5, col = "black")

segments(x0=350,y0=280, x1=395, y1=280, lwd = 10, lty = "solid", col = "black")
text(345, 265, "0", cex = 1.75, family="Main", col = "black")
text(405, 265, "200 mi", cex = 1.75, family="Main", col = "black")

segments(x0=75,y0=1155, x1=120, y1=1155, lwd = 10, lty = "solid", col = "black")
text(70, 1140, "0", cex = 1.75, family="Main", col = "black")
text(130, 1140, "100 mi", cex = 1.75, family="Main", col = "black")

segments(x0=540,y0=1155, x1=630, y1=1155, lwd = 10, lty = "solid", col = "black")
text(535, 1140, "0", cex = 1.75, family="Main", col = "black")
text(640, 1140, "200 mi", cex = 1.75, family="Main", col = "black")

segments(x0=1090,y0=1155, x1=1180, y1=1155, lwd = 10, lty = "solid", col = "black")
text(1085, 1140, "0", cex = 1.75, family="Main", col = "black")
text(1190, 1140, "100 mi", cex = 1.75, family="Main", col = "black")

text(900, 1155, "07-06", cex = 1.75, family="Main", col = "black")

text(450, 1285, "Net domestic migration", cex = 2.5, family="Main", col = "black")
text(435, 1315, "into or out of the 50 states", cex = 2.5, family="Main", col = "black")
text(450, 1348, "and District of Columbia", cex = 2.5, family="Main", col = "black")


#bottom left
text(165, 2015, ".", cex = 45, family="Circle", col = "#00867c")
text(165, 2120, ".", cex = 30, family="Circle", col = "#16a6ae")
text(170, 2305, ".", cex = 45, family="Circle", col = "#00867c")
text(280, 2115, ".", cex = 10, family="Circle", col = "#edbf90")
text(240, 2255, ".", cex = 45, family="Circle", col = "#00867c")
text(345, 2255, ".", cex = 20, family="Circle", col = "#fcc079")
text(335, 2395, ".", cex = 45, family="Circle", col = "#00867c")
text(380, 2030, ".", cex = 30, family="Circle", col = "#dc972f")
text(420, 2145, ".", cex = 30, family="Circle", col = "#dc972f")
text(460, 2260, ".", cex = 30, family="Circle", col = "#dc972f")
text(450, 2395, ".", cex = 10, family="Circle", col = "#edbf90")
text(565, 2020, ".", cex = 30, family="Circle", col = "#dc972f")
text(565, 2105, ".", cex = 20, family="Circle", col = "#fcc079")
text(570, 2185, ".", cex = 20, family="Circle", col = "#fcc079")
text(605, 2275, ".", cex = 20, family="Circle", col = "#fcc079")
text(620, 2365, ".", cex = 45, family="Circle", col = "#ba7733")
text(585, 2475, ".", cex = 45, family="Circle", col = "#ba7733")
text(680, 2060, ".", cex = 10, family="Circle", col = "#edbf90")
text(705, 2175, ".", cex = 30, family="Circle", col = "#dc972f")
text(720, 2275, ".", cex = 20, family="Circle", col = "#75ced7")
text(720, 2380, ".", cex = 20, family="Circle", col = "#75ced7")
text(720, 2485, ".", cex = 45, family="Circle", col = "#ba7733")
text(770, 2100, ".", cex = 20, family="Circle", col = "#fcc079")
text(785, 2225, ".", cex = 45, family="Circle", col = "#ba7733")
text(930, 2565, ".", cex = 45, family="Circle", col = "#00867c")
text(900, 2445, ".", cex = 45, family="Circle", col = "#00867c")
text(835, 2435, ".", cex = 20, family="Circle", col = "#75ced7")
text(775, 2435, ".", cex = 20, family="Circle", col = "#fcc079")
text(840, 2355, ".", cex = 45, family="Circle", col = "#00867c")
text(985, 2360, ".", cex = 45, family="Circle", col = "#00867c")
text(950, 2410, ".", cex = 45, family="Circle", col = "#00867c")
text(995, 2305, ".", cex = 45, family="Circle", col = "#00867c")
text(950, 2275, ".", cex = 30, family="Circle", col = "#dc972f")
text(870, 2300, ".", cex = 20, family="Circle", col = "#fcc079")
text(845, 2225, ".", cex = 10, family="Circle", col = "#73c8ca")
text(875, 2140, ".", cex = 45, family="Circle", col = "#ba7733")
text(915, 2225, ".", cex = 45, family="Circle", col = "#ba7733")
text(1010, 2210, ".", cex = 30, family="Circle", col = "#dc972f")
text(1060, 2145, ".", cex = 45, family="Circle", col = "#ba7733")
text(1035, 2255, ".", cex = 45, family="Circle", col = "#00867c")
text(1025, 2260, ".", cex = 20, family="Circle", col = "#fcc079")
text(1080, 2225, ".", cex = 45, family="Circle", col = "#ba7733")
text(1115, 2185, ".", cex = 30, family="Circle", col = "#dc972f")
text(1135, 2185, ".", cex = 10, family="Circle", col = "#73c8ca")
text(1125, 2165, ".", cex = 30, family="Circle", col = "#dc972f")
text(1115, 2115, ".", cex = 10, family="Circle", col = "#73c8ca")
text(1135, 2130, ".", cex = 30, family="Circle", col = "#16a6ae")
text(1180, 2080, ".", cex = 20, family="Circle", col = "#75ced7")

text(1060, 2255, ".", cex = 10, family="Circle", col = "#73c8ca")

grid.raster(pr, .44, .175, height = .05)
grid.raster(hawaii, .06, .175, height = .05)
text(160, 2725, ".", cex = 20, family="Circle", col = "#fcc079")
grid.raster(alaska, .1, .455, height = .08)
text(295, 1765, ".", cex = 20, family="Circle", col = "#fcc079")


text(710, 2835, ".", cex = 45, family="Circle", col = "#00867c")
text(895, 2835, "100,000 to 1,072,000", family="Main", cex = 2.5, col = "black")
text(710, 2890, ".", cex = 30, family="Circle", col = "#16a6ae")
text(880, 2890, "50,000 to 99,999", family="Main", cex = 2.5, col = "black")
text(710, 2945, ".", cex = 20, family="Circle", col = "#75ced7")
text(880, 2945, "20,000 to 49,999", family="Main", cex = 2.5, col = "black")
text(710, 2995, ".", cex = 10, family="Circle", col = "#73c8ca")
text(845, 2995, "0 to 19,999", family="Main", cex = 2.5, col = "black")
text(710, 3040, ".", cex = 10, family="Circle", col = "#edbf90")
text(850, 3038, "-20,000 to -1", family="Main", cex = 2.5, col = "black")
text(710, 3080, ".", cex = 20, family="Circle", col = "#fcc079")
text(880, 3083, "-50,000 to -20,001", family="Main", cex = 2.5, col = "black")
text(710, 3120, ".", cex = 30, family="Circle", col = "#dc972f")
text(882, 3130, "-100,000 to -50,001", family="Main", cex = 2.5, col = "black")
text(710, 3175, ".", cex = 45, family="Circle", col = "#ba7733")
text(892, 3180, "-821,000 to -100,001", family="Main", cex = 2.5, col = "black")

text(860, 1825, "Migration, 1985 to 1990", family="Title", cex = 5, col = "black")

segments(x0=350,y0=1910, x1=395, y1=1910, lwd = 10, lty = "solid", col = "black")
text(345, 1895, "0", cex = 1.75, family="Main", col = "black")
text(405, 1895, "200 mi", cex = 1.75, family="Main", col = "black")

segments(x0=75,y0=2785, x1=120, y1=2785, lwd = 10, lty = "solid", col = "black")
text(70, 2770, "0", cex = 1.75, family="Main", col = "black")
text(130, 2770, "100 mi", cex = 1.75, family="Main", col = "black")

segments(x0=540,y0=2785, x1=630, y1=2785, lwd = 10, lty = "solid", col = "black")
text(535, 2770, "0", cex = 1.75, family="Main", col = "black")
text(640, 2770, "200 mi", cex = 1.75, family="Main", col = "black")

segments(x0=1090,y0=2785, x1=1180, y1=2785, lwd = 10, lty = "solid", col = "black")
text(1085, 2770, "0", cex = 1.75, family="Main", col = "black")
text(1190, 2770, "100 mi", cex = 1.75, family="Main", col = "black")

text(900, 2785, "07-08", cex = 1.75, family="Main", col = "black")

text(450, 2915, "Net domestic migration", cex = 2.5, family="Main", col = "black")
text(435, 2945, "into or out of the 50 states", cex = 2.5, family="Main", col = "black")
text(450, 2978, "and District of Columbia", cex = 2.5, family="Main", col = "black")


#top right
text(1465, 370, ".", cex = 45, family="Circle", col = "#00867c")
text(1465, 470, ".", cex = 45, family="Circle", col = "#00867c")
text(1470, 655, ".", cex = 30, family="Circle", col = "#16a6ae")
text(1580, 465, ".", cex = 20, family="Circle", col = "#75ced7")
text(1540, 600, ".", cex = 45, family="Circle", col = "#00867c")
text(1645, 610, ".", cex = 30, family="Circle", col = "#16a6ae")
text(1635, 750, ".", cex = 45, family="Circle", col = "#00867c")
text(1680, 380, ".", cex = 10, family="Circle", col = "#73c8ca")
text(1720, 500, ".", cex = 20, family="Circle", col = "#75ced7")
text(1760, 620, ".", cex = 45, family="Circle", col = "#00867c")
text(1750, 750, ".", cex = 20, family="Circle", col = "#75ced7")
text(1865, 370, ".", cex = 10, family="Circle", col = "#edbf90")
text(1865, 455, ".", cex = 10, family="Circle", col = "#edbf90")
text(1870, 540, ".", cex = 20, family="Circle", col = "#fcc079")
text(1905, 630, ".", cex = 10, family="Circle", col = "#edbf90")
text(1920, 715, ".", cex = 45, family="Circle", col = "#00867c")
text(1885, 845, ".", cex = 45, family="Circle", col = "#00867c")
text(1980, 410, ".", cex = 20, family="Circle", col = "#fcc079")
text(2005, 535, ".", cex = 30, family="Circle", col = "#dc972f")
text(2020, 635, ".", cex = 20, family="Circle", col = "#fcc079")
text(2020, 740, ".", cex = 30, family="Circle", col = "#16a6ae")
text(2020, 855, ".", cex = 20, family="Circle", col = "#75ced7")
text(2070, 455, ".", cex = 20, family="Circle", col = "#fcc079")
text(2085, 585, ".", cex = 45, family="Circle", col = "#ba7733")
text(2230, 930, ".", cex = 45, family="Circle", col = "#00867c")
text(2200, 800, ".", cex = 45, family="Circle", col = "#00867c")
text(2135, 800, ".", cex = 20, family="Circle", col = "#75ced7")
text(2075, 800, ".", cex = 10, family="Circle", col = "#edbf90")
text(2140, 710, ".", cex = 45, family="Circle", col = "#00867c")
text(2285, 720, ".", cex = 30, family="Circle", col = "#16a6ae")
text(2250, 770, ".", cex = 30, family="Circle", col = "#16a6ae")
text(2295, 660, ".", cex = 30, family="Circle", col = "#16a6ae")
text(2250, 630, ".", cex = 10, family="Circle", col = "#73c8ca")
text(2170, 660, ".", cex = 20, family="Circle", col = "#75ced7")
text(2145, 585, ".", cex = 30, family="Circle", col = "#dc972f")
text(2175, 495, ".", cex = 45, family="Circle", col = "#ba7733")
text(2215, 580, ".", cex = 45, family="Circle", col = "#ba7733")
text(2310, 565, ".", cex = 45, family="Circle", col = "#ba7733")
text(2360, 500, ".", cex = 45, family="Circle", col = "#ba7733")
text(2335, 610, ".", cex = 30, family="Circle", col = "#dc972f")
text(2325, 620, ".", cex = 30, family="Circle", col = "#dc972f")
text(2380, 580, ".", cex = 45, family="Circle", col = "#ba7733")
text(2415, 540, ".", cex = 30, family="Circle", col = "#dc972f")
text(2435, 540, ".", cex = 10, family="Circle", col = "#edbf90")
text(2425, 520, ".", cex = 45, family="Circle", col = "#ba7733")
text(2415, 475, ".", cex = 10, family="Circle", col = "#73c8ca")
text(2435, 475, ".", cex = 20, family="Circle", col = "#75ced7")
text(2480, 430, ".", cex = 10, family="Circle", col = "#73c8ca")

text(2360, 615, ".", cex = 10, family="Circle", col = "#edbf90")

grid.raster(pr, .945, .67, height = .05)
grid.raster(hawaii, .565, .67, height = .05)
text(1460, 1095, ".", cex = 20, family="Circle", col = "#fcc079")
grid.raster(alaska, .605, .95, height = .08)
text(1595, 135, ".", cex = 10, family="Circle", col = "#edbf90")


text(2010, 1205, ".", cex = 45, family="Circle", col = "#00867c")
text(2190, 1205, "100,000 to 824,000", family="Main", cex = 2.5, col = "black")
text(2010, 1260, ".", cex = 30, family="Circle", col = "#16a6ae")
text(2180, 1260, "50,000 to 99,999", family="Main", cex = 2.5, col = "black")
text(2010, 1315, ".", cex = 20, family="Circle", col = "#75ced7")
text(2180, 1315, "20,000 to 49,999", family="Main", cex = 2.5, col = "black")
text(2010, 1365, ".", cex = 10, family="Circle", col = "#73c8ca")
text(2145, 1365, "0 to 19,999", family="Main", cex = 2.5, col = "black")
text(2010, 1405, ".", cex = 10, family="Circle", col = "#edbf90")
text(2152, 1410, "-20,000 to -1", family="Main", cex = 2.5, col = "black")
text(2010, 1445, ".", cex = 20, family="Circle", col = "#fcc079")
text(2185, 1455, "-50,000 to -20,001", family="Main", cex = 2.5, col = "black")
text(2010, 1490, ".", cex = 30, family="Circle", col = "#dc972f")
text(2185, 1500, "-100,000 to -50,001", family="Main", cex = 2.5, col = "black")
text(2010, 1545, ".", cex = 45, family="Circle", col = "#ba7733")
text(2200, 1550, "-1,098,000 to -100,001", family="Main", cex = 2.5, col = "black")

text(2160, 190, "Migration, 1975 to 1980", family="Title", cex = 5, col = "black")

segments(x0=1650,y0=280, x1=1695, y1=280, lwd = 10, lty = "solid", col = "black")
text(1645, 265, "0", cex = 1.75, family="Main", col = "black")
text(1705, 265, "200 mi", cex = 1.75, family="Main", col = "black")

segments(x0=1375,y0=1155, x1=1420, y1=1155, lwd = 10, lty = "solid", col = "black")
text(1370, 1140, "0", cex = 1.75, family="Main", col = "black")
text(1430, 1140, "100 mi", cex = 1.75, family="Main", col = "black")

segments(x0=1840,y0=1155, x1=1930, y1=1155, lwd = 10, lty = "solid", col = "black")
text(1835, 1140, "0", cex = 1.75, family="Main", col = "black")
text(1940, 1140, "200 mi", cex = 1.75, family="Main", col = "black")

segments(x0=2390,y0=1155, x1=2480, y1=1155, lwd = 10, lty = "solid", col = "black")
text(2385, 1140, "0", cex = 1.75, family="Main", col = "black")
text(2490, 1140, "100 mi", cex = 1.75, family="Main", col = "black")

text(2200, 1155, "07-07", cex = 1.75, family="Main", col = "black")

text(1750, 1285, "Net domestic migration", cex = 2.5, family="Main", col = "black")
text(1735, 1315, "into or out of the 50 states", cex = 2.5, family="Main", col = "black")
text(1750, 1348, "and District of Columbia", cex = 2.5, family="Main", col = "black")

#bottom right
text(1465, 2015, ".", cex = 30, family="Circle", col = "#16a6ae")
text(1465, 2120, ".", cex = 30, family="Circle", col = "#16a6ae")
text(1470, 2305, ".", cex = 45, family="Circle", col = "#ba7733")
text(1580, 2115, ".", cex = 20, family="Circle", col = "#75ced7")
text(1540, 2255, ".", cex = 45, family="Circle", col = "#00867c")
text(1645, 2255, ".", cex = 20, family="Circle", col = "#75ced7")
text(1635, 2395, ".", cex = 45, family="Circle", col = "#00867c")
text(1680, 2030, ".", cex = 10, family="Circle", col = "#edbf90")
text(1720, 2145, ".", cex = 10, family="Circle", col = "#edbf90")
text(1760, 2260, ".", cex = 45, family="Circle", col = "#00867c")
text(1750, 2395, ".", cex = 20, family="Circle", col = "#fcc079")
text(1865, 2020, ".", cex = 20, family="Circle", col = "#fcc079")
text(1865, 2105, ".", cex = 10, family="Circle", col = "#edbf90")
text(1870, 2185, ".", cex = 10, family="Circle", col = "#edbf90")
text(1905, 2275, ".", cex = 10, family="Circle", col = "#edbf90")
text(1920, 2365, ".", cex = 10, family="Circle", col = "#edbf90")
text(1885, 2475, ".", cex = 45, family="Circle", col = "#00867c")
text(1980, 2060, ".", cex = 20, family="Circle", col = "#75ced7")
text(2005, 2175, ".", cex = 20, family="Circle", col = "#fcc079")
text(2020, 2275, ".", cex = 20, family="Circle", col = "#75ced7")
text(2020, 2380, ".", cex = 20, family="Circle", col = "#75ced7")
text(2020, 2485, ".", cex = 30, family="Circle", col = "#dc972f")
text(2070, 2100, ".", cex = 10, family="Circle", col = "#edbf90")
text(2085, 2225, ".", cex = 45, family="Circle", col = "#ba7733")
text(2230, 2565, ".", cex = 45, family="Circle", col = "#00867c")
text(2200, 2445, ".", cex = 45, family="Circle", col = "#00867c")
text(2135, 2435, ".", cex = 20, family="Circle", col = "#75ced7")
text(2075, 2435, ".", cex = 20, family="Circle", col = "#75ced7")
text(2140, 2355, ".", cex = 45, family="Circle", col = "#00867c")
text(2285, 2360, ".", cex = 45, family="Circle", col = "#00867c")
text(2250, 2410, ".", cex = 45, family="Circle", col = "#00867c")
text(2295, 2305, ".", cex = 30, family="Circle", col = "#16a6ae")
text(2250, 2275, ".", cex = 10, family="Circle", col = "#edbf90")
text(2170, 2300, ".", cex = 20, family="Circle", col = "#75ced7")
text(2145, 2225, ".", cex = 20, family="Circle", col = "#75ced7")
text(2175, 2140, ".", cex = 30, family="Circle", col = "#dc972f")
text(2215, 2225, ".", cex = 45, family="Circle", col = "#ba7733")
text(2310, 2210, ".", cex = 45, family="Circle", col = "#ba7733")
text(2360, 2145, ".", cex = 45, family="Circle", col = "#ba7733")
text(2335, 2255, ".", cex = 10, family="Circle", col = "#edbf90")
text(2325, 2260, ".", cex = 10, family="Circle", col = "#edbf90")
text(2380, 2225, ".", cex = 45, family="Circle", col = "#ba7733")
text(2415, 2185, ".", cex = 30, family="Circle", col = "#dc972f")
text(2435, 2185, ".", cex = 10, family="Circle", col = "#73c8ca")
text(2425, 2165, ".", cex = 30, family="Circle", col = "#dc972f")
text(2415, 2115, ".", cex = 10, family="Circle", col = "#73c8ca")
text(2435, 2130, ".", cex = 20, family="Circle", col = "#75ced7")
text(2480, 2080, ".", cex = 10, family="Circle", col = "#73c8ca")

text(2360, 2255, ".", cex = 10, family="Circle", col = "#73c8ca")

grid.raster(pr, .945, .175, height = .05)
grid.raster(hawaii, .565, .175, height = .05)
text(1460, 2725, ".", cex = 30, family="Circle", col = "#dc972f")
grid.raster(alaska, .605, .455, height = .08)
text(1595, 1765, ".", cex = 20, family="Circle", col = "#fcc079")

text(2010, 2835, ".", cex = 45, family="Circle", col = "#00867c")
text(2195, 2835, "100,000 to 608,000", family="Main", cex = 2.5, col = "black")
text(2010, 2890, ".", cex = 30, family="Circle", col = "#16a6ae")
text(2180, 2890, "50,000 to 99,999", family="Main", cex = 2.5, col = "black")
text(2010, 2945, ".", cex = 20, family="Circle", col = "#75ced7")
text(2180, 2945, "20,000 to 49,999", family="Main", cex = 2.5, col = "black")
text(2010, 2995, ".", cex = 10, family="Circle", col = "#73c8ca")
text(2145, 2995, "0 to 19,999", family="Main", cex = 2.5, col = "black")
text(2010, 3035, ".", cex = 10, family="Circle", col = "#edbf90")
text(2150, 3038, "-20,000 to -1", family="Main", cex = 2.5, col = "black")
text(2010, 3075, ".", cex = 20, family="Circle", col = "#fcc079")
text(2181, 3080, "-50,000 to -20,001", family="Main", cex = 2.5, col = "black")
text(2010, 3120, ".", cex = 30, family="Circle", col = "#dc972f")
text(2183, 3130, "-100,000 to -50,001", family="Main", cex = 2.5, col = "black")
text(2010, 3175, ".", cex = 45, family="Circle", col = "#ba7733")
text(2193, 3180, "-875,000 to -100,001", family="Main", cex = 2.5, col = "black")

text(2160, 1825, "Migration, 1995 to 2000", family="Title", cex = 5, col = "black")

segments(x0=1650,y0=1910, x1=1695, y1=1910, lwd = 10, lty = "solid", col = "black")
text(1645, 1895, "0", cex = 1.75, family="Main", col = "black")
text(1705, 1895, "200 mi", cex = 1.75, family="Main", col = "black")

segments(x0=1375,y0=2785, x1=1420, y1=2785, lwd = 10, lty = "solid", col = "black")
text(1370, 2770, "0", cex = 1.75, family="Main", col = "black")
text(1430, 2770, "100 mi", cex = 1.75, family="Main", col = "black")

segments(x0=1840,y0=2785, x1=1930, y1=2785, lwd = 10, lty = "solid", col = "black")
text(1835, 2770, "0", cex = 1.75, family="Main", col = "black")
text(1940, 2770, "200 mi", cex = 1.75, family="Main", col = "black")

segments(x0=2390,y0=2785, x1=2480, y1=2785, lwd = 10, lty = "solid", col = "black")
text(2385, 2770, "0", cex = 1.75, family="Main", col = "black")
text(2490, 2770, "100 mi", cex = 1.75, family="Main", col = "black")

text(2200, 2785, "07-09", cex = 1.75, family="Main", col = "black")

text(1750, 2915, "Net domestic migration", cex = 2.5, family="Main", col = "black")
text(1735, 2945, "into or out of the 50 states", cex = 2.5, family="Main", col = "black")
text(1750, 2978, "and District of Columbia", cex = 2.5, family="Main", col = "black")

dev.off()

image_write(img, path = here::here("Original Plot Work", "Migration by State", "Migration by State.png"), format = "png")
