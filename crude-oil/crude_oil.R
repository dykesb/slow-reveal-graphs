#
# FILE:
#  crude_oil.R
#
# DESCRIPTION:Crude oil production and projection rates. Part of a large inforgraphic
# Original Source: https://www.loc.gov/resource/g7611h.ct002114/?r=0.082,0.19,0.258,0.119,0

# SLOW REVEAL ORDER:No slow reveal, just completely recreated. 
#
# AUTHORS:
#   Lauryn Davis (2021, last edit 3/27/23)
#   Ian Curtis (2023, code to save plots)


library(tidyverse)
library(ggtext)
library(ggrepel)
library(showtext)
library(grid)

font_add(family="Open", regular= 	"OpenSans-Bold.ttf")
showtext_auto()
year_levels = c("60","60.5","61","61.5","62",'62.5','63','63.5','64','64.5','65','65.5','66','66.5','67','67.5','68','68.5','69','69.5','70','70.5','71','71.5','72','72.5','73','73.5','74','74.5','75','75.5','76','76.5','77','77.5','78','78.5','79','79.5','80','80.5','90','90.5','91','91.5','92','92.5','93')
x_label<- c("1980", "", "81", "", "82", "", "83", "","84", "", "85","", "86", "", "87", "", "88","", "89","", "90", "", "91", "", "92", "", "93", "", "94", "", "95", "", "96", "", "97","", "98","", "99", "", "2000", "", "01", "", "02", "", "03", "", "04")

## FIGURE 1: FULLY UNMASKED

data <- read_csv(here::here("crude-oil", "crude_oil_data.csv"))

line<- (ggplot(data) +geom_area(mapping = aes(x = year_levels, y = amount), fill = "#6D8E2C", color= "black", size= .2)+
          scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49), labels= x_label, limits= c(0,49.2), expand= expansion(mult=c(.01,.0)))+
          scale_y_continuous(breaks = c(0,.5,1,1.5,2,2.5,3,3.5,4), limits= c(0,4.5), expand= expansion(mult=c(0,0))))
theme<- line+theme_classic()+
  theme(legend.position= "none",
        axis.title = element_blank(),
        axis.ticks.x= element_line(linewidth=.5),
        axis.ticks.y= element_blank(),
        axis.line.y= element_blank(),
        panel.grid.major.x= element_blank(),
        panel.grid.minor.x= element_blank(),
        panel.grid.major.y= element_line(color="black", size=.15),
        panel.grid.minor.y= element_blank(),
        plot.caption= element_markdown(hjust= 0),
        axis.text.y= element_blank(),
        plot.margin=unit(c(.5,.5,.5,.5), "cm"),
        plot.background= element_rect(color="black"),
        plot.title= element_textbox_simple(family= "Open",size = 8, lineheight = 1, 
                                           width = grid::unit(7.08, "in"), # fixed width
                                           hjust = .45, # alignment of box relative to plot
                                           linetype = 0, # turn on border
                                           box.color = "black", # border color
                                           fill = "#6D7166", # background fill color
                                           r = grid::unit(0, "pt"), # radius for rounded corners
                                           padding = margin(5, 5, 7, 10), # padding around text inside the box
                                           margin = margin(0, 0, 0, 0)))+
  labs(caption= "<p><span style = 'font-size:25pt; color:#000000'><sup>a</sup> Assumes pricing dispute with UN is resolved allowing Oil-for-Food exports</p><p><span style = 'font-size:25pt; color:#000000'>to increase and that production from new oilfields gradually comes on line.</span>",
       title= "<p><span style = 'font-size:30pt; color: #FFFFFF'>C</span><span style = 'font-size:25pt; color: #FFFFFF'>RUDE</span><span style = 'font-size:30pt; color: #FFFFFF'> O</span><span style = 'font-size:25pt; color: #FFFFFF'>IL</span><span style = 'font-size:30pt; color: #FFFFFF'> P</span><span style = 'font-size:25pt; color: #FFFFFF'>RODUCTION</span><span style = 'font-size:30pt; color: #FFFFFF'> A</span><span style = 'font-size:25pt; color: #FFFFFF'>ND</span><span style = 'font-size:30pt; color: #FFFFFF'> P</span><span style = 'font-size:25pt; color: #FFFFFF'>ROJECTIONS</span>")
