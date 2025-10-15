# DESCRIPTION: Time series graph of trade balances

# Original Source: https://commons.wikimedia.org/wiki/William_Playfair#/media/File:Playfair_TimeSeries.png

# SLOW REVEAL ORDER:
# No slow reveal. Just recreated fully. 

# Needed google sheet is attached within the folder. May need authorization/access granted. 


# AUTHORS:
#   Lauryn Davis (Last edit: 3/25/23)
# Ian Curtis (2023, code to generate plots)

library(tidyverse)
library(ggtext)
library(ggrepel)
library(showtext)
library(extrafont)
library(grid)
library(magick)


pop_colors <- (c('#844747','#daa855'))
iraq_data1 <- read_csv(here::here("denmark-norway-imports", "denmark_norway_imports_data.csv"))

font_files() %>% tibble() %>% filter(str_detect(family, "Playfair")) %>% pull(file)
names(pdfFonts())
font_add(family = "Playfair", regular = "PlayfairDisplay-MediumItalic.ttf")
font_add(family = "Playball", regular = "Playball-Regular.ttf")
font_add(family = "Rokkitt", regular = "Rokkitt-Regular.ttf")
font_add_google(name = "Barlow Condensed", family = "Circle")

showtext_auto()


x_label<- c("1700",'','','',"1710",'','')
picture <- image_graph(width = 780, height = 590)
annotation_custom2 <- 
  function (grob, xmin = -Inf, xmax = Inf, ymin = -Inf, ymax =Inf, data) 
  {
    layer(data = data, stat = StatIdentity, position = PositionIdentity, 
          geom = ggplot2:::GeomCustomAnn, 
          inherit.aes = TRUE, params = list(grob = grob, 
                                            xmin = xmin, xmax = xmax, 
                                            ymin = ymin, ymax = ymax))
  }

ggplot(iraq_data1)+
  geom_ribbon(aes(x=year2, ymax=exports, ymin=imports), fill='#844747', alpha=.2)+
  geom_ribbon(aes(x=year3, ymax=exports, ymin=imports), fill='#daa855', alpha=.2)+
  geom_line(aes(x= year1, y=imports), size=1.5, color='#daa855')+
  geom_line(aes(x=year1, y=exports,group=1), size=1.5, color='#844747')+
  scale_y_continuous(breaks = c(0,10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,195), limits= c(5,200), expand= expansion(mult=c(0,0)))+ scale_x_continuous(breaks = c(0,10,30,50,88), limits= c(1,88),expand= expansion(mult=c(0,.1)))+
  theme_bw()+
  theme(axis.ticks = element_blank(),
        panel.grid = element_blank(),
        axis.text.x = element_blank(),
        axis.title = element_blank(), 
        panel.background= element_rect(color='#fdf8ee', fill= '#fdf8ee'),
        plot.background =element_rect(color='#fdf8ee', fill= '#fdf8ee'),
        plot.margin=margin(2, 1, 3, 1, "cm"),
        axis.text.y = element_blank())

