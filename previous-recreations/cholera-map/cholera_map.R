#
# FILE:
# cholera_map.R
#
# DESCRIPTION:
# This code is for the John Snow Cholera Map from UCLA.  
# The png shows the final map which could be turned into a slow reveal in the future.  
# Source: https://upload.wikimedia.org/wikipedia/commons/2/27/Snow-cholera-map-1.jpg
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
library(magick)
library(showtext)


font_add_google(name = "Roboto Mono", family = "Main")
showtext_auto()

gap <- ggplot() + theme_void()

picture <- image_graph(width = 1000, height = 1000)
gap 
dev.off()


#### FIGURE 1: RECREATED GRAPHIC ####

fig01 <- image_draw(picture)

segments(x0=23,y0=23, x1=23, y1=977, lwd = .75, lty = "solid")
segments(x0=23,y0=23, x1=977, y1=23, lwd = .75, lty = "solid")
segments(x0=977,y0=977, x1=977, y1=23, lwd = .75, lty = "solid")
segments(x0=23,y0=977, x1=977, y1=977, lwd = .75, lty = "solid")

segments(x0=20,y0=20, x1=20, y1=980, lwd = 3, lty = "solid")
segments(x0=20,y0=20, x1=980, y1=20, lwd = 3, lty = "solid")
segments(x0=980,y0=980, x1=980, y1=20, lwd = 3, lty = "solid")
segments(x0=20,y0=980, x1=980, y1=980, lwd = 3, lty = "solid")

segments(x0=17,y0=17, x1=17, y1=983, lwd = .75, lty = "solid")
segments(x0=17,y0=17, x1=983, y1=17, lwd = .75, lty = "solid")
segments(x0=983,y0=983, x1=983, y1=17, lwd = .75, lty = "solid")
segments(x0=17,y0=983, x1=983, y1=983, lwd = .75, lty = "solid")

text(960, 10, "MAP 1.", family = "serif", cex = 1, col = "#383227")

segments(x0=23,y0=75, x1=125, y1=50, lwd = 1, lty = "solid")
segments(x0=115,y0=23, x1=125, y1=50, lwd = 1, lty = "solid")
segments(x0=155,y0=23, x1=162, y1=42, lwd = 1, lty = "solid")
segments(x0=235,y0=23, x1=162, y1=42, lwd = 1, lty = "solid")

segments(x0=23,y0=100, x1=45, y1=95, lwd = 1, lty = "solid")
segments(x0=70,y0=145, x1=45, y1=95, lwd = 1, lty = "solid")
segments(x0=73,y0=88, x1=98, y1=138, lwd = 1, lty = "solid")

segments(x0=73,y0=88, x1=135, y1=72, lwd = 1, lty = "solid")

segments(x0=172,y0=63, x1=240, y1=44, lwd = 1, lty = "solid")

segments(x0=265,y0=38, x1=310, y1=23, lwd = 1, lty = "solid")

segments(x0=135,y0=72, x1=152, y1=122, lwd = 1, lty = "solid")
segments(x0=172,y0=63, x1=188, y1=110, lwd = 1, lty = "solid")

segments(x0=240,y0=44, x1=251, y1=90, lwd = 1, lty = "solid")
segments(x0=265,y0=38, x1=275, y1=83, lwd = 1, lty = "solid")

segments(x0=294,y0=30, x1=304, y1=75, lwd = 1, lty = "solid")
segments(x0=300,y0=28, x1=310, y1=73, lwd = 1, lty = "solid")

segments(x0=23,y0=155, x1=70, y1=145, lwd = 1, lty = "solid")
segments(x0=152,y0=122, x1=98, y1=138, lwd = 1, lty = "solid")
segments(x0=251,y0=90, x1=188, y1=110, lwd = 1, lty = "solid")
segments(x0=275,y0=83, x1=304, y1=75, lwd = 1, lty = "solid")
segments(x0=400,y0=50, x1=310, y1=73, lwd = 1, lty = "solid")

segments(x0=400,y0=50, x1=390, y1=23, lwd = 1, lty = "solid")
segments(x0=423,y0=57, x1=410, y1=23, lwd = 1, lty = "solid")

segments(x0=423,y0=57, x1=550, y1=23, lwd = 1, lty = "solid")

segments(x0=30,y0=162, x1=73, y1=152, lwd = 1, lty = "solid")
segments(x0=30,y0=162, x1=35, y1=178, lwd = 1, lty = "solid")
segments(x0=50,y0=174, x1=35, y1=178, lwd = 1, lty = "solid")
segments(x0=50,y0=174, x1=51, y1=178, lwd = 1, lty = "solid")
segments(x0=38,y0=182, x1=51, y1=178, lwd = 1, lty = "solid")
segments(x0=38,y0=182, x1=45, y1=210, lwd = 1, lty = "solid")
segments(x0=30,y0=178, x1=40, y1=211, lwd = 1, lty = "solid")
segments(x0=30,y0=178, x1=23, y1=180, lwd = 1, lty = "solid")

segments(x0=73,y0=152, x1=95, y1=200, lwd = 1, lty = "solid")
segments(x0=108,y0=155, x1=125, y1=190, lwd = 1, lty = "solid")
segments(x0=108,y0=155, x1=160, y1=140, lwd = 1, lty = "solid")
segments(x0=165,y0=160, x1=160, y1=140, lwd = 1, lty = "solid")
segments(x0=165,y0=160, x1=155, y1=180, lwd = 1, lty = "solid")
segments(x0=125,y0=190, x1=155, y1=180, lwd = 1, lty = "solid")

segments(x0=200,y0=150, x1=193, y1=130, lwd = 1, lty = "solid")
segments(x0=257,y0=111, x1=193, y1=130, lwd = 1, lty = "solid")
segments(x0=257,y0=111, x1=267, y1=150, lwd = 1, lty = "solid")
segments(x0=220,y0=162, x1=267, y1=150, lwd = 1, lty = "solid")
segments(x0=220,y0=162, x1=200, y1=150, lwd = 1, lty = "solid")

segments(x0=280,y0=105, x1=320, y1=93, lwd = 1, lty = "solid")
segments(x0=280,y0=105, x1=285, y1=125, lwd = 1, lty = "solid")
segments(x0=325,y0=113, x1=285, y1=125, lwd = 1, lty = "solid")
segments(x0=325,y0=113, x1=320, y1=93, lwd = 1, lty = "solid")

segments(x0=332,y0=123, x1=335, y1=140, lwd = 1, lty = "solid")
segments(x0=332,y0=123, x1=290, y1=137, lwd = 1, lty = "solid")
segments(x0=295,y0=153, x1=335, y1=140, lwd = 1, lty = "solid")
segments(x0=295,y0=153, x1=290, y1=137, lwd = 1, lty = "solid")

segments(x0=337,y0=122, x1=340, y1=139, lwd = 1, lty = "solid")
segments(x0=337,y0=122, x1=425, y1=105, lwd = 1, lty = "solid")
segments(x0=430,y0=120, x1=340, y1=139, lwd = 1, lty = "solid")
segments(x0=430,y0=120, x1=425, y1=105, lwd = 1, lty = "solid")

segments(x0=340,y0=110, x1=420, y1=95, lwd = 1, lty = "solid")
segments(x0=410,y0=65, x1=420, y1=95, lwd = 1, lty = "solid")
segments(x0=330,y0=80, x1=410, y1=65, lwd = 1, lty = "solid")
segments(x0=340,y0=110, x1=330, y1=80, lwd = 1, lty = "solid")

segments(x0=440,y0=120, x1=430, y1=75, lwd = 1, lty = "solid")
segments(x0=490,y0=55, x1=430, y1=75, lwd = 1, lty = "solid")
segments(x0=440,y0=120, x1=450, y1=117, lwd = 1, lty = "solid")
segments(x0=450,y0=105, x1=450, y1=117, lwd = 1, lty = "solid")
segments(x0=450,y0=105, x1=457, y1=103, lwd = 1, lty = "solid")
segments(x0=457,y0=116, x1=457, y1=103, lwd = 1, lty = "solid")
segments(x0=457,y0=116, x1=510, y1=105, lwd = 1, lty = "solid")
segments(x0=490,y0=55, x1=510, y1=105, lwd = 1, lty = "solid")

segments(x0=505,y0=50, x1=525, y1=100, lwd = 1, lty = "solid")
segments(x0=600,y0=85, x1=525, y1=100, lwd = 1, lty = "solid")
segments(x0=600,y0=85, x1=580, y1=23, lwd = 1, lty = "solid")
segments(x0=555,y0=30, x1=580, y1=23, lwd = 1, lty = "solid")
segments(x0=555,y0=30, x1=570, y1=80, lwd = 1, lty = "solid")
segments(x0=565,y0=80, x1=570, y1=80, lwd = 1, lty = "solid")
segments(x0=565,y0=80, x1=550, y1=32, lwd = 1, lty = "solid")
segments(x0=505,y0=50, x1=550, y1=32, lwd = 1, lty = "solid")

segments(x0=600,y0=23, x1=620, y1=80, lwd = 1, lty = "solid")
segments(x0=650,y0=77, x1=620, y1=80, lwd = 1, lty = "solid")
segments(x0=650,y0=77, x1=630, y1=23, lwd = 1, lty = "solid")

segments(x0=623,y0=35, x1=620, y1=23, lwd = 1, lty = "solid")
segments(x0=618,y0=35, x1=615, y1=23, lwd = 1, lty = "solid")
segments(x0=618,y0=35, x1=623, y1=35, lwd = 1, lty = "solid")

segments(x0=665,y0=75, x1=645, y1=23, lwd = 1, lty = "solid")
segments(x0=705,y0=70, x1=685, y1=23, lwd = 1, lty = "solid")
segments(x0=705,y0=70, x1=665, y1=75, lwd = 1, lty = "solid")

segments(x0=664,y0=40, x1=660, y1=23, lwd = 1, lty = "solid")
segments(x0=670,y0=40, x1=666, y1=23, lwd = 1, lty = "solid")
segments(x0=670,y0=40, x1=664, y1=40, lwd = 1, lty = "solid")

segments(x0=715,y0=68, x1=695, y1=23, lwd = 1, lty = "solid")
segments(x0=715,y0=68, x1=750, y1=63, lwd = 1, lty = "solid")
segments(x0=745,y0=40, x1=750, y1=63, lwd = 1, lty = "solid")
segments(x0=745,y0=40, x1=730, y1=45, lwd = 1, lty = "solid")
segments(x0=725,y0=30, x1=730, y1=45, lwd = 1, lty = "solid")
segments(x0=725,y0=30, x1=710, y1=30, lwd = 1, lty = "solid")
segments(x0=715,y0=54, x1=710, y1=30, lwd = 1, lty = "solid")
segments(x0=715,y0=54, x1=740, y1=48, lwd = 1, lty = "solid")
segments(x0=743,y0=64, x1=740, y1=48, lwd = 1, lty = "solid")

segments(x0=785,y0=57, x1=750, y1=63, lwd = 1, lty = "solid")
segments(x0=785,y0=57, x1=775, y1=23, lwd = 1, lty = "solid")

segments(x0=795,y0=55, x1=785, y1=23, lwd = 1, lty = "solid")
segments(x0=795,y0=55, x1=810, y1=53, lwd = 1, lty = "solid")
segments(x0=830,y0=23, x1=810, y1=53, lwd = 1, lty = "solid")
segments(x0=835,y0=23, x1=815, y1=53, lwd = 1, lty = "solid")
segments(x0=815,y0=53, x1=977, y1=35, lwd = 1, lty = "solid")

segments(x0=23,y0=215, x1=40, y1=211, lwd = 1, lty = "solid")
segments(x0=95,y0=200, x1=45, y1=210, lwd = 1, lty = "solid")

