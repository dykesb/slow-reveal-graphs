# DESCRIPTION: Time series graph of trade balances

# SLOW REVEAL ORDER:
# 1.


# AUTHORS:
#   Connor Mcnamee (main code)
# Ian Curtis (2023, code to generate plots)


library(tidyverse)
library(circlize)
library(showtext)
font_add_google("Puritan", "Puritan")
showtext_auto()

Fill <- c(1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,0,1,0,0,0,1,1,1,1,
          0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,1,1,1,0,0,1,0,0,0,0,0,0,1,0,0,1,
          0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
          1,0,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,0,0,1,1,1,0,1,1,0,0,0,0,1,1,1,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,1,
          1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,0,0,0,0,0,0,1,0,1,
          1,0,1,0,1,1,0,1,0,1,1,0,0,0,0,0,1,0,0,0,0,1,0,1,0,0,0,0,1,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
          1,1,0,1,1,1,0,1,0,0,1,0,1,0,1,0,1,0,0,0,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,0,0,0,1,0,0,0,0,0,0,0,
          1,1,1,0,1,1,1,1,1,1,0,1,1,1,1,0,1,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,1,1,1,1,0,1,0,0,0,1,0,1,0,0,0,0,
          1,1,1,1,1,1,0,0,0,1,1,0,1,0,0,0,1,1,0,1,0,1,0,1,0,1,1,0,1,1,0,0,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,1,
          0,0,1,1,1,0,1,0,0,1,1,0,1,1,0,1,0,1,0,0,1,0,1,0,0,1,0,1,1,0,0,0,1,1,0,0,1,1,0,0,0,0,1,0,0,0,0,1
)

#### FIGURE 16: FULLY UNMASKED ####

png(filename=here::here("important-legislation", "16_full_unmasked.png"), width = 1285, height = 1200, pointsize=16)
par(mar = c(0,0,0,0))
# Start by defining rules for the circle, height of each track, degree the first cell is made at, and margins for tracks and the circle
circos.par(gap.degree = 0, cell.padding = c(0, 0, 0, 0),
           start.degree = 176, track.margin = c(0, 0), track.height = .035, circle.margin = c(.05,.05,.7,.15))
