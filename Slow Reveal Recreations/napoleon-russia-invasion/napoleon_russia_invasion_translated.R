#
# FILE:
# napoleon_russia_invasion.R
#
# DESCRIPTION:
# This code is for the Napoleons Invasion of Russia map by Charles Mindard.  
# The png shows the final map which could be turned into a slow reveal in the future while the river folder contains the river images needed to add the rivers to the map.  
# Source: https://www.nealvonflue.com/wp-content/uploads/2018/04/Minard-napolean-chart3.jpg
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC
#
# AUTHORS:
#   Robert Bilyk (main code)
#   Ian Curtis (2023, code to save plots)


library(tidyverse)
library(showtext)
library(readxl)
library(magick)
library(grid)


font_add_google(name = "Great Vibes", family = "Main")
font_add_google(name = "Charm", family = "Map")
font_add_google(name = "Elsie", family = "Misc")
font_add_google(name = "Lovers Quarrel", family = "Title")
showtext_auto()

#Adding Dimensions
gap <- ggplot() + theme_void() + 
  theme(plot.background = element_rect(color = "#d7d2bf", fill = "#d7d2bf"))

picture <- image_graph(width = 2000, height = 900)
gap 
dev.off()

#### Uploading River Images to put into map ####
neim <- image_read(here::here("Slow Reveal Recreations", "napoleon-russia-invasion", "rivers", "Neim.png"))
mosk <- image_read(here::here("Slow Reveal Recreations", "napoleon-russia-invasion", "rivers", "Mosk.PNG"))
dorg <- image_read(here::here("Slow Reveal Recreations", "napoleon-russia-invasion", "rivers", "Dorg.PNG"))
orsh <- image_read(here::here("Slow Reveal Recreations", "napoleon-russia-invasion", "rivers", "Orsh.PNG"))
bere <- image_read(here::here("Slow Reveal Recreations", "napoleon-russia-invasion", "rivers", "Bere.PNG"))


#### N: RECREATED GRAPHIC ####

#Drawing the map
fig01 <- image_draw(picture)

#Black Lines 
polygon(c(127, 177, 177, 127), c(558, 555, 560, 563), border = "black", col = "black")
polygon(c(175, 177, 200, 198), c(559, 555, 225, 225), border = "black", col = "black")
polygon(c(177, 177, 245, 245), c(555, 557, 553, 551), border = "black", col = "black")
polygon(c(310, 310, 245, 245), c(554, 550, 551, 555), border = "black", col = "black")
polygon(c(310, 310, 490, 490), c(554, 550, 560, 564), border = "black", col = "black")
polygon(c(560, 560, 490, 490), c(584, 580, 560, 564), border = "black", col = "black")
polygon(c(560, 560, 635, 635), c(584, 580, 536, 544), border = "black", col = "black")
polygon(c(760, 760, 635, 635), c(610, 602, 536, 544), border = "black", col = "black")
polygon(c(764, 760, 785, 785), c(623, 602, 607, 626), border = "black", col = "black")
polygon(c(885, 880, 785, 785), c(599, 580, 607, 626), border = "black", col = "black")
polygon(c(870, 880, 795, 785), c(582, 580, 309, 308), border = "black", col = "black")
polygon(c(885, 880, 1030, 1035), c(592, 585, 515, 523), border = "black", col = "black")
polygon(c(1235, 1235, 1030, 1035), c(482, 470, 515, 526), border = "black", col = "black")
polygon(c(1235, 1235, 1415, 1420), c(485, 470, 405, 420), border = "black", col = "black")
polygon(c(1565, 1550, 1415, 1420), c(342, 325, 405, 425), border = "black", col = "black")
polygon(c(1565, 1550, 1690, 1690), c(354, 325, 260, 295), border = "black", col = "black")
polygon(c(1880, 1890, 1690, 1690), c(342, 310, 260, 297), border = "black", col = "black")
polygon(c(1880, 1870, 1905, 1930), c(342, 307, 297, 323), border = "black", col = "black")
polygon(c(1940, 1905, 1895, 1930), c(154, 170, 300, 323), border = "black", col = "black")
polygon(c(1945, 1905, 1910, 1958), c(150, 170, 210, 188), border = "black", col = "black")