segments(x0=23,y0=240, x1=160, y1=210, lwd = 1, lty = "solid")
segments(x0=185,y0=225, x1=160, y1=210, lwd = 1, lty = "solid")
segments(x0=185,y0=225, x1=195, y1=275, lwd = 1, lty = "solid")
segments(x0=195,y0=275, x1=170, y1=280, lwd = 1, lty = "solid")
segments(x0=170,y0=280, x1=160, y1=230, lwd = 1, lty = "solid")
segments(x0=155,y0=230, x1=160, y1=230, lwd = 1, lty = "solid")
segments(x0=165,y0=280, x1=155, y1=230, lwd = 1, lty = "solid")
segments(x0=165,y0=280, x1=60, y1=305, lwd = 1, lty = "solid")
segments(x0=55,y0=295, x1=60, y1=305, lwd = 1, lty = "solid")
segments(x0=55,y0=295, x1=23, y1=300, lwd = 1, lty = "solid")

segments(x0=65,y0=275, x1=80, y1=273, lwd = 1, lty = "solid")
segments(x0=65,y0=265, x1=65, y1=273, lwd = 1, lty = "solid")
segments(x0=65,y0=265, x1=80, y1=263, lwd = 1, lty = "solid")
segments(x0=80,y0=265, x1=80, y1=273, lwd = 1, lty = "solid")

segments(x0=100,y0=250, x1=120, y1=250, lwd = 1, lty = "solid")
segments(x0=120,y0=250, x1=120, y1=270, lwd = 1, lty = "solid")
segments(x0=100,y0=270, x1=120, y1=270, lwd = 1, lty = "solid")
segments(x0=100,y0=250, x1=100, y1=270, lwd = 1, lty = "solid")

segments(x0=215,y0=220, x1=235, y1=190, lwd = 1, lty = "solid")
segments(x0=215,y0=220, x1=230, y1=305, lwd = 1, lty = "solid")
segments(x0=285,y0=285, x1=230, y1=305, lwd = 1, lty = "solid")
segments(x0=285,y0=285, x1=250, y1=185, lwd = 1, lty = "solid")
segments(x0=235,y0=190, x1=250, y1=185, lwd = 1, lty = "solid")

segments(x0=70, y0=335, x1=95, y1=410, lwd = 1, lty = "solid")
segments(x0=70, y0=335, x1=205, y1=300, lwd = 1, lty = "solid")
segments(x0=205, y0=300, x1=230, y1=375, lwd = 1, lty = "solid")
segments(x0=95, y0=410, x1=230, y1=375, lwd = 1, lty = "solid")

segments(x0=105, y0=430, x1=130, y1=425, lwd = 1, lty = "solid")
segments(x0=145, y0=465, x1=130, y1=425, lwd = 1, lty = "solid")
segments(x0=145, y0=465, x1=170, y1=485, lwd = 1, lty = "solid")
segments(x0=110, y0=550, x1=170, y1=485, lwd = 1, lty = "solid")
segments(x0=110, y0=550, x1=100, y1=500, lwd = 1, lty = "solid")
segments(x0=95, y0=500, x1=100, y1=500, lwd = 1, lty = "solid")
segments(x0=105, y0=550, x1=95, y1=500, lwd = 1, lty = "solid")
segments(x0=105, y0=550, x1=80, y1=555, lwd = 1, lty = "solid")
segments(x0=60, y0=460, x1=80, y1=555, lwd = 1, lty = "solid")
segments(x0=60, y0=460, x1=110, y1=445, lwd = 1, lty = "solid")
segments(x0=105, y0=430, x1=110, y1=445, lwd = 1, lty = "solid")

segments(x0=145, y0=425, x1=240, y1=400, lwd = 1, lty = "solid")
segments(x0=245, y0=410, x1=190, y1=470, lwd = 1, lty = "solid")
segments(x0=245, y0=410, x1=240, y1=400, lwd = 1, lty = "solid")
segments(x0=145, y0=425, x1=160, y1=460, lwd = 1, lty = "solid")
segments(x0=190, y0=470, x1=160, y1=460, lwd = 1, lty = "solid")

segments(x0=120, y0=580, x1=255, y1=430, lwd = 1, lty = "solid")
segments(x0=255, y0=430, x1=290, y1=480, lwd = 1, lty = "solid")
segments(x0=160, y0=630, x1=290, y1=480, lwd = 1, lty = "solid")
segments(x0=160, y0=630, x1=120, y1=580, lwd = 1, lty = "solid")

segments(x0=110, y0=570, x1=110, y1=590, lwd = 1, lty = "solid")
segments(x0=150, y0=640, x1=110, y1=590, lwd = 1, lty = "solid")
segments(x0=110, y0=570, x1=85, y1=575, lwd = 1, lty = "solid")
segments(x0=110, y0=685, x1=85, y1=575, lwd = 1, lty = "solid")
segments(x0=110, y0=685, x1=150, y1=640, lwd = 1, lty = "solid")

segments(x0=23, y0=595, x1=65, y1=585, lwd = 1, lty = "solid")
segments(x0=90, y0=695, x1=65, y1=585, lwd = 1, lty = "solid")
segments(x0=90, y0=695, x1=50, y1=740, lwd = 1, lty = "solid")
segments(x0=23, y0=690, x1=50, y1=740, lwd = 1, lty = "solid")

segments(x0=23, y0=720, x1=40, y1=750, lwd = 1, lty = "solid")
segments(x0=23, y0=765, x1=40, y1=750, lwd = 1, lty = "solid")

segments(x0=23, y0=580, x1=65, y1=570, lwd = 1, lty = "solid")
segments(x0=23, y0=460, x1=65, y1=570, lwd = 1, lty = "solid")

segments(x0=23, y0=430, x1=30, y1=430, lwd = 1, lty = "solid")
segments(x0=40, y0=425, x1=30, y1=430, lwd = 1, lty = "solid")
segments(x0=40, y0=425, x1=50, y1=415, lwd = 1, lty = "solid")
segments(x0=50, y0=365, x1=50, y1=415, lwd = 1, lty = "solid")
segments(x0=40, y0=355, x1=50, y1=365, lwd = 1, lty = "solid")
segments(x0=40, y0=355, x1=30, y1=350, lwd = 1, lty = "solid")
segments(x0=23, y0=350, x1=30, y1=350, lwd = 1, lty = "solid")

segments(x0=23, y0=785, x1=50, y1=765, lwd = 1, lty = "solid")
segments(x0=110, y0=850, x1=50, y1=765, lwd = 1, lty = "solid")
segments(x0=110, y0=850, x1=23, y1=910, lwd = 1, lty = "solid")

segments(x0=23, y0=815, x1=35, y1=805, lwd = 1, lty = "solid")
segments(x0=23, y0=890, x1=60, y1=860, lwd = 1, lty = "solid")
segments(x0=35, y0=805, x1=60, y1=860, lwd = 1, lty = "solid")

segments(x0=23, y0=930, x1=60, y1=977, lwd = 1, lty = "solid")

segments(x0=40, y0=925, x1=85, y1=977, lwd = 1, lty = "solid")
segments(x0=75, y0=900, x1=135, y1=977, lwd = 1, lty = "solid")
segments(x0=75, y0=900, x1=40, y1=925, lwd = 1, lty = "solid")

segments(x0=85, y0=895, x1=150, y1=977, lwd = 1, lty = "solid")
segments(x0=120, y0=875, x1=200, y1=977, lwd = 1, lty = "solid")
segments(x0=120, y0=875, x1=85, y1=895, lwd = 1, lty = "solid")

segments(x0=305, y0=500, x1=175, y1=650, lwd = 1, lty = "solid")
segments(x0=195, y0=670, x1=175, y1=650, lwd = 1, lty = "solid")
segments(x0=190, y0=680, x1=170, y1=660, lwd = 1, lty = "solid")
segments(x0=65, y0=760, x1=170, y1=660, lwd = 1, lty = "solid")
segments(x0=65, y0=760, x1=110, y1=825, lwd = 1, lty = "solid")
segments(x0=195, y0=780, x1=110, y1=825, lwd = 1, lty = "solid")
segments(x0=195, y0=670, x1=190, y1=680, lwd = 1, lty = "solid")
segments(x0=305, y0=500, x1=375, y1=600, lwd = 1, lty = "solid")
segments(x0=225, y0=700, x1=375, y1=600, lwd = 1, lty = "solid")
segments(x0=225, y0=700, x1=195, y1=670, lwd = 1, lty = "solid")
segments(x0=212, y0=690, x1=125, y1=760, lwd = 1, lty = "solid")
segments(x0=125, y0=760, x1=135, y1=775, lwd = 1, lty = "solid")
segments(x0=135, y0=775, x1=155, y1=765, lwd = 1, lty = "solid")
segments(x0=155, y0=765, x1=145, y1=755, lwd = 1, lty = "solid")
segments(x0=145, y0=755, x1=165, y1=740, lwd = 1, lty = "solid")
segments(x0=195, y0=780, x1=165, y1=740, lwd = 1, lty = "solid")

segments(x0=250, y0=650, x1=325, y1=610, lwd = 1, lty = "solid")
segments(x0=310, y0=575, x1=325, y1=610, lwd = 1, lty = "solid")
segments(x0=310, y0=575, x1=305, y1=580, lwd = 1, lty = "solid")
segments(x0=305, y0=580, x1=315, y1=600, lwd = 1, lty = "solid")
segments(x0=275, y0=605, x1=315, y1=600, lwd = 1, lty = "solid")
segments(x0=275, y0=605, x1=240, y1=635, lwd = 1, lty = "solid")
segments(x0=250, y0=650, x1=240, y1=635, lwd = 1, lty = "solid")

segments(x0=210, y0=710, x1=180, y1=730, lwd = 1, lty = "solid")
segments(x0=210, y0=770, x1=180, y1=730, lwd = 1, lty = "solid")
segments(x0=240, y0=750, x1=210, y1=710, lwd = 1, lty = "solid")
segments(x0=240, y0=750, x1=210, y1=770, lwd = 1, lty = "solid")

segments(x0=200, y0=950, x1=120, y1=835, lwd = 1, lty = "solid")
segments(x0=200, y0=950, x1=250, y1=925, lwd = 1, lty = "solid")
segments(x0=230, y0=890, x1=170, y1=810, lwd = 1, lty = "solid")
segments(x0=230, y0=890, x1=210, y1=900, lwd = 1, lty = "solid")
segments(x0=170, y0=840, x1=210, y1=900, lwd = 1, lty = "solid")
segments(x0=170, y0=840, x1=165, y1=845, lwd = 1, lty = "solid")
segments(x0=205, y0=915, x1=165, y1=845, lwd = 1, lty = "solid")
segments(x0=205, y0=915, x1=240, y1=900, lwd = 1, lty = "solid")
segments(x0=205, y0=915, x1=235, y1=900, lwd = 1, lty = "solid")
segments(x0=235, y0=900, x1=250, y1=925, lwd = 1, lty = "solid")
segments(x0=120, y0=835, x1=170, y1=810, lwd = 1, lty = "solid")

segments(x0=270, y0=920, x1=190, y1=805, lwd = 1, lty = "solid")
segments(x0=270, y0=920, x1=310, y1=900, lwd = 1, lty = "solid")
segments(x0=310, y0=900, x1=230, y1=785, lwd = 1, lty = "solid")
segments(x0=230, y0=785, x1=190, y1=805, lwd = 1, lty = "solid")

segments(x0=325, y0=895, x1=245, y1=780, lwd = 1, lty = "solid")
segments(x0=285, y0=760, x1=245, y1=780, lwd = 1, lty = "solid")
segments(x0=365, y0=875, x1=285, y1=760, lwd = 1, lty = "solid")
segments(x0=325, y0=895, x1=365, y1=875, lwd = 1, lty = "solid")

