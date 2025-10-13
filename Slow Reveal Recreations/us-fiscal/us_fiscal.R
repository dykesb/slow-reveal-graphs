#
# FILE:
#  us_fiscal_chart.R
#
# DESCRIPTION:
#  

# SLOW REVEAL ORDER:
#   1. 
#
# AUTHORS:
#   Lauryn Davis (2022, main code)
#   Ian Curtis (2023, code to save plots)

library(tidyverse)
library(grid)
library(rlang)
library(ggtext)
library(showtext)
library(extrafont)
library(grid)
library(magick)
library(ggrepel)
library(ggpubr)


font_files() %>% tibble() %>% filter(str_detect(family, "Playfair")) %>% pull(file)
names(pdfFonts())
font_add(family = "Playfair", regular = "PlayfairDisplay-MediumItalic.ttf")
font_add(family = "Playball", regular = "Playball-Regular.ttf")
font_add(family = "Rokkitt", regular = "Rokkitt-Regular.ttf")
font_add_google(name = "Barlow Condensed", family = "Circle")

showtext_auto()


## FIGURE 1: REVENUE FULLY UNMASKED

type_levels= c("From Public Lands", "Bank Stock", "Internal Revenue", "Customs", "Direct Tax", "Postage", "Miscellaneous")

year_levels <- c("1869", "1868", "1867", "1866", "1865", "1864", "1863", "1862", "1861", "1860", "1859", "1858", "1857", "1856", "1855", "1854", "1853", "1852", "1851", "1850", "1849", "1848", "1847", "1846", "1845", "1843", "1842", "1841", "1840", "1839", "1838", "1837", "1836", "1835", "1834", "1833", "1832", "1831", "1830", "1829", "1828", "1827", "1826", "1825", "1824", "1823", "1822", "1821", "1820", "1819", "1818", "1817", "1816", "1815", "1814", "1813", "1812", "1811", "1810", "1809", "1808", "1807", "1806", "1805", "1804", "1803", "1802", "1801", "1800", "1799", "1798", "1797", "1796", "1795", "1794", "1793", "1792", "1789")

year_levels1<- rev(year_levels)
type_levels1 <- rev(type_levels)

# Need to update the 1789 and 1843 dates with the correct label.
pop_colors <- c("#c0c3b7",'#737165', "#b2a961",'#e19d91',"#a48048", "#fedcc6" ,"#ffe383")


firstbar <- read_csv(here::here("us-fiscal", "us_fiscal_data_revenue.csv")) %>% 
  mutate(vote_type = factor(vote_type, levels = type_levels),
         pop_group = factor(pop_group, levels = year_levels),
         fill = factor(fill, levels = pop_colors))


picture <- image_graph(width = 640, height = 790)
annotation_custom2 <- 
  function (grob, xmin = -Inf, xmax = Inf, ymin = -Inf, ymax =Inf, data) 
  {
    layer(data = data, stat = StatIdentity, position = PositionIdentity, 
          geom = ggplot2:::GeomCustomAnn, 
          inherit.aes = TRUE, params = list(grob = grob, 
                                            xmin = xmin, xmax = xmax, 
                                            ymin = ymin, ymax = ymax))
  }

(ggplot(firstbar, aes(x = pop_group, 
                      y = amount, fill=fill, label=''))+
    geom_col(color = "black", linewidth= .3, width=1) + scale_fill_manual(labels= '', values= pop_colors, name = "")+
    
    theme_classic()+
    theme( panel.grid = element_blank(),
           panel.grid.major = element_blank(),
           panel.grid.minor = element_blank(),
           axis.ticks = element_blank(),
           axis.line.y = element_blank(),
           axis.text.y= element_text(color='black', size=12),
           axis.text.x=element_blank(),
           axis.title=element_blank(),
           axis.line.x = element_blank(),
           legend.position='none',
           plot.margin = unit(c(.5,1,.5,1), "cm")) + scale_y_continuous(limits= c(0,101), expand=c(0,0)) + scale_x_discrete(expand=c(0,3))) + coord_flip()
dev.off()
fig01 <- image_draw(picture)