dev.off()
img <- image_draw(picture)
segments(x0=25, x1=25, y0=52, y1=507, lwd = 3, lty = "solid")+
  segments(x0=25, x1=756, y0=52, y1=52, lwd = 3, lty = "solid")+
  segments(x0=756, x1=756, y0=507, y1=52, lwd = 3, lty = "solid")+
  segments(x0=25, x1=756, y0=507, y1=507, lwd = 3, lty = "solid")+
  segments(x0=115, x1=115, y0=57, y1=502, lwd = 1, lty = "solid", col = '#766558')+
  segments(x0=205, x1=205, y0=57, y1=502, lwd = 1, lty = "solid", col = '#766558')+
  segments(x0=285, x1=285, y0=57, y1=502, lwd = 1, lty = "solid", col = '#766558')+
  segments(x0=365, x1=365, y0=57, y1=502, lwd = 1, lty = "solid", col = '#766558')+
  segments(x0=445, x1=445, y0=57, y1=502, lwd = 1, lty = "solid", col = '#766558')+
  segments(x0=525, x1=525, y0=57, y1=502, lwd = 1, lty = "solid", col = '#766558')+
  segments(x0=605, x1=605, y0=57, y1=502, lwd = 1, lty = "solid", col = '#766558')+
  segments(x0=685, x1=685, y0=57, y1=502, lwd = 1, lty = "solid", col = '#766558')+
  segments(x0=32, x1=32, y0=58, y1=501, lwd = 1, lty = "solid", col = '#766558')+
  
  
  segments(x0=32, x1=685, y0=480, y1=480, lwd = 1, lty = "solid", col = '#766558')+
  segments(x0=32, x1=685, y0=459, y1=459, lwd = 1, lty = "solid", col= '#766558')+
  segments(x0=32, x1=685, y0=439, y1=439, lwd = 1, lty = "solid", col = '#766558')+
  segments(x0=32, x1=685, y0=419, y1=419, lwd = 1, lty = "solid", col = '#766558')+
  segments(x0=32, x1=685, y0=399, y1=399, lwd = 1, lty = "solid", col= '#766558')+
  segments(x0=32, x1=685, y0=377, y1=377, lwd = 1, lty = "solid", col= '#766558')+
  segments(x0=32, x1=685, y0=357, y1=357, lwd = 1, lty = "solid", col = '#766558')+
  segments(x0=32, x1=685, y0=333, y1=333, lwd = 1, lty = "solid", col= '#766558')+
  segments(x0=32, x1=685, y0=310, y1=310, lwd = 1, lty = "solid",col='#766558')+
  segments(x0=34, x1=756, y0=287, y1=287, lwd = 5, lty = "solid",col = '#766558')+
  segments(x0=32, x1=685, y0=264, y1=264, lwd = 1, lty = "solid", col='#766558')+
  segments(x0=32, x1=685, y0=241, y1=241, lwd = 1, lty = "solid", col='#766558')+
  segments(x0=32, x1=685, y0=218, y1=218, lwd = 1, lty = "solid", col ='#766558')+
  segments(x0=32, x1=685, y0=195, y1=195, lwd = 1, lty = "solid", col = '#766558')+
  segments(x0=32, x1=685, y0=172, y1=172, lwd = 1, lty = "solid", col = '#766558')+
  segments(x0=32, x1=685, y0=149, y1=149, lwd = 1, lty = "solid", col = '#766558')+
  segments(x0=32, x1=685, y0=126, y1=126, lwd = 1, lty = "solid", col = '#766558')+
  segments(x0=32, x1=685, y0=103, y1=103, lwd = 1, lty = "solid", col = '#766558')+
  segments(x0=32, x1=685, y0=80, y1=80, lwd = 1, lty = "solid", col = '#766558')+
  
  text(38, 518, substitute(paste(italic("1700"))), family = "Playball", cex = 1.2, col = "black")+
  text(115, 518, substitute(paste(italic("1710"))), family = "Playball", cex = 1.2, col = "black")+
  text(205, 518, substitute(paste(italic("1720"))), family = "Playball", cex = 1.2, col = "black")+
  text(288, 518, substitute(paste(italic("1730"))), family = "Playball", cex = 1.2, col = "black")+
  text(368, 518, substitute(paste(italic("1740"))), family = "Playball", cex = 1.2, col = "black")+
  text(448, 518, substitute(paste(italic("1750"))), family = "Playball", cex = 1.2, col = "black")+
  text(528, 518, substitute(paste(italic("1760"))), family = "Playball", cex = 1.2, col = "black")+
  text(608, 518, substitute(paste(italic("1770"))), family = "Playball", cex = 1.2, col = "black")+
  text(688, 518, substitute(paste(italic("1780"))), family = "Playball", cex = 1.2, col = "black")+
  text(695, 483, substitute(paste(italic("10"))), family = "Playball", cex = 1.15, col = "black")+
  text(697, 462, substitute(paste(italic("20"))), family = "Playball", cex = 1.1, col = "black")+
  text(697, 441, substitute(paste(italic("30"))), family = "Playball", cex = 1.1, col = "black")+
  text(697, 419, substitute(paste(italic("40"))), family = "Playball", cex = 1.1, col = "black")+
  text(697, 400, substitute(paste(italic("50"))), family = "Playball", cex = 1.1, col = "black")+
  text(697, 379, substitute(paste(italic("60"))), family = "Playball", cex = 1.1, col = "black")+
  text(697, 358, substitute(paste(italic("70"))), family = "Playball", cex = 1.1, col = "black")+
  text(697, 334, substitute(paste(italic("80"))), family = "Playball", cex = 1.1, col = "black")+
  text(697, 313, substitute(paste(italic("90"))), family = "Playball", cex = 1.1, col = "black")+
  text(709, 288, substitute(paste(italic("100,000"))), family = "Playball", cex = 1, col = "black")+
  text(698, 267, substitute(paste(italic("110"))), family = "Playball", cex = 1.1, col = "black")+
  text(700, 244, substitute(paste(italic("120"))), family = "Playball", cex = 1.1, col = "black")+
  text(700, 223, substitute(paste(italic("130"))), family = "Playball", cex = 1.1, col = "black")+ 
  text(700, 199, substitute(paste(italic("140"))), family = "Playball", cex = 1.1, col = "black")+
  text(700, 176, substitute(paste(italic("150"))), family = "Playball", cex = 1.1, col = "black")+
  text(700, 153, substitute(paste(italic("160"))), family = "Playball", cex = 1.1, col = "black")+
  text(700, 130, substitute(paste(italic("170"))), family = "Playball", cex = 1.1, col = "black")+
  text(700, 107, substitute(paste(italic("180"))), family = "Playball", cex = 1.1, col = "black")+
  text(700, 84, substitute(paste(italic("190"))), family = "Playball", cex = 1.1, col = "black")+
  
  text(390, 545, substitute(paste(italic("The Bottom line is divided into Years, the Right hand line into L10,000 each."))), family = "Playball", cex = 1.5, col = "black")+
  text(673, 560, substitute(paste(italic("Neels Sculpt 352, Strand, London."))), family = "Playball", cex = .8, col = "black")+
  text(133, 560, substitute(paste(italic("Published as the Act directs, 1st May 1786, by W. Playfair"))), family = "Playball", cex = .8, col = "black")+
  text(140,35, substitute(paste(bold("Exports"))), family = "Rokkitt", cex = 1.35, col = "black")+
  text(238,35, substitute(paste(bold("Imports"))), family = "Rokkitt", cex = 1.35, col = "black")+
  text(187,35, substitute(paste(bold("and"))), family = "Rokkitt", cex = 1.3, col = "black")+
  text(285,35, substitute(paste(bold("to"))), family = "Rokkitt", cex = 1.3, col = "black")+
  text(310,35, substitute(paste(bold("and"))), family = "Rokkitt", cex = 1.3, col = "black")+
  text(343,35, substitute(paste(bold("from"))), family = "Rokkitt", cex = 1.3, col = "black")+
  text(410,35, substitute(paste(bold("DENMARK"))), family = "Rokkitt", cex = 1.65, col = "black")+
  text(470,35, substitute(paste(bold("&"))), family = "Rokkitt", cex = 1.65, col = "black")+
  text(526,35, substitute(paste(bold("NORWAY"))), family = "Rokkitt", cex = 1.65, col = "black")+
  text(587,35, substitute(paste(bold("from"))), family = "Rokkitt", cex = 1.3, col = "black")+
  text(623,35, substitute(paste(bold("1700"))), family = "Rokkitt", cex = 1.3, col = "black")+
  text(664,35, substitute(paste(bold("to 1780."))), family = "Rokkitt", cex = 1.3, col = "black")+ 
  text(217,353, substitute(paste(bold("Line"))), family = "Rokkitt", cex = 1.3, col = "black", srt=-15)+
  text(239,362, substitute(paste(bold("of"))), family = "Rokkitt", cex = 1.3, col = "black", srt=-20)+
  text(270,376, substitute(paste(bold("Exports"))), family = "Rokkitt", cex = 1.3, col = "black", srt=-23)+
  text(212,280, substitute(paste(bold("Line"))), family = "Rokkitt", cex = 1.3, col = "black", srt=20)+
  text(237,274, substitute(paste(bold("of"))), family = "Rokkitt", cex = 1.3, col = "black", srt=5)+
  text(272,282.5, substitute(paste(bold("Imports"))), family = "Rokkitt", cex = 1.3, col = "black", srt=-15)+
  text(269,324, substitute(paste(bold("B"))), family = "Playfair", cex = 1.8, col = "black", srt=-30)+#change back to arial.
  text(282,331, substitute(paste(bold("A"))), family = "Playfair", cex = 1.6, col = "black", srt=-40)+
  text(293,340, substitute(paste(bold("L"))), family = "Playfair", cex = 1.4, col = "black", srt=-35)+
  text(305,342, substitute(paste(bold("A"))), family = "Playfair", cex = 1.4, col = "black", srt=-15)+
  text(316,344, substitute(paste(bold("N"))), family = "Playfair", cex = 1.4, col = "black", srt=-10)+
  text(328,344, substitute(paste(bold("C"))), family = "Playfair", cex = 1.4, col = "black", srt=-5)+
  text(342,345, substitute(paste(bold("E"))), family = "Playfair", cex = 1.4, col = "black", srt=0)+
  text(357,338, substitute(paste(bold("A"))), family = "Playfair", cex = 1.6, col = "black", srt=15)+
  text(368,334, substitute(paste(bold("G"))), family = "Playfair", cex = 1.5, col = "black", srt=15)+
  text(378,328, substitute(paste(bold("A"))), family = "Playfair", cex = 1.5, col = "black", srt=13)+
  text(386,325, substitute(paste(bold("I"))), family = "Playfair", cex = 1.5, col = "black", srt=13)+
  text(394,323, substitute(paste(bold("N"))), family = "Playfair", cex = 1.5, col = "black", srt=10)+
  text(405,320, substitute(paste(bold("S"))), family = "Playfair", cex = 1.5, col = "black", srt=7)+
  text(418,320, substitute(paste(bold("T"))), family = "Playfair", cex = 1.45, col = "black", srt=-7)+
  text(600,211, substitute(paste(bold("BALANCE"))), family = "Playfair", cex = 1.4, col = "black", srt=0)+
  text(655,212, substitute(paste(bold("in"))), family = "Playfair", cex = 1.2, col = "black", srt=0)+
  text(604,234, substitute(paste(bold("FAVOUR"))), family = "Playfair", cex = 1.4, col = "black", srt=0)+
  text(655,236, substitute(paste(bold("of"))), family = "Playfairl", cex = 1.2, col = "black", srt=0)+
  text(610,256, substitute(paste(bold("E N G L A N D"))), family = "Playfair", cex = 1.5, col = "black", srt=0)+#change font
  text(620,320, substitute(paste(bold("Imports"))), family = "Rokkitt", cex = 1.35, col = "black", srt=20)+
  text(578,163, substitute(paste(bold("Exports"))), family = "Rokkitt", cex = 1.35, col = "black", srt=35)



dev.off()
image_write(img, path = here::here("denmark-norway-imports", "01_full_unmasked.png"), format = "png")