segments(x0=390, y0=885, x1=260, y1=700, lwd = 1, lty = "solid")
segments(x0=390, y0=615, x1=260, y1=700, lwd = 1, lty = "solid")
segments(x0=390, y0=615, x1=450, y1=700, lwd = 1, lty = "solid")
segments(x0=370, y0=750, x1=450, y1=700, lwd = 1, lty = "solid")
segments(x0=370, y0=750, x1=410, y1=825, lwd = 1, lty = "solid")
segments(x0=500, y0=780, x1=410, y1=825, lwd = 1, lty = "solid")
segments(x0=500, y0=780, x1=550, y1=850, lwd = 1, lty = "solid")
segments(x0=390, y0=885, x1=550, y1=850, lwd = 1, lty = "solid")

segments(x0=485, y0=770, x1=425, y1=805, lwd = 1, lty = "solid")
segments(x0=400, y0=750, x1=425, y1=805, lwd = 1, lty = "solid")
segments(x0=450, y0=715, x1=400, y1=750, lwd = 1, lty = "solid")
segments(x0=485, y0=770, x1=450, y1=715, lwd = 1, lty = "solid")

segments(x0=500, y0=810, x1=510, y1=825, lwd = 1, lty = "solid")
segments(x0=500, y0=810, x1=490, y1=820, lwd = 1, lty = "solid")
segments(x0=490, y0=820, x1=500, y1=835, lwd = 1, lty = "solid")
segments(x0=500, y0=835, x1=510, y1=825, lwd = 1, lty = "solid")

segments(x0=420, y0=690, x1=400, y1=660, lwd = 1, lty = "solid")
segments(x0=395, y0=665, x1=400, y1=660, lwd = 1, lty = "solid")
segments(x0=395, y0=665, x1=400, y1=675, lwd = 1, lty = "solid")
segments(x0=370, y0=690, x1=400, y1=675, lwd = 1, lty = "solid")
segments(x0=370, y0=690, x1=400, y1=710, lwd = 1, lty = "solid")
segments(x0=420, y0=690, x1=400, y1=710, lwd = 1, lty = "solid")

segments(x0=205, y0=960, x1=215, y1=977, lwd = 1, lty = "solid")
segments(x0=205, y0=960, x1=255, y1=940, lwd = 1, lty = "solid")
segments(x0=255, y0=940, x1=280, y1=977, lwd = 1, lty = "solid")

segments(x0=280, y0=935, x1=305, y1=977, lwd = 1, lty = "solid")
segments(x0=280, y0=935, x1=370, y1=895, lwd = 1, lty = "solid")
segments(x0=370, y0=895, x1=425, y1=977, lwd = 1, lty = "solid")

segments(x0=395, y0=895, x1=450, y1=977, lwd = 1, lty = "solid")
segments(x0=395, y0=895, x1=450, y1=885, lwd = 1, lty = "solid")
segments(x0=450, y0=885, x1=500, y1=977, lwd = 1, lty = "solid")

segments(x0=465, y0=880, x1=515, y1=977, lwd = 1, lty = "solid")
segments(x0=465, y0=880, x1=555, y1=860, lwd = 1, lty = "solid")
segments(x0=600, y0=900, x1=555, y1=860, lwd = 1, lty = "solid")
segments(x0=600, y0=900, x1=580, y1=915, lwd = 1, lty = "solid")
segments(x0=620, y0=977, x1=580, y1=915, lwd = 1, lty = "solid")
segments(x0=630, y0=977, x1=595, y1=920, lwd = 1, lty = "solid")
segments(x0=605, y0=905, x1=595, y1=920, lwd = 1, lty = "solid")
segments(x0=605, y0=905, x1=660, y1=920, lwd = 1, lty = "solid")
segments(x0=670, y0=960, x1=660, y1=920, lwd = 1, lty = "solid")
segments(x0=670, y0=960, x1=628, y1=970, lwd = 1, lty = "solid")
segments(x0=630, y0=977, x1=680, y1=965, lwd = 1, lty = "solid")
segments(x0=670, y0=920, x1=680, y1=965, lwd = 1, lty = "solid")
segments(x0=670, y0=920, x1=720, y1=920, lwd = 1, lty = "solid")
segments(x0=720, y0=920, x1=740, y1=970, lwd = 1, lty = "solid")
segments(x0=725, y0=977, x1=740, y1=970, lwd = 1, lty = "solid")

segments(x0=730, y0=920, x1=750, y1=965, lwd = 1, lty = "solid")
segments(x0=730, y0=920, x1=780, y1=900, lwd = 1, lty = "solid")
segments(x0=790, y0=920, x1=780, y1=900, lwd = 1, lty = "solid")
segments(x0=790, y0=920, x1=780, y1=945, lwd = 1, lty = "solid")
segments(x0=780, y0=945, x1=750, y1=965, lwd = 1, lty = "solid")

segments(x0=750, y0=977, x1=785, y1=955, lwd = 1, lty = "solid")
segments(x0=800, y0=965, x1=785, y1=955, lwd = 1, lty = "solid")
segments(x0=800, y0=965, x1=805, y1=977, lwd = 1, lty = "solid")

segments(x0=790, y0=895, x1=800, y1=915, lwd = 1, lty = "solid")
segments(x0=825, y0=925, x1=800, y1=915, lwd = 1, lty = "solid")
segments(x0=825, y0=925, x1=860, y1=915, lwd = 1, lty = "solid")
segments(x0=790, y0=895, x1=860, y1=915, lwd = 1, lty = "solid")

segments(x0=820, y0=977, x1=815, y1=965, lwd = 1, lty = "solid")
segments(x0=830, y0=945, x1=815, y1=965, lwd = 1, lty = "solid")
segments(x0=830, y0=945, x1=840, y1=940, lwd = 1, lty = "solid")
segments(x0=850, y0=965, x1=840, y1=940, lwd = 1, lty = "solid")
segments(x0=850, y0=965, x1=820, y1=977, lwd = 1, lty = "solid")

segments(x0=855, y0=965, x1=845, y1=940, lwd = 1, lty = "solid")
segments(x0=855, y0=965, x1=890, y1=955, lwd = 1, lty = "solid")
segments(x0=870, y0=930, x1=890, y1=955, lwd = 1, lty = "solid")
segments(x0=870, y0=930, x1=845, y1=940, lwd = 1, lty = "solid")

segments(x0=850, y0=977, x1=895, y1=965, lwd = 1, lty = "solid")
segments(x0=905, y0=977, x1=895, y1=965, lwd = 1, lty = "solid")

segments(x0=915, y0=977, x1=890, y1=945, lwd = 1, lty = "solid")
segments(x0=910, y0=935, x1=890, y1=945, lwd = 1, lty = "solid")
segments(x0=910, y0=935, x1=900, y1=905, lwd = 1, lty = "solid")
segments(x0=910, y0=900, x1=900, y1=905, lwd = 1, lty = "solid")
segments(x0=910, y0=900, x1=940, y1=970, lwd = 1, lty = "solid")
segments(x0=915, y0=977, x1=940, y1=970, lwd = 1, lty = "solid")

segments(x0=900, y0=930, x1=890, y1=910, lwd = 1, lty = "solid")
segments(x0=875, y0=920, x1=890, y1=910, lwd = 1, lty = "solid")
segments(x0=885, y0=940, x1=875, y1=920, lwd = 1, lty = "solid")
segments(x0=885, y0=940, x1=900, y1=930, lwd = 1, lty = "solid")

segments(x0=950, y0=965, x1=965, y1=960, lwd = 1, lty = "solid")
segments(x0=950, y0=965, x1=940, y1=940, lwd = 1, lty = "solid")
segments(x0=955, y0=930, x1=940, y1=940, lwd = 1, lty = "solid")
segments(x0=955, y0=930, x1=965, y1=960, lwd = 1, lty = "solid")

segments(x0=955, y0=925, x1=940, y1=935, lwd = 1, lty = "solid")
segments(x0=955, y0=925, x1=945, y1=890, lwd = 1, lty = "solid")
segments(x0=945, y0=890, x1=930, y1=900, lwd = 1, lty = "solid")
segments(x0=940, y0=935, x1=930, y1=900, lwd = 1, lty = "solid")

segments(x0=965, y0=885, x1=977, y1=955, lwd = 1, lty = "solid")
segments(x0=965, y0=885, x1=977, y1=875, lwd = 1, lty = "solid")

segments(x0=960, y0=875, x1=975, y1=865, lwd = 1, lty = "solid")
segments(x0=960, y0=875, x1=950, y1=845, lwd = 1, lty = "solid")
segments(x0=950, y0=845, x1=965, y1=835, lwd = 1, lty = "solid")
segments(x0=975, y0=865, x1=965, y1=835, lwd = 1, lty = "solid")

segments(x0=977, y0=860, x1=970, y1=830, lwd = 1, lty = "solid")
segments(x0=977, y0=825, x1=970, y1=830, lwd = 1, lty = "solid")

segments(x0=945, y0=880, x1=880, y1=710, lwd = 1, lty = "solid")
segments(x0=945, y0=880, x1=915, y1=890, lwd = 1, lty = "solid")
segments(x0=915, y0=890, x1=850, y1=720, lwd = 1, lty = "solid")
segments(x0=850, y0=720, x1=880, y1=710, lwd = 1, lty = "solid")

segments(x0=265, y0=180, x1=330, y1=360, lwd = 1, lty = "solid")
segments(x0=265, y0=180, x1=320, y1=165, lwd = 1, lty = "solid")
segments(x0=340, y0=240, x1=320, y1=165, lwd = 1, lty = "solid")
segments(x0=340, y0=240, x1=450, y1=210, lwd = 1, lty = "solid")
segments(x0=490, y0=315, x1=450, y1=210, lwd = 1, lty = "solid")
segments(x0=490, y0=315, x1=330, y1=360, lwd = 1, lty = "solid")

segments(x0=330, y0=165, x1=425, y1=140, lwd = 1, lty = "solid")
segments(x0=445, y0=200, x1=425, y1=140, lwd = 1, lty = "solid")
segments(x0=445, y0=200, x1=410, y1=210, lwd = 1, lty = "solid")
segments(x0=395, y0=170, x1=410, y1=210, lwd = 1, lty = "solid")
segments(x0=395, y0=170, x1=370, y1=175, lwd = 1, lty = "solid")
segments(x0=375, y0=190, x1=370, y1=175, lwd = 1, lty = "solid")
segments(x0=375, y0=190, x1=390, y1=185, lwd = 1, lty = "solid")
segments(x0=398, y0=215, x1=390, y1=185, lwd = 1, lty = "solid")
segments(x0=398, y0=215, x1=350, y1=225, lwd = 1, lty = "solid")
segments(x0=330, y0=165, x1=350, y1=225, lwd = 1, lty = "solid")

segments(x0=440, y0=135, x1=540, y1=115, lwd = 1, lty = "solid")
segments(x0=545, y0=140, x1=540, y1=115, lwd = 1, lty = "solid")
segments(x0=545, y0=140, x1=550, y1=140, lwd = 1, lty = "solid")
segments(x0=545, y0=115, x1=550, y1=140, lwd = 1, lty = "solid")
segments(x0=545, y0=115, x1=560, y1=112, lwd = 1, lty = "solid")
segments(x0=615, y0=290, x1=560, y1=112, lwd = 1, lty = "solid")
segments(x0=615, y0=290, x1=500, y1=310, lwd = 1, lty = "solid")
segments(x0=460, y0=205, x1=500, y1=310, lwd = 1, lty = "solid")
segments(x0=460, y0=205, x1=500, y1=195, lwd = 1, lty = "solid")
segments(x0=500, y0=185, x1=500, y1=195, lwd = 1, lty = "solid")
segments(x0=460, y0=195, x1=500, y1=185, lwd = 1, lty = "solid")
segments(x0=460, y0=195, x1=440, y1=135, lwd = 1, lty = "solid")