#plotting y axis labels to the right of the bars
text(620,747, "411.3", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,739, "370.9", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,730, "405.6", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,720, "489.9", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,710, "619.6", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,700, "323.1", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,691, "262.7", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,682, "112.1", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,673, "51.9", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,664, "41.5", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,655, "56.1", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,647, "52.8", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,639, "46.7", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,629, "69.0", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,619, "74.1", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,611, "65.4",cex = .9, col = "black", family = 'Rokkitt')+
  text(620,602, "73.8", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,592, "61.5",cex = .9, col = "black", family = 'Rokkitt')+
  text(620,584, "49.8", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,574, "52.6", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,564, "43.6", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,555, "30.7", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,546, "35.7", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,536, "26.4", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,527, "29.7", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,519, "29.9", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,510, "37.6", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,502, "20.0", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,493, "16.9", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,484, "19.4", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,475, "30.0", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,465, "26.3", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,456, "24.9", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,447, "50.8", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,437, "35.4", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,428, "21.8", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,418, "33.9", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,409, "31.9", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,401, "28.5", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,391, "24.8", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,382, "24.8", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,374, "24.8", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,365, "23.0", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,356, "25.3", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,347, "21.8", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,338, "19.4",cex = .9, col = "black", family = 'Rokkitt')+
  text(620,329, "20.5", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,320, "20.2", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,311, "14.6", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,301, "17.8", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,292, "24.6", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,283, "21.6", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,274, "33.1", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,265, "47.7", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,254, "15.7", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,245, "11.2", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,235, "14.3", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,225, "9.8", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,216, "14.4", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,207, "9.4", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,199, "7.8", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,190, "17.1", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,180, "16.4", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,170, "15.6",cex = .9, col = "black", family = 'Rokkitt')+
  text(620,162, "13.6", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,153, "11.8",cex = .9, col = "black", family = 'Rokkitt')+
  text(620,144, "11.1", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,135, "15.0", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,124, "12.9", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,115, "10.8",cex = .9, col = "black", family = 'Rokkitt')+
  text(620,106, "7.5", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,97, "7.9", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,89, "8.7", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,79, "8.4",cex = .9, col = "black", family = 'Rokkitt')+
  text(620,69, "6.1", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,59, "5.4",cex = .9, col = "black", family = 'Rokkitt')+
  text(620,50, "4.7", cex = .9, col = "black", family = 'Rokkitt')+
  text(620,41, "3.7",cex = .9, col = "black", family = 'Rokkitt')+
  text(620,30, "4.4", cex = .9, col = "black", family = 'Rokkitt')+
  text(15,518, "Jan. 1", cex = .9, col = "black", family = 'Rokkitt')+
  text(93,518, "to June 30. 1844", cex = .9, col = "black", family = 'Rokkitt')+
  polygon(c(56, 606, 606, 56), c(20, 20, 37, 37), border = "black", col = "#ffe383")+ text(88,30, "May 4.  1789 to Dec 31. 1791.", cex = 1, col = "black", family = 'Rokkitt')



dev.off()

image_write(fig01, path = here::here('us-fiscal', "01_revenue_full_unmasked.png"), format = "png")

## FIGURE 2: DEBT FULLY UNMASKED

font_files() %>% tibble() %>% filter(str_detect(family, "Playfair")) %>% pull(file)
names(pdfFonts())

font_add(family = "Rokkitt1", regular = "Rokkitt-SemiBold.ttf")
font_add(family = "Rokkitt", regular = "Rokkitt-Regular.ttf")
font_add(family = "playfair", regular = "PlayfairDisplay-MediumItalic.ttf")

font_add_google(name = "Barlow Condensed", family = "Circle")
showtext_auto()

picture <- image_graph(width = 570, height = 870)
annotation_custom2 <- 
  function (grob, xmin = -Inf, xmax = Inf, ymin = -Inf, ymax =Inf, data) 
  {
    layer(data = data, stat = StatIdentity, position = PositionIdentity, 
          geom = ggplot2:::GeomCustomAnn, 
          inherit.aes = TRUE, params = list(grob = grob, 
                                            xmin = xmin, xmax = xmax, 
                                            ymin = ymin, ymax = ymax))
  }
ggplot() + theme_void()
dev.off()
fig02 <- image_draw(picture)