#Red Lines
polygon(c(78, 125, 249, 207), c(400, 555, 520, 355), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(208, 220, 220, 208), c(370, 420, 230.5, 230), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(208, 205, 340, 340), c(370, 530, 550, 390), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(340, 340, 502, 518), c(415, 390, 267, 280), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(620, 622, 502, 510), c(297, 280, 267, 285), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(620, 622, 790, 795), c(293, 280, 295, 308), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(340, 485, 455, 340), c(550, 510, 385, 410), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(480, 585, 550, 455), c(505, 475, 360, 390), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(583, 650, 645, 550), c(470, 450, 343, 367), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(645, 670, 660, 645), c(452, 449.5, 342, 343), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(670, 775, 763, 660), c(445, 430, 334, 348), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(775, 858, 848, 763), c(425, 415, 328, 340), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(858, 948, 938, 848), c(410, 400, 323, 333), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(948, 979, 972, 939), c(395, 392, 325, 327), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(965, 973, 1200, 1200), c(392, 325, 405, 475), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(1415, 1400, 1200, 1200), c(400, 335, 405, 475), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(1415, 1400, 1585, 1605), c(400, 335, 160, 220), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(1695, 1710, 1585, 1605), c(245, 195, 160, 220), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(1695, 1705, 1740, 1740), c(245, 203, 213, 257), border = "#Cb6b57", col = "#Cb6b57")
polygon(c(1740, 1740, 1945, 1930), c(213, 257, 150, 110), border = "#Cb6b57", col = "#Cb6b57")

#Troop Numbers
text(140, 355, "422.000", family = "Main", cex = 1, col = "#383227", srt = 110)
text(265, 355, "400.000", family = "Main", cex = 1, col = "#383227", srt = 88)
text(240, 250, "28.000", family = "Main", cex = 1, col = "#383227")
text(180, 260, "6.000", family = "Main", cex = 1, col = "#383227")
text(470, 340, "60.000", family = "Main", cex = 1, col = "#383227", srt = 310)
text(640, 260, "33.000", family = "Main", cex = 1, col = "#383227", srt = 85)
text(1035, 320, "175.000", family = "Main", cex = 1, col = "#383227", srt = 75)
text(1250, 360, "145.000", family = "Main", cex = 1, col = "#383227", srt = 115)
text(1625, 150, "127.100", family = "Main", cex = 1, col = "#383227", srt = 80)
text(1735, 185, "100.000", family = "Main", cex = 1, col = "#383227", srt = 85)
text(1870, 115, "100.000", family = "Main", cex = 1, col = "#383227", srt = 305)
text(1960, 210, "100.000", family = "Main", cex = 1, col = "#383227", srt = 300)
text(1845, 355, "96.000", family = "Main", cex = 1, col = "#383227", srt = 80)
text(1640, 350, "87.000", family = "Main", cex = 1, col = "#383227", srt = 110)
text(1495, 410, "55.000", family = "Main", cex = 1, col = "#383227", srt = 115)
text(1320, 480, "37.000", family = "Main", cex = 1, col = "#383227", srt = 110)
text(1130, 530, "24.000", family = "Main", cex = 1, col = "#383227", srt = 105)
text(945, 590, "20.000", family = "Main", cex = 1, col = "#383227", srt = 115)
text(825, 640, "50.000", family = "Main", cex = 1, col = "#383227", srt = 108)
text(810, 475, "30.000", family = "Main", cex = 1, col = "#383227", srt = 15)
text(690, 600, "28.000", family = "Main", cex = 1, col = "#383227", srt = 70)
text(515, 595, "12.000", family = "Main", cex = 1, col = "#383227", srt = 90)
text(390, 580, "14.000", family = "Main", cex = 1, col = "#383227", srt = 90)
text(305, 575, "8.000", family = "Main", cex = 1, col = "#383227", srt = 90)
text(200, 575, "4.000", family = "Main", cex = 1, col = "#383227", srt = 92)
text(150, 580, "10.000", family = "Main", cex = 1, col = "#383227", srt = 95)

#Borderlines
segments(x0=0,y0=760, x1=1930, y1=760, lwd = 1, lty = "solid")
segments(x0=0,y0=695, x1=2000, y1=695, lwd = 1, lty = "solid")
segments(x0=0,y0=692, x1=2000, y1=692, lwd = 1, lty = "solid")