segments(x0=635, y0=300, x1=570, y1=110, lwd = 1, lty = "solid")
segments(x0=625, y0=100, x1=570, y1=110, lwd = 1, lty = "solid")
segments(x0=625, y0=100, x1=660, y1=190, lwd = 1, lty = "solid")
segments(x0=620, y0=200, x1=660, y1=190, lwd = 1, lty = "solid")
segments(x0=620, y0=200, x1=623, y1=210, lwd = 1, lty = "solid")
segments(x0=623, y0=210, x1=663, y1=200, lwd = 1, lty = "solid")
segments(x0=700, y0=285, x1=663, y1=200, lwd = 1, lty = "solid")
segments(x0=700, y0=285, x1=635, y1=300, lwd = 1, lty = "solid")

segments(x0=635, y0=100, x1=680, y1=90, lwd = 1, lty = "solid")
segments(x0=635, y0=100, x1=670, y1=185, lwd = 1, lty = "solid")
segments(x0=670, y0=185, x1=715, y1=175, lwd = 1, lty = "solid")
segments(x0=680, y0=90, x1=715, y1=175, lwd = 1, lty = "solid")

segments(x0=675, y0=195, x1=720, y1=185, lwd = 1, lty = "solid")
segments(x0=675, y0=195, x1=710, y1=280, lwd = 1, lty = "solid")
segments(x0=710, y0=280, x1=755, y1=270, lwd = 1, lty = "solid")
segments(x0=720, y0=185, x1=755, y1=270, lwd = 1, lty = "solid")

segments(x0=730, y0=185, x1=765, y1=270, lwd = 1, lty = "solid")
segments(x0=730, y0=185, x1=790, y1=170, lwd = 1, lty = "solid")
segments(x0=790, y0=170, x1=825, y1=255, lwd = 1, lty = "solid")
segments(x0=825, y0=255, x1=765, y1=270, lwd = 1, lty = "solid")

segments(x0=725, y0=175, x1=785, y1=160, lwd = 1, lty = "solid")
segments(x0=725, y0=175, x1=695, y1=90, lwd = 1, lty = "solid")
segments(x0=695, y0=90, x1=755, y1=85, lwd = 1, lty = "solid")
segments(x0=785, y0=160, x1=755, y1=85, lwd = 1, lty = "solid")

segments(x0=805, y0=180, x1=765, y1=85, lwd = 1, lty = "solid")
segments(x0=765, y0=85, x1=790, y1=80, lwd = 1, lty = "solid")
segments(x0=830, y0=175, x1=790, y1=80, lwd = 1, lty = "solid")
segments(x0=805, y0=180, x1=830, y1=175, lwd = 1, lty = "solid")

segments(x0=810, y0=185, x1=835, y1=180, lwd = 1, lty = "solid")
segments(x0=810, y0=185, x1=825, y1=225, lwd = 1, lty = "solid")
segments(x0=825, y0=225, x1=850, y1=220, lwd = 1, lty = "solid")
segments(x0=835, y0=180, x1=850, y1=220, lwd = 1, lty = "solid")

segments(x0=830, y0=235, x1=855, y1=230, lwd = 1, lty = "solid")
segments(x0=830, y0=235, x1=845, y1=275, lwd = 1, lty = "solid")
segments(x0=845, y0=275, x1=870, y1=270, lwd = 1, lty = "solid")
segments(x0=870, y0=270, x1=855, y1=230, lwd = 1, lty = "solid")

segments(x0=842, y0=285, x1=875, y1=280, lwd = 1, lty = "solid")
segments(x0=842, y0=285, x1=830, y1=260, lwd = 1, lty = "solid")
segments(x0=770, y0=275, x1=830, y1=260, lwd = 1, lty = "solid")
segments(x0=770, y0=275, x1=790, y1=345, lwd = 1, lty = "solid")
segments(x0=885, y0=320, x1=790, y1=345, lwd = 1, lty = "solid")
segments(x0=885, y0=320, x1=875, y1=280, lwd = 1, lty = "solid")

segments(x0=760, y0=277, x1=745, y1=280, lwd = 1, lty = "solid")
segments(x0=755, y0=340, x1=745, y1=280, lwd = 1, lty = "solid")
segments(x0=755, y0=340, x1=750, y1=340, lwd = 1, lty = "solid")
segments(x0=740, y0=280, x1=750, y1=340, lwd = 1, lty = "solid")
segments(x0=740, y0=280, x1=715, y1=285, lwd = 1, lty = "solid")
segments(x0=745, y0=385, x1=715, y1=285, lwd = 1, lty = "solid")
segments(x0=745, y0=385, x1=787, y1=375, lwd = 1, lty = "solid")
segments(x0=760, y0=277, x1=787, y1=375, lwd = 1, lty = "solid")

segments(x0=718, y0=320, x1=705, y1=290, lwd = 1, lty = "solid")
segments(x0=718, y0=320, x1=690, y1=325, lwd = 1, lty = "solid")
segments(x0=685, y0=315, x1=690, y1=325, lwd = 1, lty = "solid")
segments(x0=685, y0=315, x1=695, y1=313, lwd = 1, lty = "solid")
segments(x0=690, y0=300, x1=695, y1=313, lwd = 1, lty = "solid")
segments(x0=690, y0=300, x1=673, y1=305, lwd = 1, lty = "solid")
segments(x0=670, y0=300, x1=673, y1=305, lwd = 1, lty = "solid")
segments(x0=670, y0=300, x1=705, y1=290, lwd = 1, lty = "solid")

segments(x0=663, y0=302, x1=640, y1=308, lwd = 1, lty = "solid")
segments(x0=663, y0=302, x1=673, y1=320, lwd = 1, lty = "solid")
segments(x0=680, y0=318, x1=673, y1=320, lwd = 1, lty = "solid")
segments(x0=680, y0=318, x1=685, y1=328, lwd = 1, lty = "solid")
segments(x0=675, y0=330, x1=685, y1=328, lwd = 1, lty = "solid")
segments(x0=675, y0=330, x1=677, y1=335, lwd = 1, lty = "solid")
segments(x0=721, y0=325, x1=677, y1=335, lwd = 1, lty = "solid")
segments(x0=721, y0=325, x1=735, y1=385, lwd = 1, lty = "solid")
segments(x0=665, y0=400, x1=735, y1=385, lwd = 1, lty = "solid")
segments(x0=665, y0=400, x1=640, y1=308, lwd = 1, lty = "solid")

segments(x0=656, y0=404, x1=635, y1=325, lwd = 1, lty = "solid")
segments(x0=620, y0=328, x1=635, y1=325, lwd = 1, lty = "solid")
segments(x0=620, y0=328, x1=623, y1=343, lwd = 1, lty = "solid")
segments(x0=570, y0=355, x1=623, y1=343, lwd = 1, lty = "solid")
segments(x0=570, y0=355, x1=560, y1=325, lwd = 1, lty = "solid")
segments(x0=618, y0=313, x1=560, y1=325, lwd = 1, lty = "solid")
segments(x0=618, y0=313, x1=620, y1=320, lwd = 1, lty = "solid")
segments(x0=632, y0=316, x1=620, y1=320, lwd = 1, lty = "solid")
segments(x0=632, y0=316, x1=626, y1=298, lwd = 1, lty = "solid")
segments(x0=440, y0=340, x1=626, y1=298, lwd = 1, lty = "solid")
segments(x0=440, y0=340, x1=420, y1=370, lwd = 1, lty = "solid")
segments(x0=425, y0=375, x1=420, y1=370, lwd = 1, lty = "solid")
segments(x0=425, y0=375, x1=530, y1=350, lwd = 1, lty = "solid")
segments(x0=550, y0=430, x1=530, y1=350, lwd = 1, lty = "solid")
segments(x0=550, y0=430, x1=600, y1=420, lwd = 1, lty = "solid")
segments(x0=585, y0=370, x1=600, y1=420, lwd = 1, lty = "solid")
segments(x0=585, y0=370, x1=593, y1=365, lwd = 1, lty = "solid")
segments(x0=607, y0=420, x1=593, y1=365, lwd = 1, lty = "solid")
segments(x0=607, y0=420, x1=656, y1=404, lwd = 1, lty = "solid")

segments(x0=538, y0=415, x1=525, y1=360, lwd = 1, lty = "solid")
segments(x0=485, y0=370, x1=525, y1=360, lwd = 1, lty = "solid")
segments(x0=485, y0=370, x1=496, y1=425, lwd = 1, lty = "solid")
segments(x0=538, y0=415, x1=496, y1=425, lwd = 1, lty = "solid")

segments(x0=475, y0=370, x1=480, y1=390, lwd = 1, lty = "solid")
segments(x0=475, y0=370, x1=430, y1=380, lwd = 1, lty = "solid")
segments(x0=430, y0=380, x1=435, y1=400, lwd = 1, lty = "solid")
segments(x0=435, y0=400, x1=480, y1=390, lwd = 1, lty = "solid")

segments(x0=435, y0=405, x1=480, y1=395, lwd = 1, lty = "solid")
segments(x0=435, y0=405, x1=440, y1=420, lwd = 1, lty = "solid")
segments(x0=440, y0=420, x1=485, y1=410, lwd = 1, lty = "solid")
segments(x0=485, y0=410, x1=480, y1=395, lwd = 1, lty = "solid")

segments(x0=440, y0=425, x1=485, y1=415, lwd = 1, lty = "solid")
segments(x0=440, y0=425, x1=445, y1=440, lwd = 1, lty = "solid")
segments(x0=445, y0=440, x1=490, y1=430, lwd = 1, lty = "solid")
segments(x0=490, y0=430, x1=485, y1=415, lwd = 1, lty = "solid")

segments(x0=450, y0=450, x1=495, y1=440, lwd = 1, lty = "solid")
segments(x0=450, y0=450, x1=465, y1=500, lwd = 1, lty = "solid")
segments(x0=465, y0=500, x1=510, y1=490, lwd = 1, lty = "solid")
segments(x0=510, y0=490, x1=495, y1=440, lwd = 1, lty = "solid")

segments(x0=465, y0=510, x1=520, y1=495, lwd = 1, lty = "solid")
segments(x0=465, y0=510, x1=480, y1=560, lwd = 1, lty = "solid")
segments(x0=480, y0=560, x1=570, y1=540, lwd = 1, lty = "solid")
segments(x0=540, y0=430, x1=570, y1=540, lwd = 1, lty = "solid")
segments(x0=540, y0=430, x1=505, y1=440, lwd = 1, lty = "solid")
segments(x0=520, y0=495, x1=505, y1=440, lwd = 1, lty = "solid")

segments(x0=440, y0=450, x1=470, y1=565, lwd = 1, lty = "solid") 
segments(x0=380, y0=470, x1=440, y1=450, lwd = 1, lty = "solid") 
segments(x0=380, y0=470, x1=410, y1=580, lwd = 1, lty = "solid") 
segments(x0=420, y0=575, x1=410, y1=580, lwd = 1, lty = "solid") 
segments(x0=420, y0=575, x1=400, y1=500, lwd = 1, lty = "solid") 
segments(x0=405, y0=498, x1=400, y1=500, lwd = 1, lty = "solid") 
segments(x0=405, y0=498, x1=425, y1=573, lwd = 1, lty = "solid") 
segments(x0=470, y0=565, x1=425, y1=573, lwd = 1, lty = "solid") 