polygon(c(30.7, 538, 550, 19.1), c(850, 850, 840, 840), border = "black", col = "#d69083")+
  polygon(c(19.1, 550, 552, 16), c(840, 840, 830, 830), border = "black", col = "#d69083")+
  polygon(c(16, 552, 561, 10), c(830, 830, 820, 820), border = "black", col = "#d69083")+
  polygon(c(10, 561, 570, 1.7), c(820, 820, 810, 810), border = "black", col = "#d69083")+
  polygon(c(1.7, 570, 560, 10), c(810, 810, 800, 800), border = "black", col = "#d69083")+
  polygon(c(10, 560, 473, 101), c(800, 800, 790, 790), border = "black", col = "#d69083")+
  polygon(c(101, 473, 399, 169), c(790, 790, 780, 780), border = "black", col = "#d69083")+
  polygon(c(169, 399, 340, 230), c(780, 780, 770, 770), border = "black", col = "#d69083")+
  polygon(c(230, 340, 294, 276), c(770, 770, 760, 760), border = "black", col = "#d69083")+
  polygon(c(276, 294, 291, 278), c(760, 760, 750, 750), border = "black", col = "#d69083")+
  polygon(c(278, 291, 289.5, 279), c(750, 750, 740, 740), border = "black", col = "#d69083")+
  polygon(c(279, 289.5, 288, 280), c(740, 740, 730, 730), border = "black", col = "#d69083")+
  polygon(c(280, 288, 287, 280.6), c(730, 730, 720, 720), border = "black", col = "#d69083")+
  polygon(c(280.6, 287, 286, 281), c(720, 720, 710, 710), border = "black", col = "#d69083")+
  polygon(c(281, 286, 289, 279), c(710, 710, 700, 700), border = "black", col = "#d69083")+
  polygon(c(279, 289, 290, 277), c(700, 700, 690, 690), border = "black", col = "#d69083")+
  polygon(c(277, 290, 290, 277), c(690, 690, 680, 680), border = "black", col = "#d69083")+
  polygon(c(277, 290, 290, 276), c(680, 680, 670, 670), border = "black", col = "#d69083")+
  polygon(c(276, 290, 290, 276), c(670, 670, 660, 660), border = "black", col = "#d69083")+
  polygon(c(276, 290, 290, 276), c(660, 660, 650, 650), border = "black", col = "#d69083")+
  polygon(c(276, 290, 289, 277), c(650, 650, 640, 640), border = "black", col = "#d69083")+
  polygon(c(277, 289, 288, 278.5), c(640, 640, 630, 630), border = "black", col = "#d69083")+
  polygon(c(278.5, 288, 287, 279), c(630, 630, 620, 620), border = "black", col = "#d69083")+
  polygon(c(279, 287, 284, 282), c(620, 620, 610, 610), border = "black", col = "#d69083")+
  polygon(c(282, 284, 285, 281), c(610, 610, 600, 600), border = "black", col = "#d69083")+
  polygon(c(281, 285, 285.5, 280), c(600, 600, 590, 590), border = "black", col = "#d69083")+
  polygon(c(280, 285.5, 286, 279), c(590, 590, 580, 580), border = "black", col = "#d69083")+
  polygon(c(279, 286, 284, 281), c(580, 580, 570, 570), border = "black", col = "#d69083")+
  polygon(c(281, 284, 283.5, 281.5), c(570, 570, 560, 560), border = "black", col = "#d69083")+
  polygon(c(281.5, 283.5, 282, 282), c(560, 560, 550, 550), border = "black", col = "#d69083")+
  polygon(c(282, 282, 282, 282), c(550, 550, 540, 540), border = "black", col = "#d69083")+
  polygon(c(282, 282, 283, 281), c(540, 540, 530, 530), border = "black", col = "#d69083")+
  polygon(c(281, 283, 282, 282), c(530, 530, 520, 520), border = "black", col = "#d69083")+
  polygon(c(282, 282, 282, 282), c(520, 520, 510, 510), border = "black", col = "#d69083")+
  polygon(c(282, 282, 282, 282), c(510, 510, 500, 500), border = "black", col = "#d69083")+
  polygon(c(282, 282, 283, 281), c(500, 500, 490, 490), border = "black", col = "#d69083")+
  polygon(c(281, 283, 285, 279), c(490, 490, 480, 480), border = "black", col = "#d69083")+
  polygon(c(279, 285, 286, 278), c(480, 480, 470, 470), border = "black", col = "#d69083")+
  polygon(c(278, 286, 287, 277), c(470, 470, 460, 460), border = "black", col = "#d69083")+
  polygon(c(277, 287, 288, 275), c(460, 460, 450, 450), border = "black", col = "#d69083")+
  polygon(c(275, 288, 289, 273), c(450, 450, 440, 440), border = "black", col = "#d69083")+
  polygon(c(273, 289, 289, 273), c(440, 440, 430, 430), border = "black", col = "#d69083")+
  polygon(c(273, 289, 289, 273), c(430, 430, 420, 420), border = "black", col = "#d69083")+
  polygon(c(273, 289, 289, 273), c(420, 420, 410, 410), border = "black", col = "#d69083")+
  polygon(c(273, 289, 289, 273), c(410, 410, 400, 400), border = "black", col = "#d69083")+
  polygon(c(273, 289, 291, 272), c(400, 400, 390, 390), border = "black", col = "#d69083")+
  polygon(c(272, 291, 291, 272), c(390, 390,380, 380), border = "black", col = "#d69083")+
  polygon(c(272, 291, 291, 272), c(380, 380, 370, 370), border = "black", col = "#d69083")+
  polygon(c(272, 291, 291, 272), c(370, 370, 360, 360), border = "black", col = "#d69083")+
  polygon(c(272, 291, 291, 272), c(360, 360, 350, 350), border = "black", col = "#d69083")+
  polygon(c(272, 291, 291, 272), c(350, 350, 340, 340), border = "black", col = "#d69083")+
  polygon(c(272, 291, 292, 270), c(340, 340, 330, 330), border = "black", col = "#d69083")+
  polygon(c(270, 292, 293, 269), c(330, 330, 320, 320), border = "black", col = "#d69083")+
  polygon(c(269, 293, 292, 270), c(320, 320, 310, 310), border = "black", col = "#d69083")+
  polygon(c(270, 292, 290, 271), c(310, 310, 300, 300), border = "black", col = "#d69083")+
  polygon(c(271, 290, 288, 272), c(300, 300, 290, 290), border = "black", col = "#d69083")+
  polygon(c(272, 288, 286, 275), c(290, 290, 280, 280), border = "black", col = "#d69083")+
  polygon(c(275, 286, 284, 277), c(280, 280, 270, 270), border = "black", col = "#d69083")+
  polygon(c(277, 284, 285, 276), c(270, 270, 260, 260), border = "black", col = "#d69083")+
  polygon(c(276, 285, 285, 276), c(260, 260, 250, 250), border = "black", col = "#d69083")+
  polygon(c(276, 285, 285, 276), c(250, 250, 240, 240), border = "black", col = "#d69083")+
  polygon(c(276, 285, 285, 276), c(240, 240, 230, 230), border = "black", col = "#d69083")+
  polygon(c(276, 285, 288, 273), c(230, 230, 220, 220), border = "black", col = "#d69083")+
  polygon(c(273, 288, 288, 273), c(220, 220, 210, 210), border = "black", col = "#d69083")+
  polygon(c(273, 288, 290, 270), c(210, 210, 200, 200), border = "black", col = "#d69083")+
  polygon(c(270, 290, 290, 270), c(200, 200, 190, 190), border = "black", col = "#d69083")+
  polygon(c(270, 290, 290, 270), c(190, 190, 180, 180), border = "black", col = "#d69083")+
  polygon(c(270, 290, 290, 270), c(180, 180, 170, 170), border = "black", col = "#d69083")+
  polygon(c(270, 290, 290, 270), c(170, 170, 160, 160), border = "black", col = "#d69083")+
  polygon(c(270, 290, 290, 270), c(160, 160, 150, 150), border = "black", col = "#d69083")+
  polygon(c(270, 290, 290, 270), c(150, 150, 140, 140), border = "black", col = "#d69083")+
  polygon(c(270, 290, 290, 270), c(140, 140, 130, 130), border = "black", col = "#d69083")+
  polygon(c(270, 290, 290, 270), c(130, 130, 120, 120), border = "black", col = "#d69083")+
  polygon(c(270, 290, 290, 270), c(130, 130, 120, 120), border = "black", col = "#d69083")+
  polygon(c(270, 290, 289, 270), c(120, 120, 110, 110), border = "black", col = "#d69083")+
  polygon(c(270, 289, 289, 270), c(110, 110, 100, 100), border = "black", col = "#d69083")+
  polygon(c(270, 289, 289, 270), c(100, 100, 90, 90), border = "black", col = "#d69083")+
  polygon(c(270, 289, 289, 271), c(90, 90, 80, 80), border = "black", col = "#d69083")+
  polygon(c(271, 289, 289, 271), c(80, 80, 70, 70), border = "black", col = "#d69083")+
  polygon(c(271, 289, 288, 272), c(70, 70, 60, 60), border = "black", col = "#d69083")+
  
  
  text(45,851, substitute(bold("1870")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(520,851, substitute(bold("2480.7")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(34,841, substitute(bold("1869")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(528,841, substitute(bold("2588.5")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(32,831, substitute(bold("1868")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(535,831, substitute(bold("2611.7")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(28,821, substitute(bold("1867")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(540,821, substitute(bold("2678.1")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(24,811, substitute(bold("1866")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(550,811, substitute(bold("2773.2")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(34,801, substitute(bold("1865")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(520,801, substitute(bold("2680.6")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(65,789, substitute(bold("1864")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(487,788, substitute(bold("1815.8")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(150,778, substitute(bold("1863")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(424,778, substitute(bold("1119.8")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(201,770, substitute(bold("1862")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(382,770, substitute(bold("524.2")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(253,760, substitute(bold("1861")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,758, substitute(bold("90.  6")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,750, substitute(bold("1860")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,748, substitute(bold("64.  8")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,740, substitute(bold("1859")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,738, substitute(bold("58.  5")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,730, substitute(bold("1858")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,728, substitute(bold("44.  9")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,720, substitute(bold("1857")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,718, substitute(bold("28.  7")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,710, substitute(bold("1856")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,708, substitute(bold("32.  0")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,700, substitute(bold("1855")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,698, substitute(bold("35.  6")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,690, substitute(bold("1854")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,688, substitute(bold("42.  2")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,680, substitute(bold("1853")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,678, substitute(bold("59.  8")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  
  text(255,670, substitute(bold("1852")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,668, substitute(bold("66.  2")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,660, substitute(bold("1851")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,658, substitute(bold("68.  3")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  
  text(255,650, substitute(bold("1850")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,648, substitute(bold("63.  5")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,640, substitute(bold("1849")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,638, substitute(bold("63.  1")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,630, substitute(bold("1848")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,628, substitute(bold("47.  0")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,620, substitute(bold("1847")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,618, substitute(bold("38.  8")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,610, substitute(bold("1846")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,608, substitute(bold("15.  6")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,600, substitute(bold("1845")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,598, substitute(bold("15.  9")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,590, substitute(bold("1844")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,588, substitute(bold("23.  5")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(238,581, substitute(bold("July 1. 1843")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,578, substitute(bold("32.  7")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,570, substitute(bold("1842")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,568, substitute(bold("20.  6")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,560, substitute(bold("1841")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,558, substitute(bold("13.  6")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,550, substitute(bold("1840")), cex = 1, col = "black", family = 'Rokkitt1')+
  text(312,548, substitute(bold("5.  3")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,540, substitute(bold("1839")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,538, substitute(bold("3.  6")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,530, substitute(bold("1838")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,528, substitute(bold("10.  4")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,520, substitute(bold("1837")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,518, substitute(bold("3.  3")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,510, substitute(bold("1836")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,508, substitute(bold("0.  3")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,500, substitute(bold("1835")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,498, substitute(bold("0.  0")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,490, substitute(bold("1834")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,488, substitute(bold("4.  8")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,480, substitute(bold("1833")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,478, substitute(bold("7.  0")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,470, substitute(bold("1832")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,468, substitute(bold("24.  3")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,460, substitute(bold("1831")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,458, substitute(bold("39.  1")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,450, substitute(bold("1830")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,448, substitute(bold("48.  6")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,440, substitute(bold("1829")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,438, substitute(bold("58.  4")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,430, substitute(bold("1828")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,428, substitute(bold("67.  5")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,420, substitute(bold("1827")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,418, substitute(bold("74.  0")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,410, substitute(bold("1826")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,408, substitute(bold("81.  0")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,400, substitute(bold("1825")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,398, substitute(bold("83.  8")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,390, substitute(bold("1824")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,388, substitute(bold("90.  3")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,380, substitute(bold("1823")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,378, substitute(bold("90.  9")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,370, substitute(bold("1822")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,368, substitute(bold("93.  5")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,360, substitute(bold("1821")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,358, substitute(bold("90.  0")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,350, substitute(bold("1820")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,348, substitute(bold("91.  0")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,340, substitute(bold("1819")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,338, substitute(bold("95.  5")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,330, substitute(bold("1818")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,328, substitute(bold("103.  5")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,320, substitute(bold("1817")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,318, substitute(bold("123.  5")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,310, substitute(bold("1816")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,308, substitute(bold("127.  3")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,300, substitute(bold("1815")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,298, substitute(bold("99.  8")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,290, substitute(bold("1814")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,288, substitute(bold("81.  5")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,280, substitute(bold("1813")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,278, substitute(bold("56.  0")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,270, substitute(bold("1812")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,268, substitute(bold("45.  2")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,260, substitute(bold("1811")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,258, substitute(bold("48.  0")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,250, substitute(bold("1810")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,248, substitute(bold("53.  2")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  
  
  text(312,238, substitute(bold("57.  0")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  
  
  text(312,228, substitute(bold("65.  2")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,240, substitute(bold("1809")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,218, substitute(bold("69.  2")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,230, substitute(bold("1808")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,208, substitute(bold("75.  7")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,220, substitute(bold("1807")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,198, substitute(bold("82.  3")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,210, substitute(bold("1806")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,188, substitute(bold("86.  4")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,200, substitute(bold("1805")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,178, substitute(bold("77.  1")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,190, substitute(bold("1804")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,168, substitute(bold("80.  7")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,180, substitute(bold("1803")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,158, substitute(bold("83.  0")), cex = 1, col = "black", family = 'Rokkitt1')+
  text(312,148, substitute(bold("83.  0")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,170, substitute(bold("1802")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,138, substitute(bold("78.  4")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,160, substitute(bold("1801")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,128, substitute(bold("79.  2")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,150, substitute(bold("1800")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,118, substitute(bold("82.  1")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,140, substitute(bold("1799")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,108, substitute(bold("83.  8")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,130, substitute(bold("1798")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,98, substitute(bold("80.  7")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,120, substitute(bold("1797")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,88, substitute(bold("78.  4")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,110, substitute(bold("1796")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,78, substitute(bold("80.  4")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,100, substitute(bold("1795")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,68, substitute(bold("77.  2")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,90, substitute(bold("1794")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(312,58, substitute(bold("75.  5")), cex = 1, col = "black", family = 'Rokkitt1')+
  
  text(255,80, substitute(bold("1793")), cex = 1, col = "black", family = 'Rokkitt1')+
  text(255,70, substitute(bold("1792")), cex = 1, col = "black", family = 'Rokkitt1')+
  text(241,60, substitute(bold("Jan 1. 1791")), cex = 1, col = "black", family = 'Rokkitt1')



dev.off()
image_write(fig02, path = here::here('us-fiscal', "02_debt_full_unmasked.png"), format = "png")





## FIGURE 3: EXPENDITURES FULLY UNMASKED

font_files() %>% tibble() %>% filter(str_detect(family, "Playfair")) %>% pull(file)
names(pdfFonts())
font_add(family = "Playfair", regular = "PlayfairDisplay-MediumItalic.ttf")
font_add(family = "Playball", regular = "Playball-Regular.ttf")
font_add(family = "Rokkitt", regular = "Rokkitt-Regular.ttf")
font_add_google(name = "Barlow Condensed", family = "Circle")
showtext_auto()

year_levels <- c(1870,1869,1868,1867,1866,1865,1864,1863,1862,1861,1860,1859,1858,
                 1857,1856,1855,1854,1853,1852,1851,1850,1849,1848,1847,1846,1845,1844,1842,1841,1840,1839,1838,1837,1836,1835,1834,1833,1832,1831,1830,1829,1828,1827,1826,1825,1824,1823,1822,1821,1820,1819,1818,1817,1816,1815,1814,1813,1812,1811,1810,1809,1808,1807,1806,1805,1804,1803,1802,1801,1800,1799,1798,1797,1796,1795,1794,1793,1792)
type_levels<- c('Army', 'Navy', 'Pensions', 'Civil' ,'Indians' ,'Foreign', 'Miscellaneous', 'Premium on Pub. Debt.', 'Principle of Pub.' ,'Debt Interest on Pub. Debt.')




year_levels1<- rev(year_levels)

type_levels1 <- rev(type_levels)


pop_colors<- c("#aea596", "#777367", "#292323", "#eac85c", "#fee6a9", "#d69083", "#787734", "#886a6d", "#a1aba6", "#ddd9cb")
firstbar <- read_csv(here::here("us-fiscal", "us_fiscal_data_expenditures.csv")) %>% 
  mutate(vote_type = factor(vote_type, levels = type_levels),
         pop_group = factor(pop_group, levels = year_levels),
         fill = factor(fill, levels = pop_colors))

picture <- image_graph(width = 570, height = 790)
annotation_custom2 <- 
  function (grob, xmin = -Inf, xmax = Inf, ymin = -Inf, ymax =Inf, data) 
  {
    layer(data = data, stat = StatIdentity, position = PositionIdentity, 
          geom = ggplot2:::GeomCustomAnn, 
          inherit.aes = TRUE, params = list(grob = grob, 
                                            xmin = xmin, xmax = xmax, 
                                            ymin = ymin, ymax = ymax))
  }
(ggplot(firstbar, aes(x = pop_group, 
                      y = amount, fill=fill, label=''))+
    geom_col(color = "black", linewidth= .3, width=1) + scale_fill_manual(labels= '', values= pop_colors, name = "")+
    theme_classic()+
    theme( panel.grid = element_blank(),
           panel.grid.major = element_blank(),
           panel.grid.minor = element_blank(),
           axis.ticks = element_blank(),
           axis.line.y = element_blank(),
           axis.text.y= element_text(color='black', family='Rokkitt', size=12, margin = unit(0,'cm')),
           axis.text.x=element_blank(),
           axis.title=element_blank(),
           axis.line.x = element_blank(),
           legend.position='none',
           plot.margin = unit(c(.5,1,.5,1.2), "cm")) + scale_y_continuous(limits= c(0,101), expand=c(0,0)) + scale_x_discrete(position='top',expand=c(0,3))) + coord_flip()
dev.off()
fig03 <- image_draw(picture)
text(19,749, "417.7", cex = .9, col = "black", family = 'Rokkitt')+
  text(19,740, "346.5", cex = .9, col = "black", family = 'Rokkitt')+
  text(19,730, "443.3", cex = .9, col = "black", family = 'Rokkitt')+
  text(19,720, "455.9", cex = .9, col = "black", family = 'Rokkitt')+
  text(19,711, "519.1", cex = .9, col = "black", family = 'Rokkitt')+
  text(17,701.5, "1293.5", cex = .9, col = "black", family = 'Rokkitt')+
  text(19,692, "865.0", cex = .9, col = "black", family = 'Rokkitt')+
  text(19,683, "717.8", cex = .9, col = "black", family = 'Rokkitt')+
  text(19,674, "469.6", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,665, "66.6", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,656, "63.2", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,647, "69.0", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,638, "74.5", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,629, "70.3", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,620, "66.3", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,611, "66.2", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,601, "74.7", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,592, "54.6", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,583, "46.7", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,574, "47.8", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,565, "40.9", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,556, "43.6", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,547, "47.6", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,538, "54.9", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,529, "27.6", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,520, "30.5", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,511, "39.5", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,501, "25.1", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,492, "26.5", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,483, "24.3", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,474, "26.9", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,465, "40.7", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,456, "37.2", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,447, "30.9", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,438, "17.6", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,429, "23.3", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,420, "25.3", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,411, "34.6", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,402, "30.0", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,391, "24.6", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,382, "25.1", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,373, "25.4", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,364, "22.7", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,355, "24.1", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,346, "18.6", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,337, "26.8", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,328, "15.3", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,319, "17.7", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,310, "15.8", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,299, "19.3", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,288, "26.0", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,279, "28.0", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,270, "40.0", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,261, "35.0", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,252, "32.9", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,243, "34.7", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,234, "31.7", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,223, "20.3", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,214, "11.0", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,205, "13.6", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,196, "14.1", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,187, "17.2", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,178, "12.4", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,169, "16.0", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,160, "15.6", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,151, "12.8", cex = .9, col = "black", family = 'Rokkitt')+
  text(23,143, "8.0", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,134, "11.6", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,125, "11.7", cex = .9, col = "black", family = 'Rokkitt')+
  text(21,116, "10.8", cex = .9, col = "black", family = 'Rokkitt')+
  text(23,106, "9.3", cex = .9, col = "black", family = 'Rokkitt')+
  text(23,97, "8.4", cex = .9, col = "black", family = 'Rokkitt')+
  text(23,88, "8.8", cex = .9, col = "black", family = 'Rokkitt')+
  text(23,79, "7.5", cex = .9, col = "black", family = 'Rokkitt')+
  text(23,70, "7.3", cex = .9, col = "black", family = 'Rokkitt')+
  text(23,61, "6.1", cex = .9, col = "black", family = 'Rokkitt')+
  text(23,52, "5.7", cex = .9, col = "black", family = 'Rokkitt')+
  text(23,42, "4.3", cex = .9, col = "black", family = 'Rokkitt')+
  
  
  polygon(c(35, 130, 130, 35), c(20, 20, 37, 37), border = "black", col = "#ddd9cb")+
  polygon(c(130, 160, 160, 130), c(20, 20, 37, 37), border = "black", col = "#886a6d")+
  polygon(c(160, 210, 210, 160), c(20, 20, 37, 37), border = "black", col = "#787734")+
  polygon(c(210, 213.5, 213.5, 210), c(20, 20, 37, 37), border = "black", col = "#d69083")+
  polygon(c(213.5, 215, 215, 213.5), c(20, 20, 37, 37), border = "black", col =  "#fee6a9")+
  polygon(c(215, 327, 327, 215), c(20, 20, 37, 37), border = "black", col =  "#eac85c")+
  polygon(c(327, 510, 510, 327), c(20, 20, 37, 37), border = "black", col =  "#aea596")+
  segments(x0=35, x1=35, y0=20, y1=750, lwd = 1, lty = "solid")+
  text(23,30, "3.1", cex = .9, col = "black", family = 'Rokkitt')+
  text(529.5,30, "1791", cex = 1.05, col = "black", family = 'Rokkitt')+
  text(443,30, "From May 4. 1789 to Dec. 31", cex = .95, col = "black", family = 'Rokkitt')+
  text(463,510, "Jan 1 1843 to June 30.", cex = .9, col = "black", family = 'Rokkitt')+
  text(544,515, "*", cex = 1, col = "black", family = 'Rokkitt')




dev.off()
image_write(fig03, path = here::here('us-fiscal', "03_expenditures_full_unmasked.png"), format = "png")


## MERGING ALL THREE TOGETHER

font_files() %>% tibble() %>% filter(str_detect(family, "Playfair")) %>% pull(file)
names(pdfFonts())

font_add(family = "Rokkitt1", regular = "Rokkitt-SemiBold.ttf")
font_add(family = "Rokkitt", regular = "Rokkitt-Regular.ttf")
font_add(family = "playfair", regular = "PlayfairDisplay-MediumItalic.ttf")

font_add_google(name = "Barlow Condensed", family = "Circle")
showtext_auto()

background<- image_read(here::here('us-fiscal', "white.png"))
plot1<- image_read(here::here('us-fiscal', "01_revenue_full_unmasked.png"))
plot2 <- image_read(here::here('us-fiscal', "03_expenditures_full_unmasked.png"))
plot3 <- image_read(here::here('us-fiscal', "02_debt_full_unmasked.png"))

img<- image_draw(background)


dev.off()


picture <- image_graph(width = 1650, height = 950)
annotation_custom2 <- 
  function (grob, xmin = -Inf, xmax = Inf, ymin = -Inf, ymax =Inf, data) 
  {
    layer(data = data, stat = StatIdentity, position = PositionIdentity, 
          geom = ggplot2:::GeomCustomAnn, 
          inherit.aes = TRUE, params = list(grob = grob, 
                                            xmin = xmin, xmax = xmax, 
                                            ymin = ymin, ymax = ymax))
  }

ggplot()+theme_void()

dev.off()
fig04 <- image_draw(picture)

grid.raster(plot1, .19, .40, height =.74)

grid.raster(plot3, .525, .42, height = .74)
grid.raster(plot2, .84, .40, height = .74)
text(330,215, substitute(bold("1.- REVENUE.")), cex = 1.3, col = "black", family = 'Rokkitt1')
text(1385,215, substitute(bold("3.- EXPENDITURES.")), cex = 1.3, col = "black", family = 'Rokkitt1')+
  text(860,210, substitute(bold("2.- PUBLIC DEBT.")), cex = 1.3, col = "black", family = 'Rokkitt1')+
  text(1115,226, substitute(bold("In millions and tenths")), cex = .7, col = "black", family = 'playfair')+
  text(1115,236, substitute(bold("(00,000 omitted)")), cex = .7, col = "black", family = 'playfair')+
  
  text(860,224, substitute(bold("In millions and tenths")), cex = .7, col = "black", family = 'playfair')+
  text(860,234, substitute(bold("(00,000 omitted)")), cex = .7, col = "black", family = 'playfair')+
  
  text(607,226, substitute(bold("In millions and tenths")), cex = .7, col = "black", family = 'playfair')+
  text(607,236, substitute(bold("(00,000 omitted)")), cex = .7, col = "black", family = 'playfair')+
  
  text(860,35, substitute(bold("FISCAL CHART")), cex = 2, col = "black", family = 'Rokkitt1')+
  text(860,52, substitute(bold("OF THE UNITED STATES")), cex = 1.5, col = "black", family = 'Rokkitt1')+
  text(860,67, substitute(bold("SHOWING THE COURSE OF THE PUBLIC DEBT BY YEARS 1789 TO 1870.")), cex = 1, col = "black", family = 'Rokkitt')+
  text(860,77, substitute(bold("TOGETHER WITH THE PROPORTION OF THE TOTAL")), cex = 1, col = "black", family = 'Rokkitt')+
  text(860,91, substitute(bold("RECIEPTS")), cex = 1.5, col = "black", family = 'Rokkitt1')+
  text(860,104, substitute(bold("FROM EACH PRINCIPLE SOURCE OF REVENUE")), cex = 1, col = "black", family = 'Rokkitt')+
  text(860,114, substitute(bold("AND PROPORTION OF THE TOTAL")), cex = 1, col = "black", family = 'Rokkitt')+
  text(860,128, substitute(bold("EXPENDITURES")), cex = 1.5, col = "black", family = 'Rokkitt1')+
  text(860,143, substitute(bold("FOR EACH PRINCIPLE DEPARTMENT OF THE")), cex = 1, col = "black", family = 'Rokkitt')+
  text(860,153, substitute(bold("PUBLIC SERVICE.")), cex = 1, col = "black", family = 'Rokkitt')+
  text(860,163, substitute(bold("Compiled from the Report of the Secretary of the Treasury for the year 1872,")), cex = .9, col = "black", family = 'Rokkitt')+
  text(860,173, substitute(bold("BY")), cex = .75, col = "black", family = 'Rokkitt')+
  text(860,183, substitute(bold("FRANCIS A. WALKER")), cex = 1.1, col = "black", family = 'Rokkitt')+
  
  text(330,915, substitute(bold("*Fiscal Year ending June 30.")), cex = 1.1, col = "black", family = 'Rokkitt')+ 
  text(860,915, substitute(bold("The Public Debt. January. 1. 1835, was $ 37.513.")), cex = 1.1, col = "black", family = 'Rokkitt')+ 
  text(1385,915, substitute(bold("*Fiscal Year ending June 30.")), cex = 1.1, col = "black", family = 'Rokkitt')+ 
  
  segments(x0=830, x1=895, y0=197, y1=197, lwd = 1, lty = "solid")+
  
  polygon(c(90,115, 115, 90), c(40, 40, 53, 53), border = "black", col = "#c0c3b7")+
  text(171,45, substitute(bold("From Public Lands")), cex = .9, col = "black", family = 'playfair')+
  polygon(c(90,115, 115, 90), c(65, 65, 78, 78), border = "black", col ="#b2a961")+
  text(171,70, substitute(bold("-    Bank Stock")), cex = .9, col = "black", family = 'playfair')+
  polygon(c(90,115, 115, 90), c(90, 90, 103, 103), border = "black", col ="#fedcc6")+
  text(171,95, substitute(bold("          -    Internal Revenue")), cex = .9, col = "black", family = 'playfair')+
  polygon(c(90,115, 115, 90), c(115, 115, 128, 128), border = "black", col ="#ffe383")+
  text(164,120, substitute(bold("-    Customs")), cex = .9, col = "black", family = 'playfair')+
  polygon(c(90,115, 115, 90), c(140, 140, 153, 153), border = "black", col ="#a48048")+
  text(164,145, substitute(bold("    -    Direct Tax")), cex = .9, col = "black", family = 'playfair')+
  polygon(c(90,115, 115, 90), c(165, 165, 178, 178), border = "black", col ='#e19d91')+
  text(162,170, substitute(bold("-    Postage")), cex = .9, col = "black", family = 'playfair')+
  polygon(c(90,115, 115, 90), c(190, 190, 203, 203), border = "black", col ='#737165')+
  text(162,195, substitute(bold("           -    Miscellaneous")), cex = .9, col = "black", family = 'playfair')+
  
  polygon(c(1500,1525, 1525, 1500), c(10, 10, 23, 23), border = "black", col = "#ddd9cb")+
  text(1550,18, substitute(bold("Army")), cex = .9, col = "black", family = 'playfair')+
  polygon(c(1500,1525, 1525, 1500), c(30, 30, 43, 43), border = "black", col = "#a1aba6")+
  text(1550,36, substitute(bold("Navy")), cex = .9, col = "black", family = 'playfair')+
  polygon(c(1500,1525, 1525, 1500), c(50, 50, 63, 63), border = "black", col = "#886a6d")+
  text(1555,54, substitute(bold("  Pensions")), cex = .9, col = "black", family = 'playfair')+
  polygon(c(1500,1525, 1525, 1500), c(70, 70, 83,83), border = "black", col = "#eac85c")+
  text(1549,75, substitute(bold("Civil")), cex = .9, col = "black", family = 'playfair')+
  polygon(c(1500,1525, 1525, 1500), c(90, 90, 103, 103), border = "black", col = "#d69083")+
  text(1554,95, substitute(bold("Indians")), cex = .9, col = "black", family = 'playfair')+
  polygon(c(1500,1525, 1525, 1500), c(110, 110, 123, 123), border = "black", col = "#fee6a9")+
  text(1569,135, substitute(bold("Miscellaneous")), cex = .9, col = "black", family = 'playfair')+
  polygon(c(1500,1525, 1525, 1500), c(130, 130, 143, 143), border = "black", col = "#787734")+
  text(1554,116, substitute(bold("Foreign")), cex = .9, col = "black", family = 'playfair')+
  polygon(c(1500,1525, 1525, 1500), c(150, 150, 163, 163), border = "black", col = "#292323")+
  text(1592,155, substitute(bold("Premium on Pub. Debt.")), cex = .9, col = "black", family = 'playfair')+
  polygon(c(1500,1525, 1525, 1500), c(170, 170, 183, 183), border = "black", col = "#777367")+
  text(1591,175, substitute(bold("Principal of Pub. Debt.")), cex = .9, col = "black", family = 'playfair')+
  polygon(c(1500,1525, 1525, 1500), c(190, 190, 203, 203), border = "black", col = "#aea596")+
  text(1589,195, substitute(bold("Interest on Pub. Debt.")), cex = .9, col = "black", family = 'playfair')


dev.off()
image_write(fig04, path = here::here('us-fiscal', "04_full_unmasked.png"), format = "png")





