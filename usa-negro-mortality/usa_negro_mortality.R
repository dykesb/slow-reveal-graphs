#
# FILE:
# usa_negro_mortality.R
#
# DESCRIPTION:
# This code is for the Mortality of American Negros graph by Du Bois. The png shows the final recreated graph.  
# Source: https://blogs.scientificamerican.com/sa-visual/w-e-b-du-bois-scientific-american-and-data-stories-of-the-early-1900s/
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC
#
# AUTHORS:
#   Robert Bilyk (main code)
#   Ian Curtis (2023, code to save plots)



library(tidyverse)
library(showtext)
library(readxl)
library(magick)
library(grid)



font_add_google(name = "Quicksand", family = "alt")

brac <- image_read(here::here("usa-negro-mortality", "bracket.png"))
#grid.raster(brac, .036, .428, height = .01, width = 1)


#### Adding Dimensions ####
gap <- ggplot() + theme_void() + 
  theme(plot.background = element_rect(color = "#d7d2bf", fill = "#d7d2bf"))

picture <- image_graph(width = 800, height = 1000)
gap 
dev.off()


#### N: RECREATED GRAPHIC ####

fig01 <- image_draw(picture)

text(400, 20, "Mortality of American Negroes.", family = "serif", cex = 2, col = "#383227")
segments(x0=350,y0=40, x1=450, y1=40, lwd = 1, lty = "solid")
text(400, 60, "Mortalité parmi les Négres Americains", family = "serif", cex = 1.25, col = "#383227")
segments(x0=350,y0=75, x1=450, y1=75, lwd = 1, lty = "solid")
text(400, 90, "Done by Atlanta University.", family = "serif", cex = 1, col = "#383227")

text(102, 460, "32.40 Per M.", family = "alt", cex = 1, col = "#383227")
polygon(c(135, 135, 70, 70), c(895, 470, 470, 895), border = "black", col = "black")
text(102, 905, "U.S.", family = "alt", cex = 1, col = "#383227")

text(252, 450, "33.68 Per M.", family = "alt", cex = 1, col = "#383227")
polygon(c(220, 220, 285, 285), c(895, 460, 460, 895), border = "black", col = "black")
text(252, 905, "U.S. CITIES", family = "alt", cex = 1, col = "#383227")

text(402, 185, "48.46 Per M.", family = "alt", cex = 1, col = "#383227")
polygon(c(370, 370, 435, 435), c(895, 195, 195, 895), border = "black", col = "#f5bd22")
text(402, 905, "5th WARD", family = "alt", cex = 1, col = "#383227")
text(402, 917, "SLUM", family = "alt", cex = 1, col = "#383227")

text(552, 485, "30.54 Per M.", family = "alt", cex = 1, col = "#383227")
polygon(c(520, 520, 585, 585), c(895, 495, 495, 895), border = "black", col = "#f5bd22")
text(552, 905, "7th WARD", family = "alt", cex = 1, col = "#383227")
text(552, 917, "MIXED CLASS", family = "alt", cex = 1, col = "#383227")

text(702, 560, "21.74 Per M.", family = "alt", cex = 1, col = "#383227")
polygon(c(670, 670, 735, 735), c(895, 570, 570, 895), border = "black", col = "#f5bd22")
text(702, 905, "30th WARD", family = "alt", cex = 1, col = "#383227")
text(702, 917, "BETTER CLASS", family = "alt", cex = 1, col = "#383227")

grid.raster(brac, .223, .06, height = .031, width = .34)
text(185, 970, "UNITED STATES.", family = "alt", cex = 1.5, col = "#383227")

grid.raster(brac, .698, .06, height = .033, width = .51)
text(565, 970, "PHILADELPHIA", family = "alt", cex = 1.5, col = "#383227")

dev.off()


image_write(fig01, path = here::here("usa-negro-mortality", "01_full_unmasked.png"), format = "png")