# Set number of sectors(factors) and x limits within each cell
circos.initialize(factors = c(1:48), xlim = c(-10,10))
# Next is 10 trackplotregion functions starting from the outside track and going in, each defining the color of every cell in the track
# Also circos.text functions, putting the numbers in the Wyoming cells
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","#212c1c"))
circos.text(labels = 10,sector.index = 48, track.index = 1,x=0,y=.5, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 9,sector.index = 48, track.index = 2,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","white","#212c1c","white","white","white","white"))
circos.text(labels = 8,sector.index = 48, track.index = 3,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","white","white","white","white","white","white"))
circos.text(labels = 7,sector.index = 48, track.index = 4,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 6,sector.index = 48, track.index = 5,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","white","#212c1c","white","#212c1c"))
circos.text(labels = 5,sector.index = 48, track.index = 6,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 4,sector.index = 48, track.index = 7,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","#212c1c","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 3,sector.index = 48, track.index = 8,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","white","white","white","white","white","white","#212c1c","white","white","#212c1c"))
circos.text(labels = 2,sector.index = 48, track.index = 9,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","#212c1c","#212c1c"))
circos.text(labels = 1,sector.index = 48, track.index = 10,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
# One extra track of blank cells, to provide some extra space between the state names and the cells
circos.track(ylim=c(0,3),bg.border=NA,track.height=.01, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
# Track with each individual state name going in the circle, and defining the direction they face, font and size
circos.trackText(x = rep(-4.8,48), y = rep(.1,48),
                 labels = c("Alabama","Arkansas","Connecticut","Delaware","Florida",
                            "Georgia","Illinois","Indiana","Iowa","Kentucky","Louisiana",
                            "Maine","Maryland","Massachusetts","Michigan","Minnesota",
                            "Mississippi","Missouri","Nebraska","New Hampshire","New Jersey",
                            "New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Pennsylvania",
                            "Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Vermont","Virginia",
                            "West Virginia","Wisconsin","Nevada","Montana","Kansas",
                            "Arizona","Oregon","California","Washington",
                            "Utah","Idaho","Colorado","Wyoming"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .85, adj = 0,
                 facing = "reverse.clockwise")
# New track placing the lines going all around the circle
circos.track(ylim=c(0,3),bg.border=NA,track.height=.32, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11),panel.fun = function(x,y) {
  circos.axis(major.at = 10, labels = "",direction = "inside", major.tick.length = 7, lwd= 1.6)})
# Final track, with the years that went along with some states
circos.trackText(x = rep(-5.5,48), y = rep(0,48),
                 labels = c("","","","","","","","","","","","","","","","",
                            "","","","","","","","","","","","","","","","","","","",
                            "","","1914","1914","1912",
                            "1912","1912","1911","1910",
                            "1896","1896","1893","1869"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .52, adj = 0,
                 facing = "reverse.clockwise")
circos.track(ylim=c(0,3),bg.border=NA,track.height=.3, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
circos.clear()
par(mar = c(0,1,7,0),cex=1.37)
title("Important Legislation in the United States \nAffecting Women and Children", family = "Puritan")
par(mar = c(7.6,0,0,.5),cex=1)
mtext("WHITE SPACES INDICATE GOOD LEGISLATION,\n BLACK SPACES POOR OR NO LEGISLATION,\n COLOR SPACES FULL SUFFRAGE STATES",
      side=1, font = 2, cex = 1.37, family = "Puritan", line = -2)
par(mar = c(6.8,2,0,0))
mtext("Circle 1",
      side = 1, font = 2, cex = .9, adj = .227, line = -4.9)
mtext("           2",side = 1, font = 2, cex = .9, adj = .23, line = -.3)
mtext("Industrial Welfare Commis-",
      side = 1, font = 1, cex = .9, adj = .343, line=-4.9)
mtext("sion to regulate hours, wages",  side = 1, font = 1, cex = .9, adj = .351, line = -4)
mtext("and working  conditions of",  side = 1, font = 1, cex = .9, adj = .342, line = -3.1)
mtext("women and children",  side = 1, font = 1, cex = .9, adj = .3245, line = -2.2)
mtext("Child Labor--14 year limit.",  side = 1, font = 1, cex = .9, adj = .339, line = -.4)
mtext("Guarded  exemptions during",  side = 1, font = 1, cex = .9, adj = .348, line = .5)
mtext("vacations are allowed and",  side = 1, font = 1, cex = .9, adj = .341, line = 1.4)
mtext("poverty  exemptions  when",  side = 1, font = 1, cex = .9, adj = .343, line = 2.3)
mtext("these are neutralized  by",  side = 1, font = 1, cex = .9, adj = .3375, line = 3.2)
mtext("Mothers' Pensions laws",  side = 1, font = 1, cex = .9, adj = .3345, line = 4.1)
mtext("Circle 3",  side = 1, font = 2, cex = .9, adj = .547, line = -4.9)
mtext("Compulsory education--state-",  side = 1, font = 1, cex = .9, adj = .729, line = -4.9)
mtext("wide",  side = 1, font = 1, cex = .9, adj = .605, line = -4)
mtext("4",  side = 1, font = 2, cex = .9, adj = .568, line = -3.1)
mtext("Eight or  nine hour  day for",  side = 1, font = 1, cex = .9, adj = .713, line = -3.1)
mtext("women",  side = 1, font = 1, cex = .9, adj = .616, line = -2.2)
mtext("5",  side = 1, font = 2, cex = .9, adj = .568, line = -1.3)
mtext("Minimum wage",  side = 1, font = 1, cex = .9, adj = .652, line = -1.3)
mtext("6",  side = 1, font = 2, cex = .9, adj = .568, line = -.4)
mtext("Mothers' pensions",  side = 1, font = 1, cex = .9, adj = .668, line = -.4)
mtext("7",  side = 1, font = 2, cex = .9, adj = .568, line = .5)
mtext("Equal guardianship",  side = 1, font = 1, cex = .9, adj = .6735, line = .5)
mtext("8",  side = 1, font = 2, cex = .9, adj = .568, line = 1.4)
mtext("Age of consent, 18 years--",  side = 1, font = 1, cex = .9, adj = .7115, line = 1.4)
mtext("chaste or unchaste",  side = 1, font = 1, cex = .9, adj = .672, line = 2.3)
mtext("9",  side = 1, font = 2, cex = .9, adj = .568, line = 3.2)
mtext("Red light abatement",  side = 1, font = 1, cex = .9, adj = .678, line = 3.2)
mtext("10",  side = 1, font = 2, cex = .9, adj = .566, line = 4.1)
mtext("Prohibition",  side = 1, font = 1, cex = .9, adj = .6316, line = 4.1)
mtext("Note: Neither Illinois nor any of the Victory States of 1917",  side = 1, font = 1, cex = .634, adj = .5, line = 4.9)
mtext("are included as full suffrage states in chart analysis",   side = 1, font = 1, cex = .634, adj = .5, line = 5.5)
dev.off()


#### FIGURE 1: FULLY MASKED ####


png(filename=here::here("important-legislation", "01_full_masked.png"), width = 1285, height = 1200, pointsize=16)
par(mar = c(0,0,0,0))
# Start by defining rules for the circle, height of each track, degree the first cell is made at, and margins for tracks and the circle
circos.par(gap.degree = 0, cell.padding = c(0, 0, 0, 0),
           start.degree = 176, track.margin = c(0, 0), track.height = .035, circle.margin = c(.05,.05,.7,.15))
# Set number of sectors(factors) and x limits within each cell
circos.initialize(factors = c(1:48), xlim = c(-10,10))
# Next is 10 trackplotregion functions starting from the outside track and going in, each defining the color of every cell in the track
# Also circos.text functions, putting the numbers in the Wyoming cells
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","#212c1c"))
circos.text(labels = 10,sector.index = 48, track.index = 1,x=0,y=.5, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 9,sector.index = 48, track.index = 2,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","white","#212c1c","white","white","white","white"))
circos.text(labels = 8,sector.index = 48, track.index = 3,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","white","white","white","white","white","white"))
circos.text(labels = 7,sector.index = 48, track.index = 4,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 6,sector.index = 48, track.index = 5,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","white","#212c1c","white","#212c1c"))
circos.text(labels = 5,sector.index = 48, track.index = 6,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 4,sector.index = 48, track.index = 7,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","#212c1c","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 3,sector.index = 48, track.index = 8,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","white","white","white","white","white","white","#212c1c","white","white","#212c1c"))
circos.text(labels = 2,sector.index = 48, track.index = 9,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","#212c1c","#212c1c"))
circos.text(labels = 1,sector.index = 48, track.index = 10,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
# One extra track of blank cells, to provide some extra space between the state names and the cells
circos.track(ylim=c(0,3),bg.border=NA,track.height=.01, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
# Track with each individual state name going in the circle, and defining the direction they face, font and size
circos.trackText(x = rep(-4.8,48), y = rep(.1,48),
                 labels = c("","","","","",
                            "","","","","","",
                            "","","","","",
                            "","","","","",
                            "","","","","","","",
                            "","","","","","","",
                            "","","","","",
                            "","","","",
                            "","","",""),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .85, adj = 0,
                 facing = "reverse.clockwise")
# New track placing the lines going all around the circle
circos.track(ylim=c(0,3),bg.border=NA,track.height=.32, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11),panel.fun = function(x,y) {
  circos.axis(major.at = 10, labels = "",direction = "inside", major.tick.length = 7, lwd= 1.6)})
# Final track, with the years that went along with some states
circos.trackText(x = rep(-5.5,48), y = rep(0,48),
                 labels = c("","","","","","","","","","","","","","","","",
                            "","","","","","","","","","","","","","","","","","","",
                            "","","","","",
                            "","","","",
                            "","","",""),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .52, adj = 0,
                 facing = "reverse.clockwise")
circos.track(ylim=c(0,3),bg.border=NA,track.height=.3, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
circos.clear()
# par(mar = c(0,1,7,0),cex=1.37)
# title("Important Legislation in the United States \nAffecting Women and Children", family = "Puritan")
# par(mar = c(7.6,0,0,.5),cex=1)
# mtext("WHITE SPACES INDICATE GOOD LEGISLATION,\n BLACK SPACES POOR OR NO LEGISLATION,\n COLOR SPACES FULL SUFFRAGE STATES",
#       side=1, font = 2, cex = 1.37, family = "Puritan", line = -2)
# par(mar = c(6.8,2,0,0))
# mtext("Circle 1",
#       side = 1, font = 2, cex = .9, adj = .227, line = -4.9)
# mtext("           2",side = 1, font = 2, cex = .9, adj = .23, line = -.3)
# mtext("Industrial Welfare Commis-",
#       side = 1, font = 1, cex = .9, adj = .343, line=-4.9)
# mtext("sion to regulate hours, wages",  side = 1, font = 1, cex = .9, adj = .351, line = -4)
# mtext("and working  conditions of",  side = 1, font = 1, cex = .9, adj = .342, line = -3.1)
# mtext("women and children",  side = 1, font = 1, cex = .9, adj = .3245, line = -2.2)
# mtext("Child Labor--14 year limit.",  side = 1, font = 1, cex = .9, adj = .339, line = -.4)
# mtext("Guarded  exemptions during",  side = 1, font = 1, cex = .9, adj = .348, line = .5)
# mtext("vacations are allowed and",  side = 1, font = 1, cex = .9, adj = .341, line = 1.4)
# mtext("poverty  exemptions  when",  side = 1, font = 1, cex = .9, adj = .343, line = 2.3)
# mtext("these are neutralized  by",  side = 1, font = 1, cex = .9, adj = .3375, line = 3.2)
# mtext("Mothers' Pensions laws",  side = 1, font = 1, cex = .9, adj = .3345, line = 4.1)
# mtext("Circle 3",  side = 1, font = 2, cex = .9, adj = .547, line = -4.9)
# mtext("Compulsory education--state-",  side = 1, font = 1, cex = .9, adj = .729, line = -4.9)
# mtext("wide",  side = 1, font = 1, cex = .9, adj = .605, line = -4)
# mtext("4",  side = 1, font = 2, cex = .9, adj = .568, line = -3.1)
# mtext("Eight or  nine hour  day for",  side = 1, font = 1, cex = .9, adj = .713, line = -3.1)
# mtext("women",  side = 1, font = 1, cex = .9, adj = .616, line = -2.2)
# mtext("5",  side = 1, font = 2, cex = .9, adj = .568, line = -1.3)
# mtext("Minimum wage",  side = 1, font = 1, cex = .9, adj = .652, line = -1.3)
# mtext("6",  side = 1, font = 2, cex = .9, adj = .568, line = -.4)
# mtext("Mothers' pensions",  side = 1, font = 1, cex = .9, adj = .668, line = -.4)
# mtext("7",  side = 1, font = 2, cex = .9, adj = .568, line = .5)
# mtext("Equal guardianship",  side = 1, font = 1, cex = .9, adj = .6735, line = .5)
# mtext("8",  side = 1, font = 2, cex = .9, adj = .568, line = 1.4)
# mtext("Age of consent, 18 years--",  side = 1, font = 1, cex = .9, adj = .7115, line = 1.4)
# mtext("chaste or unchaste",  side = 1, font = 1, cex = .9, adj = .672, line = 2.3)
# mtext("9",  side = 1, font = 2, cex = .9, adj = .568, line = 3.2)
# mtext("Red light abatement",  side = 1, font = 1, cex = .9, adj = .678, line = 3.2)
# mtext("10",  side = 1, font = 2, cex = .9, adj = .566, line = 4.1)
# mtext("Prohibition",  side = 1, font = 1, cex = .9, adj = .6316, line = 4.1)
# mtext("Note: Neither Illinois nor any of the Victory States of 1917",  side = 1, font = 1, cex = .634, adj = .5, line = 4.9)
# mtext("are included as full suffrage states in chart analysis",   side = 1, font = 1, cex = .634, adj = .5, line = 5.5)
dev.off()

#### FIGURE 2: REVEAL HIGHLIGHTED STATES ####


png(filename=here::here("important-legislation", "02_focus_states_unmasked.png"), width = 1285, height = 1200, pointsize=16)
par(mar = c(0,0,0,0))
# Start by defining rules for the circle, height of each track, degree the first cell is made at, and margins for tracks and the circle
circos.par(gap.degree = 0, cell.padding = c(0, 0, 0, 0),
           start.degree = 176, track.margin = c(0, 0), track.height = .035, circle.margin = c(.05,.05,.7,.15))
# Set number of sectors(factors) and x limits within each cell
circos.initialize(factors = c(1:48), xlim = c(-10,10))
# Next is 10 trackplotregion functions starting from the outside track and going in, each defining the color of every cell in the track
# Also circos.text functions, putting the numbers in the Wyoming cells
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","#212c1c"))
circos.text(labels = 10,sector.index = 48, track.index = 1,x=0,y=.5, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 9,sector.index = 48, track.index = 2,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","white","#212c1c","white","white","white","white"))
circos.text(labels = 8,sector.index = 48, track.index = 3,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","white","white","white","white","white","white"))
circos.text(labels = 7,sector.index = 48, track.index = 4,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 6,sector.index = 48, track.index = 5,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","white","#212c1c","white","#212c1c"))
circos.text(labels = 5,sector.index = 48, track.index = 6,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 4,sector.index = 48, track.index = 7,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","#212c1c","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 3,sector.index = 48, track.index = 8,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","white","white","white","white","white","white","#212c1c","white","white","#212c1c"))
circos.text(labels = 2,sector.index = 48, track.index = 9,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","#212c1c","#212c1c"))
circos.text(labels = 1,sector.index = 48, track.index = 10,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
# One extra track of blank cells, to provide some extra space between the state names and the cells
circos.track(ylim=c(0,3),bg.border=NA,track.height=.01, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
# Track with each individual state name going in the circle, and defining the direction they face, font and size
circos.trackText(x = rep(-4.8,48), y = rep(.1,48),
                 labels = c("","","","","",
                            "","","","","","",
                            "","","","","",
                            "","","","","",
                            "","","","","","","",
                            "","","","","","","",
                            "","","Nevada","Montana","Kansas",
                            "Arizona","Oregon","California","Washington",
                            "Utah","Idaho","Colorado","Wyoming"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .85, adj = 0,
                 facing = "reverse.clockwise")
# New track placing the lines going all around the circle
circos.track(ylim=c(0,3),bg.border=NA,track.height=.32, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11),panel.fun = function(x,y) {
  circos.axis(major.at = 10, labels = "",direction = "inside", major.tick.length = 7, lwd= 1.6)})
# Final track, with the years that went along with some states
circos.trackText(x = rep(-5.5,48), y = rep(0,48),
                 labels = c("","","","","","","","","","","","","","","","",
                            "","","","","","","","","","","","","","","","","","","",
                            "","","1914","1914","1912",
                            "1912","1912","1911","1910",
                            "1896","1896","1893","1869"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .52, adj = 0,
                 facing = "reverse.clockwise")
circos.track(ylim=c(0,3),bg.border=NA,track.height=.3, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
circos.clear()
# par(mar = c(0,1,7,0),cex=1.37)
# title("Important Legislation in the United States \nAffecting Women and Children", family = "Puritan")
# mtext("WHITE SPACES INDICATE GOOD LEGISLATION,\n BLACK SPACES POOR OR NO LEGISLATION,\n COLOR SPACES FULL SUFFRAGE STATES",
# par(mar = c(7.6,0,0,.5),cex=1)
#       side=1, font = 2, cex = 1.37, family = "Puritan", line = -2)
# par(mar = c(6.8,2,0,0))
# mtext("Circle 1",
#       side = 1, font = 2, cex = .9, adj = .227, line = -4.9)
# mtext("           2",side = 1, font = 2, cex = .9, adj = .23, line = -.3)
# mtext("Industrial Welfare Commis-",
#       side = 1, font = 1, cex = .9, adj = .343, line=-4.9)
# mtext("sion to regulate hours, wages",  side = 1, font = 1, cex = .9, adj = .351, line = -4)
# mtext("and working  conditions of",  side = 1, font = 1, cex = .9, adj = .342, line = -3.1)
# mtext("women and children",  side = 1, font = 1, cex = .9, adj = .3245, line = -2.2)
# mtext("Child Labor--14 year limit.",  side = 1, font = 1, cex = .9, adj = .339, line = -.4)
# mtext("Guarded  exemptions during",  side = 1, font = 1, cex = .9, adj = .348, line = .5)
# mtext("vacations are allowed and",  side = 1, font = 1, cex = .9, adj = .341, line = 1.4)
# mtext("poverty  exemptions  when",  side = 1, font = 1, cex = .9, adj = .343, line = 2.3)
# mtext("these are neutralized  by",  side = 1, font = 1, cex = .9, adj = .3375, line = 3.2)
# mtext("Mothers' Pensions laws",  side = 1, font = 1, cex = .9, adj = .3345, line = 4.1)
# mtext("Circle 3",  side = 1, font = 2, cex = .9, adj = .547, line = -4.9)
# mtext("Compulsory education--state-",  side = 1, font = 1, cex = .9, adj = .729, line = -4.9)
# mtext("wide",  side = 1, font = 1, cex = .9, adj = .605, line = -4)
# mtext("4",  side = 1, font = 2, cex = .9, adj = .568, line = -3.1)
# mtext("Eight or  nine hour  day for",  side = 1, font = 1, cex = .9, adj = .713, line = -3.1)
# mtext("women",  side = 1, font = 1, cex = .9, adj = .616, line = -2.2)
# mtext("5",  side = 1, font = 2, cex = .9, adj = .568, line = -1.3)
# mtext("Minimum wage",  side = 1, font = 1, cex = .9, adj = .652, line = -1.3)
# mtext("6",  side = 1, font = 2, cex = .9, adj = .568, line = -.4)
# mtext("Mothers' pensions",  side = 1, font = 1, cex = .9, adj = .668, line = -.4)
# mtext("7",  side = 1, font = 2, cex = .9, adj = .568, line = .5)
# mtext("Equal guardianship",  side = 1, font = 1, cex = .9, adj = .6735, line = .5)
# mtext("8",  side = 1, font = 2, cex = .9, adj = .568, line = 1.4)
# mtext("Age of consent, 18 years--",  side = 1, font = 1, cex = .9, adj = .7115, line = 1.4)
# mtext("chaste or unchaste",  side = 1, font = 1, cex = .9, adj = .672, line = 2.3)
# mtext("9",  side = 1, font = 2, cex = .9, adj = .568, line = 3.2)
# mtext("Red light abatement",  side = 1, font = 1, cex = .9, adj = .678, line = 3.2)
# mtext("10",  side = 1, font = 2, cex = .9, adj = .566, line = 4.1)
# mtext("Prohibition",  side = 1, font = 1, cex = .9, adj = .6316, line = 4.1)
# mtext("Note: Neither Illinois nor any of the Victory States of 1917",  side = 1, font = 1, cex = .634, adj = .5, line = 4.9)
# mtext("are included as full suffrage states in chart analysis",   side = 1, font = 1, cex = .634, adj = .5, line = 5.5)
dev.off()


#### FIGURE 3: REVEAL REST OF STATES ####



png(filename=here::here("important-legislation", "03_all_states_unmasked.png"), width = 1285, height = 1200, pointsize=16)
par(mar = c(0,0,0,0))
# Start by defining rules for the circle, height of each track, degree the first cell is made at, and margins for tracks and the circle
circos.par(gap.degree = 0, cell.padding = c(0, 0, 0, 0),
           start.degree = 176, track.margin = c(0, 0), track.height = .035, circle.margin = c(.05,.05,.7,.15))
# Set number of sectors(factors) and x limits within each cell
circos.initialize(factors = c(1:48), xlim = c(-10,10))
# Next is 10 trackplotregion functions starting from the outside track and going in, each defining the color of every cell in the track
# Also circos.text functions, putting the numbers in the Wyoming cells
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","#212c1c"))
circos.text(labels = 10,sector.index = 48, track.index = 1,x=0,y=.5, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 9,sector.index = 48, track.index = 2,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","white","#212c1c","white","white","white","white"))
circos.text(labels = 8,sector.index = 48, track.index = 3,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","white","white","white","white","white","white"))
circos.text(labels = 7,sector.index = 48, track.index = 4,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 6,sector.index = 48, track.index = 5,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","white","#212c1c","white","#212c1c"))
circos.text(labels = 5,sector.index = 48, track.index = 6,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 4,sector.index = 48, track.index = 7,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","#212c1c","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 3,sector.index = 48, track.index = 8,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","white","white","white","white","white","white","#212c1c","white","white","#212c1c"))
circos.text(labels = 2,sector.index = 48, track.index = 9,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","#212c1c","#212c1c"))
circos.text(labels = 1,sector.index = 48, track.index = 10,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
# One extra track of blank cells, to provide some extra space between the state names and the cells
circos.track(ylim=c(0,3),bg.border=NA,track.height=.01, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
# Track with each individual state name going in the circle, and defining the direction they face, font and size
circos.trackText(x = rep(-4.8,48), y = rep(.1,48),
                 labels = c("Alabama","Arkansas","Connecticut","Delaware","Florida",
                            "Georgia","Illinois","Indiana","Iowa","Kentucky","Louisiana",
                            "Maine","Maryland","Massachusetts","Michigan","Minnesota",
                            "Mississippi","Missouri","Nebraska","New Hampshire","New Jersey",
                            "New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Pennsylvania",
                            "Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Vermont","Virginia",
                            "West Virginia","Wisconsin","Nevada","Montana","Kansas",
                            "Arizona","Oregon","California","Washington",
                            "Utah","Idaho","Colorado","Wyoming"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .85, adj = 0,
                 facing = "reverse.clockwise")
# New track placing the lines going all around the circle
circos.track(ylim=c(0,3),bg.border=NA,track.height=.32, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11),panel.fun = function(x,y) {
  circos.axis(major.at = 10, labels = "",direction = "inside", major.tick.length = 7, lwd= 1.6)})
# Final track, with the years that went along with some states
circos.trackText(x = rep(-5.5,48), y = rep(0,48),
                 labels = c("","","","","","","","","","","","","","","","",
                            "","","","","","","","","","","","","","","","","","","",
                            "","","1914","1914","1912",
                            "1912","1912","1911","1910",
                            "1896","1896","1893","1869"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .52, adj = 0,
                 facing = "reverse.clockwise")
circos.track(ylim=c(0,3),bg.border=NA,track.height=.3, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
circos.clear()
# par(mar = c(0,1,7,0),cex=1.37)
# title("Important Legislation in the United States \nAffecting Women and Children", family = "Puritan")
# par(mar = c(7.6,0,0,.5),cex=1)
# mtext("WHITE SPACES INDICATE GOOD LEGISLATION,\n BLACK SPACES POOR OR NO LEGISLATION,\n COLOR SPACES FULL SUFFRAGE STATES",
#       side=1, font = 2, cex = 1.37, family = "Puritan", line = -2)
# par(mar = c(6.8,2,0,0))
# mtext("Circle 1",
#       side = 1, font = 2, cex = .9, adj = .227, line = -4.9)
# mtext("           2",side = 1, font = 2, cex = .9, adj = .23, line = -.3)
# mtext("Industrial Welfare Commis-",
#       side = 1, font = 1, cex = .9, adj = .343, line=-4.9)
# mtext("sion to regulate hours, wages",  side = 1, font = 1, cex = .9, adj = .351, line = -4)
# mtext("and working  conditions of",  side = 1, font = 1, cex = .9, adj = .342, line = -3.1)
# mtext("women and children",  side = 1, font = 1, cex = .9, adj = .3245, line = -2.2)
# mtext("Child Labor--14 year limit.",  side = 1, font = 1, cex = .9, adj = .339, line = -.4)
# mtext("Guarded  exemptions during",  side = 1, font = 1, cex = .9, adj = .348, line = .5)
# mtext("vacations are allowed and",  side = 1, font = 1, cex = .9, adj = .341, line = 1.4)
# mtext("poverty  exemptions  when",  side = 1, font = 1, cex = .9, adj = .343, line = 2.3)
# mtext("these are neutralized  by",  side = 1, font = 1, cex = .9, adj = .3375, line = 3.2)
# mtext("Mothers' Pensions laws",  side = 1, font = 1, cex = .9, adj = .3345, line = 4.1)
# mtext("Circle 3",  side = 1, font = 2, cex = .9, adj = .547, line = -4.9)
# mtext("Compulsory education--state-",  side = 1, font = 1, cex = .9, adj = .729, line = -4.9)
# mtext("wide",  side = 1, font = 1, cex = .9, adj = .605, line = -4)
# mtext("4",  side = 1, font = 2, cex = .9, adj = .568, line = -3.1)
# mtext("Eight or  nine hour  day for",  side = 1, font = 1, cex = .9, adj = .713, line = -3.1)
# mtext("women",  side = 1, font = 1, cex = .9, adj = .616, line = -2.2)
# mtext("5",  side = 1, font = 2, cex = .9, adj = .568, line = -1.3)
# mtext("Minimum wage",  side = 1, font = 1, cex = .9, adj = .652, line = -1.3)
# mtext("6",  side = 1, font = 2, cex = .9, adj = .568, line = -.4)
# mtext("Mothers' pensions",  side = 1, font = 1, cex = .9, adj = .668, line = -.4)
# mtext("7",  side = 1, font = 2, cex = .9, adj = .568, line = .5)
# mtext("Equal guardianship",  side = 1, font = 1, cex = .9, adj = .6735, line = .5)
# mtext("8",  side = 1, font = 2, cex = .9, adj = .568, line = 1.4)
# mtext("Age of consent, 18 years--",  side = 1, font = 1, cex = .9, adj = .7115, line = 1.4)
# mtext("chaste or unchaste",  side = 1, font = 1, cex = .9, adj = .672, line = 2.3)
# mtext("9",  side = 1, font = 2, cex = .9, adj = .568, line = 3.2)
# mtext("Red light abatement",  side = 1, font = 1, cex = .9, adj = .678, line = 3.2)
# mtext("10",  side = 1, font = 2, cex = .9, adj = .566, line = 4.1)
# mtext("Prohibition",  side = 1, font = 1, cex = .9, adj = .6316, line = 4.1)
# mtext("Note: Neither Illinois nor any of the Victory States of 1917",  side = 1, font = 1, cex = .634, adj = .5, line = 4.9)
# mtext("are included as full suffrage states in chart analysis",   side = 1, font = 1, cex = .634, adj = .5, line = 5.5)
dev.off()

#### FIGURE 4: NOTE REVEALED


png(filename=here::here("important-legislation", "04_note_unmasked.png"), width = 1285, height = 1200, pointsize=16)
par(mar = c(0,0,0,0))
# Start by defining rules for the circle, height of each track, degree the first cell is made at, and margins for tracks and the circle
circos.par(gap.degree = 0, cell.padding = c(0, 0, 0, 0),
           start.degree = 176, track.margin = c(0, 0), track.height = .035, circle.margin = c(.05,.05,.7,.15))
# Set number of sectors(factors) and x limits within each cell
circos.initialize(factors = c(1:48), xlim = c(-10,10))
# Next is 10 trackplotregion functions starting from the outside track and going in, each defining the color of every cell in the track
# Also circos.text functions, putting the numbers in the Wyoming cells
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","#212c1c"))
circos.text(labels = 10,sector.index = 48, track.index = 1,x=0,y=.5, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 9,sector.index = 48, track.index = 2,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","white","#212c1c","white","white","white","white"))
circos.text(labels = 8,sector.index = 48, track.index = 3,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","white","white","white","white","white","white"))
circos.text(labels = 7,sector.index = 48, track.index = 4,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 6,sector.index = 48, track.index = 5,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","white","#212c1c","white","#212c1c"))
circos.text(labels = 5,sector.index = 48, track.index = 6,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 4,sector.index = 48, track.index = 7,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","#212c1c","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 3,sector.index = 48, track.index = 8,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","white","white","white","white","white","white","#212c1c","white","white","#212c1c"))
circos.text(labels = 2,sector.index = 48, track.index = 9,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","#212c1c","#212c1c"))
circos.text(labels = 1,sector.index = 48, track.index = 10,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
# One extra track of blank cells, to provide some extra space between the state names and the cells
circos.track(ylim=c(0,3),bg.border=NA,track.height=.01, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
# Track with each individual state name going in the circle, and defining the direction they face, font and size
circos.trackText(x = rep(-4.8,48), y = rep(.1,48),
                 labels = c("Alabama","Arkansas","Connecticut","Delaware","Florida",
                            "Georgia","Illinois","Indiana","Iowa","Kentucky","Louisiana",
                            "Maine","Maryland","Massachusetts","Michigan","Minnesota",
                            "Mississippi","Missouri","Nebraska","New Hampshire","New Jersey",
                            "New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Pennsylvania",
                            "Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Vermont","Virginia",
                            "West Virginia","Wisconsin","Nevada","Montana","Kansas",
                            "Arizona","Oregon","California","Washington",
                            "Utah","Idaho","Colorado","Wyoming"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .85, adj = 0,
                 facing = "reverse.clockwise")
# New track placing the lines going all around the circle
circos.track(ylim=c(0,3),bg.border=NA,track.height=.32, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11),panel.fun = function(x,y) {
  circos.axis(major.at = 10, labels = "",direction = "inside", major.tick.length = 7, lwd= 1.6)})
# Final track, with the years that went along with some states
circos.trackText(x = rep(-5.5,48), y = rep(0,48),
                 labels = c("","","","","","","","","","","","","","","","",
                            "","","","","","","","","","","","","","","","","","","",
                            "","","1914","1914","1912",
                            "1912","1912","1911","1910",
                            "1896","1896","1893","1869"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .52, adj = 0,
                 facing = "reverse.clockwise")
circos.track(ylim=c(0,3),bg.border=NA,track.height=.3, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
circos.clear()
par(mar = c(0,1,7,0),cex=1.37)
# title("Important Legislation in the United States \nAffecting Women and Children", family = "Puritan")
par(mar = c(7.6,0,0,.5),cex=1)
# mtext("WHITE SPACES INDICATE GOOD LEGISLATION,\n BLACK SPACES POOR OR NO LEGISLATION,\n COLOR SPACES FULL SUFFRAGE STATES",
#       side=1, font = 2, cex = 1.37, family = "Puritan", line = -2)
par(mar = c(6.8,2,0,0))
# mtext("Circle 1",
#       side = 1, font = 2, cex = .9, adj = .227, line = -4.9)
# mtext("           2",side = 1, font = 2, cex = .9, adj = .23, line = -.3)
# mtext("Industrial Welfare Commis-",
#       side = 1, font = 1, cex = .9, adj = .343, line=-4.9)
# mtext("sion to regulate hours, wages",  side = 1, font = 1, cex = .9, adj = .351, line = -4)
# mtext("and working  conditions of",  side = 1, font = 1, cex = .9, adj = .342, line = -3.1)
# mtext("women and children",  side = 1, font = 1, cex = .9, adj = .3245, line = -2.2)
# mtext("Child Labor--14 year limit.",  side = 1, font = 1, cex = .9, adj = .339, line = -.4)
# mtext("Guarded  exemptions during",  side = 1, font = 1, cex = .9, adj = .348, line = .5)
# mtext("vacations are allowed and",  side = 1, font = 1, cex = .9, adj = .341, line = 1.4)
# mtext("poverty  exemptions  when",  side = 1, font = 1, cex = .9, adj = .343, line = 2.3)
# mtext("these are neutralized  by",  side = 1, font = 1, cex = .9, adj = .3375, line = 3.2)
# mtext("Mothers' Pensions laws",  side = 1, font = 1, cex = .9, adj = .3345, line = 4.1)
# mtext("Circle 3",  side = 1, font = 2, cex = .9, adj = .547, line = -4.9)
# mtext("Compulsory education--state-",  side = 1, font = 1, cex = .9, adj = .729, line = -4.9)
# mtext("wide",  side = 1, font = 1, cex = .9, adj = .605, line = -4)
# mtext("4",  side = 1, font = 2, cex = .9, adj = .568, line = -3.1)
# mtext("Eight or  nine hour  day for",  side = 1, font = 1, cex = .9, adj = .713, line = -3.1)
# mtext("women",  side = 1, font = 1, cex = .9, adj = .616, line = -2.2)
# mtext("5",  side = 1, font = 2, cex = .9, adj = .568, line = -1.3)
# mtext("Minimum wage",  side = 1, font = 1, cex = .9, adj = .652, line = -1.3)
# mtext("6",  side = 1, font = 2, cex = .9, adj = .568, line = -.4)
# mtext("Mothers' pensions",  side = 1, font = 1, cex = .9, adj = .668, line = -.4)
# mtext("7",  side = 1, font = 2, cex = .9, adj = .568, line = .5)
# mtext("Equal guardianship",  side = 1, font = 1, cex = .9, adj = .6735, line = .5)
# mtext("8",  side = 1, font = 2, cex = .9, adj = .568, line = 1.4)
# mtext("Age of consent, 18 years--",  side = 1, font = 1, cex = .9, adj = .7115, line = 1.4)
# mtext("chaste or unchaste",  side = 1, font = 1, cex = .9, adj = .672, line = 2.3)
# mtext("9",  side = 1, font = 2, cex = .9, adj = .568, line = 3.2)
# mtext("Red light abatement",  side = 1, font = 1, cex = .9, adj = .678, line = 3.2)
# mtext("10",  side = 1, font = 2, cex = .9, adj = .566, line = 4.1)
# mtext("Prohibition",  side = 1, font = 1, cex = .9, adj = .6316, line = 4.1)
mtext("Note: Neither Illinois nor any of the Victory States of 1917",  side = 1, font = 1, cex = .634, adj = .5, line = 4.9)
mtext("are included as full suffrage states in chart analysis",   side = 1, font = 1, cex = .634, adj = .5, line = 5.5)
dev.off()


#### FIGURE 5: LEGEND REVEALED ####


png(filename=here::here("important-legislation", "05_legend_unmasked.png"), width = 1285, height = 1200, pointsize=16)
par(mar = c(0,0,0,0))
# Start by defining rules for the circle, height of each track, degree the first cell is made at, and margins for tracks and the circle
circos.par(gap.degree = 0, cell.padding = c(0, 0, 0, 0),
           start.degree = 176, track.margin = c(0, 0), track.height = .035, circle.margin = c(.05,.05,.7,.15))
# Set number of sectors(factors) and x limits within each cell
circos.initialize(factors = c(1:48), xlim = c(-10,10))
# Next is 10 trackplotregion functions starting from the outside track and going in, each defining the color of every cell in the track
# Also circos.text functions, putting the numbers in the Wyoming cells
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","#212c1c"))
circos.text(labels = 10,sector.index = 48, track.index = 1,x=0,y=.5, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 9,sector.index = 48, track.index = 2,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","white","#212c1c","white","white","white","white"))
circos.text(labels = 8,sector.index = 48, track.index = 3,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","white","white","white","white","white","white"))
circos.text(labels = 7,sector.index = 48, track.index = 4,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 6,sector.index = 48, track.index = 5,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","white","#212c1c","white","#212c1c"))
circos.text(labels = 5,sector.index = 48, track.index = 6,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 4,sector.index = 48, track.index = 7,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","#212c1c","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 3,sector.index = 48, track.index = 8,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","white","white","white","white","white","white","#212c1c","white","white","#212c1c"))
circos.text(labels = 2,sector.index = 48, track.index = 9,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","#212c1c","#212c1c"))
circos.text(labels = 1,sector.index = 48, track.index = 10,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
# One extra track of blank cells, to provide some extra space between the state names and the cells
circos.track(ylim=c(0,3),bg.border=NA,track.height=.01, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
# Track with each individual state name going in the circle, and defining the direction they face, font and size
circos.trackText(x = rep(-4.8,48), y = rep(.1,48),
                 labels = c("Alabama","Arkansas","Connecticut","Delaware","Florida",
                            "Georgia","Illinois","Indiana","Iowa","Kentucky","Louisiana",
                            "Maine","Maryland","Massachusetts","Michigan","Minnesota",
                            "Mississippi","Missouri","Nebraska","New Hampshire","New Jersey",
                            "New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Pennsylvania",
                            "Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Vermont","Virginia",
                            "West Virginia","Wisconsin","Nevada","Montana","Kansas",
                            "Arizona","Oregon","California","Washington",
                            "Utah","Idaho","Colorado","Wyoming"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .85, adj = 0,
                 facing = "reverse.clockwise")
# New track placing the lines going all around the circle
circos.track(ylim=c(0,3),bg.border=NA,track.height=.32, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11),panel.fun = function(x,y) {
  circos.axis(major.at = 10, labels = "",direction = "inside", major.tick.length = 7, lwd= 1.6)})
# Final track, with the years that went along with some states
circos.trackText(x = rep(-5.5,48), y = rep(0,48),
                 labels = c("","","","","","","","","","","","","","","","",
                            "","","","","","","","","","","","","","","","","","","",
                            "","","1914","1914","1912",
                            "1912","1912","1911","1910",
                            "1896","1896","1893","1869"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .52, adj = 0,
                 facing = "reverse.clockwise")
circos.track(ylim=c(0,3),bg.border=NA,track.height=.3, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
circos.clear()
par(mar = c(0,1,7,0),cex=1.37)
# title("Important Legislation in the United States \nAffecting Women and Children", family = "Puritan")
par(mar = c(7.6,0,0,.5),cex=1)
mtext("WHITE SPACES INDICATE GOOD LEGISLATION,\n BLACK SPACES POOR OR NO LEGISLATION,\n COLOR SPACES FULL SUFFRAGE STATES",
      side=1, font = 2, cex = 1.37, family = "Puritan", line = -2)
par(mar = c(6.8,2,0,0))
# mtext("Circle 1",
#       side = 1, font = 2, cex = .9, adj = .227, line = -4.9)
# mtext("           2",side = 1, font = 2, cex = .9, adj = .23, line = -.3)
# mtext("Industrial Welfare Commis-",
#       side = 1, font = 1, cex = .9, adj = .343, line=-4.9)
# mtext("sion to regulate hours, wages",  side = 1, font = 1, cex = .9, adj = .351, line = -4)
# mtext("and working  conditions of",  side = 1, font = 1, cex = .9, adj = .342, line = -3.1)
# mtext("women and children",  side = 1, font = 1, cex = .9, adj = .3245, line = -2.2)
# mtext("Child Labor--14 year limit.",  side = 1, font = 1, cex = .9, adj = .339, line = -.4)
# mtext("Guarded  exemptions during",  side = 1, font = 1, cex = .9, adj = .348, line = .5)
# mtext("vacations are allowed and",  side = 1, font = 1, cex = .9, adj = .341, line = 1.4)
# mtext("poverty  exemptions  when",  side = 1, font = 1, cex = .9, adj = .343, line = 2.3)
# mtext("these are neutralized  by",  side = 1, font = 1, cex = .9, adj = .3375, line = 3.2)
# mtext("Mothers' Pensions laws",  side = 1, font = 1, cex = .9, adj = .3345, line = 4.1)
# mtext("Circle 3",  side = 1, font = 2, cex = .9, adj = .547, line = -4.9)
# mtext("Compulsory education--state-",  side = 1, font = 1, cex = .9, adj = .729, line = -4.9)
# mtext("wide",  side = 1, font = 1, cex = .9, adj = .605, line = -4)
# mtext("4",  side = 1, font = 2, cex = .9, adj = .568, line = -3.1)
# mtext("Eight or  nine hour  day for",  side = 1, font = 1, cex = .9, adj = .713, line = -3.1)
# mtext("women",  side = 1, font = 1, cex = .9, adj = .616, line = -2.2)
# mtext("5",  side = 1, font = 2, cex = .9, adj = .568, line = -1.3)
# mtext("Minimum wage",  side = 1, font = 1, cex = .9, adj = .652, line = -1.3)
# mtext("6",  side = 1, font = 2, cex = .9, adj = .568, line = -.4)
# mtext("Mothers' pensions",  side = 1, font = 1, cex = .9, adj = .668, line = -.4)
# mtext("7",  side = 1, font = 2, cex = .9, adj = .568, line = .5)
# mtext("Equal guardianship",  side = 1, font = 1, cex = .9, adj = .6735, line = .5)
# mtext("8",  side = 1, font = 2, cex = .9, adj = .568, line = 1.4)
# mtext("Age of consent, 18 years--",  side = 1, font = 1, cex = .9, adj = .7115, line = 1.4)
# mtext("chaste or unchaste",  side = 1, font = 1, cex = .9, adj = .672, line = 2.3)
# mtext("9",  side = 1, font = 2, cex = .9, adj = .568, line = 3.2)
# mtext("Red light abatement",  side = 1, font = 1, cex = .9, adj = .678, line = 3.2)
# mtext("10",  side = 1, font = 2, cex = .9, adj = .566, line = 4.1)
# mtext("Prohibition",  side = 1, font = 1, cex = .9, adj = .6316, line = 4.1)
mtext("Note: Neither Illinois nor any of the Victory States of 1917",  side = 1, font = 1, cex = .634, adj = .5, line = 4.9)
mtext("are included as full suffrage states in chart analysis",   side = 1, font = 1, cex = .634, adj = .5, line = 5.5)
dev.off()


#### FIGURE 6: CIRCLE ONE NOTE REVEALED ####



png(filename=here::here("important-legislation", "06_circle1_unmasked.png"), width = 1285, height = 1200, pointsize=16)
par(mar = c(0,0,0,0))
# Start by defining rules for the circle, height of each track, degree the first cell is made at, and margins for tracks and the circle
circos.par(gap.degree = 0, cell.padding = c(0, 0, 0, 0),
           start.degree = 176, track.margin = c(0, 0), track.height = .035, circle.margin = c(.05,.05,.7,.15))
# Set number of sectors(factors) and x limits within each cell
circos.initialize(factors = c(1:48), xlim = c(-10,10))
# Next is 10 trackplotregion functions starting from the outside track and going in, each defining the color of every cell in the track
# Also circos.text functions, putting the numbers in the Wyoming cells
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","#212c1c"))
circos.text(labels = 10,sector.index = 48, track.index = 1,x=0,y=.5, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 9,sector.index = 48, track.index = 2,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","white","#212c1c","white","white","white","white"))
circos.text(labels = 8,sector.index = 48, track.index = 3,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","white","white","white","white","white","white"))
circos.text(labels = 7,sector.index = 48, track.index = 4,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 6,sector.index = 48, track.index = 5,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","white","#212c1c","white","#212c1c"))
circos.text(labels = 5,sector.index = 48, track.index = 6,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 4,sector.index = 48, track.index = 7,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","#212c1c","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 3,sector.index = 48, track.index = 8,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","white","white","white","white","white","white","#212c1c","white","white","#212c1c"))
circos.text(labels = 2,sector.index = 48, track.index = 9,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","#212c1c","#212c1c"))
circos.text(labels = 1,sector.index = 48, track.index = 10,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
# One extra track of blank cells, to provide some extra space between the state names and the cells
circos.track(ylim=c(0,3),bg.border=NA,track.height=.01, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
# Track with each individual state name going in the circle, and defining the direction they face, font and size
circos.trackText(x = rep(-4.8,48), y = rep(.1,48),
                 labels = c("Alabama","Arkansas","Connecticut","Delaware","Florida",
                            "Georgia","Illinois","Indiana","Iowa","Kentucky","Louisiana",
                            "Maine","Maryland","Massachusetts","Michigan","Minnesota",
                            "Mississippi","Missouri","Nebraska","New Hampshire","New Jersey",
                            "New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Pennsylvania",
                            "Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Vermont","Virginia",
                            "West Virginia","Wisconsin","Nevada","Montana","Kansas",
                            "Arizona","Oregon","California","Washington",
                            "Utah","Idaho","Colorado","Wyoming"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .85, adj = 0,
                 facing = "reverse.clockwise")
# New track placing the lines going all around the circle
circos.track(ylim=c(0,3),bg.border=NA,track.height=.32, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11),panel.fun = function(x,y) {
  circos.axis(major.at = 10, labels = "",direction = "inside", major.tick.length = 7, lwd= 1.6)})
# Final track, with the years that went along with some states
circos.trackText(x = rep(-5.5,48), y = rep(0,48),
                 labels = c("","","","","","","","","","","","","","","","",
                            "","","","","","","","","","","","","","","","","","","",
                            "","","1914","1914","1912",
                            "1912","1912","1911","1910",
                            "1896","1896","1893","1869"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .52, adj = 0,
                 facing = "reverse.clockwise")
circos.track(ylim=c(0,3),bg.border=NA,track.height=.3, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
circos.clear()
par(mar = c(0,1,7,0),cex=1.37)
# title("Important Legislation in the United States \nAffecting Women and Children", family = "Puritan")
par(mar = c(7.6,0,0,.5),cex=1)
mtext("WHITE SPACES INDICATE GOOD LEGISLATION,\n BLACK SPACES POOR OR NO LEGISLATION,\n COLOR SPACES FULL SUFFRAGE STATES",
      side=1, font = 2, cex = 1.37, family = "Puritan", line = -2)
par(mar = c(6.8,2,0,0))
mtext("Circle 1",
      side = 1, font = 2, cex = .9, adj = .227, line = -4.9)
# mtext("           2",side = 1, font = 2, cex = .9, adj = .23, line = -.3)
mtext("Industrial Welfare Commis-",
      side = 1, font = 1, cex = .9, adj = .343, line=-4.9)
mtext("sion to regulate hours, wages",  side = 1, font = 1, cex = .9, adj = .351, line = -4)
mtext("and working  conditions of",  side = 1, font = 1, cex = .9, adj = .342, line = -3.1)
mtext("women and children",  side = 1, font = 1, cex = .9, adj = .3245, line = -2.2)
# mtext("Child Labor--14 year limit.",  side = 1, font = 1, cex = .9, adj = .339, line = -.4)
# mtext("Guarded  exemptions during",  side = 1, font = 1, cex = .9, adj = .348, line = .5)
# mtext("vacations are allowed and",  side = 1, font = 1, cex = .9, adj = .341, line = 1.4)
# mtext("poverty  exemptions  when",  side = 1, font = 1, cex = .9, adj = .343, line = 2.3)
# mtext("these are neutralized  by",  side = 1, font = 1, cex = .9, adj = .3375, line = 3.2)
# mtext("Mothers' Pensions laws",  side = 1, font = 1, cex = .9, adj = .3345, line = 4.1)
# mtext("Circle 3",  side = 1, font = 2, cex = .9, adj = .547, line = -4.9)
# mtext("Compulsory education--state-",  side = 1, font = 1, cex = .9, adj = .729, line = -4.9)
# mtext("wide",  side = 1, font = 1, cex = .9, adj = .605, line = -4)
# mtext("4",  side = 1, font = 2, cex = .9, adj = .568, line = -3.1)
# mtext("Eight or  nine hour  day for",  side = 1, font = 1, cex = .9, adj = .713, line = -3.1)
# mtext("women",  side = 1, font = 1, cex = .9, adj = .616, line = -2.2)
# mtext("5",  side = 1, font = 2, cex = .9, adj = .568, line = -1.3)
# mtext("Minimum wage",  side = 1, font = 1, cex = .9, adj = .652, line = -1.3)
# mtext("6",  side = 1, font = 2, cex = .9, adj = .568, line = -.4)
# mtext("Mothers' pensions",  side = 1, font = 1, cex = .9, adj = .668, line = -.4)
# mtext("7",  side = 1, font = 2, cex = .9, adj = .568, line = .5)
# mtext("Equal guardianship",  side = 1, font = 1, cex = .9, adj = .6735, line = .5)
# mtext("8",  side = 1, font = 2, cex = .9, adj = .568, line = 1.4)
# mtext("Age of consent, 18 years--",  side = 1, font = 1, cex = .9, adj = .7115, line = 1.4)
# mtext("chaste or unchaste",  side = 1, font = 1, cex = .9, adj = .672, line = 2.3)
# mtext("9",  side = 1, font = 2, cex = .9, adj = .568, line = 3.2)
# mtext("Red light abatement",  side = 1, font = 1, cex = .9, adj = .678, line = 3.2)
# mtext("10",  side = 1, font = 2, cex = .9, adj = .566, line = 4.1)
# mtext("Prohibition",  side = 1, font = 1, cex = .9, adj = .6316, line = 4.1)
mtext("Note: Neither Illinois nor any of the Victory States of 1917",  side = 1, font = 1, cex = .634, adj = .5, line = 4.9)
mtext("are included as full suffrage states in chart analysis",   side = 1, font = 1, cex = .634, adj = .5, line = 5.5)
dev.off()


#### FIGURE 7: CIRCLE 2 REVEALED ####



png(filename=here::here("important-legislation", "07_circle2_unmasked.png"), width = 1285, height = 1200, pointsize=16)
par(mar = c(0,0,0,0))
# Start by defining rules for the circle, height of each track, degree the first cell is made at, and margins for tracks and the circle
circos.par(gap.degree = 0, cell.padding = c(0, 0, 0, 0),
           start.degree = 176, track.margin = c(0, 0), track.height = .035, circle.margin = c(.05,.05,.7,.15))
# Set number of sectors(factors) and x limits within each cell
circos.initialize(factors = c(1:48), xlim = c(-10,10))
# Next is 10 trackplotregion functions starting from the outside track and going in, each defining the color of every cell in the track
# Also circos.text functions, putting the numbers in the Wyoming cells
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","#212c1c"))
circos.text(labels = 10,sector.index = 48, track.index = 1,x=0,y=.5, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 9,sector.index = 48, track.index = 2,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","white","#212c1c","white","white","white","white"))
circos.text(labels = 8,sector.index = 48, track.index = 3,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","white","white","white","white","white","white"))
circos.text(labels = 7,sector.index = 48, track.index = 4,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 6,sector.index = 48, track.index = 5,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","white","#212c1c","white","#212c1c"))
circos.text(labels = 5,sector.index = 48, track.index = 6,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 4,sector.index = 48, track.index = 7,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","#212c1c","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 3,sector.index = 48, track.index = 8,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","white","white","white","white","white","white","#212c1c","white","white","#212c1c"))
circos.text(labels = 2,sector.index = 48, track.index = 9,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","#212c1c","#212c1c"))
circos.text(labels = 1,sector.index = 48, track.index = 10,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
# One extra track of blank cells, to provide some extra space between the state names and the cells
circos.track(ylim=c(0,3),bg.border=NA,track.height=.01, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
# Track with each individual state name going in the circle, and defining the direction they face, font and size
circos.trackText(x = rep(-4.8,48), y = rep(.1,48),
                 labels = c("Alabama","Arkansas","Connecticut","Delaware","Florida",
                            "Georgia","Illinois","Indiana","Iowa","Kentucky","Louisiana",
                            "Maine","Maryland","Massachusetts","Michigan","Minnesota",
                            "Mississippi","Missouri","Nebraska","New Hampshire","New Jersey",
                            "New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Pennsylvania",
                            "Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Vermont","Virginia",
                            "West Virginia","Wisconsin","Nevada","Montana","Kansas",
                            "Arizona","Oregon","California","Washington",
                            "Utah","Idaho","Colorado","Wyoming"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .85, adj = 0,
                 facing = "reverse.clockwise")
# New track placing the lines going all around the circle
circos.track(ylim=c(0,3),bg.border=NA,track.height=.32, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11),panel.fun = function(x,y) {
  circos.axis(major.at = 10, labels = "",direction = "inside", major.tick.length = 7, lwd= 1.6)})
# Final track, with the years that went along with some states
circos.trackText(x = rep(-5.5,48), y = rep(0,48),
                 labels = c("","","","","","","","","","","","","","","","",
                            "","","","","","","","","","","","","","","","","","","",
                            "","","1914","1914","1912",
                            "1912","1912","1911","1910",
                            "1896","1896","1893","1869"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .52, adj = 0,
                 facing = "reverse.clockwise")
circos.track(ylim=c(0,3),bg.border=NA,track.height=.3, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
circos.clear()
par(mar = c(0,1,7,0),cex=1.37)
# title("Important Legislation in the United States \nAffecting Women and Children", family = "Puritan")
par(mar = c(7.6,0,0,.5),cex=1)
mtext("WHITE SPACES INDICATE GOOD LEGISLATION,\n BLACK SPACES POOR OR NO LEGISLATION,\n COLOR SPACES FULL SUFFRAGE STATES",
      side=1, font = 2, cex = 1.37, family = "Puritan", line = -2)
par(mar = c(6.8,2,0,0))
mtext("Circle 1",
      side = 1, font = 2, cex = .9, adj = .227, line = -4.9)
mtext("           2",side = 1, font = 2, cex = .9, adj = .23, line = -.3)
mtext("Industrial Welfare Commis-",
      side = 1, font = 1, cex = .9, adj = .343, line=-4.9)
mtext("sion to regulate hours, wages",  side = 1, font = 1, cex = .9, adj = .351, line = -4)
mtext("and working  conditions of",  side = 1, font = 1, cex = .9, adj = .342, line = -3.1)
mtext("women and children",  side = 1, font = 1, cex = .9, adj = .3245, line = -2.2)
mtext("Child Labor--14 year limit.",  side = 1, font = 1, cex = .9, adj = .339, line = -.4)
mtext("Guarded  exemptions during",  side = 1, font = 1, cex = .9, adj = .348, line = .5)
mtext("vacations are allowed and",  side = 1, font = 1, cex = .9, adj = .341, line = 1.4)
mtext("poverty  exemptions  when",  side = 1, font = 1, cex = .9, adj = .343, line = 2.3)
mtext("these are neutralized  by",  side = 1, font = 1, cex = .9, adj = .3375, line = 3.2)
mtext("Mothers' Pensions laws",  side = 1, font = 1, cex = .9, adj = .3345, line = 4.1)
# mtext("Circle 3",  side = 1, font = 2, cex = .9, adj = .547, line = -4.9)
# mtext("Compulsory education--state-",  side = 1, font = 1, cex = .9, adj = .729, line = -4.9)
# mtext("wide",  side = 1, font = 1, cex = .9, adj = .605, line = -4)
# mtext("4",  side = 1, font = 2, cex = .9, adj = .568, line = -3.1)
# mtext("Eight or  nine hour  day for",  side = 1, font = 1, cex = .9, adj = .713, line = -3.1)
# mtext("women",  side = 1, font = 1, cex = .9, adj = .616, line = -2.2)
# mtext("5",  side = 1, font = 2, cex = .9, adj = .568, line = -1.3)
# mtext("Minimum wage",  side = 1, font = 1, cex = .9, adj = .652, line = -1.3)
# mtext("6",  side = 1, font = 2, cex = .9, adj = .568, line = -.4)
# mtext("Mothers' pensions",  side = 1, font = 1, cex = .9, adj = .668, line = -.4)
# mtext("7",  side = 1, font = 2, cex = .9, adj = .568, line = .5)
# mtext("Equal guardianship",  side = 1, font = 1, cex = .9, adj = .6735, line = .5)
# mtext("8",  side = 1, font = 2, cex = .9, adj = .568, line = 1.4)
# mtext("Age of consent, 18 years--",  side = 1, font = 1, cex = .9, adj = .7115, line = 1.4)
# mtext("chaste or unchaste",  side = 1, font = 1, cex = .9, adj = .672, line = 2.3)
# mtext("9",  side = 1, font = 2, cex = .9, adj = .568, line = 3.2)
# mtext("Red light abatement",  side = 1, font = 1, cex = .9, adj = .678, line = 3.2)
# mtext("10",  side = 1, font = 2, cex = .9, adj = .566, line = 4.1)
# mtext("Prohibition",  side = 1, font = 1, cex = .9, adj = .6316, line = 4.1)
mtext("Note: Neither Illinois nor any of the Victory States of 1917",  side = 1, font = 1, cex = .634, adj = .5, line = 4.9)
mtext("are included as full suffrage states in chart analysis",   side = 1, font = 1, cex = .634, adj = .5, line = 5.5)
dev.off()


#### FIGURE 8: CIRCLE 3 UNMASKED ####



png(filename=here::here("important-legislation", "08_circle3_unmasked.png"), width = 1285, height = 1200, pointsize=16)
par(mar = c(0,0,0,0))
# Start by defining rules for the circle, height of each track, degree the first cell is made at, and margins for tracks and the circle
circos.par(gap.degree = 0, cell.padding = c(0, 0, 0, 0),
           start.degree = 176, track.margin = c(0, 0), track.height = .035, circle.margin = c(.05,.05,.7,.15))
# Set number of sectors(factors) and x limits within each cell
circos.initialize(factors = c(1:48), xlim = c(-10,10))
# Next is 10 trackplotregion functions starting from the outside track and going in, each defining the color of every cell in the track
# Also circos.text functions, putting the numbers in the Wyoming cells
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","#212c1c"))
circos.text(labels = 10,sector.index = 48, track.index = 1,x=0,y=.5, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 9,sector.index = 48, track.index = 2,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","white","#212c1c","white","white","white","white"))
circos.text(labels = 8,sector.index = 48, track.index = 3,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","white","white","white","white","white","white"))
circos.text(labels = 7,sector.index = 48, track.index = 4,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 6,sector.index = 48, track.index = 5,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","white","#212c1c","white","#212c1c"))
circos.text(labels = 5,sector.index = 48, track.index = 6,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 4,sector.index = 48, track.index = 7,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","#212c1c","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 3,sector.index = 48, track.index = 8,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","white","white","white","white","white","white","#212c1c","white","white","#212c1c"))
circos.text(labels = 2,sector.index = 48, track.index = 9,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","#212c1c","#212c1c"))
circos.text(labels = 1,sector.index = 48, track.index = 10,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
# One extra track of blank cells, to provide some extra space between the state names and the cells
circos.track(ylim=c(0,3),bg.border=NA,track.height=.01, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
# Track with each individual state name going in the circle, and defining the direction they face, font and size
circos.trackText(x = rep(-4.8,48), y = rep(.1,48),
                 labels = c("Alabama","Arkansas","Connecticut","Delaware","Florida",
                            "Georgia","Illinois","Indiana","Iowa","Kentucky","Louisiana",
                            "Maine","Maryland","Massachusetts","Michigan","Minnesota",
                            "Mississippi","Missouri","Nebraska","New Hampshire","New Jersey",
                            "New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Pennsylvania",
                            "Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Vermont","Virginia",
                            "West Virginia","Wisconsin","Nevada","Montana","Kansas",
                            "Arizona","Oregon","California","Washington",
                            "Utah","Idaho","Colorado","Wyoming"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .85, adj = 0,
                 facing = "reverse.clockwise")
# New track placing the lines going all around the circle
circos.track(ylim=c(0,3),bg.border=NA,track.height=.32, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11),panel.fun = function(x,y) {
  circos.axis(major.at = 10, labels = "",direction = "inside", major.tick.length = 7, lwd= 1.6)})
# Final track, with the years that went along with some states
circos.trackText(x = rep(-5.5,48), y = rep(0,48),
                 labels = c("","","","","","","","","","","","","","","","",
                            "","","","","","","","","","","","","","","","","","","",
                            "","","1914","1914","1912",
                            "1912","1912","1911","1910",
                            "1896","1896","1893","1869"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .52, adj = 0,
                 facing = "reverse.clockwise")
circos.track(ylim=c(0,3),bg.border=NA,track.height=.3, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
circos.clear()
par(mar = c(0,1,7,0),cex=1.37)
# title("Important Legislation in the United States \nAffecting Women and Children", family = "Puritan")
par(mar = c(7.6,0,0,.5),cex=1)
mtext("WHITE SPACES INDICATE GOOD LEGISLATION,\n BLACK SPACES POOR OR NO LEGISLATION,\n COLOR SPACES FULL SUFFRAGE STATES",
      side=1, font = 2, cex = 1.37, family = "Puritan", line = -2)
par(mar = c(6.8,2,0,0))
mtext("Circle 1",
      side = 1, font = 2, cex = .9, adj = .227, line = -4.9)
mtext("           2",side = 1, font = 2, cex = .9, adj = .23, line = -.3)
mtext("Industrial Welfare Commis-",
      side = 1, font = 1, cex = .9, adj = .343, line=-4.9)
mtext("sion to regulate hours, wages",  side = 1, font = 1, cex = .9, adj = .351, line = -4)
mtext("and working  conditions of",  side = 1, font = 1, cex = .9, adj = .342, line = -3.1)
mtext("women and children",  side = 1, font = 1, cex = .9, adj = .3245, line = -2.2)
mtext("Child Labor--14 year limit.",  side = 1, font = 1, cex = .9, adj = .339, line = -.4)
mtext("Guarded  exemptions during",  side = 1, font = 1, cex = .9, adj = .348, line = .5)
mtext("vacations are allowed and",  side = 1, font = 1, cex = .9, adj = .341, line = 1.4)
mtext("poverty  exemptions  when",  side = 1, font = 1, cex = .9, adj = .343, line = 2.3)
mtext("these are neutralized  by",  side = 1, font = 1, cex = .9, adj = .3375, line = 3.2)
mtext("Mothers' Pensions laws",  side = 1, font = 1, cex = .9, adj = .3345, line = 4.1)
mtext("Circle 3",  side = 1, font = 2, cex = .9, adj = .547, line = -4.9)
mtext("Compulsory education--state-",  side = 1, font = 1, cex = .9, adj = .729, line = -4.9)
mtext("wide",  side = 1, font = 1, cex = .9, adj = .605, line = -4)
# mtext("4",  side = 1, font = 2, cex = .9, adj = .568, line = -3.1)
# mtext("Eight or  nine hour  day for",  side = 1, font = 1, cex = .9, adj = .713, line = -3.1)
# mtext("women",  side = 1, font = 1, cex = .9, adj = .616, line = -2.2)
# mtext("5",  side = 1, font = 2, cex = .9, adj = .568, line = -1.3)
# mtext("Minimum wage",  side = 1, font = 1, cex = .9, adj = .652, line = -1.3)
# mtext("6",  side = 1, font = 2, cex = .9, adj = .568, line = -.4)
# mtext("Mothers' pensions",  side = 1, font = 1, cex = .9, adj = .668, line = -.4)
# mtext("7",  side = 1, font = 2, cex = .9, adj = .568, line = .5)
# mtext("Equal guardianship",  side = 1, font = 1, cex = .9, adj = .6735, line = .5)
# mtext("8",  side = 1, font = 2, cex = .9, adj = .568, line = 1.4)
# mtext("Age of consent, 18 years--",  side = 1, font = 1, cex = .9, adj = .7115, line = 1.4)
# mtext("chaste or unchaste",  side = 1, font = 1, cex = .9, adj = .672, line = 2.3)
# mtext("9",  side = 1, font = 2, cex = .9, adj = .568, line = 3.2)
# mtext("Red light abatement",  side = 1, font = 1, cex = .9, adj = .678, line = 3.2)
# mtext("10",  side = 1, font = 2, cex = .9, adj = .566, line = 4.1)
# mtext("Prohibition",  side = 1, font = 1, cex = .9, adj = .6316, line = 4.1)
mtext("Note: Neither Illinois nor any of the Victory States of 1917",  side = 1, font = 1, cex = .634, adj = .5, line = 4.9)
mtext("are included as full suffrage states in chart analysis",   side = 1, font = 1, cex = .634, adj = .5, line = 5.5)
dev.off()


#### FIGURE 9: CIRCLE 4 UNMASKED ####

png(filename=here::here("important-legislation", "09_circle4_unmasked.png"), width = 1285, height = 1200, pointsize=16)
par(mar = c(0,0,0,0))
# Start by defining rules for the circle, height of each track, degree the first cell is made at, and margins for tracks and the circle
circos.par(gap.degree = 0, cell.padding = c(0, 0, 0, 0),
           start.degree = 176, track.margin = c(0, 0), track.height = .035, circle.margin = c(.05,.05,.7,.15))
# Set number of sectors(factors) and x limits within each cell
circos.initialize(factors = c(1:48), xlim = c(-10,10))
# Next is 10 trackplotregion functions starting from the outside track and going in, each defining the color of every cell in the track
# Also circos.text functions, putting the numbers in the Wyoming cells
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","#212c1c"))
circos.text(labels = 10,sector.index = 48, track.index = 1,x=0,y=.5, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 9,sector.index = 48, track.index = 2,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","white","#212c1c","white","white","white","white"))
circos.text(labels = 8,sector.index = 48, track.index = 3,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","white","white","white","white","white","white"))
circos.text(labels = 7,sector.index = 48, track.index = 4,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 6,sector.index = 48, track.index = 5,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","white","#212c1c","white","#212c1c"))
circos.text(labels = 5,sector.index = 48, track.index = 6,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 4,sector.index = 48, track.index = 7,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","#212c1c","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 3,sector.index = 48, track.index = 8,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","white","white","white","white","white","white","#212c1c","white","white","#212c1c"))
circos.text(labels = 2,sector.index = 48, track.index = 9,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","#212c1c","#212c1c"))
circos.text(labels = 1,sector.index = 48, track.index = 10,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
# One extra track of blank cells, to provide some extra space between the state names and the cells
circos.track(ylim=c(0,3),bg.border=NA,track.height=.01, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
# Track with each individual state name going in the circle, and defining the direction they face, font and size
circos.trackText(x = rep(-4.8,48), y = rep(.1,48),
                 labels = c("Alabama","Arkansas","Connecticut","Delaware","Florida",
                            "Georgia","Illinois","Indiana","Iowa","Kentucky","Louisiana",
                            "Maine","Maryland","Massachusetts","Michigan","Minnesota",
                            "Mississippi","Missouri","Nebraska","New Hampshire","New Jersey",
                            "New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Pennsylvania",
                            "Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Vermont","Virginia",
                            "West Virginia","Wisconsin","Nevada","Montana","Kansas",
                            "Arizona","Oregon","California","Washington",
                            "Utah","Idaho","Colorado","Wyoming"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .85, adj = 0,
                 facing = "reverse.clockwise")
# New track placing the lines going all around the circle
circos.track(ylim=c(0,3),bg.border=NA,track.height=.32, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11),panel.fun = function(x,y) {
  circos.axis(major.at = 10, labels = "",direction = "inside", major.tick.length = 7, lwd= 1.6)})
# Final track, with the years that went along with some states
circos.trackText(x = rep(-5.5,48), y = rep(0,48),
                 labels = c("","","","","","","","","","","","","","","","",
                            "","","","","","","","","","","","","","","","","","","",
                            "","","1914","1914","1912",
                            "1912","1912","1911","1910",
                            "1896","1896","1893","1869"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .52, adj = 0,
                 facing = "reverse.clockwise")
circos.track(ylim=c(0,3),bg.border=NA,track.height=.3, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
circos.clear()
par(mar = c(0,1,7,0),cex=1.37)
# title("Important Legislation in the United States \nAffecting Women and Children", family = "Puritan")
par(mar = c(7.6,0,0,.5),cex=1)
mtext("WHITE SPACES INDICATE GOOD LEGISLATION,\n BLACK SPACES POOR OR NO LEGISLATION,\n COLOR SPACES FULL SUFFRAGE STATES",
      side=1, font = 2, cex = 1.37, family = "Puritan", line = -2)
par(mar = c(6.8,2,0,0))
mtext("Circle 1",
      side = 1, font = 2, cex = .9, adj = .227, line = -4.9)
mtext("           2",side = 1, font = 2, cex = .9, adj = .23, line = -.3)
mtext("Industrial Welfare Commis-",
      side = 1, font = 1, cex = .9, adj = .343, line=-4.9)
mtext("sion to regulate hours, wages",  side = 1, font = 1, cex = .9, adj = .351, line = -4)
mtext("and working  conditions of",  side = 1, font = 1, cex = .9, adj = .342, line = -3.1)
mtext("women and children",  side = 1, font = 1, cex = .9, adj = .3245, line = -2.2)
mtext("Child Labor--14 year limit.",  side = 1, font = 1, cex = .9, adj = .339, line = -.4)
mtext("Guarded  exemptions during",  side = 1, font = 1, cex = .9, adj = .348, line = .5)
mtext("vacations are allowed and",  side = 1, font = 1, cex = .9, adj = .341, line = 1.4)
mtext("poverty  exemptions  when",  side = 1, font = 1, cex = .9, adj = .343, line = 2.3)
mtext("these are neutralized  by",  side = 1, font = 1, cex = .9, adj = .3375, line = 3.2)
mtext("Mothers' Pensions laws",  side = 1, font = 1, cex = .9, adj = .3345, line = 4.1)
mtext("Circle 3",  side = 1, font = 2, cex = .9, adj = .547, line = -4.9)
mtext("Compulsory education--state-",  side = 1, font = 1, cex = .9, adj = .729, line = -4.9)
mtext("wide",  side = 1, font = 1, cex = .9, adj = .605, line = -4)
mtext("4",  side = 1, font = 2, cex = .9, adj = .568, line = -3.1)
mtext("Eight or  nine hour  day for",  side = 1, font = 1, cex = .9, adj = .713, line = -3.1)
mtext("women",  side = 1, font = 1, cex = .9, adj = .616, line = -2.2)
# mtext("5",  side = 1, font = 2, cex = .9, adj = .568, line = -1.3)
# mtext("Minimum wage",  side = 1, font = 1, cex = .9, adj = .652, line = -1.3)
# mtext("6",  side = 1, font = 2, cex = .9, adj = .568, line = -.4)
# mtext("Mothers' pensions",  side = 1, font = 1, cex = .9, adj = .668, line = -.4)
# mtext("7",  side = 1, font = 2, cex = .9, adj = .568, line = .5)
# mtext("Equal guardianship",  side = 1, font = 1, cex = .9, adj = .6735, line = .5)
# mtext("8",  side = 1, font = 2, cex = .9, adj = .568, line = 1.4)
# mtext("Age of consent, 18 years--",  side = 1, font = 1, cex = .9, adj = .7115, line = 1.4)
# mtext("chaste or unchaste",  side = 1, font = 1, cex = .9, adj = .672, line = 2.3)
# mtext("9",  side = 1, font = 2, cex = .9, adj = .568, line = 3.2)
# mtext("Red light abatement",  side = 1, font = 1, cex = .9, adj = .678, line = 3.2)
# mtext("10",  side = 1, font = 2, cex = .9, adj = .566, line = 4.1)
# mtext("Prohibition",  side = 1, font = 1, cex = .9, adj = .6316, line = 4.1)
mtext("Note: Neither Illinois nor any of the Victory States of 1917",  side = 1, font = 1, cex = .634, adj = .5, line = 4.9)
mtext("are included as full suffrage states in chart analysis",   side = 1, font = 1, cex = .634, adj = .5, line = 5.5)
dev.off()


#### FIGURE 10: CIRCLE 5 REVEALED ####

png(filename=here::here("important-legislation", "10_circle5_unmasked.png"), width = 1285, height = 1200, pointsize=16)
par(mar = c(0,0,0,0))
# Start by defining rules for the circle, height of each track, degree the first cell is made at, and margins for tracks and the circle
circos.par(gap.degree = 0, cell.padding = c(0, 0, 0, 0),
           start.degree = 176, track.margin = c(0, 0), track.height = .035, circle.margin = c(.05,.05,.7,.15))
# Set number of sectors(factors) and x limits within each cell
circos.initialize(factors = c(1:48), xlim = c(-10,10))
# Next is 10 trackplotregion functions starting from the outside track and going in, each defining the color of every cell in the track
# Also circos.text functions, putting the numbers in the Wyoming cells
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","#212c1c"))
circos.text(labels = 10,sector.index = 48, track.index = 1,x=0,y=.5, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 9,sector.index = 48, track.index = 2,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","white","#212c1c","white","white","white","white"))
circos.text(labels = 8,sector.index = 48, track.index = 3,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","white","white","white","white","white","white"))
circos.text(labels = 7,sector.index = 48, track.index = 4,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 6,sector.index = 48, track.index = 5,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","white","#212c1c","white","#212c1c"))
circos.text(labels = 5,sector.index = 48, track.index = 6,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 4,sector.index = 48, track.index = 7,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","#212c1c","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 3,sector.index = 48, track.index = 8,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","white","white","white","white","white","white","#212c1c","white","white","#212c1c"))
circos.text(labels = 2,sector.index = 48, track.index = 9,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","#212c1c","#212c1c"))
circos.text(labels = 1,sector.index = 48, track.index = 10,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
# One extra track of blank cells, to provide some extra space between the state names and the cells
circos.track(ylim=c(0,3),bg.border=NA,track.height=.01, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
# Track with each individual state name going in the circle, and defining the direction they face, font and size
circos.trackText(x = rep(-4.8,48), y = rep(.1,48),
                 labels = c("Alabama","Arkansas","Connecticut","Delaware","Florida",
                            "Georgia","Illinois","Indiana","Iowa","Kentucky","Louisiana",
                            "Maine","Maryland","Massachusetts","Michigan","Minnesota",
                            "Mississippi","Missouri","Nebraska","New Hampshire","New Jersey",
                            "New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Pennsylvania",
                            "Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Vermont","Virginia",
                            "West Virginia","Wisconsin","Nevada","Montana","Kansas",
                            "Arizona","Oregon","California","Washington",
                            "Utah","Idaho","Colorado","Wyoming"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .85, adj = 0,
                 facing = "reverse.clockwise")
# New track placing the lines going all around the circle
circos.track(ylim=c(0,3),bg.border=NA,track.height=.32, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11),panel.fun = function(x,y) {
  circos.axis(major.at = 10, labels = "",direction = "inside", major.tick.length = 7, lwd= 1.6)})
# Final track, with the years that went along with some states
circos.trackText(x = rep(-5.5,48), y = rep(0,48),
                 labels = c("","","","","","","","","","","","","","","","",
                            "","","","","","","","","","","","","","","","","","","",
                            "","","1914","1914","1912",
                            "1912","1912","1911","1910",
                            "1896","1896","1893","1869"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .52, adj = 0,
                 facing = "reverse.clockwise")
circos.track(ylim=c(0,3),bg.border=NA,track.height=.3, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
circos.clear()
par(mar = c(0,1,7,0),cex=1.37)
# title("Important Legislation in the United States \nAffecting Women and Children", family = "Puritan")
par(mar = c(7.6,0,0,.5),cex=1)
mtext("WHITE SPACES INDICATE GOOD LEGISLATION,\n BLACK SPACES POOR OR NO LEGISLATION,\n COLOR SPACES FULL SUFFRAGE STATES",
      side=1, font = 2, cex = 1.37, family = "Puritan", line = -2)
par(mar = c(6.8,2,0,0))
mtext("Circle 1",
      side = 1, font = 2, cex = .9, adj = .227, line = -4.9)
mtext("           2",side = 1, font = 2, cex = .9, adj = .23, line = -.3)
mtext("Industrial Welfare Commis-",
      side = 1, font = 1, cex = .9, adj = .343, line=-4.9)
mtext("sion to regulate hours, wages",  side = 1, font = 1, cex = .9, adj = .351, line = -4)
mtext("and working  conditions of",  side = 1, font = 1, cex = .9, adj = .342, line = -3.1)
mtext("women and children",  side = 1, font = 1, cex = .9, adj = .3245, line = -2.2)
mtext("Child Labor--14 year limit.",  side = 1, font = 1, cex = .9, adj = .339, line = -.4)
mtext("Guarded  exemptions during",  side = 1, font = 1, cex = .9, adj = .348, line = .5)
mtext("vacations are allowed and",  side = 1, font = 1, cex = .9, adj = .341, line = 1.4)
mtext("poverty  exemptions  when",  side = 1, font = 1, cex = .9, adj = .343, line = 2.3)
mtext("these are neutralized  by",  side = 1, font = 1, cex = .9, adj = .3375, line = 3.2)
mtext("Mothers' Pensions laws",  side = 1, font = 1, cex = .9, adj = .3345, line = 4.1)
mtext("Circle 3",  side = 1, font = 2, cex = .9, adj = .547, line = -4.9)
mtext("Compulsory education--state-",  side = 1, font = 1, cex = .9, adj = .729, line = -4.9)
mtext("wide",  side = 1, font = 1, cex = .9, adj = .605, line = -4)
mtext("4",  side = 1, font = 2, cex = .9, adj = .568, line = -3.1)
mtext("Eight or  nine hour  day for",  side = 1, font = 1, cex = .9, adj = .713, line = -3.1)
mtext("women",  side = 1, font = 1, cex = .9, adj = .616, line = -2.2)
mtext("5",  side = 1, font = 2, cex = .9, adj = .568, line = -1.3)
mtext("Minimum wage",  side = 1, font = 1, cex = .9, adj = .652, line = -1.3)
# mtext("6",  side = 1, font = 2, cex = .9, adj = .568, line = -.4)
# mtext("Mothers' pensions",  side = 1, font = 1, cex = .9, adj = .668, line = -.4)
# mtext("7",  side = 1, font = 2, cex = .9, adj = .568, line = .5)
# mtext("Equal guardianship",  side = 1, font = 1, cex = .9, adj = .6735, line = .5)
# mtext("8",  side = 1, font = 2, cex = .9, adj = .568, line = 1.4)
# mtext("Age of consent, 18 years--",  side = 1, font = 1, cex = .9, adj = .7115, line = 1.4)
# mtext("chaste or unchaste",  side = 1, font = 1, cex = .9, adj = .672, line = 2.3)
# mtext("9",  side = 1, font = 2, cex = .9, adj = .568, line = 3.2)
# mtext("Red light abatement",  side = 1, font = 1, cex = .9, adj = .678, line = 3.2)
# mtext("10",  side = 1, font = 2, cex = .9, adj = .566, line = 4.1)
# mtext("Prohibition",  side = 1, font = 1, cex = .9, adj = .6316, line = 4.1)
mtext("Note: Neither Illinois nor any of the Victory States of 1917",  side = 1, font = 1, cex = .634, adj = .5, line = 4.9)
mtext("are included as full suffrage states in chart analysis",   side = 1, font = 1, cex = .634, adj = .5, line = 5.5)
dev.off()


#### FIGURE 11: CIRCLE 6 UNMASKED ####

png(filename=here::here("important-legislation", "11_circle6_unmasked.png"), width = 1285, height = 1200, pointsize=16)
par(mar = c(0,0,0,0))
# Start by defining rules for the circle, height of each track, degree the first cell is made at, and margins for tracks and the circle
circos.par(gap.degree = 0, cell.padding = c(0, 0, 0, 0),
           start.degree = 176, track.margin = c(0, 0), track.height = .035, circle.margin = c(.05,.05,.7,.15))
# Set number of sectors(factors) and x limits within each cell
circos.initialize(factors = c(1:48), xlim = c(-10,10))
# Next is 10 trackplotregion functions starting from the outside track and going in, each defining the color of every cell in the track
# Also circos.text functions, putting the numbers in the Wyoming cells
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","#212c1c"))
circos.text(labels = 10,sector.index = 48, track.index = 1,x=0,y=.5, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 9,sector.index = 48, track.index = 2,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","white","#212c1c","white","white","white","white"))
circos.text(labels = 8,sector.index = 48, track.index = 3,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","white","white","white","white","white","white"))
circos.text(labels = 7,sector.index = 48, track.index = 4,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 6,sector.index = 48, track.index = 5,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","white","#212c1c","white","#212c1c"))
circos.text(labels = 5,sector.index = 48, track.index = 6,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 4,sector.index = 48, track.index = 7,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","#212c1c","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 3,sector.index = 48, track.index = 8,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","white","white","white","white","white","white","#212c1c","white","white","#212c1c"))
circos.text(labels = 2,sector.index = 48, track.index = 9,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","#212c1c","#212c1c"))
circos.text(labels = 1,sector.index = 48, track.index = 10,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
# One extra track of blank cells, to provide some extra space between the state names and the cells
circos.track(ylim=c(0,3),bg.border=NA,track.height=.01, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
# Track with each individual state name going in the circle, and defining the direction they face, font and size
circos.trackText(x = rep(-4.8,48), y = rep(.1,48),
                 labels = c("Alabama","Arkansas","Connecticut","Delaware","Florida",
                            "Georgia","Illinois","Indiana","Iowa","Kentucky","Louisiana",
                            "Maine","Maryland","Massachusetts","Michigan","Minnesota",
                            "Mississippi","Missouri","Nebraska","New Hampshire","New Jersey",
                            "New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Pennsylvania",
                            "Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Vermont","Virginia",
                            "West Virginia","Wisconsin","Nevada","Montana","Kansas",
                            "Arizona","Oregon","California","Washington",
                            "Utah","Idaho","Colorado","Wyoming"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .85, adj = 0,
                 facing = "reverse.clockwise")
# New track placing the lines going all around the circle
circos.track(ylim=c(0,3),bg.border=NA,track.height=.32, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11),panel.fun = function(x,y) {
  circos.axis(major.at = 10, labels = "",direction = "inside", major.tick.length = 7, lwd= 1.6)})
# Final track, with the years that went along with some states
circos.trackText(x = rep(-5.5,48), y = rep(0,48),
                 labels = c("","","","","","","","","","","","","","","","",
                            "","","","","","","","","","","","","","","","","","","",
                            "","","1914","1914","1912",
                            "1912","1912","1911","1910",
                            "1896","1896","1893","1869"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .52, adj = 0,
                 facing = "reverse.clockwise")
circos.track(ylim=c(0,3),bg.border=NA,track.height=.3, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
circos.clear()
par(mar = c(0,1,7,0),cex=1.37)
# title("Important Legislation in the United States \nAffecting Women and Children", family = "Puritan")
par(mar = c(7.6,0,0,.5),cex=1)
mtext("WHITE SPACES INDICATE GOOD LEGISLATION,\n BLACK SPACES POOR OR NO LEGISLATION,\n COLOR SPACES FULL SUFFRAGE STATES",
      side=1, font = 2, cex = 1.37, family = "Puritan", line = -2)
par(mar = c(6.8,2,0,0))
mtext("Circle 1",
      side = 1, font = 2, cex = .9, adj = .227, line = -4.9)
mtext("           2",side = 1, font = 2, cex = .9, adj = .23, line = -.3)
mtext("Industrial Welfare Commis-",
      side = 1, font = 1, cex = .9, adj = .343, line=-4.9)
mtext("sion to regulate hours, wages",  side = 1, font = 1, cex = .9, adj = .351, line = -4)
mtext("and working  conditions of",  side = 1, font = 1, cex = .9, adj = .342, line = -3.1)
mtext("women and children",  side = 1, font = 1, cex = .9, adj = .3245, line = -2.2)
mtext("Child Labor--14 year limit.",  side = 1, font = 1, cex = .9, adj = .339, line = -.4)
mtext("Guarded  exemptions during",  side = 1, font = 1, cex = .9, adj = .348, line = .5)
mtext("vacations are allowed and",  side = 1, font = 1, cex = .9, adj = .341, line = 1.4)
mtext("poverty  exemptions  when",  side = 1, font = 1, cex = .9, adj = .343, line = 2.3)
mtext("these are neutralized  by",  side = 1, font = 1, cex = .9, adj = .3375, line = 3.2)
mtext("Mothers' Pensions laws",  side = 1, font = 1, cex = .9, adj = .3345, line = 4.1)
mtext("Circle 3",  side = 1, font = 2, cex = .9, adj = .547, line = -4.9)
mtext("Compulsory education--state-",  side = 1, font = 1, cex = .9, adj = .729, line = -4.9)
mtext("wide",  side = 1, font = 1, cex = .9, adj = .605, line = -4)
mtext("4",  side = 1, font = 2, cex = .9, adj = .568, line = -3.1)
mtext("Eight or  nine hour  day for",  side = 1, font = 1, cex = .9, adj = .713, line = -3.1)
mtext("women",  side = 1, font = 1, cex = .9, adj = .616, line = -2.2)
mtext("5",  side = 1, font = 2, cex = .9, adj = .568, line = -1.3)
mtext("Minimum wage",  side = 1, font = 1, cex = .9, adj = .652, line = -1.3)
mtext("6",  side = 1, font = 2, cex = .9, adj = .568, line = -.4)
mtext("Mothers' pensions",  side = 1, font = 1, cex = .9, adj = .668, line = -.4)
# mtext("7",  side = 1, font = 2, cex = .9, adj = .568, line = .5)
# mtext("Equal guardianship",  side = 1, font = 1, cex = .9, adj = .6735, line = .5)
# mtext("8",  side = 1, font = 2, cex = .9, adj = .568, line = 1.4)
# mtext("Age of consent, 18 years--",  side = 1, font = 1, cex = .9, adj = .7115, line = 1.4)
# mtext("chaste or unchaste",  side = 1, font = 1, cex = .9, adj = .672, line = 2.3)
# mtext("9",  side = 1, font = 2, cex = .9, adj = .568, line = 3.2)
# mtext("Red light abatement",  side = 1, font = 1, cex = .9, adj = .678, line = 3.2)
# mtext("10",  side = 1, font = 2, cex = .9, adj = .566, line = 4.1)
# mtext("Prohibition",  side = 1, font = 1, cex = .9, adj = .6316, line = 4.1)
mtext("Note: Neither Illinois nor any of the Victory States of 1917",  side = 1, font = 1, cex = .634, adj = .5, line = 4.9)
mtext("are included as full suffrage states in chart analysis",   side = 1, font = 1, cex = .634, adj = .5, line = 5.5)
dev.off()


#### FIGURE 12: CIRCLE 7 REVEALED ####


png(filename=here::here("important-legislation", "12_circle7_unmasked.png"), width = 1285, height = 1200, pointsize=16)
par(mar = c(0,0,0,0))
# Start by defining rules for the circle, height of each track, degree the first cell is made at, and margins for tracks and the circle
circos.par(gap.degree = 0, cell.padding = c(0, 0, 0, 0),
           start.degree = 176, track.margin = c(0, 0), track.height = .035, circle.margin = c(.05,.05,.7,.15))
# Set number of sectors(factors) and x limits within each cell
circos.initialize(factors = c(1:48), xlim = c(-10,10))
# Next is 10 trackplotregion functions starting from the outside track and going in, each defining the color of every cell in the track
# Also circos.text functions, putting the numbers in the Wyoming cells
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","#212c1c"))
circos.text(labels = 10,sector.index = 48, track.index = 1,x=0,y=.5, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 9,sector.index = 48, track.index = 2,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","white","#212c1c","white","white","white","white"))
circos.text(labels = 8,sector.index = 48, track.index = 3,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","white","white","white","white","white","white"))
circos.text(labels = 7,sector.index = 48, track.index = 4,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 6,sector.index = 48, track.index = 5,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","white","#212c1c","white","#212c1c"))
circos.text(labels = 5,sector.index = 48, track.index = 6,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 4,sector.index = 48, track.index = 7,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","#212c1c","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 3,sector.index = 48, track.index = 8,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","white","white","white","white","white","white","#212c1c","white","white","#212c1c"))
circos.text(labels = 2,sector.index = 48, track.index = 9,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","#212c1c","#212c1c"))
circos.text(labels = 1,sector.index = 48, track.index = 10,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
# One extra track of blank cells, to provide some extra space between the state names and the cells
circos.track(ylim=c(0,3),bg.border=NA,track.height=.01, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
# Track with each individual state name going in the circle, and defining the direction they face, font and size
circos.trackText(x = rep(-4.8,48), y = rep(.1,48),
                 labels = c("Alabama","Arkansas","Connecticut","Delaware","Florida",
                            "Georgia","Illinois","Indiana","Iowa","Kentucky","Louisiana",
                            "Maine","Maryland","Massachusetts","Michigan","Minnesota",
                            "Mississippi","Missouri","Nebraska","New Hampshire","New Jersey",
                            "New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Pennsylvania",
                            "Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Vermont","Virginia",
                            "West Virginia","Wisconsin","Nevada","Montana","Kansas",
                            "Arizona","Oregon","California","Washington",
                            "Utah","Idaho","Colorado","Wyoming"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .85, adj = 0,
                 facing = "reverse.clockwise")
# New track placing the lines going all around the circle
circos.track(ylim=c(0,3),bg.border=NA,track.height=.32, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11),panel.fun = function(x,y) {
  circos.axis(major.at = 10, labels = "",direction = "inside", major.tick.length = 7, lwd= 1.6)})
# Final track, with the years that went along with some states
circos.trackText(x = rep(-5.5,48), y = rep(0,48),
                 labels = c("","","","","","","","","","","","","","","","",
                            "","","","","","","","","","","","","","","","","","","",
                            "","","1914","1914","1912",
                            "1912","1912","1911","1910",
                            "1896","1896","1893","1869"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .52, adj = 0,
                 facing = "reverse.clockwise")
circos.track(ylim=c(0,3),bg.border=NA,track.height=.3, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
circos.clear()
par(mar = c(0,1,7,0),cex=1.37)
# title("Important Legislation in the United States \nAffecting Women and Children", family = "Puritan")
par(mar = c(7.6,0,0,.5),cex=1)
mtext("WHITE SPACES INDICATE GOOD LEGISLATION,\n BLACK SPACES POOR OR NO LEGISLATION,\n COLOR SPACES FULL SUFFRAGE STATES",
      side=1, font = 2, cex = 1.37, family = "Puritan", line = -2)
par(mar = c(6.8,2,0,0))
mtext("Circle 1",
      side = 1, font = 2, cex = .9, adj = .227, line = -4.9)
mtext("           2",side = 1, font = 2, cex = .9, adj = .23, line = -.3)
mtext("Industrial Welfare Commis-",
      side = 1, font = 1, cex = .9, adj = .343, line=-4.9)
mtext("sion to regulate hours, wages",  side = 1, font = 1, cex = .9, adj = .351, line = -4)
mtext("and working  conditions of",  side = 1, font = 1, cex = .9, adj = .342, line = -3.1)
mtext("women and children",  side = 1, font = 1, cex = .9, adj = .3245, line = -2.2)
mtext("Child Labor--14 year limit.",  side = 1, font = 1, cex = .9, adj = .339, line = -.4)
mtext("Guarded  exemptions during",  side = 1, font = 1, cex = .9, adj = .348, line = .5)
mtext("vacations are allowed and",  side = 1, font = 1, cex = .9, adj = .341, line = 1.4)
mtext("poverty  exemptions  when",  side = 1, font = 1, cex = .9, adj = .343, line = 2.3)
mtext("these are neutralized  by",  side = 1, font = 1, cex = .9, adj = .3375, line = 3.2)
mtext("Mothers' Pensions laws",  side = 1, font = 1, cex = .9, adj = .3345, line = 4.1)
mtext("Circle 3",  side = 1, font = 2, cex = .9, adj = .547, line = -4.9)
mtext("Compulsory education--state-",  side = 1, font = 1, cex = .9, adj = .729, line = -4.9)
mtext("wide",  side = 1, font = 1, cex = .9, adj = .605, line = -4)
mtext("4",  side = 1, font = 2, cex = .9, adj = .568, line = -3.1)
mtext("Eight or  nine hour  day for",  side = 1, font = 1, cex = .9, adj = .713, line = -3.1)
mtext("women",  side = 1, font = 1, cex = .9, adj = .616, line = -2.2)
mtext("5",  side = 1, font = 2, cex = .9, adj = .568, line = -1.3)
mtext("Minimum wage",  side = 1, font = 1, cex = .9, adj = .652, line = -1.3)
mtext("6",  side = 1, font = 2, cex = .9, adj = .568, line = -.4)
mtext("Mothers' pensions",  side = 1, font = 1, cex = .9, adj = .668, line = -.4)
mtext("7",  side = 1, font = 2, cex = .9, adj = .568, line = .5)
mtext("Equal guardianship",  side = 1, font = 1, cex = .9, adj = .6735, line = .5)
# mtext("8",  side = 1, font = 2, cex = .9, adj = .568, line = 1.4)
# mtext("Age of consent, 18 years--",  side = 1, font = 1, cex = .9, adj = .7115, line = 1.4)
# mtext("chaste or unchaste",  side = 1, font = 1, cex = .9, adj = .672, line = 2.3)
# mtext("9",  side = 1, font = 2, cex = .9, adj = .568, line = 3.2)
# mtext("Red light abatement",  side = 1, font = 1, cex = .9, adj = .678, line = 3.2)
# mtext("10",  side = 1, font = 2, cex = .9, adj = .566, line = 4.1)
# mtext("Prohibition",  side = 1, font = 1, cex = .9, adj = .6316, line = 4.1)
mtext("Note: Neither Illinois nor any of the Victory States of 1917",  side = 1, font = 1, cex = .634, adj = .5, line = 4.9)
mtext("are included as full suffrage states in chart analysis",   side = 1, font = 1, cex = .634, adj = .5, line = 5.5)
dev.off()


#### FIGURE 13: CIRCLE 8 UNMASKED ####

png(filename=here::here("important-legislation", "13_circle8_unmasked.png"), width = 1285, height = 1200, pointsize=16)
par(mar = c(0,0,0,0))
# Start by defining rules for the circle, height of each track, degree the first cell is made at, and margins for tracks and the circle
circos.par(gap.degree = 0, cell.padding = c(0, 0, 0, 0),
           start.degree = 176, track.margin = c(0, 0), track.height = .035, circle.margin = c(.05,.05,.7,.15))
# Set number of sectors(factors) and x limits within each cell
circos.initialize(factors = c(1:48), xlim = c(-10,10))
# Next is 10 trackplotregion functions starting from the outside track and going in, each defining the color of every cell in the track
# Also circos.text functions, putting the numbers in the Wyoming cells
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","#212c1c"))
circos.text(labels = 10,sector.index = 48, track.index = 1,x=0,y=.5, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 9,sector.index = 48, track.index = 2,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","white","#212c1c","white","white","white","white"))
circos.text(labels = 8,sector.index = 48, track.index = 3,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","white","white","white","white","white","white"))
circos.text(labels = 7,sector.index = 48, track.index = 4,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 6,sector.index = 48, track.index = 5,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","white","#212c1c","white","#212c1c"))
circos.text(labels = 5,sector.index = 48, track.index = 6,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 4,sector.index = 48, track.index = 7,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","#212c1c","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 3,sector.index = 48, track.index = 8,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","white","white","white","white","white","white","#212c1c","white","white","#212c1c"))
circos.text(labels = 2,sector.index = 48, track.index = 9,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","#212c1c","#212c1c"))
circos.text(labels = 1,sector.index = 48, track.index = 10,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
# One extra track of blank cells, to provide some extra space between the state names and the cells
circos.track(ylim=c(0,3),bg.border=NA,track.height=.01, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
# Track with each individual state name going in the circle, and defining the direction they face, font and size
circos.trackText(x = rep(-4.8,48), y = rep(.1,48),
                 labels = c("Alabama","Arkansas","Connecticut","Delaware","Florida",
                            "Georgia","Illinois","Indiana","Iowa","Kentucky","Louisiana",
                            "Maine","Maryland","Massachusetts","Michigan","Minnesota",
                            "Mississippi","Missouri","Nebraska","New Hampshire","New Jersey",
                            "New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Pennsylvania",
                            "Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Vermont","Virginia",
                            "West Virginia","Wisconsin","Nevada","Montana","Kansas",
                            "Arizona","Oregon","California","Washington",
                            "Utah","Idaho","Colorado","Wyoming"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .85, adj = 0,
                 facing = "reverse.clockwise")
# New track placing the lines going all around the circle
circos.track(ylim=c(0,3),bg.border=NA,track.height=.32, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11),panel.fun = function(x,y) {
  circos.axis(major.at = 10, labels = "",direction = "inside", major.tick.length = 7, lwd= 1.6)})
# Final track, with the years that went along with some states
circos.trackText(x = rep(-5.5,48), y = rep(0,48),
                 labels = c("","","","","","","","","","","","","","","","",
                            "","","","","","","","","","","","","","","","","","","",
                            "","","1914","1914","1912",
                            "1912","1912","1911","1910",
                            "1896","1896","1893","1869"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .52, adj = 0,
                 facing = "reverse.clockwise")
circos.track(ylim=c(0,3),bg.border=NA,track.height=.3, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
circos.clear()
par(mar = c(0,1,7,0),cex=1.37)
# title("Important Legislation in the United States \nAffecting Women and Children", family = "Puritan")
par(mar = c(7.6,0,0,.5),cex=1)
mtext("WHITE SPACES INDICATE GOOD LEGISLATION,\n BLACK SPACES POOR OR NO LEGISLATION,\n COLOR SPACES FULL SUFFRAGE STATES",
      side=1, font = 2, cex = 1.37, family = "Puritan", line = -2)
par(mar = c(6.8,2,0,0))
mtext("Circle 1",
      side = 1, font = 2, cex = .9, adj = .227, line = -4.9)
mtext("           2",side = 1, font = 2, cex = .9, adj = .23, line = -.3)
mtext("Industrial Welfare Commis-",
      side = 1, font = 1, cex = .9, adj = .343, line=-4.9)
mtext("sion to regulate hours, wages",  side = 1, font = 1, cex = .9, adj = .351, line = -4)
mtext("and working  conditions of",  side = 1, font = 1, cex = .9, adj = .342, line = -3.1)
mtext("women and children",  side = 1, font = 1, cex = .9, adj = .3245, line = -2.2)
mtext("Child Labor--14 year limit.",  side = 1, font = 1, cex = .9, adj = .339, line = -.4)
mtext("Guarded  exemptions during",  side = 1, font = 1, cex = .9, adj = .348, line = .5)
mtext("vacations are allowed and",  side = 1, font = 1, cex = .9, adj = .341, line = 1.4)
mtext("poverty  exemptions  when",  side = 1, font = 1, cex = .9, adj = .343, line = 2.3)
mtext("these are neutralized  by",  side = 1, font = 1, cex = .9, adj = .3375, line = 3.2)
mtext("Mothers' Pensions laws",  side = 1, font = 1, cex = .9, adj = .3345, line = 4.1)
mtext("Circle 3",  side = 1, font = 2, cex = .9, adj = .547, line = -4.9)
mtext("Compulsory education--state-",  side = 1, font = 1, cex = .9, adj = .729, line = -4.9)
mtext("wide",  side = 1, font = 1, cex = .9, adj = .605, line = -4)
mtext("4",  side = 1, font = 2, cex = .9, adj = .568, line = -3.1)
mtext("Eight or  nine hour  day for",  side = 1, font = 1, cex = .9, adj = .713, line = -3.1)
mtext("women",  side = 1, font = 1, cex = .9, adj = .616, line = -2.2)
mtext("5",  side = 1, font = 2, cex = .9, adj = .568, line = -1.3)
mtext("Minimum wage",  side = 1, font = 1, cex = .9, adj = .652, line = -1.3)
mtext("6",  side = 1, font = 2, cex = .9, adj = .568, line = -.4)
mtext("Mothers' pensions",  side = 1, font = 1, cex = .9, adj = .668, line = -.4)
mtext("7",  side = 1, font = 2, cex = .9, adj = .568, line = .5)
mtext("Equal guardianship",  side = 1, font = 1, cex = .9, adj = .6735, line = .5)
mtext("8",  side = 1, font = 2, cex = .9, adj = .568, line = 1.4)
mtext("Age of consent, 18 years--",  side = 1, font = 1, cex = .9, adj = .7115, line = 1.4)
mtext("chaste or unchaste",  side = 1, font = 1, cex = .9, adj = .672, line = 2.3)
# mtext("9",  side = 1, font = 2, cex = .9, adj = .568, line = 3.2)
# mtext("Red light abatement",  side = 1, font = 1, cex = .9, adj = .678, line = 3.2)
# mtext("10",  side = 1, font = 2, cex = .9, adj = .566, line = 4.1)
# mtext("Prohibition",  side = 1, font = 1, cex = .9, adj = .6316, line = 4.1)
mtext("Note: Neither Illinois nor any of the Victory States of 1917",  side = 1, font = 1, cex = .634, adj = .5, line = 4.9)
mtext("are included as full suffrage states in chart analysis",   side = 1, font = 1, cex = .634, adj = .5, line = 5.5)
dev.off()


#### FIGURE 14: CIRCLE 9 UNMASKED ####

png(filename=here::here("important-legislation", "14_circle9_unmasked.png"), width = 1285, height = 1200, pointsize=16)
par(mar = c(0,0,0,0))
# Start by defining rules for the circle, height of each track, degree the first cell is made at, and margins for tracks and the circle
circos.par(gap.degree = 0, cell.padding = c(0, 0, 0, 0),
           start.degree = 176, track.margin = c(0, 0), track.height = .035, circle.margin = c(.05,.05,.7,.15))
# Set number of sectors(factors) and x limits within each cell
circos.initialize(factors = c(1:48), xlim = c(-10,10))
# Next is 10 trackplotregion functions starting from the outside track and going in, each defining the color of every cell in the track
# Also circos.text functions, putting the numbers in the Wyoming cells
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","#212c1c"))
circos.text(labels = 10,sector.index = 48, track.index = 1,x=0,y=.5, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 9,sector.index = 48, track.index = 2,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","white","#212c1c","white","white","white","white"))
circos.text(labels = 8,sector.index = 48, track.index = 3,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","white","white","white","white","white","white"))
circos.text(labels = 7,sector.index = 48, track.index = 4,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 6,sector.index = 48, track.index = 5,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","white","#212c1c","white","#212c1c"))
circos.text(labels = 5,sector.index = 48, track.index = 6,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 4,sector.index = 48, track.index = 7,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","#212c1c","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 3,sector.index = 48, track.index = 8,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","white","white","white","white","white","white","#212c1c","white","white","#212c1c"))
circos.text(labels = 2,sector.index = 48, track.index = 9,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","#212c1c","#212c1c"))
circos.text(labels = 1,sector.index = 48, track.index = 10,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
# One extra track of blank cells, to provide some extra space between the state names and the cells
circos.track(ylim=c(0,3),bg.border=NA,track.height=.01, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
# Track with each individual state name going in the circle, and defining the direction they face, font and size
circos.trackText(x = rep(-4.8,48), y = rep(.1,48),
                 labels = c("Alabama","Arkansas","Connecticut","Delaware","Florida",
                            "Georgia","Illinois","Indiana","Iowa","Kentucky","Louisiana",
                            "Maine","Maryland","Massachusetts","Michigan","Minnesota",
                            "Mississippi","Missouri","Nebraska","New Hampshire","New Jersey",
                            "New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Pennsylvania",
                            "Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Vermont","Virginia",
                            "West Virginia","Wisconsin","Nevada","Montana","Kansas",
                            "Arizona","Oregon","California","Washington",
                            "Utah","Idaho","Colorado","Wyoming"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .85, adj = 0,
                 facing = "reverse.clockwise")
# New track placing the lines going all around the circle
circos.track(ylim=c(0,3),bg.border=NA,track.height=.32, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11),panel.fun = function(x,y) {
  circos.axis(major.at = 10, labels = "",direction = "inside", major.tick.length = 7, lwd= 1.6)})
# Final track, with the years that went along with some states
circos.trackText(x = rep(-5.5,48), y = rep(0,48),
                 labels = c("","","","","","","","","","","","","","","","",
                            "","","","","","","","","","","","","","","","","","","",
                            "","","1914","1914","1912",
                            "1912","1912","1911","1910",
                            "1896","1896","1893","1869"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .52, adj = 0,
                 facing = "reverse.clockwise")
circos.track(ylim=c(0,3),bg.border=NA,track.height=.3, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
circos.clear()
par(mar = c(0,1,7,0),cex=1.37)
# title("Important Legislation in the United States \nAffecting Women and Children", family = "Puritan")
par(mar = c(7.6,0,0,.5),cex=1)
mtext("WHITE SPACES INDICATE GOOD LEGISLATION,\n BLACK SPACES POOR OR NO LEGISLATION,\n COLOR SPACES FULL SUFFRAGE STATES",
      side=1, font = 2, cex = 1.37, family = "Puritan", line = -2)
par(mar = c(6.8,2,0,0))
mtext("Circle 1",
      side = 1, font = 2, cex = .9, adj = .227, line = -4.9)
mtext("           2",side = 1, font = 2, cex = .9, adj = .23, line = -.3)
mtext("Industrial Welfare Commis-",
      side = 1, font = 1, cex = .9, adj = .343, line=-4.9)
mtext("sion to regulate hours, wages",  side = 1, font = 1, cex = .9, adj = .351, line = -4)
mtext("and working  conditions of",  side = 1, font = 1, cex = .9, adj = .342, line = -3.1)
mtext("women and children",  side = 1, font = 1, cex = .9, adj = .3245, line = -2.2)
mtext("Child Labor--14 year limit.",  side = 1, font = 1, cex = .9, adj = .339, line = -.4)
mtext("Guarded  exemptions during",  side = 1, font = 1, cex = .9, adj = .348, line = .5)
mtext("vacations are allowed and",  side = 1, font = 1, cex = .9, adj = .341, line = 1.4)
mtext("poverty  exemptions  when",  side = 1, font = 1, cex = .9, adj = .343, line = 2.3)
mtext("these are neutralized  by",  side = 1, font = 1, cex = .9, adj = .3375, line = 3.2)
mtext("Mothers' Pensions laws",  side = 1, font = 1, cex = .9, adj = .3345, line = 4.1)
mtext("Circle 3",  side = 1, font = 2, cex = .9, adj = .547, line = -4.9)
mtext("Compulsory education--state-",  side = 1, font = 1, cex = .9, adj = .729, line = -4.9)
mtext("wide",  side = 1, font = 1, cex = .9, adj = .605, line = -4)
mtext("4",  side = 1, font = 2, cex = .9, adj = .568, line = -3.1)
mtext("Eight or  nine hour  day for",  side = 1, font = 1, cex = .9, adj = .713, line = -3.1)
mtext("women",  side = 1, font = 1, cex = .9, adj = .616, line = -2.2)
mtext("5",  side = 1, font = 2, cex = .9, adj = .568, line = -1.3)
mtext("Minimum wage",  side = 1, font = 1, cex = .9, adj = .652, line = -1.3)
mtext("6",  side = 1, font = 2, cex = .9, adj = .568, line = -.4)
mtext("Mothers' pensions",  side = 1, font = 1, cex = .9, adj = .668, line = -.4)
mtext("7",  side = 1, font = 2, cex = .9, adj = .568, line = .5)
mtext("Equal guardianship",  side = 1, font = 1, cex = .9, adj = .6735, line = .5) 
mtext("8",  side = 1, font = 2, cex = .9, adj = .568, line = 1.4) 
mtext("Age of consent, 18 years--",  side = 1, font = 1, cex = .9, adj = .7115, line = 1.4)
mtext("chaste or unchaste",  side = 1, font = 1, cex = .9, adj = .672, line = 2.3)
mtext("9",  side = 1, font = 2, cex = .9, adj = .568, line = 3.2)
mtext("Red light abatement",  side = 1, font = 1, cex = .9, adj = .678, line = 3.2)
# mtext("10",  side = 1, font = 2, cex = .9, adj = .566, line = 4.1)
# mtext("Prohibition",  side = 1, font = 1, cex = .9, adj = .6316, line = 4.1)
mtext("Note: Neither Illinois nor any of the Victory States of 1917",  side = 1, font = 1, cex = .634, adj = .5, line = 4.9)
mtext("are included as full suffrage states in chart analysis",   side = 1, font = 1, cex = .634, adj = .5, line = 5.5)
dev.off()


#### FIGURE 15: CIRCLE 10 UNMASKED ####

png(filename=here::here("important-legislation", "15_circle10_unmasked.png"), width = 1285, height = 1200, pointsize=16)
par(mar = c(0,0,0,0))
# Start by defining rules for the circle, height of each track, degree the first cell is made at, and margins for tracks and the circle
circos.par(gap.degree = 0, cell.padding = c(0, 0, 0, 0),
           start.degree = 176, track.margin = c(0, 0), track.height = .035, circle.margin = c(.05,.05,.7,.15))
# Set number of sectors(factors) and x limits within each cell
circos.initialize(factors = c(1:48), xlim = c(-10,10))
# Next is 10 trackplotregion functions starting from the outside track and going in, each defining the color of every cell in the track
# Also circos.text functions, putting the numbers in the Wyoming cells
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","#212c1c"))
circos.text(labels = 10,sector.index = 48, track.index = 1,x=0,y=.5, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 9,sector.index = 48, track.index = 2,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","white","#212c1c","white","white","white","white"))
circos.text(labels = 8,sector.index = 48, track.index = 3,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","white","#212c1c","white","white","#212c1c","white","#212c1c","white","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","#212c1c","white","white","white","white","white","white","white"))
circos.text(labels = 7,sector.index = 48, track.index = 4,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","#212c1c","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 6,sector.index = 48, track.index = 5,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","white","white","#212c1c","white","#212c1c"))
circos.text(labels = 5,sector.index = 48, track.index = 6,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","white","white","white","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c"))
circos.text(labels = 4,sector.index = 48, track.index = 7,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .47)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","#212c1c","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","white","white","white"))
circos.text(labels = 3,sector.index = 48, track.index = 8,x=0,y=.45, col = "black", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("white","white","white","white","white","#212c1c","white","white","white","white","white","white","white","white","white","white","#212c1c","white","white","white","white","#212c1c","white","#212c1c","white","white","white","white","white","white","white","white","#212c1c","#212c1c","#212c1c","white","white","#212c1c","white","white","white","white","white","white","#212c1c","white","white","#212c1c"))
circos.text(labels = 2,sector.index = 48, track.index = 9,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
circos.trackPlotRegion(ylim = c(0, 1), factors = c(1:48), 
                       bg.col = c("#212c1c","white","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","#212c1c","white","#212c1c","#212c1c","white","#212c1c","white","white","white","#212c1c","#212c1c","#212c1c","#212c1c"))
circos.text(labels = 1,sector.index = 48, track.index = 10,x=0,y=.45, col = "#e1e2e4", facing = "downward", cex = .5)
# One extra track of blank cells, to provide some extra space between the state names and the cells
circos.track(ylim=c(0,3),bg.border=NA,track.height=.01, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
# Track with each individual state name going in the circle, and defining the direction they face, font and size
circos.trackText(x = rep(-4.8,48), y = rep(.1,48),
                 labels = c("Alabama","Arkansas","Connecticut","Delaware","Florida",
                            "Georgia","Illinois","Indiana","Iowa","Kentucky","Louisiana",
                            "Maine","Maryland","Massachusetts","Michigan","Minnesota",
                            "Mississippi","Missouri","Nebraska","New Hampshire","New Jersey",
                            "New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Pennsylvania",
                            "Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Vermont","Virginia",
                            "West Virginia","Wisconsin","Nevada","Montana","Kansas",
                            "Arizona","Oregon","California","Washington",
                            "Utah","Idaho","Colorado","Wyoming"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .85, adj = 0,
                 facing = "reverse.clockwise")
# New track placing the lines going all around the circle
circos.track(ylim=c(0,3),bg.border=NA,track.height=.32, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11),panel.fun = function(x,y) {
  circos.axis(major.at = 10, labels = "",direction = "inside", major.tick.length = 7, lwd= 1.6)})
# Final track, with the years that went along with some states
circos.trackText(x = rep(-5.5,48), y = rep(0,48),
                 labels = c("","","","","","","","","","","","","","","","",
                            "","","","","","","","","","","","","","","","","","","",
                            "","","1914","1914","1912",
                            "1912","1912","1911","1910",
                            "1896","1896","1893","1869"),
                 factors = c(1:48), col = "#212c1c", font = 2, cex = .52, adj = 0,
                 facing = "reverse.clockwise")
circos.track(ylim=c(0,3),bg.border=NA,track.height=.3, bg.col = c(rep(NA,37),rep(rgb(red = 1,green = .5,blue = 0,alpha = .2),37),11))
circos.clear()
par(mar = c(0,1,7,0),cex=1.37)
# title("Important Legislation in the United States \nAffecting Women and Children", family = "Puritan")
par(mar = c(7.6,0,0,.5),cex=1)
mtext("WHITE SPACES INDICATE GOOD LEGISLATION,\n BLACK SPACES POOR OR NO LEGISLATION,\n COLOR SPACES FULL SUFFRAGE STATES",
      side=1, font = 2, cex = 1.37, family = "Puritan", line = -2)
par(mar = c(6.8,2,0,0))
mtext("Circle 1",
      side = 1, font = 2, cex = .9, adj = .227, line = -4.9)
mtext("           2",side = 1, font = 2, cex = .9, adj = .23, line = -.3)
mtext("Industrial Welfare Commis-",
      side = 1, font = 1, cex = .9, adj = .343, line=-4.9)
mtext("sion to regulate hours, wages",  side = 1, font = 1, cex = .9, adj = .351, line = -4)
mtext("and working  conditions of",  side = 1, font = 1, cex = .9, adj = .342, line = -3.1)
mtext("women and children",  side = 1, font = 1, cex = .9, adj = .3245, line = -2.2)
mtext("Child Labor--14 year limit.",  side = 1, font = 1, cex = .9, adj = .339, line = -.4)
mtext("Guarded  exemptions during",  side = 1, font = 1, cex = .9, adj = .348, line = .5)
mtext("vacations are allowed and",  side = 1, font = 1, cex = .9, adj = .341, line = 1.4)
mtext("poverty  exemptions  when",  side = 1, font = 1, cex = .9, adj = .343, line = 2.3)
mtext("these are neutralized  by",  side = 1, font = 1, cex = .9, adj = .3375, line = 3.2)
mtext("Mothers' Pensions laws",  side = 1, font = 1, cex = .9, adj = .3345, line = 4.1)
mtext("Circle 3",  side = 1, font = 2, cex = .9, adj = .547, line = -4.9)
mtext("Compulsory education--state-",  side = 1, font = 1, cex = .9, adj = .729, line = -4.9)
mtext("wide",  side = 1, font = 1, cex = .9, adj = .605, line = -4)
mtext("4",  side = 1, font = 2, cex = .9, adj = .568, line = -3.1)
mtext("Eight or  nine hour  day for",  side = 1, font = 1, cex = .9, adj = .713, line = -3.1)
mtext("women",  side = 1, font = 1, cex = .9, adj = .616, line = -2.2)
mtext("5",  side = 1, font = 2, cex = .9, adj = .568, line = -1.3)
mtext("Minimum wage",  side = 1, font = 1, cex = .9, adj = .652, line = -1.3)
mtext("6",  side = 1, font = 2, cex = .9, adj = .568, line = -.4)
mtext("Mothers' pensions",  side = 1, font = 1, cex = .9, adj = .668, line = -.4)
mtext("7",  side = 1, font = 2, cex = .9, adj = .568, line = .5)
mtext("Equal guardianship",  side = 1, font = 1, cex = .9, adj = .6735, line = .5) 
mtext("8",  side = 1, font = 2, cex = .9, adj = .568, line = 1.4) 
mtext("Age of consent, 18 years--",  side = 1, font = 1, cex = .9, adj = .7115, line = 1.4)
mtext("chaste or unchaste",  side = 1, font = 1, cex = .9, adj = .672, line = 2.3)
mtext("9",  side = 1, font = 2, cex = .9, adj = .568, line = 3.2)
mtext("Red light abatement",  side = 1, font = 1, cex = .9, adj = .678, line = 3.2)
mtext("10",  side = 1, font = 2, cex = .9, adj = .566, line = 4.1)
mtext("Prohibition",  side = 1, font = 1, cex = .9, adj = .6316, line = 4.1)
mtext("Note: Neither Illinois nor any of the Victory States of 1917",  side = 1, font = 1, cex = .634, adj = .5, line = 4.9)
mtext("are included as full suffrage states in chart analysis",   side = 1, font = 1, cex = .634, adj = .5, line = 5.5)
dev.off()




