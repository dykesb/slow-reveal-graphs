#
# FILE:
# 2015 Population Advisories.R
#
# DESCRIPTION:
# This code is for Long-term Drinking Water Advisories Graph from the Human Rights Watch. The png's include  
# different graphs for the slow reveal.  
# Source: https://www.hrw.org/report/2016/06/07/make-it-safe/canadas-obligation-end-first-nations-water-crisis
#
# SLOW REVEAL ORDER:
#   
# 6: RECREATED GRAPHIC
# 1: FULLY CONCEALED GRAPHIC
# 2: REVEAL XAXIS
# 3: REVEAL YAXIS
# 4a: REVEAL TITLE OPT1
# 4b: REVEAL TITLE OPT2
# 5: REVEAL TITLE
# 7: ORIGINAL GRAPHIC
#
# AUTHORS:
#   Robert Bilyk (main code)
# Ian Curtis (2023, code to save plots)


library(tidyverse)
library(magick)
library(ggpubr)
library(showtext)



font_add_google(name = "Barlow Condensed", family = "Circle")
showtext_auto()


data <- data.frame(Population = c(50,75,100,175,260,360,260,475,525,530,1650,1900,
                                  75, 85, 760, 850, 150, 350, 75, 125, 175, 450,
                                  700, 300, 10, 100, 110, 200, 300, 325, 25, 30, 40,
                                  300, 350, 150, 2500,480, 1480, 25, 50, 325),
                   Length = c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,2,3,4,5,6,6,6,7,7,7,7,9,10,
                              11,11,12,12,12,13,13,14,14,18,18,20),
                   Type = c(1,2,1,1,2,1,2,2,1,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                            1,1,1,1,1,1,1,1,1,1,1))
data$Type <- as_factor(data$Type)