final<- theme +  annotate(geom="text", x=.1, y=.3, label=".5",
                          color="black", size= 2.8)+
  annotate(geom="text", x=.1, y=.8, label="1.0",
           color="black", size= 2.8)+
  annotate(geom="text", x=.1, y=1.3, label="1.5",
           color="black", size= 2.8)+
  annotate(geom="text", x=.1, y=1.8, label="2.0",
           color="black", size= 2.8)+
  annotate(geom="text", x=.1, y=2.3, label="2.5",
           color="black", size= 2.8)+
  annotate(geom="text", x=.1, y=2.8, label="3.0",
           color="black", size= 2.8)+
  annotate(geom="text", x=.1, y=3.3, label="3.5",
           color="black", size= 2.8)+
  annotate(geom="text", x=.1, y=3.8, label="4.0",
           color="black", size= 2.8)+
  annotation_custom(grob = grid::textGrob(label = "Million b/d", hjust=0, gp=gpar(col="black", cex=.72, fontface="italic")),xmin = 0, xmax = -1, ymin = 4.15, ymax = 4.15)+
  
  
  annotation_custom(grob = grid::textGrob(label = "Iran-Iraq war", hjust=0, gp=gpar(col="black", cex=.7)),xmin = 0, xmax = 4.5, ymin = 1.8, ymax = 1.8)+
  annotation_custom(grob = grid::textGrob(label = "Gulf war", hjust=0, gp=gpar(col="black", cex=.7)),xmin = 0, xmax = 48, ymin = 1.2, ymax = 1.2 )+
  geom_label(
    label= "Pre-Gulf war OPEC\nquota, 3.14 million\nbarrels per day",
    x= 17,
    y=3.5,
    label.padding = unit(0.1, "lines"), # Rectangle size around label
    label.size = NA,
    color = "black",
    fill="white",
    lineheight=1,
    size=3
  )+
  geom_label(
    label= "UN begins\nOil-for-Food\nProgram",
    x= 32,
    y=1.5,
    label.padding = unit(0.1, "lines"), # Rectangle size around label
    label.size = NA,
    color = "black",
    fill="white",
    lineheight=1,
    size=3
  )+
  geom_label(
    label= "UN begins\nretroactive\npricing policy",
    x= 40,
    y=3.1,
    label.padding = unit(0.1, "lines"), # Rectangle size around label
    label.size = NA,
    color = "black",
    fill="white",
    lineheight=1,
    size=3
  )+
  geom_richtext(aes(x= 37, y=3.7, label=Label, size=4.5), fill= NA, label.color=NA)+
  geom_segment(aes(x = 3.2, y = 1.7, xend = 3.2, yend = .9),size=.05,
               arrow = arrow(length = unit(0.1, "cm"), type="closed"))+
  geom_segment(aes(x = 25, y = 1.05, xend = 23.3, yend = .25),size=.02,
               arrow = arrow(length = unit(0.1, "cm"), type="closed"))+
  geom_segment(aes(x = 32, y = 1.05, xend = 33.5, yend = .65),size=.02,
               arrow = arrow(length = unit(0.1, "cm"), type="closed"))+
  geom_segment(aes(x = 42.5, y = 2.7, xend = 43.7, yend = 2.45),size=.02,
               arrow = arrow(length = unit(0.1, "cm"), type="closed"))+
  geom_segment(aes(x = 42.3, y = 3.7, xend = 44.5, yend = 3.7),size=.02,
               arrow = arrow(length = unit(0.1, "cm"), type="closed"))+
  geom_segment(aes(x= 20, y= 3.1, xend= 22, yend= 3.1), size=.02)+
  geom_segment(aes(x= 20, y= 3.15, xend= 20, yend= 3.05), size=.02)+
  geom_segment(aes(x= 22, y= 3.15, xend= 22, yend= 3.05), size=.02)+
  geom_rect(aes(xmin = 45, xmax = 49, ymin = 0, ymax = 4), 
            fill = "#E7E3FB", alpha=.048)
ggsave(here::here('crude-oil', '01_full_unmasked.png'), height = 5, width =7.5) #If these margins look strange, alter the margins. 

