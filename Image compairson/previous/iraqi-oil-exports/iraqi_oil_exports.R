# DESCRIPTION: The following visualizations are from an inforgraphic surrounding 
# Iraq's petroleum and gas infrastructure.

#Original Source: https://www.loc.gov/item/2007629280/

# SLOW REVEAL ORDER: No slow reveal, just completely recreated. 

# AUTHORS:
#   Lauryn Davis (Last edit: 3/27/23)
# Ian Curtis (2023, code to save plots)

library(tidyverse)
library(ggtext)
library(ggrepel)
library(showtext)
library(grid)
library(magick)


## FIGURE 1: FULLY UNMASKED

iraq_data <- read_csv(here::here("iraqi-oil-exports", "iraqi_oil_exports_data.csv"))

Label= "<span style = 'font-size:9pt; color:#000000'><i><b>Phase 9</span>"  
Label1= "<span style = 'font-size:9pt; color:#000000'><i><b>Phase 10</span>"
Label2 = "<span style = 'font-size:9pt; color:#000000'><i><b>Phase 11</span>"
Label3 = "<span style = 'font-size:9pt; color:#000000'><i><b>Phase 12</span>"
Label4 = "<span style = 'font-size:9pt; color:#000000'><i><b>Phase 13</span>"
Label5= paste0("Iraq halts expors\nfor 30 days during \"revised\" \nsanctions debate; start of\nPhase 10 delayed")
Label6= paste0("Iraq halts exports for\n30 days in \"show of\n support\" for Palestines")

stamp <- image_read(here::here("iraqi-oil-exports", "congress_mark.png"))
square<- image_read(here::here("iraqi-oil-exports", "legend.png"))
plot(as.raster(stamp))
plot(as.raster(square))

picture <- image_graph(width = 900, height = 500)
ggplot(iraq_data,  
       aes(x = year, y= value))+
  geom_rect(aes(xmin = 30, xmax = 51, ymin = 0, ymax = 3.5), 
            fill = "#E7E3FB", alpha=.02)+
  geom_rect(aes(xmin = 80, xmax = 104, ymin = 0, ymax = 3.5), 
            fill = "#E7E3FB", alpha=.02)+
  geom_bar(stat= 'identity', fill= '#37573E', width = .8)+ theme_classic()+ scale_x_discrete(expand= expansion(mult=c(.03,0))) +   scale_y_continuous(breaks = c(0,.5,1,1.5,2,2.5,3,3.5), limits= c(0,3.5), expand= expansion(mult=c(.15,.4)))+ 
  geom_line(aes(x= year, y= cumul_mean1, group =1), linewidth=1, color='white')+
  geom_line(aes(x= year, y= cumul_mean1, group =1), linewidth=.5, color='#c5494d')+labs(title= "<p><span style = 'font-size:16pt; color: #FFFFFF'>I</span><span style = 'font-size:11pt; color: #FFFFFF'>RAQI</span><span style = 'font-size:16pt; color: #FFFFFF'> O</span><span style = 'font-size:11pt; color: #FFFFFF'>IL</span><span style = 'font-size:16pt; color: #FFFFFF'> E</span><span style = 'font-size:11pt; color: #FFFFFF'>XPORTS</span><span style = 'font-size:16pt; color: #FFFFFF'> U</span><span style = 'font-size:11pt; color: #FFFFFF'>NDER</span><span style = 'font-size:16pt; color: #FFFFFF'> P</span><span style = 'font-size:11pt; color: #FFFFFF'>HASES</span></span><span style = 'font-size:16pt; color: #FFFFFF'> 9,10,11,12</span><span style = 'font-size:11pt; color: #FFFFFF'> AND</span><span style = 'font-size:16pt; color: #FFFFFF'> 13</span><br><span style = 'font-size:10.5pt; color: #FFFFFF'>December 2000 Through January 2003</span>")+
  #subtitle= "<span style = 'font-size:8pt; color: #000000'>Weekly Average</span><br><span style = 'font-size:8pt; color: #000000'>Cumulatice average within phase</span>")+
  theme(plot.title= element_textbox_simple(family= "Open",size = 8.2, lineheight = 1, 
                                           width = grid::unit(12.7, "in"), # fixed width
                                           hjust = .45, # alignment of box relative to plot
                                           linetype = 0, # turn on border
                                           box.color = "black", # border color
                                           fill = "#6D7166", # background fill color
                                           r = grid::unit(0, "pt"), # radius for rounded corners
                                           padding = margin(0, 5, 7, 10), # padding around text inside the box
                                           margin = margin(-0, 0, 0, 0)),
        #plot.subtitle=  element_textbox_simple(size= 5, lineheight = 2, 
        #width = grid::unit(2.3, "in"), # fixed width
        #hjust = 0,
        #linetype = 1, # turn on border
        #box.color = "black", # border color
        #fill = "white", # background fill color
        #r = grid::unit(0, "pt"), # radius for rounded corners
        #padding = margin(10, 5, 7, 10), # padding around text inside the box
        #margin = margin(.5, .5, 5, 0)),
        legend.position= "none",                                             
        axis.line.x=element_blank(),                                                                       
        axis.title = element_blank(),
        axis.ticks.x= element_blank(),
        axis.ticks.y= element_blank(),
        axis.line.y= element_blank(),
        panel.grid.major.x= element_blank(),
        panel.grid.minor.x= element_blank(),
        panel.grid.major.y= element_line(color="black", linewidth=.15),
        panel.grid.minor.y= element_blank(),
        axis.text.x= element_blank(),
        axis.text.y = element_blank(),
        plot.margin=unit(c(0,.5,.5,.5), "cm"),
        plot.background= element_rect(color="black"))

dev.off()
img <- image_draw(picture)

