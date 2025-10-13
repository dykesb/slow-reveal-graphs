#
# FILE:
# type_region_migration.R
#
# DESCRIPTION:
# This code is for Migration Type Graph by State from the U.S. Census Bureau. The png's include  
# different graphs being created into the final png named "Migration by Type and Region.png".  
# Source: https://www.census.gov/content/dam/Census/library/publications/2007/dec/7_migration.pdf (page 4)
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC
#
# AUTHORS:
#   Robert Bilyk (main code)
#   Ian Curtis (2023, code to save plots)

library(tidyverse)
library(magick)
library(ggpubr)
library(showtext)



#Importing Fonts
font_add_google(name = "Roboto", regular.wt = 900, family = "Main")
font_add_google(name = "Roboto", regular.wt = 100, family = "Alt")

showtext_auto()


#Creating Data
data <- data.frame(region = c('Northeast', 'Midwest', 'South', 'West', 'Northeast', 'Midwest', 'South', 'West', 'Northeast', 'Midwest', 'South', 'West'),
                   type = c("Domestic Immigrants", "Domestic Immigrants","Domestic Immigrants","Domestic Immigrants",
                            "Domestic Outmigrants", "Domestic Outmigrants","Domestic Outmigrants","Domestic Outmigrants",
                            "International Immigrants","International Immigrants","International Immigrants","International Immigrants"),
                   count = c(1.8, 2.3, 5, 2.8, -2.8, -3, -3.2, -2.6, 1.8, 1, 2.5, 2.2))

data$region <- factor(data$region, levels = c("Northeast", "Midwest", "South", 'West'))


#### N: RECREATED GRAPHIC ####

#Creating Graphs
graph <- ggplot(data, aes(fill=type, y=count, x=region)) + 
  geom_bar(position=position_dodge(.55), stat="identity", width = .55) +
  scale_y_continuous(position = "left", limits = c(-3.2,5), breaks = seq(-3,5,1), sec.axis = dup_axis( trans=~. , name="Second Axis")) +
  scale_x_discrete(expand = c(0,0)) +
  theme(legend.position = "none") +
  theme(axis.title = element_blank(),
        axis.text.x = element_text(family="Main", color = "black", size = 11),
        axis.text.y = element_text(color = "black", size = 10),
        axis.ticks = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.background = element_rect(color = NA, fill = NA),
        panel.ontop = TRUE) +
  scale_fill_manual(values = c("#4c82c2","#8ca2d3","#86a05f"))

#Arranging into png and reimporting
gap <- ggplot() + theme_void()

png(here::here("type-region-migration", "unfinished.png"),width=700,height=450)
ggarrange(gap, graph, nrow = 2, heights = c(.5, 1))
dev.off()
original <- image_read(here::here("type-region-migration", "unfinished.png"))

#Drawing Final Details
fig01 <- image_draw(original)

segments(x0=22,y0=319, x1=676, y1=319, lwd = 2.25, lty = "solid", col = "#8f8f8f")

polygon(c(120, 155, 155, 120), c(80, 80, 110, 110), border = "#4c82c2", col = "#4c82c2")
text(90, 87, "Domestic", family = "Alt", cex = 1, col = "black")
text(85, 99, "immigrants", family = "Alt", cex = 1, col = "black")

polygon(c(190, 155, 155, 190), c(140, 140, 110, 110), border = "#8ca2d3", col = "#8ca2d3")
text(126, 120, "Domestic", family = "Alt", cex = 1, col = "black")
text(120, 131, "outmigrants", family = "Alt", cex = 1, col = "black")

polygon(c(190, 225, 225, 190), c(80, 80, 110, 110), border = "#86a05f", col = "#86a05f")
text(262, 87, "International", family = "Alt", cex = 1, col = "black")
text(260, 99, "immigrants", family = "Alt", cex = 1, col = "black")

text(50, 10, "Figure 7-2.", family = "Alt", cex = 1, col = "black")
text(314, 30, "Migrants (millions) by Type and Region, 1995 to 2000", family = "Main", cex =2, col = "black")

dev.off()

image_write(fig01, path = here::here("type-region-migration", "01_full_unmasked.png"), format = "png")



