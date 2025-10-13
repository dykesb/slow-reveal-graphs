#
# FILE:
# 1890_germanic_natives.R
#
# DESCRIPTION:
# This code is for the 1890 Number of Natives from Germanic Nations Graph from Henry Gannett. The png shows the final graph.  
# Source: https://www.loc.gov/resource/g3701gm.gct00010/?sp=34&r=-0.576,-0.039,2.152,1.42,0
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC
#
# AUTHORS:
#  Robert Bilyk (main code)
# Ian Curtis (codee to save plots)

font_add_google(name = "Courier Prime", family = "Main")
showtext_auto()


data <- tibble(state=c("NEW YORK","ILLINOIS","WISCONSIN","PENNSYLVANIA","OHIO","NORWAY",
                           "MICHIGAN","IOWA","MISSOURI","MINNESOTA","NEW JERSEY","INDIANA",
                           "NEBRASKA","CALIFORNIA","TEXAS","KANSAS","MARYLAND","KENTUCKY",
                           "MASSACHUSETTS","CONNECTICUT","SOUTH DAKOTA","COLORADO","WASHINGTON",
                           "LOUISIANA","OREGON"),
                   count=c(5.5,3.75,2.8,2.6,2.55,1.75,1.45,1.4,1.35,1.3,.9,.75,.7,.55,.52,.49,.46,.4,.24,.22,.18,.1,.09,.08,.07)) %>% 
  mutate(count = count*100000)


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
text(300, 10, "42. NUMBER OF NATIVES OF GERMANIC NATIONS, BY STATES: 1890", family = "Main", cex = .75, col = "#383227")

dev.off()

image_write(fig01, path = here::here("1890-germanic-natives", "01_full_unmasked.png"), format = "png")
