#
# FILE:
# 1917_victory_map.R
#
# DESCRIPTION:
# This code is for the Victory Map of 1917 from the National American Woman Suffrage Association Collection.  
# The png shows the final map which could be turned into a slow reveal in the future.  
# Source: https://www.loc.gov/resource/rbnawsa.n7111/?sp=26
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC
#
# AUTHORS:
#   Robert Bilyk (main code)
# Ian Curtis (2023, code to save plots)


library(tidyverse)
library(showtext)
library(readxl)
library(grid)
library(ggpattern)
library(maps)
library(mapdata)

font_add_google(name = "PT Serif", family = "Title")
font_add_google(name = "Averia Serif Libre", family = "Main")
showtext_auto()

map <- map_data("state")
types <- read_xlsx(here::here("1917-victory-map", "1917_victory_map_data.xlsx"))

x_cross <- system.file("img", "x_cross_pattern.jpg", package = "ggpattern")
x_dot <- system.file("img", "x_cross_dot.jpg", package = "ggpattern")

types$State <- tolower(types$State)

newmap <- map %>%
  inner_join(types, by = c("region" = "State")) %>%
  mutate(Type = coalesce(case_when(test == 1 ~ 'FULL\nSUFFRAGE',
                                   test == 2 ~ 'PRIMARY \nSUFFRAGE',
                                   test == 3 ~ 'SCHOOL \nBOND TAX',
                                   test == 4 ~ 'PRESIDENTIAL \nSUFFRAGE',
                                   test == 5 ~ 'PRESIDENTIAL \n& MUNICIPAL \nSUFFRAGE',
                                   test == 6 ~ 'MUNICIPAL \nSUFFRAGE IN \nCHARTER CITIES',
                                   test == 7 ~ 'NO \nSUFFRAGE',
                                   test == 8 ~ 'MUNICIPAL \nSUFFRAGE',
  )))

newmap$Type <- newmap$Type %>%
  factor(levels = c('FULL\nSUFFRAGE','PRIMARY \nSUFFRAGE','SCHOOL \nBOND TAX','PRESIDENTIAL \nSUFFRAGE','PRESIDENTIAL \n& MUNICIPAL \nSUFFRAGE',
                    'MUNICIPAL \nSUFFRAGE','MUNICIPAL \nSUFFRAGE IN \nCHARTER CITIES','NO \nSUFFRAGE'))


#NOTE: "x cross dot.jpg" and "x cross pattern.jpg" images in the "1917 Victory Map" folder need to be copied into the "img" folder 
#in the ggpattern directory the path is "R/x86_64-pc-linux-gnu-library/4.1/ggpattern/img"
# Or /Library/Frameworks/R.framework/Versions/X.x-arm64/Resources/library/ggpattern/img


#### FIGURE 1: RECREATED GRAPHIC ####

png(here::here("1917-victory-map", "01_full_unmasked.png"),width=900,height=600)

ggplot(data = newmap) + 
  geom_polygon_pattern(aes(x=long, y=lat, group=group, 
                           fill = Type,
                           pattern = Type,
                           pattern_fill = Type,
                           pattern_spacing = Type,
                           pattern_type = Type,
                           pattern_filename = Type,
                           pattern_scale = Type,
                           pattern_density = Type,
                           pattern_angle = Type),
                       color="grey",
                       linewidth = .8) +
  labs(title = "Victory Map of 1917") +
  theme(legend.position = "bottom",
        legend.title = element_blank(),
        legend.text = element_text(size = 6, family = "Main"),
        legend.key.width = unit(1.6, "cm"),
        legend.key.height = unit(.8, "cm"),
        legend.direction = "horizontal") +
  theme(axis.title = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        plot.title = element_text(size = 20, hjust = .5, family = "Title"),
        plot.margin = margin(30,10,10,10),
        plot.background = element_rect(fill = "white")) +
  scale_fill_manual(values = c("white","white","black","white","white","white","white", "black")) +
  scale_pattern_manual(values = c("none", "none", "circle", "circle", "image", "image", "stripe", "none")) +
  scale_pattern_fill_manual(values = c("white", "white", "white", "black", "white", "white", "black", "white")) +
  scale_pattern_spacing_manual(values = c(.05, .05, .02, .02, .05, .05, .006, .05)) +
  scale_pattern_type_manual(values = c(NA, NA, NA, NA, "tile", "tile", NA, NA)) +
  scale_pattern_filename_manual(values = c(NA, NA, NA, NA, x_dot, x_cross, NA, NA)) +
  scale_pattern_scale_manual(values = c(1, 1, 1, 1, .15, .15, 1, 1)) +
  scale_pattern_density_manual(values = c(.2, .2, .3, .2, .2, .2, .2, .2)) +
  scale_pattern_angle_manual(values = c(30, 30, 30, 30, 30, 30, 0, 30)) +
  guides(fill = guide_legend(nrow = 1))

