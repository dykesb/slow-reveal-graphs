#
# FILE:
#  oil_production_goals.R
#
# DESCRIPTION:Crude oil production and projection rates. Part of a large inforgraphic
# Original Source: https://www.loc.gov/resource/g7611h.ct002114/?r=0.082,0.19,0.258,0.119,0

# SLOW REVEAL ORDER: No slow reveal, just completely recreated. 
#
# AUTHORS:
#   Lauryn Davis (last edit 3/27/23)
#   Ian Curtis (2023, code to save plots)


library(tidyverse)
library(ggtext)
library(ggrepel)
library(showtext)
library(grid)

font_add(family="Open", regular= 	"OpenSans-Bold.ttf")
showtext_auto()

type_levels= c("Unidiscovered fields", "Undeveloped discovered fields", "Improved production from existing fields", "Unimproved existing fields")

year_levels= c("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20")
colors= c('#85b838', '#d9361c', '#e2e02a', '#0c0202')
x_label<- c("2001", "02", "03", "04", "05", "06", "07", "08", "09", "2010", "11", "12", "13", "14", "15", "16", "17", "18", "19", "2020")


data<- read_csv(here::here("oil-production-goals", "oil_production_goals_data.csv"))


labels <- tibble(
  iraq_type = factor(type_levels, levels = type_levels))
labels <- data %>% 
  mutate(iraq_type = factor(iraq_type, levels = type_levels),
         iraq_year= factor(iraq_year, levels = year_levels),
         fill = factor(fill, levels = colors))


## FIGURE 1: FULLY UNMASKED



initial<- (ggplot(data, aes(x= iraq_year, 
                            y= amount,
                            fill=fill,
                            label= "")) +
             geom_col(color= "black", size= .2, width= .5) +
             geom_text(size = 4, position = position_stack(vjust = 0.5))+ 
             scale_x_discrete(labels= x_label, expand=expansion(mult=c(.05,.0)))+ 
             scale_y_continuous(breaks = c(0,1,2,3,4,5,6), limits= c(0,6), expand= expansion(mult=c(0,.18)))+ scale_fill_manual(labels= type_levels, values= c('#0c0202', '#e2e02a','#d9361c', "#6D8E2C"), name = "")+
             theme_classic()+
             theme(legend.position= "none",
                   axis.title = element_blank(),
                   axis.ticks= element_blank(),
                   axis.line.y= element_blank(),
                   panel.grid.major.x= element_blank(),
                   panel.grid.minor.x= element_blank(),
                   panel.grid.major.y= element_line(color="black", linewidth=.15),
                   panel.grid.minor.y= element_blank(),
                   plot.margin= unit(c(.5,4,.5,.5), "cm"),
                   plot.caption= element_markdown(hjust= 0),
                   axis.text.y= element_blank(),
                   axis.text.x = element_text(size = 20),
                   plot.background= element_rect(color="black"),
                   plot.title= element_textbox_simple(family= "Open",size = 8, lineheight = 1, 
                                                      width = grid::unit(7.53, "in"), # fixed width
                                                      hjust = .15, # alignment of box relative to plot
                                                      linetype = 0, # turn on border
                                                      box.color = "black", # border color
                                                      fill = "#6D7166", # background fill color
                                                      r = grid::unit(0, "pt"), # radius for rounded corners
                                                      padding = margin(5, 5, 7, 10), # padding around text inside the box
                                                      margin = margin(0, 0, 0, 0)))+
             labs(caption= "<p><span style = 'font-size:30pt; color:#000000'><sup>a</sup>Adapted from published oil ministry plans (assumes no sanctions constraints).</p></span>",
                  title= "<p><span style = 'font-size:30pt; color: #FFFFFF'><b>O</span><span style = 'font-size:25pt; color: #FFFFFF'>IL</span><span style = 'font-size:30pt; color: #FFFFFF'> M</span><span style = 'font-size:25pt; color: #FFFFFF'>INISTRY</span><span style = 'font-size:30pt; color: #FFFFFF'> P</span><span style = 'font-size:25pt; color: #FFFFFF'>RODUCTION</span><span style = 'font-size:30pt; color: #FFFFFF'> G</span><span style = 'font-size:25pt; color: #FFFFFF'>OALS<sup>a</sup></p></span>"))

fig01 <- initial + 
  annotate(geom="text", x=.15, y=.75, label="1",
           color="black", size = 10)+
  annotate(geom="text", x=.15, y=1.75, label="2",
           color="black", size = 10)+
  annotate(geom="text", x=.15, y=2.75, label="3",
           color="black", size = 10)+
  annotate(geom="text", x=.15, y=3.75, label="4",
           color="black", size = 10)+
  annotate(geom="text", x=.15, y=4.75, label="5",
           color="black", size = 10)+
  annotate(geom="text", x=.15, y=5.75, label="6",
           color="black", size = 10)+
  annotate(geom="text", x=.88, y=6.1, label="Million b/d",
           color="", size = 10)+
  geom_segment(aes(x = 20.27, 
                   y = 6, 
                   xend = 25.3, 
                   yend = 6
  ),
  col = "#bcc0c2", size=.08)+
  geom_segment(aes(x = 20, 
                   y = 0, 
                   xend = 25.3, 
                   yend = 0
  ),
  col = "black", size=.27)+
  coord_cartesian(ylim=c(0,6), xlim= c(0,20),clip="off")+
  annotation_custom(grob = grid::textGrob(label = "Million b/d", hjust=0, gp=gpar(col="black", cex=1.5, fontface="italic", fontsize = 20)),xmin = 0, xmax = .1, ymin = 6.1, ymax = 6.3)+
  annotation_custom(grob = grid::textGrob(label = "Undiscovered fields", hjust=0, gp=gpar(col="black", cex=2)),xmin = 21, xmax = 21, ymin = 5.8, ymax = 5.8)+
  annotation_custom(grob = grid::textGrob(label = "Undeveloped\ndiscovered fields\n(foreign participation)", hjust=0, gp=gpar(col="black", cex=2, lineheight= .8)),xmin = 21, xmax = 21, ymin = 4, ymax = 4)+ 
  annotation_custom(grob = grid::textGrob(label = "Improved production\nfrom existing fields\n(national effort)", hjust=0, gp=gpar(col="black", cex=2, lineheight= .8)),xmin = 21, xmax = 21, ymin = 2, ymax = 2)+
  annotation_custom(grob = grid::textGrob(label = "Unimproved\nexisting fields", hjust=0, gp=gpar(col="black", cex=2, lineheight= .8)),xmin = 21, xmax = 21, ymin = .7, ymax = .7)+
  annotation_custom(grob = linesGrob(), xmin = 20.27, xmax = 20.85, ymin = 5.8, ymax = 5.8)+
  annotation_custom(grob = linesGrob(), xmin = 20.27, xmax = 20.85, ymin = 4.35, ymax = 4.35)+
  annotation_custom(grob = linesGrob(), xmin = 20.27, xmax = 20.85, ymin = 2.35, ymax = 2.35)+
  annotation_custom(grob = linesGrob(), xmin = 20.27, xmax = 20.85, ymin = .5, ymax = .75)


ggsave(here::here("oil-production-goals", "01_full_unmasked.png"), fig01) #Markdown Margins: {r, fig.height= 1.5, fig.width= 3}