#Horz Graph Lines
segments(x0=550,y0=797, x1=1930, y1=797, lwd = 1, lty = "solid")
segments(x0=550,y0=834, x1=1930, y1=834, lwd = 1, lty = "solid")
segments(x0=550,y0=871, x1=1930, y1=871, lwd = 1, lty = "solid")

#Vert Graph Lines
segments(x0=94,y0=797, x1=94, y1=435, lwd = 1, lty = "solid")
segments(x0=310,y0=855, x1=310, y1=555, lwd = 1, lty = "solid")
segments(x0=550,y0=871, x1=550, y1=580, lwd = 1, lty = "solid")
segments(x0=635,y0=853, x1=635, y1=545, lwd = 1, lty = "solid")
segments(x0=750,y0=835, x1=750, y1=605, lwd = 1, lty = "solid")
segments(x0=870,y0=797, x1=870, y1=600, lwd = 1, lty = "solid")
segments(x0=1228,y0=845, x1=1228, y1=480, lwd = 1, lty = "solid")
segments(x0=1413,y0=797, x1=1413, y1=422, lwd = 1, lty = "solid")
segments(x0=1930,y0=880, x1=1930, y1=315, lwd = 1, lty = "solid")

#Rivers
text(20, 360, "Niéman", family = "Map", cex = 1, col = "#383227", srt = 25)
text(55, 375, "R.", family = "Map", cex = 1, col = "#383227")
text(113, 620, "Niéman", family = "Map", cex = 1., col = "#383227", srt = 80)
text(122, 575, "R.", family = "Map", cex = 1, col = "#383227", srt = 90)
grid.raster(neim, .036, .428, height = .4)
grid.raster(mosk, .84, .828, height = .15)
text(1645, 115, "Moskowa", family = "Map", cex = 1, col = "#383227", srt = 310)
text(1685, 155, "R.", family = "Map", cex = 1, col = "#383227")
grid.raster(dorg, .712, .57, height = .05)
grid.raster(orsh, .53, .37, height = .27)
text(710, 510, "Bérézina", family = "Map", cex = 1, col = "#383227", srt = 335)
text(755, 535, "R.", family = "Map", cex = 1, col = "#383227", srt = 330)
grid.raster(bere, .375, .35, height = .25)

#Distance Legend
segments(x0=1455,y0=600, x1=1670, y1=600, lwd = 1, lty = "solid")
segments(x0=1455,y0=600, x1=1455, y1=595, lwd = 1, lty = "solid")
segments(x0=1475,y0=600, x1=1475, y1=595, lwd = 1, lty = "solid")
segments(x0=1495,y0=600, x1=1495, y1=595, lwd = 1, lty = "solid")
segments(x0=1515,y0=600, x1=1515, y1=595, lwd = 1, lty = "solid")
segments(x0=1535,y0=600, x1=1535, y1=595, lwd = 1, lty = "solid")
segments(x0=1555,y0=600, x1=1555, y1=595, lwd = 1, lty = "solid")
segments(x0=1670,y0=600, x1=1670, y1=595, lwd = 1, lty = "solid")
text(1455, 605, "0", family = "Main", cex = .75, col = "#383227")
text(1475, 605, "25", family = "Main", cex = .75, col = "#383227")
text(1495, 605, "50", family = "Main", cex = .75, col = "#383227")
text(1515, 605, "75", family = "Main", cex = .75, col = "#383227")
text(1535, 605, "100", family = "Main", cex = .75, col = "#383227")
text(1555, 605, "125", family = "Main", cex = .75, col = "#383227")
text(1670, 605, "250", family = "Main", cex = .75, col = "#383227")
text(1560, 575, expression("Distance in kilometers (Map by Mr. Fezensac)"), family = "Map", cex = .85, col = "#383227")


#Misc Graph Text
text(120, 810, "The Cossacks gallop across", family = "Map", cex = 1.25, col = "#383227")
text(100, 830, "the frozen Niémen.", family = "Map", cex = 1.25, col = "#383227")
text(820, 736, "the temperature, in degrees Celcius (Fahrenheit), below zero", family = "Map", cex = 2, col = "#383227")
text(465, 735, "CHART TABLE", family = "Misc", cex = 2, col = "#383227")