segments(x0=370, y0=460, x1=435, y1=440, lwd = 1, lty = "solid") 
segments(x0=370, y0=460, x1=350, y1=400, lwd = 1, lty = "solid") 
segments(x0=420, y0=380, x1=350, y1=400, lwd = 1, lty = "solid") 
segments(x0=420, y0=380, x1=430, y1=410, lwd = 1, lty = "solid") 
segments(x0=390, y0=420, x1=430, y1=410, lwd = 1, lty = "solid") 
segments(x0=390, y0=420, x1=390, y1=423, lwd = 1, lty = "solid") 
segments(x0=430, y0=415, x1=390, y1=423, lwd = 1, lty = "solid") 
segments(x0=430, y0=415, x1=435, y1=440, lwd = 1, lty = "solid") 

segments(x0=415, y0=375, x1=340, y1=395, lwd = 1, lty = "solid")
segments(x0=415, y0=375, x1=410, y1=365, lwd = 1, lty = "solid") 
segments(x0=410, y0=365, x1=335, y1=385, lwd = 1, lty = "solid") 
segments(x0=335, y0=385, x1=340, y1=395, lwd = 1, lty = "solid") 

segments(x0=420, y0=355, x1=325, y1=380, lwd = 1, lty = "solid") 
segments(x0=420, y0=355, x1=420, y1=345, lwd = 1, lty = "solid") 
segments(x0=420, y0=345, x1=315, y1=373, lwd = 1, lty = "solid") 
segments(x0=315, y0=373, x1=325, y1=380, lwd = 1, lty = "solid") 

segments(x0=235, y0=315, x1=290, y1=295, lwd = 1, lty = "solid") 
segments(x0=235, y0=315, x1=260, y1=385, lwd = 1, lty = "solid") 
segments(x0=260, y0=385, x1=315, y1=365, lwd = 1, lty = "solid") 
segments(x0=290, y0=295, x1=315, y1=365, lwd = 1, lty = "solid") 

segments(x0=265, y0=390, x1=280, y1=420, lwd = 1, lty = "solid") 
segments(x0=330, y0=400, x1=280, y1=420, lwd = 1, lty = "solid") 
segments(x0=330, y0=400, x1=305, y1=380, lwd = 1, lty = "solid") 
segments(x0=265, y0=390, x1=305, y1=380, lwd = 1, lty = "solid") 

segments(x0=335, y0=405, x1=285, y1=425, lwd = 1, lty = "solid") 
segments(x0=335, y0=405, x1=375, y1=505, lwd = 1, lty = "solid") 
segments(x0=350, y0=520, x1=375, y1=505, lwd = 1, lty = "solid") 
segments(x0=350, y0=520, x1=285, y1=425, lwd = 1, lty = "solid") 

segments(x0=355, y0=525, x1=380, y1=510, lwd = 1, lty = "solid") 
segments(x0=355, y0=525, x1=400, y1=580, lwd = 1, lty = "solid") 
segments(x0=400, y0=580, x1=400, y1=570, lwd = 1, lty = "solid") 
segments(x0=380, y0=510, x1=400, y1=570, lwd = 1, lty = "solid") 

segments(x0=555, y0=440, x1=625, y1=420, lwd = 1, lty = "solid") 
segments(x0=555, y0=440, x1=580, y1=535, lwd = 1, lty = "solid") 
segments(x0=580, y0=535, x1=650, y1=515, lwd = 1, lty = "solid") 
segments(x0=650, y0=515, x1=625, y1=420, lwd = 1, lty = "solid") 

segments(x0=660, y0=515, x1=635, y1=420, lwd = 1, lty = "solid") 
segments(x0=670, y0=405, x1=635, y1=420, lwd = 1, lty = "solid") 
segments(x0=670, y0=405, x1=695, y1=500, lwd = 1, lty = "solid") 
segments(x0=660, y0=515, x1=695, y1=500, lwd = 1, lty = "solid") 

segments(x0=675, y0=405, x1=700, y1=500, lwd = 1, lty = "solid") 
segments(x0=675, y0=405, x1=700, y1=400, lwd = 1, lty = "solid") 
segments(x0=725, y0=495, x1=700, y1=400, lwd = 1, lty = "solid") 
segments(x0=725, y0=495, x1=700, y1=500, lwd = 1, lty = "solid") 

segments(x0=717, y0=440, x1=705, y1=400, lwd = 1, lty = "solid") 
segments(x0=740, y0=395, x1=705, y1=400, lwd = 1, lty = "solid") 
segments(x0=740, y0=395, x1=752, y1=435, lwd = 1, lty = "solid") 
segments(x0=717, y0=440, x1=752, y1=435, lwd = 1, lty = "solid") 

segments(x0=722, y0=445, x1=757, y1=440, lwd = 1, lty = "solid")
segments(x0=722, y0=445, x1=735, y1=495, lwd = 1, lty = "solid")
segments(x0=735, y0=495, x1=770, y1=490, lwd = 1, lty = "solid") 
segments(x0=770, y0=490, x1=757, y1=440, lwd = 1, lty = "solid")

segments(x0=778, y0=490, x1=750, y1=390, lwd = 1, lty = "solid")
segments(x0=778, y0=490, x1=815, y1=480, lwd = 1, lty = "solid")
segments(x0=790, y0=380, x1=815, y1=480, lwd = 1, lty = "solid")
segments(x0=790, y0=380, x1=780, y1=385, lwd = 1, lty = "solid")
segments(x0=795, y0=450, x1=780, y1=385, lwd = 1, lty = "solid")
segments(x0=795, y0=450, x1=790, y1=450, lwd = 1, lty = "solid")
segments(x0=775, y0=385, x1=790, y1=450, lwd = 1, lty = "solid")
segments(x0=775, y0=385, x1=750, y1=390, lwd = 1, lty = "solid")

segments(x0=795, y0=355, x1=805, y1=390, lwd = 1, lty = "solid")
segments(x0=795, y0=355, x1=820, y1=350, lwd = 1, lty = "solid")
segments(x0=820, y0=350, x1=830, y1=385, lwd = 1, lty = "solid")
segments(x0=830, y0=385, x1=805, y1=390, lwd = 1, lty = "solid")

segments(x0=825, y0=345, x1=835, y1=380, lwd = 1, lty = "solid")
segments(x0=825, y0=345, x1=885, y1=330, lwd = 1, lty = "solid")
segments(x0=885, y0=330, x1=895, y1=365, lwd = 1, lty = "solid")
segments(x0=895, y0=365, x1=835, y1=380, lwd = 1, lty = "solid")

segments(x0=900, y0=380, x1=805, y1=398, lwd = 1, lty = "solid")
segments(x0=900, y0=380, x1=920, y1=460, lwd = 1, lty = "solid")
segments(x0=825, y0=480, x1=920, y1=460, lwd = 1, lty = "solid")
segments(x0=825, y0=480, x1=805, y1=398, lwd = 1, lty = "solid")
segments(x0=824, y0=394, x1=833, y1=425, lwd = 1, lty = "solid")
segments(x0=850, y0=422, x1=833, y1=425, lwd = 1, lty = "solid")
segments(x0=850, y0=422, x1=843, y1=390, lwd = 1, lty = "solid")
segments(x0=870, y0=385, x1=885, y1=450, lwd = 1, lty = "solid")
segments(x0=880, y0=452, x1=885, y1=450, lwd = 1, lty = "solid")
segments(x0=880, y0=452, x1=865, y1=388, lwd = 1, lty = "solid")

segments(x0=830, y0=490, x1=925, y1=470, lwd = 1, lty = "solid")
segments(x0=935, y0=510, x1=925, y1=470, lwd = 1, lty = "solid")
segments(x0=935, y0=510, x1=850, y1=550, lwd = 1, lty = "solid")
segments(x0=830, y0=490, x1=850, y1=550, lwd = 1, lty = "solid")

segments(x0=935, y0=515, x1=850, y1=555, lwd = 1, lty = "solid")
segments(x0=860, y0=600, x1=850, y1=555, lwd = 1, lty = "solid")
segments(x0=860, y0=600, x1=955, y1=585, lwd = 1, lty = "solid")
segments(x0=935, y0=515, x1=955, y1=585, lwd = 1, lty = "solid")

segments(x0=865, y0=610, x1=960, y1=595, lwd = 1, lty = "solid")
segments(x0=865, y0=610, x1=890, y1=700, lwd = 1, lty = "solid")
segments(x0=977, y0=680, x1=890, y1=700, lwd = 1, lty = "solid")
segments(x0=977, y0=680, x1=960, y1=595, lwd = 1, lty = "solid")

segments(x0=977, y0=690, x1=895, y1=710, lwd = 1, lty = "solid")
segments(x0=910, y0=750, x1=895, y1=710, lwd = 1, lty = "solid")
segments(x0=910, y0=750, x1=977, y1=730, lwd = 1, lty = "solid")

segments(x0=915, y0=755, x1=977, y1=735, lwd = 1, lty = "solid")
segments(x0=915, y0=755, x1=920, y1=785, lwd = 1, lty = "solid")
segments(x0=977, y0=770, x1=920, y1=785, lwd = 1, lty = "solid")

segments(x0=977, y0=782, x1=925, y1=795, lwd = 1, lty = "solid")
segments(x0=940, y0=830, x1=925, y1=795, lwd = 1, lty = "solid")
segments(x0=940, y0=830, x1=977, y1=815, lwd = 1, lty = "solid")

segments(x0=845, y0=710, x1=875, y1=700, lwd = 1, lty = "solid")
segments(x0=845, y0=710, x1=825, y1=640, lwd = 1, lty = "solid")
segments(x0=825, y0=640, x1=855, y1=630, lwd = 1, lty = "solid")
segments(x0=855, y0=630, x1=875, y1=700, lwd = 1, lty = "solid")

segments(x0=820, y0=630, x1=855, y1=620, lwd = 1, lty = "solid")
segments(x0=845, y0=605, x1=855, y1=620, lwd = 1, lty = "solid")
segments(x0=720, y0=640, x1=845, y1=605, lwd = 1, lty = "solid")
segments(x0=720, y0=640, x1=730, y1=670, lwd = 1, lty = "solid")
segments(x0=815, y0=650, x1=730, y1=670, lwd = 1, lty = "solid")
segments(x0=815, y0=650, x1=805, y1=630, lwd = 1, lty = "solid")
segments(x0=800, y0=632, x1=805, y1=630, lwd = 1, lty = "solid")
segments(x0=800, y0=632, x1=820, y1=630, lwd = 1, lty = "solid")

segments(x0=815, y0=605, x1=845, y1=595, lwd = 1, lty = "solid")
segments(x0=815, y0=605, x1=810, y1=585, lwd = 1, lty = "solid")
segments(x0=810, y0=585, x1=840, y1=575, lwd = 1, lty = "solid")
segments(x0=840, y0=575, x1=845, y1=595, lwd = 1, lty = "solid")

segments(x0=760, y0=622, x1=805, y1=610, lwd = 1, lty = "solid")
segments(x0=760, y0=622, x1=755, y1=602, lwd = 1, lty = "solid")
segments(x0=755, y0=602, x1=800, y1=590, lwd = 1, lty = "solid")
segments(x0=800, y0=590, x1=805, y1=610, lwd = 1, lty = "solid")

segments(x0=715, y0=635, x1=750, y1=625, lwd = 1, lty = "solid")
segments(x0=715, y0=635, x1=710, y1=615, lwd = 1, lty = "solid")
segments(x0=710, y0=615, x1=745, y1=605, lwd = 1, lty = "solid")
segments(x0=745, y0=605, x1=750, y1=625, lwd = 1, lty = "solid")

