#
# FILE:
# 1890_britain_natives.R
#
# DESCRIPTION:
# This code is for the 1890 Number of Natives from Great Britain Graph from Henry Gannett. The png shows the final graph.  
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


data <- tibble(state=c("PENNSYLVANNIA","NEW YORK","MASSACHUSETTS","ILLNOIS","OHIO","MICHIGAN",
                           "NEW JERSEY","CALIFORNIA","IOWA","WISCONSIN","CONNECTICUT","UTAH","KANSAS",
                           "RHODE ISLAND","MISSOURI","MINNESOTA","COLORADO","NEBRASKA","WASHINGTON", "INDIANA","TEXAS"),
                   count=c(1.95,1.85,1,.95,.75,.7,.65,.48,.4,.399,.3,.29,.28,.27,.26,.2,.19,.17,.15,.14,.1)) %>% 
  mutate(count = count*100000)


#### FIGURE 1: FULL UNMASKED

picture <- image_graph(width =300, height=400)

options(scipen = 999)
ggplot(data, aes(x = count, y = fct_rev(fct_inorder(state))), fill = NA) +
  geom_col(color = "black", fill = "black", width = .4 ) +
  labs(tag = "(Hundreds of thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,250000), breaks=seq(100000,250000,100000)) +
  theme(axis.text.x = element_text(family = "Main", size = 7, color= "black"),
        axis.title.x = element_blank(), 
        axis.ticks.x = element_blank(),
        panel.grid.major.x = element_line(color="black", linewidth =.25),
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

segments(x0=5,y0=22, x1=5, y1=390, lwd = 1, lty = "solid")
segments(x0=5,y0=22, x1=290, y1=22, lwd = 1, lty = "solid")
segments(x0=290,y0=22, x1=290, y1=390, lwd = 1, lty = "solid")
segments(x0=5,y0=390, x1=290, y1=390, lwd = 1, lty = "solid")
segments(x0=5,y0=35, x1=290, y1=35, lwd = 1, lty = "solid")
segments(x0=86,y0=22, x1=86, y1=390, lwd = 1, lty = "solid")
segments(x0=125,y0=35, x1=125, y1=390, lwd = 1, lty = "solid")
segments(x0=205,y0=35, x1=205, y1=390, lwd = 1, lty = "solid")

text(47, 29, "STATES.", family = "Main", cex = .75, col = "#383227")
text(150, 7, "44. NUMBER OF NATIVES OF GREAT BRITAIN, BY", family = "Main", cex = .75, col = "#383227")
text(150, 15, "STATES: 1890", family = "Main", cex = .75, col = "#383227")

dev.off()

image_write(fig01, path = here::here("1890-britain-natives", "01_full_unmasked.png"), format = "png")











