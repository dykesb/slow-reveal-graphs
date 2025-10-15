

#
# FILE:
# 1890_foreign_born_nativity.R
#
# DESCRIPTION:
# This code is for the 1890 Nativity of the Foreign Born Population Graph from Henry Gannett. The png shows the final graph.  
# Source: https://www.loc.gov/resource/g3701gm.gct00010/?sp=34&r=-0.576,-0.039,2.152,1.42,0
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC
#
# AUTHORS:
#  Robert Bilyk (main code)
# Ian Curtis (code to save files)

library(tidyverse)
library(showtext)
library(magick)

font_add_google(name = "Courier Prime", family = "Main")
showtext_auto()


data <- tibble(country=c("GERMANY","IRELAND","CANADA","ENGLAND","SWEDEN","NORWAY",
                             "SCOTLAND","RUSSIA","ITALY","POLAND","DENMARK","AUSTRIA",
                             "BOHEMIA","FRANCE","CHINA","SWITZERLAND","WALES"),
                   count=c(28,19,10,9,5,3,2.5,2,1.9,1.2,1.1,1,.9,.8,.7,.6,.5))


#### FIGURE 1: FULLY UNMASKED ####


picture <- image_graph(width =500, height=600)

ggplot(data, aes(x = count, y = fct_rev(fct_inorder(country))), fill = NA) +
  geom_col(color = "black", fill = "black", width = .3 ) +
  labs(tag = "(Hundreds of thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,30), breaks=seq(2,28,2)) +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "black"),
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
        plot.tag = element_text(family = "Main", color = "black", hjust = .5, vjust = 5, size = 7),
        plot.tag.position = "top",
        plot.margin = margin(20,10,10,10))
dev.off()


fig01 <- image_draw(picture)

segments(x0=86,y0=22, x1=86, y1=590, lwd = 1, lty = "solid")
segments(x0=470,y0=22, x1=470, y1=590, lwd = 1, lty = "solid")
segments(x0=5,y0=22, x1=470, y1=22, lwd = 1, lty = "solid")
segments(x0=5,y0=590, x1=470, y1=590, lwd = 1, lty = "solid")
segments(x0=5,y0=35, x1=470, y1=35, lwd = 1, lty = "solid")
segments(x0=5,y0=22, x1=5, y1=590, lwd = 1, lty = "solid")

text(48, 29, "COUNTRIES.", family = "Main", cex = .75, col = "#383227")
text(250, 6, "41. NATIVITY OF THE FOREIGN BORN POPULATION", family = "Main", cex = .75, col = "#383227")

dev.off()

image_write(fig01, path = here::here("1890-foreign-born-nativity", "01_full_unmasked.png"), format = "png")






