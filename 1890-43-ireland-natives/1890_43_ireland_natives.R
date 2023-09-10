

#
# FILE:
# 1890_ireland_natives.R
#
# DESCRIPTION:
# This code is for the 1890 Number of Native from Ireland Graph from Henry Gannett. The png shows the final graph.  
# Source: https://www.loc.gov/resource/g3701gm.gct00010/?sp=34&r=-0.576,-0.039,2.152,1.42,0
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC
#
# AUTHORS:
#  Robert Bilyk (main code)
# Ian Curtis (code to save plots)

library(tidyverse)
library(showtext)
library(magick)

font_add_google(name = "Courier Prime", family = "Main")
showtext_auto()


data <- data.frame(state=c("NEW YORK","MASSACHUSETTS","PENNSYLVANIA","ILLINOIS","NEW JERSEY","CONNECTICUT",
                           "OHIO","CALIFORNIA","MISSOURI","MICHIGAN","RHODE ISLAND","IOWA","WISCONSIN","MINNESOTA",
                           "INDIANA","MARYLAND","NEBRASKA","KANSAS","NEW HAMPSHIRE","KENTUCKY","COLORADO","MAINE"),
                   count=c(4.8,2.6,2.4,1.25,1,.75,.7,.65,.45,.44,.43,.42,.41,.38,.25,.24,.23,.22,.21,.2,.19,.18))
data$count <- data$count * 100000


#### FIGURE 1: RECREATED GRAPHIC ####

picture <- image_graph(width =600, height=500)

options(scipen = 999)
ggplot(data, aes(x = count, y = fct_rev(fct_inorder(state))), fill = NA) +
  geom_col(color = "black", fill = "black", width = .4 ) +
  labs(tag = "(Hundreds of thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,600000), breaks=seq(100000,500000,100000)) +
  theme(axis.text.x = element_text(family = "Main", size = 7, color= "black"),
        axis.title.x = element_blank(), 
        axis.ticks.x = element_blank(),
        panel.grid.major.x = element_line(color="black", linewidth=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_text(family = "Main", color = "#f1d9b5", hjust = .5, vjust = 5, size = 7),
        plot.tag.position = "top",
        plot.margin = margin(20,10,10,10))
dev.off()

fig01 <- image_draw(picture)

segments(x0=5,y0=22, x1=570, y1=22, lwd = 1, lty = "solid")
segments(x0=5,y0=35, x1=570, y1=35, lwd = 1, lty = "solid")
segments(x0=100,y0=22, x1=100, y1=490, lwd = 1, lty = "solid")
segments(x0=140,y0=35, x1=140, y1=490, lwd = 1, lty = "solid")
segments(x0=217,y0=35, x1=217, y1=490, lwd = 1, lty = "solid")
segments(x0=294,y0=35, x1=294, y1=490, lwd = 1, lty = "solid")
segments(x0=371,y0=35, x1=371, y1=490, lwd = 1, lty = "solid")
segments(x0=450,y0=35, x1=450, y1=490, lwd = 1, lty = "solid")
segments(x0=529,y0=35, x1=529, y1=490, lwd = 1, lty = "solid")
segments(x0=570,y0=22, x1=570, y1=490, lwd = 1, lty = "solid")
segments(x0=5,y0=22, x1=5, y1=490, lwd = 1, lty = "solid")
segments(x0=5,y0=490, x1=570, y1=490, lwd = 1, lty = "solid")

text(50, 29, "STATES", family = "Main", cex = .75, col = "#383227")
text(300, 10, "43. NUMBER OF NATIVES OF IRELAND, BY STATES: 1890", family = "Main", cex = .75, col = "#383227")

dev.off()

image_write(fig01, path = here::here("1890-ireland-natives", "01_full_unmasked.png"), format = "png")