segments(x0=810, y0=580, x1=840, y1=570, lwd = 1, lty = "solid")
segments(x0=810, y0=580, x1=795, y1=540, lwd = 1, lty = "solid")
segments(x0=795, y0=540, x1=835, y1=530, lwd = 1, lty = "solid")
segments(x0=835, y0=530, x1=840, y1=570, lwd = 1, lty = "solid")

segments(x0=795, y0=535, x1=835, y1=525, lwd = 1, lty = "solid")
segments(x0=795, y0=535, x1=780, y1=495, lwd = 1, lty = "solid")
segments(x0=780, y0=495, x1=820, y1=485, lwd = 1, lty = "solid")
segments(x0=820, y0=485, x1=835, y1=525, lwd = 1, lty = "solid")

segments(x0=790, y0=535, x1=775, y1=495, lwd = 1, lty = "solid")
segments(x0=725, y0=500, x1=775, y1=495, lwd = 1, lty = "solid")
segments(x0=725, y0=500, x1=740, y1=540, lwd = 1, lty = "solid")
segments(x0=790, y0=535, x1=740, y1=540, lwd = 1, lty = "solid")

segments(x0=790, y0=540, x1=765, y1=545, lwd = 1, lty = "solid")
segments(x0=790, y0=540, x1=805, y1=580, lwd = 1, lty = "solid")
segments(x0=805, y0=580, x1=780, y1=590, lwd = 1, lty = "solid")
segments(x0=780, y0=590, x1=765, y1=545, lwd = 1, lty = "solid")

segments(x0=720, y0=500, x1=735, y1=545, lwd = 1, lty = "solid")
segments(x0=720, y0=500, x1=660, y1=520, lwd = 1, lty = "solid")
segments(x0=660, y0=520, x1=690, y1=610, lwd = 1, lty = "solid")
segments(x0=695, y0=607, x1=690, y1=610, lwd = 1, lty = "solid")
segments(x0=680, y0=540, x1=695, y1=607, lwd = 1, lty = "solid")
segments(x0=680, y0=540, x1=685, y1=538, lwd = 1, lty = "solid")
segments(x0=700, y0=608, x1=685, y1=538, lwd = 1, lty = "solid")
segments(x0=700, y0=608, x1=770, y1=590, lwd = 1, lty = "solid")
segments(x0=760, y0=550, x1=770, y1=590, lwd = 1, lty = "solid")
segments(x0=760, y0=550, x1=700, y1=555, lwd = 1, lty = "solid")
segments(x0=700, y0=550, x1=700, y1=555, lwd = 1, lty = "solid")
segments(x0=700, y0=550, x1=735, y1=545, lwd = 1, lty = "solid")

segments(x0=650, y0=525, x1=680, y1=620, lwd = 1, lty = "solid")
segments(x0=650, y0=525, x1=620, y1=535, lwd = 1, lty = "solid")
segments(x0=620, y0=535, x1=650, y1=630, lwd = 1, lty = "solid")
segments(x0=650, y0=630, x1=680, y1=620, lwd = 1, lty = "solid")

segments(x0=615, y0=535, x1=645, y1=630, lwd = 1, lty = "solid")
segments(x0=615, y0=535, x1=585, y1=545, lwd = 1, lty = "solid")
segments(x0=585, y0=545, x1=615, y1=640, lwd = 1, lty = "solid")
segments(x0=615, y0=640, x1=645, y1=630, lwd = 1, lty = "solid")

segments(x0=580, y0=545, x1=610, y1=640, lwd = 1, lty = "solid")
segments(x0=580, y0=545, x1=550, y1=555, lwd = 1, lty = "solid")
segments(x0=575, y0=650, x1=550, y1=555, lwd = 1, lty = "solid")
segments(x0=575, y0=650, x1=610, y1=640, lwd = 1, lty = "solid")

segments(x0=550, y0=580, x1=542, y1=555, lwd = 1, lty = "solid")
segments(x0=550, y0=580, x1=500, y1=590, lwd = 1, lty = "solid")
segments(x0=500, y0=590, x1=492, y1=565, lwd = 1, lty = "solid")
segments(x0=492, y0=565, x1=542, y1=555, lwd = 1, lty = "solid")

segments(x0=545, y0=595, x1=515, y1=600, lwd = 1, lty = "solid")
segments(x0=545, y0=595, x1=550, y1=625, lwd = 1, lty = "solid")
segments(x0=550, y0=625, x1=520, y1=630, lwd = 1, lty = "solid")
segments(x0=520, y0=630, x1=515, y1=600, lwd = 1, lty = "solid")

segments(x0=560, y0=630, x1=510, y1=640, lwd = 1, lty = "solid")
segments(x0=560, y0=630, x1=565, y1=655, lwd = 1, lty = "solid")
segments(x0=565, y0=655, x1=515, y1=665, lwd = 1, lty = "solid")
segments(x0=515, y0=665, x1=510, y1=640, lwd = 1, lty = "solid")

segments(x0=485, y0=570, x1=505, y1=670, lwd = 1, lty = "solid")
segments(x0=485, y0=570, x1=455, y1=575, lwd = 1, lty = "solid")
segments(x0=455, y0=575, x1=475, y1=675, lwd = 1, lty = "solid")
segments(x0=475, y0=675, x1=505, y1=670, lwd = 1, lty = "solid")

segments(x0=450, y0=575, x1=470, y1=675, lwd = 1, lty = "solid")
segments(x0=450, y0=575, x1=405, y1=590, lwd = 1, lty = "solid")
segments(x0=465, y0=675, x1=405, y1=590, lwd = 1, lty = "solid")
segments(x0=465, y0=675, x1=470, y1=675, lwd = 1, lty = "solid")

segments(x0=910, y0=885, x1=815, y1=660, lwd = 1, lty = "solid")
segments(x0=910, y0=885, x1=890, y1=895, lwd = 1, lty = "solid")
segments(x0=870, y0=850, x1=890, y1=895, lwd = 1, lty = "solid")
segments(x0=870, y0=850, x1=865, y1=850, lwd = 1, lty = "solid")
segments(x0=885, y0=900, x1=865, y1=850, lwd = 1, lty = "solid")
segments(x0=885, y0=900, x1=860, y1=905, lwd = 1, lty = "solid")
segments(x0=810, y0=820, x1=860, y1=905, lwd = 1, lty = "solid")
segments(x0=810, y0=820, x1=845, y1=800, lwd = 1, lty = "solid")
segments(x0=845, y0=795, x1=845, y1=800, lwd = 1, lty = "solid")
segments(x0=845, y0=795, x1=805, y1=810, lwd = 1, lty = "solid")
segments(x0=735, y0=680, x1=805, y1=810, lwd = 1, lty = "solid")
segments(x0=735, y0=680, x1=815, y1=660, lwd = 1, lty = "solid")

segments(x0=780, y0=785, x1=845, y1=895, lwd = 1, lty = "solid")
segments(x0=740, y0=865, x1=845, y1=895, lwd = 1, lty = "solid")
segments(x0=740, y0=865, x1=710, y1=800, lwd = 1, lty = "solid")
segments(x0=780, y0=785, x1=710, y1=800, lwd = 1, lty = "solid")

segments(x0=775, y0=775, x1=705, y1=790, lwd = 1, lty = "solid")
segments(x0=775, y0=775, x1=700, y1=625, lwd = 1, lty = "solid")

segments(x0=700, y0=625, x1=630, y1=645, lwd = 1, lty = "solid")
segments(x0=630, y0=645, x1=705, y1=790, lwd = 1, lty = "solid")

segments(x0=680, y0=870, x1=765, y1=890, lwd = 1, lty = "solid")
segments(x0=700, y0=905, x1=765, y1=890, lwd = 1, lty = "solid")
segments(x0=700, y0=905, x1=680, y1=870, lwd = 1, lty = "solid")

segments(x0=695, y0=905, x1=675, y1=870, lwd = 1, lty = "solid")
segments(x0=695, y0=905, x1=645, y1=895, lwd = 1, lty = "solid")
segments(x0=635, y0=865, x1=645, y1=895, lwd = 1, lty = "solid")
segments(x0=635, y0=865, x1=675, y1=870, lwd = 1, lty = "solid")

segments(x0=630, y0=865, x1=640, y1=895, lwd = 1, lty = "solid")
segments(x0=600, y0=860, x1=640, y1=895, lwd = 1, lty = "solid")
segments(x0=600, y0=860, x1=630, y1=865, lwd = 1, lty = "solid")

segments(x0=470, y0=685, x1=505, y1=680, lwd = 1, lty = "solid")
segments(x0=470, y0=685, x1=505, y1=730, lwd = 1, lty = "solid")
segments(x0=505, y0=680, x1=505, y1=730, lwd = 1, lty = "solid")

segments(x0=515, y0=750, x1=515, y1=680, lwd = 1, lty = "solid")
segments(x0=515, y0=750, x1=595, y1=840, lwd = 1, lty = "solid")
segments(x0=730, y0=865, x1=595, y1=840, lwd = 1, lty = "solid")
segments(x0=730, y0=865, x1=620, y1=650, lwd = 1, lty = "solid")
segments(x0=515, y0=680, x1=620, y1=650, lwd = 1, lty = "solid")

segments(x0=920, y0=400, x1=977, y1=590, lwd = 1, lty = "solid")
segments(x0=920, y0=400, x1=977, y1=380, lwd = 1, lty = "solid")

segments(x0=920, y0=390, x1=977, y1=370, lwd = 1, lty = "solid")
segments(x0=920, y0=390, x1=875, y1=230, lwd = 1, lty = "solid")
segments(x0=930, y0=220, x1=875, y1=230, lwd = 1, lty = "solid")
segments(x0=930, y0=220, x1=940, y1=270, lwd = 1, lty = "solid")
segments(x0=960, y0=265, x1=940, y1=270, lwd = 1, lty = "solid")
segments(x0=960, y0=265, x1=977, y1=370, lwd = 1, lty = "solid")

segments(x0=925, y0=210, x1=870, y1=220, lwd = 1, lty = "solid")
segments(x0=815, y0=80, x1=870, y1=220, lwd = 1, lty = "solid")
segments(x0=815, y0=80, x1=920, y1=70, lwd = 1, lty = "solid")
segments(x0=920, y0=70, x1=930, y1=125, lwd = 1, lty = "solid")
segments(x0=900, y0=135, x1=930, y1=125, lwd = 1, lty = "solid")
segments(x0=900, y0=135, x1=925, y1=210, lwd = 1, lty = "solid")

segments(x0=930, y0=70, x1=940, y1=125, lwd = 1, lty = "solid")
segments(x0=930, y0=70, x1=977, y1=60, lwd = 1, lty = "solid")
segments(x0=977, y0=115, x1=940, y1=125, lwd = 1, lty = "solid")

segments(x0=977, y0=140, x1=930, y1=150, lwd = 1, lty = "solid")
segments(x0=955, y0=250, x1=930, y1=150, lwd = 1, lty = "solid")
segments(x0=955, y0=250, x1=977, y1=245, lwd = 1, lty = "solid")