grid.raster(stamp, .9, .795, height = .2)+
  grid.raster(square, .2, .795, height = .05)

#labels for phases
text(130, 170, substitute(paste(italic("Phase 9"))), family = "Text", cex = .9, col = "black")+
  text(340, 170, substitute(paste(italic("Phase 10"))), family = "Text", cex = .9, col = "black")+
  text(550,170, substitute(paste(italic("Phase 11"))), family = "Text", cex = .9, col = "black")+
  text(735, 170, substitute(paste(italic("Phase 12"))), family = "Text", cex = .9, col = "black")+
  text(855,170, substitute(paste(italic("Phase 13"))), family = "Text", cex = .9, col = "black")+
  
  #labels above phases
  text(343, 130, substitute(paste(italic("UN begins retreoactove\npricing policy in late 2001;\nIraqi exports drop over\nPhases 11 and 12"))), family = "Text", cex = .75, col = "black", pos = 4)+
  text(50, 130, substitute(paste(italic("Iraqi surcharges continue; first\neported in late 2000"))), family = "Text", cex = .75, col = "black", pos =4)+
  text(220, 130, substitute(paste(italic("Iraq halts expors\nfor 30 days during \"revised\" \nsanctions debate; start of\nPhase 10 delayed"))), family = "Text", cex = .75, col = "black", pos =4)+
  text(553, 130, substitute(paste(italic("Iraq halts exports for\n30 days in \"show of\nsupport\" for Palestines"))), family = "Text", cex = .75, col = "black", pos =4)+
  #labels for y axis
  text(20, 447, "0", family = "Text", cex = .75, col = "black")+
  text(20, 407, ".5", family = "Text", cex = .75, col = "black")+
  text(22, 367, "1.0", family = "Text", cex = .75, col = "black")+
  text(22, 327, "1.5", family = "Text", cex = .75, col = "black")+
  text(22, 289, "2.0", family = "Text", cex = .75, col = "black")+
  text(22, 243, "2.5", family = "Text", cex = .75, col = "black")+
  text(22, 203, "3.0", family = "Text", cex = .75, col = "black")+
  text(22, 163, "3.5", family = "Text", cex = .75, col = "black")+
  text(10, 145, substitute(paste(italic("Million\nb/d"))), family = "Text", cex = .75, col = "black", pos=4)+
  
  #months x axis labels
  
  text(51, 447, "Dec", family = "Text", cex = .75, col = "black")+
  text(77.9, 447, "Jan", family = "Text", cex = .75, col = "black")+
  text(115, 447, "Feb", family = "Text", cex = .75, col = "black")+
  text(152.2, 447, "Mar", family = "Text", cex = .75, col = "black")+
  text(182.2, 447, "Apr", family = "Text", cex = .75, col = "black")+
  text(212.2, 447, "May", family = "Text", cex = .75, col = "black")+
  text(249.2, 447, "Jun", family = "Text", cex = .75, col = "black")+
  text(282.2, 447, "Jul", family = "Text", cex = .75, col = "black")+
  text(309.2, 447, "Aug", family = "Text", cex = .75, col = "black")+
  text(345.2, 447, "Sep", family = "Text", cex = .75, col = "black")+
  text(375.2, 447, "Oct", family = "Text", cex = .75, col = "black")+
  text(406.2, 447, "Nov", family = "Text", cex = .75, col = "black")+
  text(445.2, 447, "Dec", family = "Text", cex = .75, col = "black")+
  text(475.2, 447, "Jan", family = "Text", cex = .75, col = "black")+
  text(507.2, 447, "Feb", family = "Text", cex = .75, col = "black")+
  text(538.2, 447, "Mar", family = "Text", cex = .75, col = "black")+
  text(572.2, 447, "Apr", family = "Text", cex = .75, col = "black")+
  text(610.2, 447, "May", family = "Text", cex = .75, col = "black")+
  text(641.2, 447, "Jun", family = "Text", cex = .75, col = "black")+
  text(671.2, 447, "Jul", family = "Text", cex = .75, col = "black")+
  text(704.2, 447, "Aug", family = "Text", cex = .75, col = "black")+
  text(734.2, 447, "Sep", family = "Text", cex = .75, col = "black")+
  text(764.2, 447, "Oct", family = "Text", cex = .75, col = "black")+
  text(794.2, 447, "Nov", family = "Text", cex = .75, col = "black")+
  text(832.2, 447, "Dec", family = "Text", cex = .75, col = "black")+
  text(868.2, 447, "Jan", family = "Text", cex = .75, col = "black")+
  text(50, 465, substitute(paste(italic('2000'))), family = "Text", cex = .87, col = "black")+
  text(80, 465, substitute(paste(italic('2001'))), family = "Text", cex = .87, col = "black") +
  text(868,465, substitute(paste(italic('2003'))), family = 'Text', cex = .87, col = 'black')

segments(x0=39, x1=39, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=63, x1=63, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=97, x1=97, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=130, x1=130, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=165, x1=165, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=195, x1=195, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=225, x1=225, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=266, x1=266, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=295, x1=295, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=325, x1=325, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=362, x1=362, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=391, x1=391, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=423, x1=423, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=456, x1=456, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=492, x1=492, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=521, x1=521, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=561, x1=561, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=590, x1=590, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=624, x1=624, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=658, x1=658, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=685, x1=685, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=717, x1=717, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=747, x1=747, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=777, x1=777, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=814, x1=814, y0=440, y1=455, lwd = 1, lty = "solid")+
  segments(x0=853, x1=853, y0=440, y1=455, lwd = 1, lty = "solid")

dev.off()

image_write(img, path = here::here('iraqi-oil-exports', "01_full_unmasked.png"), format = "png")