#Main Text
text(350, 33, "Figurative Map", family = "Main", cex = 3.5, col = "#383227")
text(795, 35, "of the successive losses in men of the French Army in the campaign of", family = "Title", cex = 3, col = "#383227")
text(1245, 28, "Russia 1812 - 1813", family = "Main", cex = 3.5, col = "#383227")
text(800, 63, "Drawn up by M. Minard, retired Inspector General of roads and bridges", family = "Title", cex = 3, col = "#383227")
segments(x0=700, y0=85, x1=900, y1=85, lwd = 1, lty = "solid", col = "#383227")
text(1275, 80, "Paris, 20 November 1869.", family = "Title", cex = 3, col = "#383227")
text(800, 105, "The numbers of men present are represented by the widths of the colored zones at the rate of one millimeter for ten thousand men; this is more pronounced", family = "Title", cex = 2.75, col = "#383227")
text(800, 135, "across the different zones. Red denotes men entering Russia, black those leaving it. __ The information used to draw up the map was taken from the", family = "Title", cex = 2.75, col = "#383227")
text(800, 165, "works of M. M. Chiers, Fezensac, and Chambray using the unpublished journal of Jacob, the pharmacist of the Army since October 28.", family = "Title", cex = 2.75, col = "#383227")
text(800, 195, "To make the reduction of the army easier to judge by eye, I have supposed that corps of Prince Jerome and Marshal Davous, which had", family = "Title", cex = 2.75, col = "#383227")
text(800, 225, "been detached to Minsk and Mohilow and then rejoined towards Orscha and Witebsk had always marched with the army.", family = "Title", cex = 2.75, col = "#383227")

#Cities
text(125, 460, "Kowno", family = "Map", cex = 1.35, col = "#383227")
text(325, 457, "Wilna", family = "Map", cex = 1.35, col = "#383227")
text(520, 550, "Smorgoni", family = "Map", cex = 1.35, col = "#383227")
text(565, 595, "Molodezno", family = "Map", cex = 1.35, col = "#383227")
text(655, 665, "Minsk", family = "Map", cex = 1.35, col = "#383227")
text(635, 325, "Gloubokoe", family = "Map", cex = 1.35, col = "#383227")
text(760, 635, "Stulienska", family = "Map", cex = 1.35, col = "#383227")
text(780, 280, "Polotzk", family = "Map", cex = 1.35, col = "#383227")
text(900, 600, "Botr", family = "Map", cex = 1.35, col = "#383227")
text(1055, 655, "Mohilow", family = "Map", cex = 1.35, col = "#383227")
text(1035, 495, "Orscha", family = "Map", cex = 1.35, col = "#383227")
text(965, 340, "Witebsk", family = "Map", cex = 1.35, col = "#383227")
text(1210, 450, "Smolensk", family = "Map", cex = 1.35, col = "#383227")
text(1390, 370, "Dorogobouge", family = "Map", cex = 1.35, col = "#383227")
text(1570, 365, "Wizma", family = "Map", cex = 1.35, col = "#383227")
text(1585, 195, "Chjat", family = "Map", cex = 1.35, col = "#383227")
text(1775, 265, "Mojaisk", family = "Map", cex = 1.35, col = "#383227")
text(1968, 260, "Tarantino", family = "Map", cex = 1.35, col = "#383227")
text(1935, 350, "Malo-jarosewli", family = "Map", cex = 1.35, col = "#383227")
text(1930, 90, "Moscow", family = "Misc", cex = 1.75, col = "#383227")