segments(x0=195, y0=190, x1=215, y1=300, lwd = 1, lty = "dotdash")
segments(x0=260, y0=415, x1=215, y1=300, lwd = 1, lty = "dotdash")
segments(x0=260, y0=415, x1=305, y1=480, lwd = 1, lty = "dotdash")
segments(x0=120, y0=695, x1=305, y1=480, lwd = 1, lty = "dotdash")
segments(x0=120, y0=695, x1=50, y1=755, lwd = 1, lty = "dotdash")
segments(x0=195, y0=960, x1=50, y1=755, lwd = 1, lty = "dotdash")
segments(x0=195, y0=960, x1=370, y1=885, lwd = 1, lty = "dotdash")
segments(x0=385, y0=895, x1=370, y1=885, lwd = 1, lty = "dotdash")
segments(x0=385, y0=895, x1=580, y1=845, lwd = 1, lty = "dotdash")
segments(x0=700, y0=865, x1=580, y1=845, lwd = 1, lty = "dotdash")
segments(x0=700, y0=865, x1=865, y1=910, lwd = 1, lty = "dotdash")
segments(x0=950, y0=887, x1=865, y1=910, lwd = 1, lty = "dotdash")
segments(x0=950, y0=887, x1=885, y1=705, lwd = 1, lty = "dotdash")
segments(x0=977, y0=685, x1=885, y1=705, lwd = 1, lty = "dotdash")
segments(x0=977, y0=625, x1=875, y1=250, lwd = 1, lty = "dotdash")
segments(x0=800, y0=70, x1=875, y1=250, lwd = 1, lty = "dotdash")
segments(x0=800, y0=70, x1=700, y1=80, lwd = 1, lty = "dotdash")
segments(x0=450, y0=125, x1=700, y1=80, lwd = 1, lty = "dotdash")
segments(x0=450, y0=125, x1=195, y1=190, lwd = 1, lty = "dotdash")

polygon(c(392, 392, 385, 385), c(209, 216, 217, 210), border = "black", col = "black")

polygon(c(562, 562, 555, 555), c(292, 299, 300, 293), border = "black", col = "black")
polygon(c(582, 582, 575, 575), c(288, 295, 297, 290), border = "black", col = "black")
polygon(c(631, 629, 626, 628), c(275, 268, 268, 275), border = "black", col = "black")
polygon(c(621, 619, 616, 618), c(250, 243, 243, 250), border = "black", col = "black")
polygon(c(637, 635, 632, 634), c(295, 288, 288, 295), border = "black", col = "black")
polygon(c(629, 627, 624, 626), c(310, 303, 303, 310), border = "black", col = "black")
polygon(c(641, 639, 636, 638), c(350, 343, 343, 350), border = "black", col = "black")
polygon(c(645, 643, 640, 642), c(365, 358, 358, 365), border = "black", col = "black")
polygon(c(649, 647, 644, 646), c(380, 373, 373, 380), border = "black", col = "black")

polygon(c(610, 610, 620, 620), c(417, 410, 408, 415), border = "black", col = "black")
polygon(c(630, 630, 650, 650), c(412, 409, 403, 406), border = "black", col = "black")
polygon(c(637, 637, 643, 643), c(410, 394, 393, 406), border = "black", col = "black")

polygon(c(585, 585, 593, 593), c(369, 365, 363, 365), border = "black", col = "black")

polygon(c(588, 585, 588, 591), c(395, 380, 380, 395), border = "black", col = "black")
polygon(c(594, 596, 600, 597), c(410, 417, 417, 410), border = "black", col = "black")

polygon(c(555, 555, 562, 562), c(426, 430, 427, 423), border = "black", col = "black")

polygon(c(550, 548, 555, 557), c(420, 413, 413, 420), border = "black", col = "black")
polygon(c(545, 538, 545, 552), c(403, 380, 380, 403), border = "black", col = "black")
polygon(c(536, 533, 537, 540), c(367, 360, 360, 367), border = "black", col = "black")

polygon(c(586, 583, 593, 596), c(342, 335, 332, 339), border = "black", col = "black")

polygon(c(434, 431, 438, 442), c(357, 355, 346, 350), border = "black", col = "black")

polygon(c(634, 631, 638, 640), c(212, 210, 207, 210), border = "black", col = "black")

polygon(c(644, 641, 648, 650), c(209, 207, 204, 207), border = "black", col = "black")

polygon(c(678, 672, 676, 680), c(244, 237, 234, 241), border = "black", col = "black")

polygon(c(675, 669, 679, 683), c(291, 287, 284, 288), border = "black", col = "black")

polygon(c(660, 654, 664, 668), c(294, 290, 287, 291), border = "black", col = "black")

polygon(c(663, 660, 662, 665), c(164, 157, 154, 161), border = "black", col = "black")

polygon(c(750, 744, 754, 758), c(169, 165, 162, 166), border = "black", col = "black")

polygon(c(778, 775, 777, 780), c(114, 107, 104, 111), border = "black", col = "black")

polygon(c(700, 694, 704, 708), c(199, 195, 192, 196), border = "black", col = "black")

polygon(c(738, 735, 737, 740), c(204, 197, 194, 201), border = "black", col = "black")
polygon(c(728, 725, 727, 730), c(214, 207, 204, 211), border = "black", col = "black")

polygon(c(680, 674, 704, 708), c(300, 298, 291, 293), border = "black", col = "black")
polygon(c(695, 689, 714, 718), c(325, 323, 317, 319), border = "black", col = "black")
polygon(c(690, 684, 709, 713), c(338, 333, 327, 332), border = "black", col = "black")
polygon(c(710, 706, 724, 728), c(390, 385, 381, 386), border = "black", col = "black")
polygon(c(685, 681, 699, 703), c(395, 390, 386, 391), border = "black", col = "black")
polygon(c(670, 666, 675, 679), c(398, 393, 391, 396), border = "black", col = "black")

polygon(c(708, 705, 707, 710), c(309, 302, 299, 306), border = "black", col = "black")

polygon(c(643, 640, 642, 645), c(319, 312, 309, 316), border = "black", col = "black")
polygon(c(651, 645, 650, 653), c(339, 332, 329, 336), border = "black", col = "black")
polygon(c(656, 650, 655, 658), c(359, 352, 349, 356), border = "black", col = "black")

polygon(c(726, 720, 725, 728), c(354, 347, 344, 351), border = "black", col = "black")
polygon(c(731, 725, 730, 733), c(374, 367, 364, 371), border = "black", col = "black")

polygon(c(728, 718, 723, 730), c(324, 297, 294, 321), border = "black", col = "black")
polygon(c(740, 733, 738, 742), c(364, 347, 344, 361), border = "black", col = "black")

polygon(c(748, 742, 746, 750), c(384, 377, 374, 381), border = "black", col = "black")

polygon(c(768, 764, 767, 770), c(314, 307, 304, 311), border = "black", col = "black")

polygon(c(781, 777, 780, 783), c(364, 357, 354, 361), border = "black", col = "black")

polygon(c(806, 797, 800, 808), c(389, 362, 359, 386), border = "black", col = "black")

polygon(c(783, 779, 782, 785), c(314, 307, 304, 311), border = "black", col = "black")

polygon(c(820, 812, 815, 822), c(454, 427, 424, 451), border = "black", col = "black")

polygon(c(810, 809, 814, 815), c(414, 407, 404, 411), border = "black", col = "black")

polygon(c(802, 787, 790, 804), c(444, 387, 384, 441), border = "black", col = "black")

polygon(c(777, 758, 761, 779), c(484, 417, 414, 481), border = "black", col = "black")

polygon(c(784, 778, 781, 787), c(444, 417, 414, 441), border = "black", col = "black")

polygon(c(794, 783, 786, 797), c(534, 497, 494, 531), border = "black", col = "black")

polygon(c(787, 802, 803, 790), c(509, 500, 494, 503), border = "black", col = "black")

polygon(c(792, 807, 808, 795), c(529, 520, 514, 523), border = "black", col = "black")

polygon(c(900, 907, 908, 900), c(484, 480, 473, 478), border = "black", col = "black")

polygon(c(850, 857, 858, 850), c(494, 490, 483, 488), border = "black", col = "black")

polygon(c(850, 857, 858, 850), c(474, 471, 467, 470), border = "black", col = "black")

polygon(c(870, 877, 878, 870), c(470, 467, 463, 466), border = "black", col = "black")

polygon(c(830, 877, 878, 830), c(348, 337, 333, 344), border = "black", col = "black")

polygon(c(830, 860, 860, 830), c(333, 327, 320, 326), border = "black", col = "black")

polygon(c(810, 800, 800, 810), c(338, 342, 338, 334), border = "black", col = "black")

polygon(c(825, 815, 815, 825), c(326, 330, 326, 322), border = "black", col = "black")

polygon(c(770, 760, 760, 770), c(378, 382, 378, 374), border = "black", col = "black")

polygon(c(765, 755, 755, 765), c(391, 391, 389, 387), border = "black", col = "black")

polygon(c(805, 795, 795, 805), c(483, 483, 481, 479), border = "black", col = "black")

polygon(c(790, 780, 780, 790), c(273, 277, 273, 269), border = "black", col = "black")

polygon(c(835, 825, 825, 835), c(536, 537, 532, 531), border = "black", col = "black")

polygon(c(830, 815, 815, 830), c(571, 575, 577, 573), border = "black", col = "black")

polygon(c(832, 822, 822, 832), c(581, 584, 581, 578), border = "black", col = "black")

polygon(c(782, 772, 772, 782), c(598, 602, 599, 596), border = "black", col = "black")

polygon(c(782, 772, 772, 782), c(616, 620, 617, 614), border = "black", col = "black")

polygon(c(782, 772, 772, 782), c(626, 630, 627, 624), border = "black", col = "black")

polygon(c(742, 732, 732, 742), c(608, 612, 609, 606), border = "black", col = "black")

polygon(c(727, 717, 717, 727), c(631, 635, 632, 629), border = "black", col = "black")

polygon(c(872, 862, 862, 872), c(716, 720, 717, 714), border = "black", col = "black")

polygon(c(752, 742, 742, 752), c(593, 597, 594, 591), border = "black", col = "black")

polygon(c(727, 717, 717, 727), c(545, 547, 544, 543), border = "black", col = "black")

polygon(c(712, 702, 702, 712), c(547, 549, 543, 542), border = "black", col = "black")

polygon(c(717, 677, 677, 717), c(503, 519, 516, 501), border = "black", col = "black")

polygon(c(687, 662, 662, 687), c(503, 514, 511, 500), border = "black", col = "black")

polygon(c(667, 642, 642, 667), c(409, 420, 417, 406), border = "black", col = "black")

polygon(c(737, 712, 712, 737), c(399, 402, 399, 396), border = "black", col = "black")

polygon(c(747, 722, 722, 747), c(434, 438, 435, 431), border = "black", col = "black")

polygon(c(737, 727, 727, 737), c(445, 448, 445, 442), border = "black", col = "black")

polygon(c(757, 702, 702, 757), c(556, 560, 555, 551), border = "black", col = "black")

polygon(c(690, 687, 691, 694), c(607, 598, 598, 607), border = "black", col = "black")

polygon(c(683, 680, 684, 687), c(587, 578, 578, 587), border = "black", col = "black")

polygon(c(671, 662, 666, 675), c(547, 525, 525, 547), border = "black", col = "black")

polygon(c(766, 759, 763, 770), c(587, 565, 565, 587), border = "black", col = "black")

polygon(c(649, 637, 641, 653), c(470, 425, 425, 470), border = "black", col = "black")

polygon(c(689, 677, 681, 693), c(500, 455, 455, 500), border = "black", col = "black")

polygon(c(734, 730, 738, 742), c(485, 470, 470, 485), border = "black", col = "black")

polygon(c(752, 755, 763, 760), c(450, 460, 460, 450), border = "black", col = "black")

polygon(c(839, 842, 843, 843), c(687, 697, 697, 687), border = "black", col = "black")

polygon(c(752, 759, 760, 755), c(737, 747, 747, 737), border = "black", col = "black")

polygon(c(622, 638, 640, 625), c(537, 587, 587, 537), border = "black", col = "black")

polygon(c(647, 640, 648, 655), c(617, 597, 597, 617), border = "black", col = "black")

polygon(c(644, 654, 662, 652), c(532, 562, 562, 532), border = "black", col = "black")

polygon(c(662, 669, 672, 665), c(577, 597, 597, 577), border = "black", col = "black")