grid.draw(textGrob("The Woman Citizen", x=.4,y=.98, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("November 24, 1917", x=.6,y=.98, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("WASH. \n1910", x=.13,y=.81, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("OREG. \n1912", x=.125,y=.7, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("CAL. \n1911", x=.125,y=.505, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("IDAHO \n1896", x=.22,y=.69, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("NEV. \n1914", x=.18,y=.57, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("UTAH. \n1896", x=.26,y=.565, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("MONT. \n1914", x=.295,y=.8, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("ARIZ. \n1912", x=.26,y=.42, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("WYO. \n1869", x=.325,y=.68, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("COL. \n1893", x=.355,y=.555, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("KAN. \n1912", x=.465,y=.545, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("ARK. \n1917", x=.555,y=.435, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .345, y= .425, width = .045, height = .025))
grid.draw(textGrob("N.MEX.", x=.345,y=.425, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .45, y= .35, width = .03, height = .025))
grid.draw(textGrob("TEX.", x=.45,y=.35, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .48, y= .45, width = .04, height = .025))
grid.draw(textGrob("OKLA.", x=.48,y=.45, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .44, y= .635, width = .031, height = .04, gp = gpar(col="white")))
grid.draw(textGrob("NEB. \n1917", x=.44,y=.635, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .44, y= .725, width = .045, height = .025))
grid.draw(textGrob("S.DAK.", x=.44,y=.725, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .435, y= .81, width = .046, height = .04, gp = gpar(col="white")))
grid.draw(textGrob("N.DAK. \n1917", x=.435,y=.81, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .525, y= .785, width = .04, height = .025))
grid.draw(textGrob("MINN", x=.525,y=.785, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .535, y= .65, width = .04, height = .025))
grid.draw(textGrob("IOWA.", x=.535,y=.65, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .55, y= .545, width = .03, height = .025))
grid.draw(textGrob("MO.", x=.55,y=.545, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .555, y= .32, width = .03, height = .025))
grid.draw(textGrob("LA.", x=.555,y=.32, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .605, y= .59, width = .03, height = .04, gp = gpar(col="white")))
grid.draw(textGrob("ILL. \n1913", x=.605,y=.59, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .59, y= .73, width = .03, height = .025))
grid.draw(textGrob("WIS.", x=.59,y=.73, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .675, y= .68, width = .04, height = .04, gp = gpar(col="white")))
grid.draw(textGrob("MICH. \n1917", x=.675,y=.68, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .65, y= .605, width = .03, height = .04))
grid.draw(textGrob("IND. \n1917", x=.65,y=.605, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .705, y= .6, width = .04, height = .04))
grid.draw(textGrob("OHIO. \n1917", x=.705,y=.6, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .675, y= .515, width = .03, height = .025))
grid.draw(textGrob("KY.", x=.675,y=.515, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .65, y= .46, width = .04, height = .025))
grid.draw(textGrob("TENN.", x=.65,y=.46, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .595, y= .37, width = .04, height = .025))
grid.draw(textGrob("MISS.", x=.595,y=.37, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .64, y= .375, width = .03, height = .025))
grid.draw(textGrob("ALA.", x=.64,y=.375, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .69, y= .375, width = .03, height = .025))
grid.draw(textGrob("GA.", x=.69,y=.375, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .71, y= .27, width = .03, height = .025))
grid.draw(textGrob("FLA.", x=.71,y=.27, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .735, y= .405, width = .03, height = .025))
grid.draw(textGrob("S.C.", x=.735,y=.405, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .755, y= .46, width = .03, height = .025))
grid.draw(textGrob("N.C.", x=.755,y=.46, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .765, y= .515, width = .03, height = .025))
grid.draw(textGrob("VA.", x=.765,y=.515, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .738, y= .55, width = .04, height = .025))
grid.draw(textGrob("W.VA.", x=.738,y=.55, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .8, y= .55, width = .03, height = .025))
grid.draw(textGrob("M.D.", x=.8,y=.55, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("DEL.", x=.835,y=.548, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .825, y= .59, width = .03, height = .025))
grid.draw(textGrob("N.J.", x=.825,y=.59, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .78, y= .61, width = .04, height = .025))
grid.draw(textGrob("PENN.", x=.78,y=.61, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("N.Y. \n1917", x=.82,y=.67, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("CONN.", x=.858,y=.61, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("R.I. \n1917", x=.89,y=.605, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("MASS.", x=.91,y=.655, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .875, y= .7, width = .03, height = .025))
grid.draw(textGrob("N.H.", x=.875,y=.7, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(rectGrob(x= .91, y= .75, width = .03, height = .025))
grid.draw(textGrob("ME.", x=.91,y=.75, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("VER. \n1917", x=.86,y=.76, gp=gpar(fontsize=8, fontfamily="Main")))

grid.draw(circleGrob(x=.715,y=.235, r=.0065))
grid.draw(circleGrob(x=.715,y=.235, r=.0005))

grid.draw(circleGrob(x=.705,y=.565, r=.0065))
grid.draw(circleGrob(x=.705,y=.565, r=.0005))

grid.draw(circleGrob(x=.762,y=.045, r=.0065))
grid.draw(circleGrob(x=.762,y=.045, r=.0005))

grid.draw(textGrob("?", x=.65,y=.565, gp=gpar(fontsize=20, fontfamily="Main", col = "white")))

grid.draw(segmentsGrob(x0 = 0.550, x1 = 0.558, y0 = 0.4, y1 = 0.4))
grid.draw(segmentsGrob(x0 = 0.554, x1 = 0.554, y0 = 0.394, y1 = 0.406))
grid.draw(segmentsGrob(x0 = 0.551, x1 = 0.557, y0 = 0.395, y1 = 0.405))
grid.draw(segmentsGrob(x0 = 0.551, x1 = 0.557, y0 = 0.405, y1 = 0.395))

grid.draw(segmentsGrob(x0 = 0.165, x1 = 0.173, y0 = 0.045, y1 = 0.045))
grid.draw(segmentsGrob(x0 = 0.169, x1 = 0.169, y0 = 0.039, y1 = 0.051))
grid.draw(segmentsGrob(x0 = 0.166, x1 = 0.172, y0 = 0.04, y1 = 0.05))
grid.draw(segmentsGrob(x0 = 0.166, x1 = 0.172, y0 = 0.05, y1 = 0.04))


dev.off()