#Graph Lines
segments(x0=550,y0=869, x1=310, y1=853, lwd = .25, lty = "solid")
segments(x0=550,y0=871, x1=310, y1=855, lwd = 3, lty = "12")
segments(x0=550,y0=873, x1=310, y1=857, lwd = .25, lty = "solid")
segments(x0=550,y0=869, x1=635, y1=851, lwd = .25, lty = "solid")
segments(x0=550,y0=871, x1=635, y1=853, lwd = 3, lty = "12")
segments(x0=550,y0=873, x1=635, y1=855, lwd = .25, lty = "solid")
segments(x0=635,y0=851, x1=750, y1=833, lwd = .25, lty = "solid")
segments(x0=635,y0=853, x1=750, y1=835, lwd = 3, lty = "12")
segments(x0=635,y0=855, x1=750, y1=837, lwd = .25, lty = "solid")
segments(x0=870,y0=795, x1=750, y1=833, lwd = .25, lty = "solid")
segments(x0=870,y0=797, x1=750, y1=835, lwd = 3, lty = "12")
segments(x0=870,y0=799, x1=750, y1=837, lwd = .25, lty = "solid")
segments(x0=870,y0=795, x1=1228, y1=843, lwd = .25, lty = "solid")
segments(x0=870,y0=797, x1=1228, y1=845, lwd = 3, lty = "12")
segments(x0=870,y0=799, x1=1228, y1=847, lwd = .25, lty = "solid")
segments(x0=1413,y0=795, x1=1228, y1=843, lwd = .25, lty = "solid")
segments(x0=1413,y0=797, x1=1228, y1=845, lwd = 3, lty = "12")
segments(x0=1413,y0=799, x1=1228, y1=847, lwd = .25, lty = "solid")
segments(x0=1413,y0=795, x1=1780, y1=763, lwd = .25, lty = "solid")
segments(x0=1413,y0=797, x1=1780, y1=765, lwd = 3, lty = "12")
segments(x0=1413,y0=799, x1=1780, y1=767, lwd = .25, lty = "solid")
segments(x0=1930,y0=763, x1=1780, y1=763, lwd = .25, lty = "solid")
segments(x0=1930,y0=765, x1=1780, y1=765, lwd = 3, lty = "12")
segments(x0=1930,y0=767, x1=1780, y1=767, lwd = .25, lty = "solid")

#Graph Text
text(310, 875, expression("-33.3"^"o"*"C "*"(-27.9"^"o"*"F) December 7"), family = "serif", cex = 1.35, col = "#383227")
text(550, 885, expression("-37.5"^"o"*"C "*"(-35.5"^"o"*"F) December 6"), family = "serif", cex = 1.35, col = "#383227")
text(705, 868, expression("-30.1"^"o"*"C "*"(-22.2"^"o"*"F) December 1"), family = "serif", cex = 1.35, col = "#383227")
text(805, 853, expression("-25.4"^"o"*"C "*"(-13.7"^"o"*"F) November 28"), family = "serif", cex = 1.35, col = "#383227")
text(868, 782, expression("-13.4"^"o"*"C "*"(7.9"^"o"*"F) November 14"), family = "serif", cex = 1.35, col = "#383227")
text(1230, 857, expression("-26.4"^"o"*"C "*"(-15.5"^"o"*"F) November 9"), family = "serif", cex = 1.35, col = "#383227")
text(1445, 820, expression("-12.4"^"o"*"C "*"(9.7"^"o"*"F) October 24"), family = "serif", cex = 1.35, col = "#383227")
text(1775, 785, expression("Rainy 30"^"o"*"C (86"^"o"*"F) October 18"), family = "serif", cex = 1.35, col = "#383227")
text(1960, 760, expression("0"^"o"*"C "*"(32"^"o"*"F)"), family = "serif", cex = 1, col = "#383227")

#Graph axis
segments(x0=1927,y0=815, x1=1933, y1=815, lwd = .25, lty = "solid")
segments(x0=1927,y0=778, x1=1933, y1=778, lwd = .25, lty = "solid")
segments(x0=1927,y0=852, x1=1933, y1=852, lwd = .25, lty = "solid")
text(1957, 778, "6.25 (20.75)", family = "Map", cex = .85, col = "#383227")
text(1952, 797, "12.5 (9.5)", family = "Map", cex = .85, col = "#383227")
text(1957, 815, "18.75 (-1.75)", family = "Map", cex = .85, col = "#383227")
text(1949, 834, "25 (-13)", family = "Map", cex = .85, col = "#383227")
text(1960, 852, "31.25 (-24.25)", family = "Map", cex = .85, col = "#383227")
text(1955, 871, "37.5 (-35.5)", family = "Map", cex = .85, col = "#383227")
text(1947, 886, expression(""^"o"*"C ("^"o"*"F)"), family = "Map", cex = 1, col = "#383227")

dev.off()

image_write(fig01, path = here::here("Slow Reveal Recreations", "napoleon-russia-invasion", "01_full_unmasked_translated_updated.png"), format = "png")