polygon(c(670, 672, 680, 677), c(612, 622, 622, 612), border = "black", col = "black")

polygon(c(632, 634, 642, 640), c(612, 622, 622, 612), border = "black", col = "black")

polygon(c(605, 607, 609, 607), c(602, 612, 612, 602), border = "black", col = "black")

polygon(c(615, 627, 629, 617), c(542, 582, 582, 542), border = "black", col = "black")

polygon(c(580, 582, 584, 582), c(552, 562, 562, 552), border = "black", col = "black")

polygon(c(553, 555, 557, 555), c(562, 572, 572, 562), border = "black", col = "black")

polygon(c(543, 545, 547, 545), c(562, 572, 572, 562), border = "black", col = "black")

polygon(c(483, 485, 487, 485), c(577, 587, 587, 577), border = "black", col = "black")

polygon(c(617, 562, 562, 617), c(430, 446, 439, 423), border = "black", col = "black")

polygon(c(637, 582, 582, 637), c(517, 533, 529, 513), border = "black", col = "black")

polygon(c(557, 576, 579, 560), c(447, 517, 517, 447), border = "black", col = "black")

polygon(c(597, 616, 623, 604), c(432, 502, 502, 432), border = "black", col = "black")

polygon(c(632, 637, 641, 637), c(474, 482, 482, 474), border = "black", col = "black")

polygon(c(627, 630, 634, 632), c(444, 452, 452, 444), border = "black", col = "black")

polygon(c(532, 522, 522, 532), c(557, 561, 565, 560), border = "black", col = "black")

polygon(c(512, 502, 502, 512), c(582, 586, 590, 585), border = "black", col = "black")

polygon(c(512, 482, 482, 512), c(547, 554, 561, 553), border = "black", col = "black")

polygon(c(537, 512, 512, 537), c(432, 439, 444, 437), border = "black", col = "black")

polygon(c(527, 502, 502, 527), c(412, 419, 424, 417), border = "black", col = "black")

polygon(c(482, 442, 442, 482), c(417, 424, 426, 419), border = "black", col = "black")

polygon(c(477, 467, 467, 477), c(429, 432, 434, 431), border = "black", col = "black")

polygon(c(477, 467, 467, 477), c(444, 447, 449, 446), border = "black", col = "black")

polygon(c(417, 387, 387, 417), c(444, 452, 454, 446), border = "black", col = "black")

polygon(c(417, 397, 397, 417), c(379, 387, 389, 381), border = "black", col = "black")

polygon(c(392, 396, 402, 398), c(432, 450, 450, 432), border = "black", col = "black")

polygon(c(402, 406, 412, 408), c(462, 485, 485, 460), border = "black", col = "black")

polygon(c(397, 382, 382, 397), c(463, 471, 473, 465), border = "black", col = "black")

polygon(c(437, 422, 422, 437), c(452, 457, 459, 454), border = "black", col = "black")

polygon(c(412, 414, 416, 415), c(562, 570, 568, 560), border = "black", col = "black")

polygon(c(458, 464, 466, 461), c(532, 560, 558, 530), border = "black", col = "black")

polygon(c(448, 452, 454, 451), c(502, 512, 510, 500), border = "black", col = "black")

polygon(c(428, 432, 434, 431), c(422, 432, 430, 420), border = "black", col = "black")

polygon(c(418, 424, 426, 423), c(392, 402, 400, 390), border = "black", col = "black")

polygon(c(433, 437, 439, 438), c(387, 397, 395, 385), border = "black", col = "black")

polygon(c(473, 477, 479, 478), c(382, 392, 390, 380), border = "black", col = "black")

polygon(c(436, 440, 442, 441), c(407, 417, 415, 405), border = "black", col = "black")

polygon(c(478, 482, 484, 483), c(402, 412, 410, 400), border = "black", col = "black")

polygon(c(493, 505, 507, 498), c(452, 482, 480, 450), border = "black", col = "black")

polygon(c(460, 464, 466, 465), c(482, 492, 490, 480), border = "black", col = "black")

polygon(c(467, 474, 476, 472), c(512, 542, 540, 510), border = "black", col = "black")

polygon(c(560, 564, 566, 565), c(528, 537, 535, 525), border = "black", col = "black")

polygon(c(555, 559, 561, 560), c(508, 517, 515, 505), border = "black", col = "black")

polygon(c(540, 544, 546, 545), c(448, 457, 455, 445), border = "black", col = "black")

polygon(c(545, 552, 557, 550), c(468, 497, 495, 465), border = "black", col = "black")

polygon(c(525, 532, 537, 530), c(388, 417, 415, 385), border = "black", col = "black")

polygon(c(485, 492, 497, 490), c(373, 397, 395, 370), border = "black", col = "black")

polygon(c(492, 495, 500, 497), c(410, 417, 415, 408), border = "black", col = "black")

polygon(c(368, 370, 377, 375), c(755, 762, 765, 758), border = "black", col = "black")


polygon(c(410, 410, 413, 413), c(60, 63, 63, 60), border = "black", col = "black")
text(395, 60, "PUMP", family = "Main", cex = .75, col = "black")

polygon(c(550, 550, 553, 553), c(30, 33, 33, 30), border = "black", col = "black")
text(535, 30, "PUMP", family = "Main", cex = .75, col = "black")

polygon(c(655, 655, 658, 658), c(75, 78, 78, 75), border = "black", col = "black")
text(670, 75, "PUMP", family = "Main", cex = .75, col = "black")

polygon(c(712, 712, 715, 715), c(70, 73, 73, 70), border = "black", col = "black")
text(727, 70, "PUMP", family = "Main", cex = .75, col = "black")

polygon(c(380, 380, 383, 383), c(225, 228, 228, 225), border = "black", col = "black")
text(395, 225, "PUMP", family = "Main", cex = .75, col = "black")

polygon(c(410, 410, 413, 413), c(360, 363, 363, 360), border = "black", col = "black")
text(395, 360, "PUMP", family = "Main", cex = .75, col = "black")

polygon(c(630, 630, 633, 633), c(420, 423, 423, 420), border = "black", col = "black")
text(645, 420, "PUMP", family = "Main", cex = .75, col = "black")

polygon(c(815, 815, 818, 818), c(640, 643, 643, 640), border = "black", col = "black")
text(830, 640, "PUMP", family = "Main", cex = .75, col = "black")

polygon(c(860, 860, 863, 863), c(920, 923, 923, 920), border = "black", col = "black")
text(875, 920, "PUMP", family = "Main", cex = .75, col = "black")

polygon(c(380, 380, 383, 383), c(900, 903, 903, 900), border = "black", col = "black")
text(895, 900, "PUMP", family = "Main", cex = .75, col = "black")

polygon(c(490, 490, 493, 493), c(680, 683, 683, 680), border = "black", col = "black")
text(505, 680, "PUMP", family = "Main", cex = .75, col = "black")

polygon(c(610, 610, 613, 613), c(635, 638, 638, 635), border = "black", col = "black")
text(595, 635, "PUMP", family = "Main", cex = .75, col = "black")


text(100, 210, "OXFORD STREET", family = "Main", srt = 10, cex = 1, col = "black")
text(170, 120, "REGENT STREET", family = "Main", srt = 285, cex = 1, col = "black")
text(150, 60, "MARGARET STREET", family = "Main", srt = 15, cex = 1, col = "black")
text(260, 90, "JOHN STREET", family = "Main", srt = 285, cex = 1, col = "black")
text(80, 130, "PRINCES STREET", family = "Main", srt = 295, cex = 1, col = "black")
text(120, 310, "PRINCES STREET", family = "Main", srt = 15, cex = 1, col = "black")
text(160, 410, "HANOVER STREET", family = "Main", srt = 15, cex = 1, col = "black")
text(60, 390, "HANOVER SQUARE", family = "Main", srt = 285, cex = 1, col = "black")
text(80, 600, "GEORGE STREET", family = "Main", srt = 285, cex = 1, col = "black")
text(160, 520, "MADDOX STREET", family = "Main", srt = 50, cex = 1, col = "black")
text(160, 650, "CONDUIT STREET", family = "Main", srt = 50, cex = 1, col = "black")
text(300, 660, "NEW BURLINGTON STREET", family = "Main", srt = 30, cex = 1, col = "black")
text(260, 930, "BURLINGTON GARDENS", family = "Main", srt = 25, cex = 1, col = "black")
text(140, 880, "PRINCES STREET", family = "Main", srt = 305, cex = 1, col = "black")
text(180, 800, "CLIFFORD STREET", family = "Main", srt = 25, cex = 1, col = "black")
text(230, 880, "CORK STREET", family = "Main", srt = 305, cex = 1, col = "black")
text(290, 850, "OLD BURLINGTON STREET", family = "Main", srt = 305, cex = 1, col = "black")
text(335, 820, "SAVILLE ROW", family = "Main", srt = 305, cex = 1, col = "black")
text(480, 925, "SACKVILLE STREET", family = "Main", srt = 300, cex = 1, col = "black")
text(475, 720, "REGENT STREET", family = "Main", srt = 305, cex = 1, col = "black")
text(265, 420, "REGENT STREET", family = "Main", srt = 305, cex = 1, col = "black")
text(680, 910, "REGENT QUADRANT", family = "Main", srt = -5, cex = 1, col = "black")
text(670, 865, "MARYLEBON STREET QUADRANT", family = "Main", srt = -10, cex = 1, col = "black")
text(810, 940, "PICCADILLY", family = "Main", srt = 20, cex = 1, col = "black")
text(940, 860, "PRINCES STREET", family = "Main", srt = 285, cex = 1, col = "black")
text(960, 570, "DEAN STREET", family = "Main", srt = 285, cex = 1, col = "black")
text(840, 170, "DEAN STREET", family = "Main", srt = 295, cex = 1, col = "black")
text(960, 195, "LORD SQUARE", family = "Main", srt = 285, cex = 1, col = "black")
text(500, 115, "OXFORD STREET", family = "Main", srt = 10, cex = 1, col = "black")
text(900, 60, "OXFORD STREET", family = "Main", srt = 10, cex = 1, col = "black")
text(470, 50, "CASTLE ST. EAST", family = "Main", srt = 15, cex = 1, col = "black")
text(710, 150, "WARDOUR STREET", family = "Main", srt = 290, cex = 1, col = "black")
text(790, 160, "GREAT CHAPEL STREET", family = "Main", srt = 290, cex = 1, col = "black")
text(660, 170, "SERWICK STREET", family = "Main", srt = 290, cex = 1, col = "black")
text(590, 190, "POLAND STREET", family = "Main", srt = 290, cex = 1, col = "black")
text(465, 230, "BLENHEIM STREET", family = "Main", srt = 290, cex = 1, col = "black")
text(275, 240, "ARCYLL STREET", family = "Main", srt = 290, cex = 1, col = "black")
text(500, 320, "GREAT MARLBOROUGH STREET", family = "Main", srt = 15, cex = 1, col = "black")
text(570, 660, "BREWER STREET", family = "Main", srt = 15, cex = 1, col = "black")
text(680, 750, "SHERRARD STREET", family = "Main", srt = 297, cex = 1, col = "black")
text(780, 770, "GREAT WINDHILL STREET", family = "Main", srt = 297, cex = 1, col = "black")
text(867, 770, "RUPERT STREET", family = "Main", srt = 293, cex = 1, col = "black")

text(800, 990, "SCALE 50 INCHES TO A MILE.", family = "Main",cex = .5, col = "black")
text(500, 990, "C.F. Cheffines, Lith, Southampton Bdgs, London.", family = "serif" ,cex = .5, col = "black")

dev.off()


image_write(fig01, path = here::here("cholera-map", "01_full_unmasked.png"), format = "png")








