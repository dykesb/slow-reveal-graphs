#
# FILE:
# hull_house_map.R
#
# DESCRIPTION:
# 
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC
#
# AUTHORS:
#  Robert Bilyk (main code)
# Ian Curtis (2023, code to save plots)

library(tidyverse)
library(showtext)
library(magick)

font_add_google(name = "Space Mono", family = "Text")
font_add_google(name = "Cutive Mono", family = "Main")

showtext_auto()

#Add Dimensions
gap <- ggplot() + theme_void() + 
  theme(plot.background = element_rect(color = "#cabc8d", fill = "#cabc8d"))

picture <- image_graph(width = 1400, height = 975)

gap 

dev.off()


fig01 <- image_draw(picture)

#topleft

polygon(c(195, 275, 275, 195), c(50, 50, 130, 130), border = "#b5b5b5", col = "#b5b5b5")
polygon(c(190.8, 207.6, 207.6, 190.8), c(113, 113, 130, 130), border = "#944eb5", col = "#944eb5")
polygon(c(224.4, 207.6, 207.6, 224.4), c(50, 50, 70, 70), border = "#999999", col = "#999999")
polygon(c(224.4, 207.6, 207.6, 224.4), c(130, 130, 70, 70), border = "#944eb5", col = "#944eb5")
polygon(c(224.4, 241.2, 241.2, 224.4), c(130, 130, 50, 50), border = "#999999", col = "#999999")
polygon(c(258, 241.2, 241.2, 258), c(50, 50, 130, 130), border = "#b5b5b5", col = "#b5b5b5")
polygon(c(258, 275, 275, 258), c(50, 50, 90, 90), border = "#999999", col = "#999999")
polygon(c(258, 275, 275, 258), c(130, 130, 90, 90), border = "#996f72", col = "#996f72")

segments(x0=90, x1=275, y0=50, y1=50, lwd = 1, lty = "solid")
segments(x0=90, x1=90, y0=50, y1=130, lwd = 1, lty = "solid")
segments(x0=275, x1=275, y0=50, y1=130, lwd = 1, lty = "solid")
segments(x0=90, x1=275, y0=130, y1=130, lwd = 1, lty = "solid")

text(98.4, 90, "6", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=106.8, x1=106.8, y0=50, y1=130, lwd = 1, lty = "solid")
text(115.2, 90, "5", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=123.6, x1=123.6, y0=50, y1=130, lwd = 1, lty = "solid")
text(132, 90, "4", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=140.4, x1=140.4, y0=50, y1=130, lwd = 1, lty = "solid")
text(148.8, 90, "3", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=157.2, x1=157.2, y0=50, y1=130, lwd = 1, lty = "solid")
text(165.6, 90, "2", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=174, x1=174, y0=50, y1=130, lwd = 1, lty = "solid")
text(182.4, 90, "1", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=190.8, x1=190.8, y0=50, y1=130, lwd = 1, lty = "solid")
text(199.8, 90, "9", family = "Main", cex = .75, col = "black", srt = 90)
segments(x0=207.6, x1=207.6, y0=50, y1=130, lwd = 1, lty = "solid")
text(216, 90, "8", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=224.4, x1=224.4, y0=50, y1=130, lwd = 1, lty = "solid")
text(232.8, 90, "7", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=241.2, x1=241.2, y0=50, y1=130, lwd = 1, lty = "solid")
text(249.6, 90, "6", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=258, x1=258, y0=50, y1=130, lwd = 1, lty = "solid")
text(266.4, 90, "5", family = "Main", cex = .75, col = "black", srt = 270)

#down1
polygon(c(95, 90, 90, 95), c(156.8, 156.8, 140, 140), border = "#77997e", col = "#77997e")
polygon(c(95, 150, 150, 95), c(156.8, 156.8, 140, 140), border = "#c05a50", col = "#c05a50")
polygon(c(150, 175, 175, 150), c(156.8, 156.8, 140, 140), border = "#1f5c87", col = "#1f5c87")
polygon(c(90, 94, 94, 90), c(156.8, 156.8, 173.6, 173.6), border = "#77997e", col = "#77997e")
polygon(c(94, 152, 152, 94), c(156.8, 156.8, 173.6, 173.6), border = "#c05a50", col = "#c05a50")
polygon(c(152, 175, 175, 152), c(156.8, 156.8, 173.6, 173.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(90, 145, 145, 90), c(173.6, 173.6, 190.4, 190.4), border = "#77997e", col = "#77997e")
polygon(c(145, 175, 175, 145), c(173.6, 173.6, 190.4, 190.4), border = "#1f5c87", col = "#1f5c87")
polygon(c(90, 130, 130, 90), c(240.8, 240.8, 257.6, 257.6), border = "#77997e", col = "#77997e")
polygon(c(130, 165, 165, 130), c(240.8, 240.8, 257.6, 257.6), border = "#c05a50", col = "#c05a50")
polygon(c(165, 175, 175, 165), c(240.8, 240.8, 257.6, 257.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(90, 175, 175, 90), c(291.2, 291.2, 308, 308), border = "#77997e", col = "#77997e")
polygon(c(90, 170, 170, 90), c(357.4, 357.4, 341.2, 341.2), border = "#c05a50", col = "#c05a50")
polygon(c(90, 170, 170, 90), c(373.6, 373.6, 357.4, 357.4), border = "#e8c55c", col = "#e8c55c")
polygon(c(90, 92, 92, 90), c(406, 406, 387.7, 387.7), border = "#77997e", col = "#77997e")
polygon(c(145, 92, 92, 145), c(406, 406, 387.7, 387.7), border = "#996f72", col = "#996f72")
polygon(c(145, 170, 170, 145), c(406, 406, 387.7, 387.7), border = "#c05a50", col = "#c05a50")
polygon(c(110, 90, 90, 110), c(519.4, 519.4, 535.6, 535.6), border = "#77997e", col = "#77997e")
polygon(c(140, 110, 110, 140), c(519.4, 519.4, 535.6, 535.6), border = "#996f72", col = "#996f72")
polygon(c(140, 155, 155, 140), c(519.4, 519.4, 535.6, 535.6), border = "#c05a50", col = "#c05a50")
polygon(c(170, 155, 155, 170), c(519.4, 519.4, 535.6, 535.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(170, 90, 90, 170), c(551.8, 551.8, 535.6, 535.6), border = "#996f72", col = "#996f72")
polygon(c(90, 105, 105, 90), c(551.8, 551.8, 568, 568), border = "#e8c55c", col = "#e8c55c")
polygon(c(140, 105, 105, 140), c(551.8, 551.8, 568, 568), border = "#c05a50", col = "#c05a50")
polygon(c(170, 140, 140, 170), c(551.8, 551.8, 568, 568), border = "#996f72", col = "#996f72")
polygon(c(170, 90, 90, 170), c(584.2, 584.2, 568, 568), border = "#996f72", col = "#996f72")
polygon(c(90, 110, 110, 90), c(584.2, 584.2, 600, 600), border = "#c05a50", col = "#c05a50")
polygon(c(110, 160, 160, 110), c(584.2, 584.2, 600, 600), border = "#1f5c87", col = "#1f5c87")
polygon(c(170, 160, 160, 170), c(584.2, 584.2, 600, 600), border = "#996f72", col = "#996f72")

segments(x0=90, x1=175, y0=140, y1=140, lwd = 1, lty = "solid")
segments(x0=90, x1=170, y0=600, y1=600, lwd = 1, lty = "solid")
segments(x0=90, x1=90, y0=140, y1=600, lwd = 1, lty = "solid")
segments(x0=170, x1=170, y0=325, y1=600, lwd = 1, lty = "solid")
segments(x0=170, x1=175, y0=325, y1=325, lwd = 1, lty = "solid")
segments(x0=175, x1=175, y0=325, y1=140, lwd = 1, lty = "solid")

segments(x0=90, x1=170, y0=341.2, y1=341.2, lwd = 1, lty = "solid")
text(130, 333.1, "51", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=170, y0=357.4, y1=357.4, lwd = 1, lty = "solid")
text(130, 349.3, "50", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=170, y0=373.6, y1=373.6, lwd = 1, lty = "solid")
text(130, 365.5, "49", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=170, y0=387.7, y1=387.8, lwd = 1, lty = "solid")
text(130, 381.7, "48", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=170, y0=406, y1=406, lwd = 1, lty = "solid")
text(130, 397.9, "47", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=170, y0=422.2, y1=422.2, lwd = 1, lty = "solid")
text(130, 414.1, "46", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=170, y0=438.4, y1=438.4, lwd = 1, lty = "solid")
text(130, 430.3, "45", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=170, y0=454.6, y1=454.6, lwd = 1, lty = "solid")
text(130, 446.5, "44", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=170, y0=470.8, y1=470.8, lwd = 1, lty = "solid")
text(130, 462.7, "43", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=170, y0=487, y1=487, lwd = 1, lty = "solid")
text(130, 478.9, "42", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=170, y0=503.2, y1=503.2, lwd = 1, lty = "solid")
text(130, 495.1, "41", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=170, y0=519.4, y1=519.4, lwd = 1, lty = "solid")
text(130, 511.3, "40", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=170, y0=535.6, y1=535.6, lwd = 1, lty = "solid")
text(130, 527.5, "39", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=170, y0=551.8, y1=551.8, lwd = 1, lty = "solid")
text(130, 543.7, "38", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=170, y0=568, y1=568, lwd = 1, lty = "solid")
text(130, 559.9, "37", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=170, y0=584.2, y1=584.2, lwd = 1, lty = "solid")
text(130, 576.1, "36", family = "Main", cex = .75, col = "black", srt = 270)
text(130, 592.3, "35", family = "Main", cex = .75, col = "black", srt = 270)

text(130, 148.4, "7", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=175, y0=156.8, y1=156.8, lwd = 1, lty = "solid")
text(130, 165.2, "8", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=175, y0=173.6, y1=173.6, lwd = 1, lty = "solid")
text(130, 182, "9", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=175, y0=190.4, y1=190.4, lwd = 1, lty = "solid")
text(130, 198.8, "10", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=175, y0=207.2, y1=207.2, lwd = 1, lty = "solid")
text(130, 215.6, "11", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=175, y0=224, y1=224, lwd = 1, lty = "solid")
text(130, 232.4, "12", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=175, y0=240.8, y1=240.8, lwd = 1, lty = "solid")
text(130, 249.2, "13", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=175, y0=257.6, y1=257.6, lwd = 1, lty = "solid")
text(130, 266, "14", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=175, y0=274.4, y1=274.4, lwd = 1, lty = "solid")
text(130, 282.8, "15", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=175, y0=291.2, y1=291.2, lwd = 1, lty = "solid")
text(130, 299.6, "16", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=175, y0=308, y1=308, lwd = 1, lty = "solid")
text(130, 316.4, "17", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=175, y0=325, y1=325, lwd = 1, lty = "solid")

#down1 right1

polygon(c(200, 210, 210, 200), c(152.5, 152.5, 140, 140), border = "black", col = "black")
polygon(c(210, 235, 235, 210), c(152.5, 152.5, 140, 140), border = "#1f5c87", col = "#1f5c87")
polygon(c(235, 260, 260, 235), c(152.5, 152.5, 140, 140), border = "#996f72", col = "#996f72")
polygon(c(260, 275, 275, 260), c(152.5, 152.5, 140, 140), border = "#c05a50", col = "#c05a50")

polygon(c(200, 210, 210, 200), c(152.5, 152.5, 165, 165), border = "#1f5c87", col = "#1f5c87")
polygon(c(210, 240, 240, 210), c(152.5, 152.5, 165, 165), border = "#996f72", col = "#996f72")
polygon(c(240, 250, 250, 240), c(152.5, 152.5, 165, 165), border = "#c05a50", col = "#c05a50")
polygon(c(250, 260, 260, 250), c(152.5, 152.5, 165, 165), border = "#77997e", col = "#77997e")
polygon(c(275, 260, 260, 275), c(152.5, 152.5, 165, 165), border = "#e8c55c", col = "#e8c55c")

polygon(c(200, 215, 215, 200), c(177.5, 177.5, 165, 165), border = "#1f5c87", col = "#1f5c87")
polygon(c(240, 215, 215, 240), c(177.5, 177.5, 165, 165), border = "#c05a50", col = "#c05a50")
polygon(c(275, 240, 240, 275), c(177.5, 177.5, 165, 165), border = "#77997e", col = "#77997e")

polygon(c(275, 200, 200, 275), c(177.5, 177.5, 190, 190), border = "#c05a50", col = "#c05a50")

polygon(c(195, 240, 240, 195), c(206.8, 206.8, 190, 190), border = "#1f5c87", col = "#1f5c87")
polygon(c(240, 245, 245, 240), c(206.8, 206.8, 190, 190), border = "#996f72", col = "#996f72")
polygon(c(245, 265, 265, 245), c(206.8, 206.8, 190, 190), border = "#c05a50", col = "#c05a50")
polygon(c(275, 265, 265, 275), c(206.8, 206.8, 190, 190), border = "#77997e", col = "#77997e")

polygon(c(195, 220, 220, 195), c(206.8, 206.8, 223.6, 223.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(220, 260, 260, 220), c(206.8, 206.8, 223.6, 223.6), border = "#c05a50", col = "#c05a50")
polygon(c(270, 260, 260, 270), c(206.8, 206.8, 223.6, 223.6), border = "#77997e", col = "#77997e")
polygon(c(270, 275, 275, 270), c(206.8, 206.8, 223.6, 223.6), border = "#e8c55c", col = "#e8c55c")

polygon(c(195, 205, 205, 195), c(240.2, 240.2, 223.6, 223.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(205, 250, 250, 205), c(240.2, 240.2, 223.6, 223.6), border = "#c05a50", col = "#c05a50")
polygon(c(265, 250, 250, 265), c(240.2, 240.2, 223.6, 223.6), border = "#77997e", col = "#77997e")
polygon(c(265, 275, 275, 265), c(240.2, 240.2, 223.6, 223.6), border = "#e8c55c", col = "#e8c55c")

polygon(c(195, 240, 240, 195), c(240.2, 240.2, 257.2, 257.2), border = "#c05a50", col = "#c05a50")
polygon(c(260, 240, 240, 260), c(240.2, 240.2, 257.2, 257.2), border = "#77997e", col = "#77997e")
polygon(c(260, 275, 275, 260), c(240.2, 240.2, 257.2, 257.2), border = "#e8c55c", col = "#e8c55c")

polygon(c(195, 215, 215, 195), c(274, 274, 257.2, 257.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(215, 235, 235, 215), c(274, 274, 257.2, 257.2), border = "#c05a50", col = "#c05a50")
polygon(c(235, 255, 255, 235), c(274, 274, 257.2, 257.2), border = "#996f72", col = "#996f72")
polygon(c(255, 275, 275, 255), c(274, 274, 257.2, 257.2), border = "#77997e", col = "#77997e")

polygon(c(275, 195, 195, 275), c(274, 274, 290.8, 290.8), border = "#c05a50", col = "#c05a50")

polygon(c(235, 195, 195, 235), c(307.6, 307.6, 290.8, 290.8), border = "#c05a50", col = "#c05a50")
polygon(c(235, 275, 275, 235), c(307.6, 307.6, 290.8, 290.8), border = "#e8c55c", col = "#e8c55c")

polygon(c(225, 195, 195, 225), c(325, 325, 307.6, 307.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(225, 230, 230, 225), c(325, 325, 307.6, 307.6), border = "#996f72", col = "#996f72")
polygon(c(260, 230, 230, 260), c(325, 325, 307.6, 307.6), border = "#c05a50", col = "#c05a50")
polygon(c(260, 265, 265, 260), c(325, 325, 307.6, 307.6), border = "#77997e", col = "#77997e")
polygon(c(265, 275, 275, 265), c(325, 325, 307.6, 307.6), border = "#e8c55c", col = "#e8c55c")

polygon(c(190, 215, 215, 190), c(325, 325, 341.6, 341.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(215, 220, 220, 215), c(325, 325, 341.6, 341.6), border = "#996f72", col = "#996f72")
polygon(c(220, 240, 240, 220), c(325, 325, 341.6, 341.6), border = "#c05a50", col = "#c05a50")
polygon(c(240, 265, 265, 240), c(325, 325, 341.6, 341.6), border = "#77997e", col = "#77997e")
polygon(c(265, 270, 270, 265), c(325, 325, 341.6, 341.6), border = "#e8c55c", col = "#e8c55c")

segments(x0=275, x1=200, y0=140, y1=140, lwd = 1, lty = "solid")
segments(x0=200, x1=200, y0=140, y1=190, lwd = 1, lty = "solid")
segments(x0=195, x1=200, y0=190, y1=190, lwd = 1, lty = "solid")
segments(x0=195, x1=195, y0=190, y1=325, lwd = 1, lty = "solid")
segments(x0=195, x1=190, y0=325, y1=325, lwd = 1, lty = "solid")
segments(x0=190, x1=190, y0=525, y1=325, lwd = 1, lty = "solid")
segments(x0=190, x1=270, y0=525, y1=525, lwd = 1, lty = "solid")
segments(x0=270, x1=270, y0=525, y1=325, lwd = 1, lty = "solid")
segments(x0=275, x1=270, y0=325, y1=325, lwd = 1, lty = "solid")
segments(x0=275, x1=270, y0=325, y1=325, lwd = 1, lty = "solid")
segments(x0=275, x1=275, y0=140, y1=325, lwd = 1, lty = "solid")

text(225, 146.2, "4", family = "Main", cex = .75, col = "black", srt = 270)
text(225, 158.7, "3", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=275, x1=200, y0=152.5, y1=152.5, lwd = 1, lty = "solid")
text(225, 171.2, "2", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=275, x1=200, y0=165, y1=165, lwd = 1, lty = "solid")
text(225, 183.7, "1", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=275, x1=200, y0=177.5, y1=177.5, lwd = 1, lty = "solid")
segments(x0=275, x1=200, y0=190, y1=190, lwd = 1, lty = "solid")

text(225, 198.4, "25", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=275, x1=195, y0=206.8, y1=206.8, lwd = 1, lty = "solid")
text(225, 215.2, "24", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=275, x1=195, y0=223.6, y1=223.6, lwd = 1, lty = "solid")
text(225, 232, "23", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=275, x1=195, y0=240.4, y1=240.2, lwd = 1, lty = "solid")
text(225, 248.8, "22", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=275, x1=195, y0=257.2, y1=257.2, lwd = 1, lty = "solid")
text(225, 265.6, "21", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=275, x1=195, y0=274, y1=274, lwd = 1, lty = "solid")
text(225, 282.4, "20", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=275, x1=195, y0=290.8, y1=290.8, lwd = 1, lty = "solid")
text(225, 299.2, "19", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=275, x1=195, y0=307.6, y1=307.6, lwd = 1, lty = "solid")
text(225, 316, "18", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=275, x1=195, y0=325, y1=325, lwd = 1, lty = "solid")

text(225, 332.8, "18", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=270, x1=190, y0=341.6, y1=341.6, lwd = 1, lty = "solid")
text(225, 349.9, "19", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=270, x1=190, y0=358.2, y1=358.2, lwd = 1, lty = "solid")
text(225, 366.5, "20", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=270, x1=190, y0=374.8, y1=374.8, lwd = 1, lty = "solid")
text(225, 383.1, "21", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=270, x1=190, y0=391.4, y1=391.4, lwd = 1, lty = "solid")
text(225, 399.7, "22", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=270, x1=190, y0=408, y1=408, lwd = 1, lty = "solid")
text(225, 416.3, "23", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=270, x1=190, y0=424.6, y1=424.6, lwd = 1, lty = "solid")
text(225, 432.9, "24", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=270, x1=190, y0=441.2, y1=441.2, lwd = 1, lty = "solid")
text(225, 449.5, "25", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=270, x1=190, y0=457.8, y1=457.8, lwd = 1, lty = "solid")
text(225, 466.1, "26", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=270, x1=190, y0=474.4, y1=474.4, lwd = 1, lty = "solid")
text(225, 482.7, "27", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=270, x1=190, y0=491, y1=491, lwd = 1, lty = "solid")
text(225, 499.3, "28", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=270, x1=190, y0=507.6, y1=507.6, lwd = 1, lty = "solid")
text(225, 515.9, "29", family = "Main", cex = .75, col = "black", srt = 270)

#down1 right1 down1

polygon(c(202, 185, 185, 202), c(580, 580, 535, 535), border = "#1f5c87", col = "#1f5c87")
polygon(c(202, 185, 185, 202), c(580, 580, 595, 595), border = "#c05a50", col = "#c05a50")
polygon(c(202, 185, 185, 202), c(600, 600, 595, 595), border = "#77997e", col = "#77997e")

polygon(c(219, 202, 202, 219), c(535, 535, 540, 540), border = "black", col = "black")
polygon(c(219, 202, 202, 219), c(540, 540, 600, 600), border = "#1f5c87", col = "#1f5c87")

polygon(c(219, 236, 236, 219), c(535, 535, 560, 560), border = "#1f5c87", col = "#1f5c87")
polygon(c(219, 236, 236, 219), c(560, 560, 575, 575), border = "#c05a50", col = "#c05a50")
polygon(c(219, 236, 236, 219), c(595, 595, 575, 575), border = "#77997e", col = "#77997e")
polygon(c(219, 236, 236, 219), c(595, 595, 600, 600), border = "#e8c55c", col = "#e8c55c")

polygon(c(253, 236, 236, 253), c(535, 535, 560, 560), border = "#1f5c87", col = "#1f5c87")
polygon(c(253, 236, 236, 253), c(560, 560, 585, 585), border = "#c05a50", col = "#c05a50")
polygon(c(253, 236, 236, 253), c(585, 585, 590, 590), border = "#77997e", col = "#77997e")
polygon(c(253, 236, 236, 253), c(600, 600, 590, 590), border = "#e8c55c", col = "#e8c55c")

polygon(c(253, 270, 270, 253), c(535, 535, 560, 560), border = "#1f5c87", col = "#1f5c87")
polygon(c(253, 270, 270, 253), c(560, 560, 585, 585), border = "#c05a50", col = "#c05a50")
polygon(c(253, 270, 270, 253), c(585, 585, 595, 595), border = "#77997e", col = "#77997e")
polygon(c(253, 270, 270, 253), c(600, 600, 595, 595), border = "#e8c55c", col = "#e8c55c")

segments(x0=270, x1=185, y0=535, y1=535, lwd = 1, lty = "solid")
segments(x0=185, x1=185, y0=535, y1=600, lwd = 1, lty = "solid")
segments(x0=270, x1=270, y0=535, y1=600, lwd = 1, lty = "solid")
segments(x0=270, x1=185, y0=600, y1=600, lwd = 1, lty = "solid")

text(193.5, 567.5, "34", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=202, x1=202, y0=535, y1=600, lwd = 1, lty = "solid")
text(210.5, 567.5, "33", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=219, x1=219, y0=535, y1=600, lwd = 1, lty = "solid")
text(227.5, 567.5, "32", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=236, x1=236, y0=535, y1=600, lwd = 1, lty = "solid")
text(244.5, 567.5, "31", family = "Main", cex = .75, col = "black", srt = 270)
text(261.5, 567.5, "30", family = "Main", cex = .75, col = "black", srt = 270)

#right1

polygon(c(315, 329, 329, 315), c(50, 50, 55, 55), border = "#e8c55c", col = "#e8c55c")
polygon(c(315, 329, 329, 315), c(55, 55, 65, 65), border = "#77997e", col = "#77997e")
polygon(c(315, 329, 329, 315), c(65, 65, 80, 80), border = "#c05a50", col = "#c05a50")
polygon(c(315, 329, 329, 315), c(80, 80, 120, 120), border = "#1f5c87", col = "#1f5c87")

polygon(c(345, 329, 329, 345), c(50, 50, 75, 75), border = "#e8c55c", col = "#e8c55c")
polygon(c(345, 329, 329, 345), c(75, 75, 105, 105), border = "#77997e", col = "#77997e")
polygon(c(345, 329, 329, 345), c(120, 120, 105, 105), border = "#996f72", col = "#996f72")

polygon(c(345, 359, 359, 345), c(50, 50, 95, 95), border = "#77997e", col = "#77997e")
polygon(c(345, 359, 359, 345), c(95, 95, 120, 120), border = "#1f5c87", col = "#1f5c87")

polygon(c(359, 373, 373, 359), c(50, 50, 95, 95), border = "#996f72", col = "#996f72")
polygon(c(359, 373, 373, 359), c(95, 95, 120, 120), border = "#77997e", col = "#77997e")

polygon(c(390, 373, 373, 390), c(75, 75, 50, 50), border = "#77997e", col = "#77997e")
polygon(c(390, 373, 373, 390), c(75, 75, 120, 120), border = "#996f72", col = "#996f72")

polygon(c(325, 315, 315, 325), c(120, 120, 135.4, 135.4), border = "#c05a50", col = "#c05a50")
polygon(c(325, 365, 365, 325), c(120, 120, 135.4, 135.4), border = "#996f72", col = "#996f72")
polygon(c(390, 365, 365, 390), c(120, 120, 135.4, 135.4), border = "#1f5c87", col = "#1f5c87")

polygon(c(315, 350, 350, 315), c(151.4, 151.4, 135.4, 135.4), border = "#e8c55c", col = "#e8c55c")
polygon(c(350, 390, 390, 350), c(151.4, 151.4, 135.4, 135.4), border = "#77997e", col = "#77997e")

polygon(c(315, 325, 325, 315), c(151.4, 151.4, 167.1, 167.1), border = "#77997e", col = "#77997e")
polygon(c(325, 390, 390, 325), c(151.4, 151.4, 167.1, 167.1), border = "#1f5c87", col = "#1f5c87")

polygon(c(315, 330, 330, 315), c(167.1, 167.1, 182.8, 182.8), border = "#e8c55c", col = "#e8c55c")
polygon(c(330, 350, 350, 330), c(167.1, 167.1, 182.8, 182.8), border = "#77997e", col = "#77997e")
polygon(c(350, 375, 375, 350), c(167.1, 167.1, 182.8, 182.8), border = "#c05a50", col = "#c05a50")
polygon(c(375, 390, 390, 375), c(167.1, 167.1, 182.8, 182.8), border = "#1f5c87", col = "#1f5c87")

polygon(c(315, 330, 330, 315), c(182.8, 182.8, 198.5, 198.5), border = "#e8c55c", col = "#e8c55c")
polygon(c(330, 350, 350, 330), c(182.8, 182.8, 198.5, 198.5), border = "#c05a50", col = "#c05a50")
polygon(c(350, 390, 390, 350), c(182.8, 182.8, 198.5, 198.5), border = "#996f72", col = "#996f72")

polygon(c(315, 320, 320, 315), c(198.5, 198.5, 222, 222), border = "#e8c55c", col = "#e8c55c")
polygon(c(320, 350, 350, 320), c(198.5, 198.5, 222, 222), border = "#77997e", col = "#77997e")
polygon(c(350, 375, 375, 350), c(198.5, 198.5, 222, 222), border = "#c05a50", col = "#c05a50")
polygon(c(390, 375, 375, 390), c(198.5, 198.5, 222, 222), border = "#1f5c87", col = "#1f5c87")

polygon(c(315, 370, 370, 315), c(245.6, 245.6, 222, 222), border = "#77997e", col = "#77997e")
polygon(c(370, 380, 380, 370), c(245.6, 245.6, 222, 222), border = "#996f72", col = "#996f72")
polygon(c(380, 390, 390, 380), c(245.6, 245.6, 222, 222), border = "#c05a50", col = "#c05a50")

polygon(c(325, 315, 315, 325), c(245.6, 245.6, 261.3, 261.3), border = "#e8c55c", col = "#e8c55c")
polygon(c(325, 340, 340, 325), c(245.6, 245.6, 261.3, 261.3), border = "#996f72", col = "#996f72")
polygon(c(340, 370, 370, 340), c(245.6, 245.6, 261.3, 261.3), border = "#c05a50", col = "#c05a50")
polygon(c(390, 370, 370, 390), c(245.6, 245.6, 261.3, 261.3), border = "#1f5c87", col = "#1f5c87")

polygon(c(315, 320, 320, 315), c(277, 277, 261.3, 261.3), border = "#e8c55c", col = "#e8c55c")
polygon(c(320, 330, 330, 320), c(277, 277, 261.3, 261.3), border = "#77997e", col = "#77997e")
polygon(c(330, 355, 355, 330), c(277, 277, 261.3, 261.3), border = "#c05a50", col = "#c05a50")
polygon(c(355, 375, 375, 355), c(277, 277, 261.3, 261.3), border = "#996f72", col = "#996f72")
polygon(c(385, 375, 375, 385), c(277, 277, 261.3, 261.3), border = "#1f5c87", col = "#1f5c87")
polygon(c(390, 385, 385, 390), c(277, 277, 261.3, 261.3), border = "black", col = "black")

polygon(c(315, 325, 325, 315), c(277, 277, 292.7, 292.7), border = "#77997e", col = "#77997e")
polygon(c(325, 350, 350, 325), c(277, 277, 292.7, 292.7), border = "#c05a50", col = "#c05a50")
polygon(c(350, 365, 365, 350), c(277, 277, 292.7, 292.7), border = "#996f72", col = "#996f72")
polygon(c(390, 365, 365, 390), c(277, 277, 292.7, 292.7), border = "#1f5c87", col = "#1f5c87")

polygon(c(315, 330, 330, 315), c(308.4, 308.4, 292.7, 292.7), border = "#e8c55c", col = "#e8c55c")
polygon(c(330, 350, 350, 330), c(308.4, 308.4, 292.7, 292.7), border = "#77997e", col = "#77997e")
polygon(c(350, 370, 370, 350), c(308.4, 308.4, 292.7, 292.7), border = "#c05a50", col = "#c05a50")
polygon(c(370, 390, 390, 370), c(308.4, 308.4, 292.7, 292.7), border = "#1f5c87", col = "#1f5c87")

polygon(c(315, 370, 370, 315), c(308.4, 308.4, 325, 325), border = "#1f5c87", col = "#1f5c87")
polygon(c(370, 390, 390, 370), c(308.4, 308.4, 325, 325), border = "black", col = "black")

polygon(c(310, 340, 340, 310), c(341.6, 341.6, 325, 325), border = "#77997e", col = "#77997e")
polygon(c(340, 350, 350, 340), c(341.6, 341.6, 325, 325), border = "#e8c55c", col = "#e8c55c")
polygon(c(350, 370, 370, 350), c(341.6, 341.6, 325, 325), border = "#e8c55c", col = "#e8c55c")
polygon(c(370, 390, 390, 370), c(341.6, 341.6, 325, 325), border = "#e8c55c", col = "#e8c55c")

polygon(c(310, 315, 315, 310), c(341.6, 341.6, 358.2, 358.2), border = "#e8c55c", col = "#e8c55c")
polygon(c(315, 320, 320, 315), c(341.6, 341.6, 358.2, 358.2), border = "#c05a50", col = "#c05a50")
polygon(c(320, 390, 390, 320), c(341.6, 341.6, 358.2, 358.2), border = "#1f5c87", col = "#1f5c87")

polygon(c(310, 315, 315, 310), c(374.8, 374.8, 358.2, 358.2), border = "#e8c55c", col = "#e8c55c")
polygon(c(315, 345, 345, 315), c(374.8, 374.8, 358.2, 358.2), border = "#77997e", col = "#77997e")
polygon(c(345, 350, 350, 345), c(374.8, 374.8, 358.2, 358.2), border = "#996f72", col = "#996f72")
polygon(c(350, 390, 390, 350), c(374.8, 374.8, 358.2, 358.2), border = "#1f5c87", col = "#1f5c87")

polygon(c(360, 310, 310, 360), c(374.8, 374.8, 391.4, 391.4), border = "#c05a50", col = "#c05a50")
polygon(c(360, 375, 375, 360), c(374.8, 374.8, 391.4, 391.4), border = "#996f72", col = "#996f72")
polygon(c(375, 390, 390, 375), c(374.8, 374.8, 391.4, 391.4), border = "#77997e", col = "#77997e")

polygon(c(310, 315, 315, 310), c(391.4, 391.4, 408, 408), border = "#e8c55c", col = "#e8c55c")
polygon(c(315, 320, 320, 315), c(391.4, 391.4, 408, 408), border = "#c05a50", col = "#c05a50")
polygon(c(320, 335, 335, 320), c(391.4, 391.4, 408, 408), border = "#996f72", col = "#996f72")
polygon(c(390, 335, 335, 390), c(391.4, 391.4, 408, 408), border = "#1f5c87", col = "#1f5c87")

polygon(c(325, 310, 310, 325), c(408, 408, 424.6, 424.6), border = "#e8c55c", col = "#e8c55c")
polygon(c(325, 370, 370, 325), c(408, 408, 424.6, 424.6), border = "#c05a50", col = "#c05a50")
polygon(c(370, 390, 390, 370), c(408, 408, 424.6, 424.6), border = "black", col = "black")

polygon(c(335, 310, 310, 335), c(441.2, 441.2, 424.6, 424.6), border = "#77997e", col = "#77997e")
polygon(c(390, 335, 335, 390), c(441.2, 441.2, 424.6, 424.6), border = "#c05a50", col = "#c05a50")

polygon(c(325, 310, 310, 325), c(441.2, 441.2, 457.8, 457.8), border = "#996f72", col = "#996f72")
polygon(c(375, 325, 325, 375), c(441.2, 441.2, 457.8, 457.8), border = "#c05a50", col = "#c05a50")
polygon(c(390, 375, 375, 390), c(441.2, 441.2, 457.8, 457.8), border = "#1f5c87", col = "#1f5c87")

polygon(c(310, 315, 315, 310), c(474.4, 474.4, 457.8, 457.8), border = "#e8c55c", col = "#e8c55c")
polygon(c(315, 320, 320, 315), c(474.4, 474.4, 457.8, 457.8), border = "#996f72", col = "#996f72")
polygon(c(375, 320, 320, 375), c(474.4, 474.4, 457.8, 457.8), border = "#c05a50", col = "#c05a50")
polygon(c(390, 375, 375, 390), c(474.4, 474.4, 457.8, 457.8), border = "#1f5c87", col = "#1f5c87")

polygon(c(310, 320, 320, 310), c(474.4, 474.4, 491, 491), border = "#e8c55c", col = "#e8c55c")
polygon(c(320, 335, 335, 320), c(474.4, 474.4, 491, 491), border = "#77997e", col = "#77997e")
polygon(c(335, 355, 355, 335), c(474.4, 474.4, 491, 491), border = "#c05a50", col = "#c05a50")
polygon(c(355, 390, 390, 355), c(474.4, 474.4, 491, 491), border = "#1f5c87", col = "#1f5c87")

polygon(c(310, 345, 345, 310), c(507.6, 507.6, 491, 491), border = "#e8c55c", col = "#e8c55c")
polygon(c(345, 360, 360, 345), c(507.6, 507.6, 491, 491), border = "#77997e", col = "#77997e")
polygon(c(360, 390, 390, 360), c(507.6, 507.6, 491, 491), border = "#c05a50", col = "#c05a50")

polygon(c(350, 310, 310, 350), c(507.6, 507.6, 525, 525), border = "#c05a50", col = "#c05a50")
polygon(c(350, 390, 390, 350), c(507.6, 507.6, 525, 525), border = "#1f5c87", col = "#1f5c87")

segments(x0=315, x1=390, y0=50, y1=50, lwd = 1, lty = "solid")
segments(x0=315, x1=315, y0=50, y1=325, lwd = 1, lty = "solid")
segments(x0=315, x1=310, y0=325, y1=325, lwd = 1, lty = "solid")
segments(x0=310, x1=310, y0=325, y1=525, lwd = 1, lty = "solid")
segments(x0=310, x1=390, y0=525, y1=525, lwd = 1, lty = "solid")
segments(x0=390, x1=390, y0=50, y1=525, lwd = 1, lty = "solid")

text(352.5, 85, "5", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=330, x1=330, y0=50, y1=120, lwd = 1, lty = "solid")
segments(x0=345, x1=345, y0=50, y1=120, lwd = 1, lty = "solid")

segments(x0=315, x1=390, y0=120, y1=120, lwd = 1, lty = "solid")
text(352.5, 135.7, "4", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=315, x1=390, y0=151.4, y1=151.4, lwd = 1, lty = "solid")
text(352.5, 174.9, "3", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=315, x1=390, y0=198.5, y1=198.5, lwd = 1, lty = "solid")
text(352.5, 222, "2", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=315, x1=390, y0=245.6, y1=245.6, lwd = 1, lty = "solid")
text(352.5, 253.4, "5", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=315, x1=390, y0=261.3, y1=261.3, lwd = 1, lty = "solid")
text(352.5, 269.15, "4", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=315, x1=390, y0=277, y1=277, lwd = 1, lty = "solid")
text(352.5, 284.8, "3", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=315, x1=390, y0=292.7, y1=292.7, lwd = 1, lty = "solid")
text(352.5, 300.5, "2", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=315, x1=390, y0=308.4, y1=308.4, lwd = 1, lty = "solid")
text(352.5, 316.2, "1", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=315, x1=390, y0=325, y1=325, lwd = 1, lty = "solid")

segments(x0=310, x1=390, y0=325, y1=325, lwd = 1, lty = "solid")
text(352.5, 333.3, "17", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=310, x1=390, y0=341.6, y1=341.6, lwd = 1, lty = "solid")
text(352.5, 349.9, "16", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=310, x1=390, y0=358.2, y1=358.2, lwd = 1, lty = "solid")
text(352.5, 366.5, "15", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=310, x1=390, y0=374.8, y1=374.8, lwd = 1, lty = "solid")
text(352.5, 383.1, "14", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=310, x1=390, y0=391.4, y1=391.4, lwd = 1, lty = "solid")
text(352.5, 399.7, "13", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=310, x1=390, y0=408, y1=408, lwd = 1, lty = "solid")
text(352.5, 416.3, "12", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=310, x1=390, y0=424.6, y1=424.6, lwd = 1, lty = "solid")
text(352.5, 432.9, "11", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=310, x1=390, y0=441.2, y1=441.2, lwd = 1, lty = "solid")
text(352.5, 449.5, "10", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=310, x1=390, y0=457.8, y1=457.8, lwd = 1, lty = "solid")
text(352.5, 466.1, "9", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=310, x1=390, y0=474.4, y1=474.4, lwd = 1, lty = "solid")
text(352.5, 482.1, "8", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=310, x1=390, y0=491, y1=491, lwd = 1, lty = "solid")
text(352.5, 499.3, "7", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=310, x1=390, y0=507.6, y1=507.6, lwd = 1, lty = "solid")
text(352.5, 516.5, "6", family = "Main", cex = .75, col = "black", srt = 270)

#right1 down1

polygon(c(342, 326, 326, 342), c(580, 580, 535, 535), border = "#1f5c87", col = "#1f5c87")
polygon(c(342, 326, 326, 342), c(580, 580, 600, 600), border = "#c05a50", col = "#c05a50")

polygon(c(358, 342, 342, 358), c(570, 570, 535, 535), border = "#c05a50", col = "#c05a50")
polygon(c(358, 342, 342, 358), c(570, 570, 590, 590), border = "#77997e", col = "#77997e")
polygon(c(358, 342, 342, 358), c(590, 590, 600, 600), border = "#e8c55c", col = "#e8c55c")

polygon(c(358, 374, 374, 358), c(535, 535, 540, 540), border = "#1f5c87", col = "#1f5c87")
polygon(c(358, 374, 374, 358), c(540, 540, 590, 590), border = "#c05a50", col = "#c05a50")
polygon(c(358, 374, 374, 358), c(590, 590, 595, 595), border = "#77997e", col = "#77997e")
polygon(c(358, 374, 374, 358), c(595, 595, 600, 600), border = "#996f72", col = "#996f72")

polygon(c(390, 374, 374, 390), c(535, 535, 545, 545), border = "#996f72", col = "#996f72")
polygon(c(390, 374, 374, 390), c(545, 545, 585, 585), border = "#c05a50", col = "#c05a50")
polygon(c(390, 374, 374, 390), c(585, 585, 595, 595), border = "#77997e", col = "#77997e")
polygon(c(390, 374, 374, 390), c(595, 595, 600, 600), border = "#e8c55c", col = "#e8c55c")


segments(x0=310, x1=310, y0=600, y1=535, lwd = 1, lty = "solid")
segments(x0=390, x1=390, y0=600, y1=535, lwd = 1, lty = "solid")
segments(x0=310, x1=390, y0=535, y1=535, lwd = 1, lty = "solid")
segments(x0=310, x1=390, y0=600, y1=600, lwd = 1, lty = "solid")

text(318, 567.5, "5", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=326, x1=326, y0=535, y1=600, lwd = 1, lty = "solid")
text(334, 567.5, "4", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=342, x1=342, y0=535, y1=600, lwd = 1, lty = "solid")
text(350, 567.5, "3", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=358, x1=358, y0=535, y1=600, lwd = 1, lty = "solid")
text(366, 567.5, "2", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=374, x1=374, y0=535, y1=600, lwd = 1, lty = "solid")
text(382, 567.5, "1", family = "Main", cex = .75, col = "black", srt = 270)

#right2

polygon(c(400, 418.7, 418.7, 400), c(50, 50, 90, 90), border = "#996f72", col = "#996f72")
polygon(c(400, 418.7, 418.7, 400), c(90, 90, 120, 120), border = "#77997e", col = "#77997e")

polygon(c(437.5, 418.7, 418.7, 437.5), c(50, 50, 90, 90), border = "#e8c55c", col = "#e8c55c")
polygon(c(437.5, 418.7, 418.7, 437.5), c(90, 90, 105, 105), border = "#c05a50", col = "#c05a50")
polygon(c(437.5, 418.7, 418.7, 437.5), c(120, 120, 105, 105), border = "#1f5c87", col = "#1f5c87")

polygon(c(437.5, 456.1, 456.1, 437.5), c(50, 50, 55, 55), border = "#e8c55c", col = "#e8c55c")
polygon(c(437.5, 456.1, 456.1, 437.5), c(55, 55, 60, 60), border = "#77997e", col = "#77997e")
polygon(c(437.5, 456.1, 456.1, 437.5), c(60, 60, 90, 90), border = "#c05a50", col = "#c05a50")
polygon(c(437.5, 456.1, 456.1, 437.5), c(120, 120, 90, 90), border = "#1f5c87", col = "#1f5c87")

polygon(c(475, 456.1, 456.1, 475), c(50, 50, 80, 80), border = "#e8c55c", col = "#e8c55c")
polygon(c(475, 456.1, 456.1, 475), c(120, 120, 80, 80), border = "#c05a50", col = "#c05a50")

segments(x0=400, x1=400, y0=50, y1=120, lwd = 1, lty = "solid")
segments(x0=475, x1=475, y0=50, y1=120, lwd = 1, lty = "solid")
segments(x0=400, x1=475, y0=120, y1=120, lwd = 1, lty = "solid")
segments(x0=400, x1=475, y0=50, y1=50, lwd = 1, lty = "solid")

segments(x0=374, x1=374, y0=535, y1=600, lwd = 1, lty = "solid")

text(409.3, 85, "4", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=418.7, x1=418.7, y0=50, y1=120, lwd = 1, lty = "solid")
text(428, 85, "3", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=437.5, x1=437.5, y0=50, y1=120, lwd = 1, lty = "solid")
text(446.7, 85, "2", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=456.1, x1=456.1, y0=50, y1=120, lwd = 1, lty = "solid")
text(465.4, 85, "1", family = "Main", cex = .75, col = "black", srt = 270)

#right2 down1

polygon(c(400, 405, 405, 400), c(155, 155, 130, 130), border = "#1f5c87", col = "#1f5c87")
polygon(c(405, 435, 435, 405), c(155, 155, 130, 130), border = "#c05a50", col = "#c05a50")
polygon(c(435, 445, 445, 435), c(155, 155, 130, 130), border = "#996f72", col = "#996f72")
polygon(c(455, 445, 445, 455), c(155, 155, 130, 130), border = "#77997e", col = "#77997e")
polygon(c(455, 475, 475, 455), c(155, 155, 130, 130), border = "#e8c55c", col = "#e8c55c")

polygon(c(400, 450, 450, 400), c(155, 155, 171.6, 171.6), border = "#996f72", col = "#996f72")
polygon(c(450, 475, 475, 450), c(155, 155, 171.6, 171.6), border = "#e8c55c", col = "#e8c55c")

polygon(c(400, 440, 440, 400), c(188.2, 188.2, 171.6, 171.6), border = "#996f72", col = "#996f72")
polygon(c(475, 440, 440, 475), c(188.2, 188.2, 171.6, 171.6), border = "#e8c55c", col = "#e8c55c")

polygon(c(410, 400, 400, 410), c(188.2, 188.2, 204.8, 204.8), border = "#1f5c87", col = "#1f5c87")
polygon(c(410, 465, 465, 410), c(188.2, 188.2, 204.8, 204.8), border = "#77997e", col = "#77997e")
polygon(c(465, 475, 475, 465), c(188.2, 188.2, 204.8, 204.8), border = "#996f72", col = "#996f72")

polygon(c(415, 400, 400, 415), c(221.4, 221.4, 204.8, 204.8), border = "#c05a50", col = "#c05a50")
polygon(c(415, 435, 435, 415), c(221.4, 221.4, 204.8, 204.8), border = "#77997e", col = "#77997e")
polygon(c(435, 455, 455, 435), c(221.4, 221.4, 204.8, 204.8), border = "#996f72", col = "#996f72")
polygon(c(455, 475, 475, 455), c(221.4, 221.4, 204.8, 204.8), border = "#e8c55c", col = "#e8c55c")

polygon(c(400, 435, 435, 400), c(221.4, 221.4, 238, 238), border = "black", col = "black")
polygon(c(435, 455, 455, 435), c(221.4, 221.4, 238, 238), border = "#996f72", col = "#996f72")
polygon(c(475, 455, 455, 475), c(221.4, 221.4, 238, 238), border = "#c05a50", col = "#c05a50")

polygon(c(400, 475, 475, 400), c(254.6, 254.6, 238, 238), border = "#e8c55c", col = "#e8c55c")

polygon(c(400, 425, 425, 400), c(254.6, 254.6, 271.2, 271.2), border = "#c05a50", col = "#c05a50")
polygon(c(425, 445, 445, 425), c(254.6, 254.6, 271.2, 271.2), border = "#996f72", col = "#996f72")
polygon(c(445, 475, 475, 445), c(254.6, 254.6, 271.2, 271.2), border = "#e8c55c", col = "#e8c55c")

polygon(c(400, 430, 430, 400), c(287.8, 287.8, 271.2, 271.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(430, 440, 440, 430), c(287.8, 287.8, 271.2, 271.2), border = "#996f72", col = "#996f72")
polygon(c(440, 455, 455, 440), c(287.8, 287.8, 271.2, 271.2), border = "#c05a50", col = "#c05a50")
polygon(c(475, 455, 455, 475), c(287.8, 287.8, 271.2, 271.2), border = "#e8c55c", col = "#e8c55c")

polygon(c(415, 400, 400, 415), c(287.8, 287.8, 307.8, 307.8), border = "#1f5c87", col = "#1f5c87")
polygon(c(415, 430, 430, 415), c(287.8, 287.8, 307.8, 307.8), border = "#c05a50", col = "#c05a50")
polygon(c(430, 475, 475, 430), c(287.8, 287.8, 307.8, 307.8), border = "#e8c55c", col = "#e8c55c")

polygon(c(400, 430, 430, 400), c(327.8, 327.8, 307.8, 307.8), border = "#1f5c87", col = "#1f5c87")
polygon(c(430, 465, 465, 430), c(327.8, 327.8, 307.8, 307.8), border = "#c05a50", col = "#c05a50")
polygon(c(470, 465, 465, 470), c(327.8, 327.8, 307.8, 307.8), border = "#996f72", col = "#996f72")
polygon(c(475, 470, 470, 475), c(327.8, 327.8, 307.8, 307.8), border = "#e8c55c", col = "#e8c55c")

polygon(c(400, 475, 475, 400), c(327.8, 327.8, 344.4, 344.4), border = "#996f72", col = "#996f72")

polygon(c(450, 400, 400, 450), c(361, 361, 344.4, 344.4), border = "#77997e", col = "#77997e")
polygon(c(475, 450, 450, 475), c(361, 361, 344.4, 344.4), border = "#e8c55c", col = "#e8c55c")

polygon(c(425, 400, 400, 425), c(361, 361, 377.8, 377.8), border = "#1f5c87", col = "#1f5c87")
polygon(c(455, 425, 425, 455), c(361, 361, 377.8, 377.8), border = "#77997e", col = "#77997e")
polygon(c(475, 455, 455, 475), c(361, 361, 377.8, 377.8), border = "#e8c55c", col = "#e8c55c")

polygon(c(425, 400, 400, 425), c(393.6, 393.6, 377.8, 377.8), border = "#c05a50", col = "#c05a50")
polygon(c(475, 425, 425, 475), c(393.6, 393.6, 377.8, 377.8), border = "#996f72", col = "#996f72")

polygon(c(410, 400, 400, 410), c(409.5, 409.5, 393.6, 393.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(410, 420, 420, 410), c(409.5, 409.5, 393.6, 393.6), border = "#996f72", col = "#996f72")
polygon(c(420, 450, 450, 420), c(409.5, 409.5, 393.6, 393.6), border = "#c05a50", col = "#c05a50")
polygon(c(450, 475, 475, 450), c(409.5, 409.5, 393.6, 393.6), border = "#e8c55c", col = "#e8c55c")

polygon(c(415, 400, 400, 415), c(425.3, 425.3, 409.5, 409.5), border = "#1f5c87", col = "#1f5c87")
polygon(c(465, 415, 415, 465), c(425.3, 425.3, 409.5, 409.5), border = "#c05a50", col = "#c05a50")
polygon(c(475, 465, 465, 475), c(425.3, 425.3, 409.5, 409.5), border = "#e8c55c", col = "#e8c55c")

polygon(c(415, 400, 400, 415), c(425.3, 425.3, 441.2, 441.2), border = "#996f72", col = "#996f72")
polygon(c(415, 490, 490, 415), c(425.3, 425.3, 441.2, 441.2), border = "#c05a50", col = "#c05a50")

polygon(c(400, 410, 410, 400), c(457, 457, 441.2, 441.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(410, 420, 420, 410), c(457, 457, 441.2, 441.2), border = "#996f72", col = "#996f72")
polygon(c(420, 460, 460, 420), c(457, 457, 441.2, 441.2), border = "#c05a50", col = "#c05a50")
polygon(c(460, 475, 475, 460), c(457, 457, 441.2, 441.2), border = "#e8c55c", col = "#e8c55c")

polygon(c(410, 400, 400, 410), c(457, 457, 472.9, 472.9), border = "#c05a50", col = "#c05a50")
polygon(c(420, 410, 410, 420), c(457, 457, 472.9, 472.9), border = "#77997e", col = "#77997e")
polygon(c(430, 420, 420, 430), c(457, 457, 472.9, 472.9), border = "#996f72", col = "#996f72")
polygon(c(475, 430, 430, 475), c(457, 457, 472.9, 472.9), border = "#e8c55c", col = "#e8c55c")

polygon(c(400, 425, 425, 400), c(488.7, 488.7, 472.9, 472.9), border = "#1f5c87", col = "#1f5c87")
polygon(c(425, 460, 460, 425), c(488.7, 488.7, 472.9, 472.9), border = "#c05a50", col = "#c05a50")
polygon(c(460, 465, 465, 460), c(488.7, 488.7, 472.9, 472.9), border = "#77997e", col = "#77997e")
polygon(c(465, 475, 475, 465), c(488.7, 488.7, 472.9, 472.9), border = "#e8c55c", col = "#e8c55c")

polygon(c(400, 435, 435, 400), c(488.7, 488.7, 504.6, 504.6), border = "#77997e", col = "#77997e")
polygon(c(435, 475, 475, 435), c(488.7, 488.7, 504.6, 504.6), border = "#e8c55c", col = "#e8c55c")

polygon(c(400, 420, 420, 400), c(520, 520, 504.6, 504.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(420, 460, 460, 420), c(520, 520, 504.6, 504.6), border = "#996f72", col = "#996f72")
polygon(c(460, 475, 475, 460), c(520, 520, 504.6, 504.6), border = "#77997e", col = "#77997e")

polygon(c(400, 435, 435, 400), c(520, 520, 536.3, 536.3), border = "#c05a50", col = "#c05a50")
polygon(c(475, 435, 435, 475), c(520, 520, 536.3, 536.3), border = "#e8c55c", col = "#e8c55c")

polygon(c(400, 440, 440, 400), c(552, 552, 536.3, 536.3), border = "#1f5c87", col = "#1f5c87")
polygon(c(440, 450, 450, 440), c(552, 552, 536.3, 536.3), border = "#996f72", col = "#996f72")
polygon(c(450, 460, 460, 450), c(552, 552, 536.3, 536.3), border = "#c05a50", col = "#c05a50")
polygon(c(460, 470, 470, 460), c(552, 552, 536.3, 536.3), border = "#77997e", col = "#77997e")
polygon(c(470, 475, 475, 470), c(552, 552, 536.3, 536.3), border = "#e8c55c", col = "#e8c55c")

polygon(c(400, 420, 420, 400), c(552, 552, 568, 568), border = "black", col = "black")
polygon(c(420, 445, 445, 420), c(552, 552, 568, 568), border = "#1f5c87", col = "#1f5c87")
polygon(c(445, 455, 455, 445), c(552, 552, 568, 568), border = "#c05a50", col = "#c05a50")
polygon(c(455, 465, 465, 455), c(552, 552, 568, 568), border = "#77997e", col = "#77997e")
polygon(c(465, 470, 470, 465), c(552, 552, 568, 568), border = "#996f72", col = "#996f72")
polygon(c(470, 475, 475, 470), c(552, 552, 568, 568), border = "#e8c55c", col = "#e8c55c")

polygon(c(400, 425, 425, 400), c(583, 583, 568, 568), border = "#1f5c87", col = "#1f5c87")
polygon(c(425, 460, 460, 425), c(583, 583, 568, 568), border = "#c05a50", col = "#c05a50")
polygon(c(460, 475, 475, 460), c(583, 583, 568, 568), border = "#e8c55c", col = "#e8c55c")

polygon(c(400, 415, 415, 400), c(583, 583, 600, 600), border = "#c05a50", col = "#c05a50")
polygon(c(415, 430, 430, 415), c(583, 583, 600, 600), border = "#996f72", col = "#996f72")
polygon(c(475, 430, 430, 475), c(583, 583, 600, 600), border = "#e8c55c", col = "#e8c55c")

segments(x0=400, x1=475, y0=130, y1=130, lwd = 1, lty = "solid")
segments(x0=400, x1=475, y0=600, y1=600, lwd = 1, lty = "solid")
segments(x0=400, x1=400, y0=130, y1=600, lwd = 1, lty = "solid")
segments(x0=475, x1=475, y0=600, y1=130, lwd = 1, lty = "solid")

text(437.5, 142.5, "5", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=400, x1=475, y0=155, y1=155, lwd = 1, lty = "solid")
text(437.5, 163.3, "31", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=400, x1=475, y0=171.6, y1=171.6, lwd = 1, lty = "solid")
text(437.5, 179.9, "30", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=400, x1=475, y0=188.2, y1=188.2, lwd = 1, lty = "solid")
text(437.5, 196.5, "29", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=400, x1=475, y0=204.8, y1=204.8, lwd = 1, lty = "solid")
text(437.5, 213.1, "28", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=400, x1=475, y0=221.4, y1=221.4, lwd = 1, lty = "solid")
text(437.5, 229.7, "27", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=400, x1=475, y0=238, y1=238, lwd = 1, lty = "solid")
text(437.5, 246.3, "26", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=400, x1=475, y0=254.6, y1=254.6, lwd = 1, lty = "solid")
text(437.5, 262.9, "25", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=400, x1=475, y0=271.2, y1=271.2, lwd = 1, lty = "solid")
text(437.5, 279.5, "24", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=400, x1=475, y0=287.8, y1=287.8, lwd = 1, lty = "solid")
text(437.5, 305, "17", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=400, x1=475, y0=307.8, y1=307.8, lwd = 1, lty = "solid")
segments(x0=400, x1=475, y0=327.8, y1=327.8, lwd = 1, lty = "solid")
text(437.5, 352.8, "17", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=400, x1=475, y0=377.8, y1=377.8, lwd = 1, lty = "solid")
text(437.5, 393.6, "18", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=400, x1=475, y0=409.5, y1=409.5, lwd = 1, lty = "solid")
text(437.5, 425.3, "19", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=400, x1=475, y0=441.2, y1=441.2, lwd = 1, lty = "solid")
text(437.5, 457, "20", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=400, x1=475, y0=472.9, y1=472.9, lwd = 1, lty = "solid")
text(437.5, 488.7, "21", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=400, x1=475, y0=504.6, y1=504.6, lwd = 1, lty = "solid")
text(437.5, 520.4, "22", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=400, x1=475, y0=536.3, y1=536.3, lwd = 1, lty = "solid")
text(437.5, 552.1, "23", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=400, x1=475, y0=568, y1=568, lwd = 1, lty = "solid")
text(437.5, 583.8, "24", family = "Main", cex = .75, col = "black", srt = 270)

#right3

polygon(c(538.7, 557.5, 557.5, 538.7), c(50, 50, 90, 90), border = "#77997e", col = "#77997e")
polygon(c(538.7, 557.5, 557.5, 538.7), c(120, 120, 90, 90), border = "#c05a50", col = "#c05a50")

polygon(c(576.1, 557.5, 557.5, 576.1), c(120, 120, 50, 50), border = "#77997e", col = "#77997e")

polygon(c(576.1, 595, 595, 576.1), c(70, 70, 50, 50), border = "#77997e", col = "#77997e")
polygon(c(576.1, 595, 595, 576.1), c(120, 120, 70, 70), border = "#1f5c87", col = "#1f5c87")

segments(x0=520, x1=520, y0=50, y1=120, lwd = 1, lty = "solid")
segments(x0=595, x1=595, y0=50, y1=120, lwd = 1, lty = "solid")
segments(x0=520, x1=595, y0=120, y1=120, lwd = 1, lty = "solid")
segments(x0=520, x1=595, y0=50, y1=50, lwd = 1, lty = "solid")

text(529.3, 85, "17", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=538.7, x1=538.7, y0=50, y1=120, lwd = 1, lty = "solid")
text(548.1, 85, "16", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=557.5, x1=557.5, y0=50, y1=120, lwd = 1, lty = "solid")
text(566.9, 85, "15", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=576.1, x1=576.1, y0=50, y1=120, lwd = 1, lty = "solid")
text(585.7, 85, "14", family = "Main", cex = .75, col = "black", srt = 270)

#right3 down1

polygon(c(520, 555, 555, 520), c(130, 130, 155, 155), border = "#e8c55c", col = "#e8c55c")
polygon(c(555, 595, 595, 555), c(130, 130, 155, 155), border = "#c05a50", col = "#c05a50")

polygon(c(520, 555, 555, 520), c(171.6, 171.6, 155, 155), border = "#996f72", col = "#996f72")
polygon(c(555, 595, 595, 555), c(171.6, 171.6, 155, 155), border = "#1f5c87", col = "#1f5c87")

polygon(c(520, 530, 530, 520), c(171.6, 171.6, 188.2, 188.2), border = "#77997e", col = "#77997e")
polygon(c(530, 580, 580, 530), c(171.6, 171.6, 188.2, 188.2), border = "#c05a50", col = "#c05a50")
polygon(c(580, 595, 595, 580), c(171.6, 171.6, 188.2, 188.2), border = "#1f5c87", col = "#1f5c87")

polygon(c(520, 535, 535, 520), c(204.8, 204.8, 188.2, 188.2), border = "#c05a50", col = "#c05a50")
polygon(c(535, 595, 595, 535), c(204.8, 204.8, 188.2, 188.2), border = "#996f72", col = "#996f72")

polygon(c(520, 595, 595, 520), c(204.8, 204.8, 221.4, 221.4), border = "#1f5c87", col = "#1f5c87")

polygon(c(520, 540, 540, 520), c(238, 238, 221.4, 221.4), border = "#e8c55c", col = "#e8c55c")
polygon(c(540, 550, 550, 540), c(238, 238, 221.4, 221.4), border = "#77997e", col = "#77997e")
polygon(c(550, 560, 560, 550), c(238, 238, 221.4, 221.4), border = "#996f72", col = "#996f72")
polygon(c(560, 575, 575, 560), c(238, 238, 221.4, 221.4), border = "#c05a50", col = "#c05a50")
polygon(c(595, 575, 575, 595), c(238, 238, 221.4, 221.4), border = "#1f5c87", col = "#1f5c87")

polygon(c(595, 520, 520, 595), c(238, 238, 254.6, 254.6), border = "#996f72", col = "#996f72")

polygon(c(530, 520, 520, 530), c(254.6, 254.6, 271.2, 271.2), border = "#77997e", col = "#77997e")
polygon(c(580, 530, 530, 580), c(254.6, 254.6, 271.2, 271.2), border = "#c05a50", col = "#c05a50")
polygon(c(595, 580, 580, 595), c(254.6, 254.6, 271.2, 271.2), border = "#996f72", col = "#996f72")

polygon(c(520, 550, 550, 520), c(287.8, 287.8, 271.2, 271.2), border = "#996f72", col = "#996f72")
polygon(c(595, 550, 550, 595), c(287.8, 287.8, 271.2, 271.2), border = "#c05a50", col = "#c05a50")

polygon(c(520, 530, 530, 520), c(287.8, 287.8, 300.8, 300.8), border = "#e8c55c", col = "#e8c55c")
polygon(c(530, 540, 540, 530), c(287.8, 287.8, 300.8, 300.8), border = "#77997e", col = "#77997e")
polygon(c(540, 550, 550, 540), c(287.8, 287.8, 300.8, 300.8), border = "#996f72", col = "#996f72")
polygon(c(550, 575, 575, 550), c(287.8, 287.8, 300.8, 300.8), border = "#c05a50", col = "#c05a50")
polygon(c(575, 595, 595, 575), c(287.8, 287.8, 300.8, 300.8), border = "#1f5c87", col = "#1f5c87")

polygon(c(520, 530, 530, 520), c(313.8, 313.8, 300.8, 300.8), border = "#e8c55c", col = "#e8c55c")
polygon(c(530, 545, 545, 530), c(313.8, 313.8, 300.8, 300.8), border = "#77997e", col = "#77997e")
polygon(c(545, 560, 560, 545), c(313.8, 313.8, 300.8, 300.8), border = "#c05a50", col = "#c05a50")
polygon(c(560, 570, 570, 560), c(313.8, 313.8, 300.8, 300.8), border = "#996f72", col = "#996f72")
polygon(c(570, 595, 595, 570), c(313.8, 313.8, 300.8, 300.8), border = "#1f5c87", col = "#1f5c87")

polygon(c(520, 540, 540, 520), c(327.8, 327.8, 344.4, 344.4), border = "#e8c55c", col = "#e8c55c")
polygon(c(540, 570, 570, 540), c(327.8, 327.8, 344.4, 344.4), border = "#77997e", col = "#77997e")
polygon(c(570, 585, 585, 570), c(327.8, 327.8, 344.4, 344.4), border = "#c05a50", col = "#c05a50")
polygon(c(595, 585, 585, 595), c(327.8, 327.8, 344.4, 344.4), border = "#1f5c87", col = "#1f5c87")

polygon(c(520, 560, 560, 520), c(361, 361, 344.4, 344.4), border = "#e8c55c", col = "#e8c55c")
polygon(c(595, 560, 560, 595), c(361, 361, 344.4, 344.4), border = "black", col = "black")

polygon(c(520, 560, 560, 520), c(377.6, 377.6, 393, 393), border = "#e8c55c", col = "#e8c55c")
polygon(c(595, 560, 560, 595), c(377.6, 377.6, 393, 393), border = "#996f72", col = "#996f72")

polygon(c(520, 565, 565, 520), c(393, 393, 409.3, 409.3), border = "#c05a50", col = "#c05a50")
polygon(c(565, 595, 595, 565), c(393, 393, 409.3, 409.3), border = "#1f5c87", col = "#1f5c87")

polygon(c(520, 530, 530, 520), c(425.9, 425.9, 409.3, 409.3), border = "#e8c55c", col = "#e8c55c")
polygon(c(530, 580, 580, 530), c(425.9, 425.9, 409.3, 409.3), border = "#c05a50", col = "#c05a50")
polygon(c(595, 580, 580, 595), c(425.9, 425.9, 409.3, 409.3), border = "#1f5c87", col = "#1f5c87")

polygon(c(520, 525, 525, 520), c(425.9, 425.9, 441, 441), border = "#e8c55c", col = "#e8c55c")
polygon(c(525, 535, 535, 525), c(425.9, 425.9, 441, 441), border = "#77997e", col = "#77997e")
polygon(c(535, 560, 560, 535), c(425.9, 425.9, 441, 441), border = "#c05a50", col = "#c05a50")
polygon(c(560, 595, 595, 560), c(425.9, 425.9, 441, 441), border = "#1f5c87", col = "#1f5c87")

polygon(c(520, 595, 595, 520), c(457.6, 457.6, 441, 441), border = "#1f5c87", col = "#1f5c87")

polygon(c(520, 555, 555, 520), c(457.6, 457.6, 474.2, 474.2), border = "#c05a50", col = "#c05a50")
polygon(c(595, 555, 555, 595), c(457.6, 457.6, 474.2, 474.2), border = "#1f5c87", col = "#1f5c87")

polygon(c(595, 520, 520, 595), c(490.8, 490.8, 474.2, 474.2), border = "#e8c55c", col = "#e8c55c")

polygon(c(520, 535, 535, 520), c(540.8, 540.8, 555.8, 555.8), border = "#e8c55c", col = "#e8c55c")
polygon(c(535, 560, 560, 535), c(540.8, 540.8, 555.8, 555.8), border = "#c05a50", col = "#c05a50")
polygon(c(560, 595, 595, 560), c(540.8, 540.8, 555.8, 555.8), border = "#996f72", col = "#996f72")

polygon(c(520, 555, 555, 520), c(570.4, 570.4, 555.8, 555.8), border = "#c05a50", col = "#c05a50")
polygon(c(590, 555, 555, 590), c(570.4, 570.4, 555.8, 555.8), border = "#1f5c87", col = "#1f5c87")

polygon(c(520, 595, 595, 520), c(570.4, 570.4, 585.8, 585.8), border = "#77997e", col = "#77997e")

polygon(c(520, 535, 535, 520), c(600, 600, 585.8, 585.8), border = "#77997e", col = "#77997e")
polygon(c(535, 555, 555, 535), c(600, 600, 585.8, 585.8), border = "#996f72", col = "#996f72")
polygon(c(595, 555, 555, 595), c(600, 600, 585.8, 585.8), border = "#1f5c87", col = "#1f5c87")

segments(x0=520, x1=520, y0=600, y1=130, lwd = 1, lty = "solid")
segments(x0=595, x1=595, y0=600, y1=130, lwd = 1, lty = "solid")
segments(x0=520, x1=595, y0=130, y1=130, lwd = 1, lty = "solid")
segments(x0=520, x1=595, y0=600, y1=600, lwd = 1, lty = "solid")

text(557.5, 142.5, "18", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=155, y1=155, lwd = 1, lty = "solid")
text(557.5, 163.3, "6", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=171.6, y1=171.6, lwd = 1, lty = "solid")
text(557.5, 179.9, "5", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=188.2, y1=188.2, lwd = 1, lty = "solid")
text(557.5, 196.5, "4", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=204.8, y1=204.8, lwd = 1, lty = "solid")
text(557.5, 213.1, "3", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=221.4, y1=221.4, lwd = 1, lty = "solid")
text(557.5, 229.7, "2", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=238, y1=238, lwd = 1, lty = "solid")
text(557.5, 246.3, "1", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=254.6, y1=254.6, lwd = 1, lty = "solid")
text(557.5, 262.9, "19", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=271.2, y1=271.2, lwd = 1, lty = "solid")
text(557.5, 279.5, "20", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=287.8, y1=287.8, lwd = 1, lty = "solid")
text(557.5, 294.5, "21", family = "Main", cex = .7, col = "black", srt = 270)
segments(x0=520, x1=595, y0=300.8, y1=300.8, lwd = 1, lty = "solid")
text(557.5, 307.5, "22", family = "Main", cex = .7, col = "black", srt = 270)
segments(x0=520, x1=595, y0=313.8, y1=313.8, lwd = 1, lty = "solid")
text(557.5, 320.5, "23", family = "Main", cex = .7, col = "black", srt = 270)
segments(x0=520, x1=595, y0=327.8, y1=327.8, lwd = 1, lty = "solid")
segments(x0=520, x1=595, y0=344.4, y1=344.4, lwd = 1, lty = "solid")
text(557.5, 352.7, "16", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=361, y1=361, lwd = 1, lty = "solid")
segments(x0=520, x1=595, y0=377.6, y1=377.6, lwd = 1, lty = "solid")
segments(x0=520, x1=595, y0=409.3, y1=409.3, lwd = 1, lty = "solid")
text(557.5, 391.6, "15", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=425.9, y1=425.9, lwd = 1, lty = "solid")
text(557.5, 424.7, "14", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=457.6, y1=457.6, lwd = 1, lty = "solid")
text(557.5, 457.9, "13", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=474.2, y1=474.2, lwd = 1, lty = "solid")
text(557.5, 490, "12", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=490.8, y1=490.8, lwd = 1, lty = "solid")
text(557.5, 520.8, "11", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=540.8, y1=540.8, lwd = 1, lty = "solid")
text(557.5, 555.8, "10", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=570.4, y1=570.4, lwd = 1, lty = "solid")
text(557.5, 585.4, "9", family = "Main", cex = .75, col = "black", srt = 270)

#right4

polygon(c(623.7, 605, 605, 623.7), c(50, 50, 55, 55), border = "#e8c55c", col = "#e8c55c")
polygon(c(623.7, 605, 605, 623.7), c(55, 55, 60, 60), border = "#77997e", col = "#77997e")
polygon(c(623.7, 605, 605, 623.7), c(60, 60, 110, 110), border = "#c05a50", col = "#c05a50")
polygon(c(623.7, 605, 605, 623.7), c(110, 110, 120, 120), border = "#1f5c87", col = "#1f5c87")

polygon(c(623.7, 642.4, 642.4, 623.7), c(50, 50, 120, 120), border = "#77997e", col = "#77997e")

polygon(c(661.1, 642.4, 642.4, 661.1), c(50, 50, 120, 120), border = "#e8c55c", col = "#e8c55c")

polygon(c(661.1, 680, 680, 661.1), c(50, 50, 90, 90), border = "#e8c55c", col = "#e8c55c")
polygon(c(661.1, 680, 680, 661.1), c(90, 90, 120, 120), border = "#77997e", col = "#77997e")

segments(x0=680, x1=680, y0=50, y1=120, lwd = 1, lty = "solid")
segments(x0=605, x1=605, y0=50, y1=120, lwd = 1, lty = "solid")
segments(x0=680, x1=605, y0=120, y1=120, lwd = 1, lty = "solid")
segments(x0=680, x1=605, y0=50, y1=50, lwd = 1, lty = "solid")

text(614.3, 85, "13", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=623.7, x1=623.7, y0=50, y1=120, lwd = 1, lty = "solid")
text(633.1, 85, "12", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=642.4, x1=642.4, y0=50, y1=120, lwd = 1, lty = "solid")
text(651.9, 85, "11", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=661.1, x1=661.1, y0=50, y1=120, lwd = 1, lty = "solid")
text(670.7, 85, "10", family = "Main", cex = .75, col = "black", srt = 270)

#right4 down1

polygon(c(605, 635, 635, 605), c(130, 130, 155, 155), border = "#1f5c87", col = "#1f5c87")
polygon(c(635, 640, 640, 635), c(130, 130, 155, 155), border = "#996f72", col = "#996f72")
polygon(c(640, 655, 655, 640), c(130, 130, 155, 155), border = "#77997e", col = "#77997e")
polygon(c(655, 680, 680, 655), c(130, 130, 155, 155), border = "#e8c55c", col = "#e8c55c")

polygon(c(605, 620, 620, 605), c(171.6, 171.6, 155, 155), border = "#c05a50", col = "#c05a50")
polygon(c(620, 635, 635, 620), c(171.6, 171.6, 155, 155), border = "#996f72", col = "#996f72")
polygon(c(635, 655, 655, 635), c(171.6, 171.6, 155, 155), border = "#77997e", col = "#77997e")
polygon(c(655, 680, 680, 655), c(171.6, 171.6, 155, 155), border = "#e8c55c", col = "#e8c55c")

polygon(c(605, 645, 645, 605), c(171.6, 171.6, 188.2, 188.2), border = "#996f72", col = "#996f72")
polygon(c(645, 680, 680, 645), c(171.6, 171.6, 188.2, 188.2), border = "#e8c55c", col = "#e8c55c")

polygon(c(605, 625, 625, 605), c(204.8, 204.8, 188.2, 188.2), border = "#c05a50", col = "#c05a50")
polygon(c(625, 645, 645, 625), c(204.8, 204.8, 188.2, 188.2), border = "#77997e", col = "#77997e")
polygon(c(645, 680, 680, 645), c(204.8, 204.8, 188.2, 188.2), border = "#e8c55c", col = "#e8c55c")

polygon(c(605, 615, 615, 605), c(204.8, 204.8, 221.4, 221.4), border = "#1f5c87", col = "#1f5c87")
polygon(c(615, 630, 630, 615), c(204.8, 204.8, 221.4, 221.4), border = "#c05a50", col = "#c05a50")
polygon(c(630, 645, 645, 630), c(204.8, 204.8, 221.4, 221.4), border = "#996f72", col = "#996f72")
polygon(c(645, 665, 665, 645), c(204.8, 204.8, 221.4, 221.4), border = "#77997e", col = "#77997e")
polygon(c(665, 680, 680, 665), c(204.8, 204.8, 221.4, 221.4), border = "#e8c55c", col = "#e8c55c")

polygon(c(605, 645, 645, 605), c(238, 238, 221.4, 221.4), border = "#c05a50", col = "#c05a50")
polygon(c(645, 680, 680, 645), c(238, 238, 221.4, 221.4), border = "#e8c55c", col = "#e8c55c")

polygon(c(605, 680, 680, 605), c(238, 238, 254.6, 254.6), border = "#996f72", col = "#996f72")

polygon(c(605, 660, 660, 605), c(271.2, 271.2, 254.6, 254.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(660, 665, 665, 660), c(271.2, 271.2, 254.6, 254.6), border = "#c05a50", col = "#c05a50")
polygon(c(665, 675, 675, 665), c(271.2, 271.2, 254.6, 254.6), border = "#996f72", col = "#996f72")
polygon(c(675, 680, 680, 675), c(271.2, 271.2, 254.6, 254.6), border = "#e8c55c", col = "#e8c55c")

polygon(c(605, 635, 635, 605), c(271.2, 271.2, 287.8, 287.8), border = "#c05a50", col = "#c05a50")
polygon(c(635, 680, 680, 635), c(271.2, 271.2, 287.8, 287.8), border = "#e8c55c", col = "#e8c55c")

polygon(c(605, 635, 635, 605), c(301.8, 301.8, 287.8, 287.8), border = "#996f72", col = "#996f72")
polygon(c(635, 680, 680, 635), c(301.8, 301.8, 287.8, 287.8), border = "#e8c55c", col = "#e8c55c")

polygon(c(605, 680, 680, 605), c(301.8, 301.8, 330, 330), border = "#1f5c87", col = "#1f5c87")

polygon(c(605, 635, 635, 605), c(352.7, 352.7, 330, 330), border = "#c05a50", col = "#c05a50")
polygon(c(635, 680, 680, 635), c(352.7, 352.7, 330, 330), border = "#e8c55c", col = "#e8c55c")

polygon(c(605, 625, 625, 605), c(377.6, 377.6, 365.1, 365.1), border = "#1f5c87", col = "#1f5c87")
polygon(c(680, 625, 625, 680), c(377.6, 377.6, 365.1, 365.1), border = "#c05a50", col = "#c05a50")

polygon(c(630, 605, 605, 630), c(377.6, 377.6, 393.4, 393.4), border = "#1f5c87", col = "#1f5c87")
polygon(c(655, 630, 630, 655), c(377.6, 377.6, 393.4, 393.4), border = "#996f72", col = "#996f72")
polygon(c(680, 655, 655, 680), c(377.6, 377.6, 393.4, 393.4), border = "#77997e", col = "#77997e")

polygon(c(630, 605, 605, 630), c(409.3, 409.3, 393.4, 393.4), border = "#c05a50", col = "#c05a50")
polygon(c(655, 630, 630, 655), c(409.3, 409.3, 393.4, 393.4), border = "#77997e", col = "#77997e")
polygon(c(680, 655, 655, 680), c(409.3, 409.3, 393.4, 393.4), border = "#e8c55c", col = "#e8c55c")

polygon(c(630, 605, 605, 630), c(409.3, 409.3, 423.2, 423.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(655, 630, 630, 655), c(409.3, 409.3, 423.2, 423.2), border = "#996f72", col = "#996f72")
polygon(c(680, 655, 655, 680), c(409.3, 409.3, 423.2, 423.2), border = "#e8c55c", col = "#e8c55c")

polygon(c(620, 605, 605, 620), c(437.1, 437.1, 423.2, 423.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(620, 640, 640, 620), c(437.1, 437.1, 423.2, 423.2), border = "#c05a50", col = "#c05a50")
polygon(c(640, 660, 660, 640), c(437.1, 437.1, 423.2, 423.2), border = "#77997e", col = "#77997e")
polygon(c(660, 680, 680, 660), c(437.1, 437.1, 423.2, 423.2), border = "#e8c55c", col = "#e8c55c")

polygon(c(605, 680, 680, 605), c(437.1, 437.1, 455.9, 455.9), border = "#e8c55c", col = "#e8c55c")

polygon(c(605, 680, 680, 605), c(474.8, 474.8, 455.9, 455.9), border = "#996f72", col = "#996f72")

polygon(c(605, 660, 660, 605), c(474.8, 474.8, 481.9, 481.9), border = "#1f5c87", col = "#1f5c87")
polygon(c(660, 670, 670, 660), c(474.8, 474.8, 481.9, 481.9), border = "#c05a50", col = "#c05a50")
polygon(c(675, 670, 670, 675), c(474.8, 474.8, 481.9, 481.9), border = "#77997e", col = "#77997e")
polygon(c(675, 680, 680, 675), c(474.8, 474.8, 481.9, 481.9), border = "#e8c55c", col = "#e8c55c")

polygon(c(605, 665, 665, 605), c(503.5, 503.5, 481.9, 481.9), border = "#1f5c87", col = "#1f5c87")
polygon(c(665, 670, 670, 665), c(503.5, 503.5, 481.9, 481.9), border = "#c05a50", col = "#c05a50")
polygon(c(675, 670, 670, 675), c(503.5, 503.5, 481.9, 481.9), border = "#77997e", col = "#77997e")
polygon(c(675, 680, 680, 675), c(503.5, 503.5, 481.9, 481.9), border = "#e8c55c", col = "#e8c55c")

polygon(c(625, 605, 605, 625), c(503.5, 503.5, 517.3, 517.3), border = "#1f5c87", col = "#1f5c87")
polygon(c(640, 625, 625, 640), c(503.5, 503.5, 517.3, 517.3), border = "#996f72", col = "#996f72")
polygon(c(660, 640, 640, 660), c(503.5, 503.5, 517.3, 517.3), border = "#c05a50", col = "#c05a50")
polygon(c(680, 660, 660, 680), c(503.5, 503.5, 517.3, 517.3), border = "#e8c55c", col = "#e8c55c")

polygon(c(605, 615, 615, 605), c(531.2, 531.2, 517.3, 517.3), border = "#1f5c87", col = "#1f5c87")
polygon(c(615, 625, 625, 615), c(531.2, 531.2, 517.3, 517.3), border = "#996f72", col = "#996f72")
polygon(c(625, 650, 650, 625), c(531.2, 531.2, 517.3, 517.3), border = "#77997e", col = "#77997e")
polygon(c(650, 680, 680, 650), c(531.2, 531.2, 517.3, 517.3), border = "#e8c55c", col = "#e8c55c")

polygon(c(645, 605, 605, 645), c(531.2, 531.2, 547.5, 547.5), border = "#1f5c87", col = "#1f5c87")
polygon(c(645, 680, 680, 645), c(531.2, 531.2, 547.5, 547.5), border = "#77997e", col = "#77997e")

polygon(c(640, 605, 605, 640), c(547.5, 547.5, 563.9, 563.9), border = "#c05a50", col = "#c05a50")
polygon(c(680, 640, 640, 680), c(547.5, 547.5, 563.9, 563.9), border = "#77997e", col = "#77997e")

polygon(c(625, 605, 605, 625), c(581.9, 581.9, 563.9, 563.9), border = "#1f5c87", col = "#1f5c87")
polygon(c(640, 625, 625, 640), c(581.9, 581.9, 563.9, 563.9), border = "#996f72", col = "#996f72")
polygon(c(640, 680, 680, 640), c(581.9, 581.9, 563.9, 563.9), border = "#c05a50", col = "#c05a50")

polygon(c(605, 640, 640, 605), c(581.9, 581.9, 600, 600), border = "#1f5c87", col = "#1f5c87")
polygon(c(640, 680, 680, 640), c(581.9, 581.9, 600, 600), border = "#996f72", col = "#996f72")

segments(x0=680, x1=680, y0=600, y1=130, lwd = 1, lty = "solid")
segments(x0=605, x1=605, y0=600, y1=130, lwd = 1, lty = "solid")
segments(x0=680, x1=605, y0=130, y1=130, lwd = 1, lty = "solid")
segments(x0=680, x1=605, y0=600, y1=600, lwd = 1, lty = "solid")

text(642.5, 142.5, "9", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=155, y1=155, lwd = 1, lty = "solid")
text(642.5, 163.3, "8", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=171.6, y1=171.6, lwd = 1, lty = "solid")
text(642.5, 179.9, "7", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=188.2, y1=188.2, lwd = 1, lty = "solid")
text(642.5, 196.5, "6", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=204.8, y1=204.8, lwd = 1, lty = "solid")
text(642.5, 213.1, "5", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=221.4, y1=221.4, lwd = 1, lty = "solid")
text(642.5, 229.7, "4", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=238, y1=238, lwd = 1, lty = "solid")
text(642.5, 246.3, "3", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=254.6, y1=254.6, lwd = 1, lty = "solid")
text(642.5, 262.9, "2", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=271.2, y1=271.2, lwd = 1, lty = "solid")
text(642.5, 279.5, "1", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=287.8, y1=287.8, lwd = 1, lty = "solid")
text(642.5, 352.7, "1", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=330, y1=330, lwd = 1, lty = "solid")
text(642.5, 391.6, "2", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=352.7, y1=352.7, lwd = 1, lty = "solid")
text(642.5, 424.7, "3", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=377.6, y1=377.6, lwd = 1, lty = "solid")
text(642.5, 457.9, "4", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=409.3, y1=409.3, lwd = 1, lty = "solid")
text(642.5, 490, "5", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=437.1, y1=437.1, lwd = 1, lty = "solid")
text(642.5, 520.8, "6", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=474.8, y1=474.8, lwd = 1, lty = "solid")
text(642.5, 548.8, "7", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=503.5, y1=503.5, lwd = 1, lty = "solid")
text(642.5, 585.4, "8", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=531.2, y1=531.2, lwd = 1, lty = "solid")
segments(x0=605, x1=680, y0=563.9, y1=563.9, lwd = 1, lty = "solid")

#right5

polygon(c(725, 743.7, 743.7, 725), c(50, 50, 70, 70), border = "#e8c55c", col = "#e8c55c")
polygon(c(725, 743.7, 743.7, 725), c(70, 70, 83.2, 83.2), border = "#77997e", col = "#77997e")

polygon(c(743.7, 762.5, 762.5, 743.7), c(50, 50, 55, 55), border = "#e8c55c", col = "#e8c55c")
polygon(c(743.7, 762.5, 762.5, 743.7), c(55, 55, 60, 60), border = "#77997e", col = "#77997e")
polygon(c(743.7, 762.5, 762.5, 743.7), c(60, 60, 70, 70), border = "#c05a50", col = "#c05a50")
polygon(c(743.7, 762.5, 762.5, 743.7), c(70, 70, 83.2, 83.2), border = "#1f5c87", col = "#1f5c87")

polygon(c(762.5, 781.2, 781.2, 762.5), c(50, 50, 60, 60), border = "#e8c55c", col = "#e8c55c")
polygon(c(762.5, 781.2, 781.2, 762.5), c(60, 60, 68, 68), border = "#77997e", col = "#77997e")
polygon(c(762.5, 781.2, 781.2, 762.5), c(68, 68, 83.2, 83.2), border = "#c05a50", col = "#c05a50")

polygon(c(781.2, 800, 800, 781.2), c(50, 50, 60, 60), border = "#e8c55c", col = "#e8c55c")
polygon(c(781.2, 800, 800, 781.2), c(60, 60, 68, 68), border = "#77997e", col = "#77997e")
polygon(c(781.2, 800, 800, 781.2), c(68, 68, 74, 74), border = "#c05a50", col = "#c05a50")
polygon(c(781.2, 800, 800, 781.2), c(74, 74, 83.2, 83.2), border = "#1f5c87", col = "#1f5c87")



polygon(c(725, 775, 775, 725), c(99.8, 99.8, 83.2, 83.2), border = "#c05a50", col = "#c05a50")
polygon(c(775, 800, 800, 775), c(99.8, 99.8, 83.2, 83.2), border = "#996f72", col = "#996f72")

polygon(c(725, 800, 800, 725), c(99.8, 99.8, 116.4, 116.4), border = "#e8c55c", col = "#e8c55c")

polygon(c(725, 740, 740, 725), c(133, 133, 116.4, 116.4), border = "#77997e", col = "#77997e")
polygon(c(740, 780, 780, 740), c(133, 133, 116.4, 116.4), border = "#c05a50", col = "#c05a50")
polygon(c(800, 780, 780, 800), c(133, 133, 116.4, 116.4), border = "#1f5c87", col = "#1f5c87")

polygon(c(725, 745, 745, 725), c(133, 133, 149.6, 149.6), border = "#e8c55c", col = "#e8c55c")
polygon(c(745, 780, 780, 745), c(133, 133, 149.6, 149.6), border = "#c05a50", col = "#c05a50")
polygon(c(800, 780, 780, 800), c(133, 133, 149.6, 149.6), border = "#1f5c87", col = "#1f5c87")

polygon(c(725, 750, 750, 725), c(166.2, 166.2, 149.6, 149.6), border = "#77997e", col = "#77997e")
polygon(c(800, 750, 750, 800), c(166.2, 166.2, 149.6, 149.6), border = "#c05a50", col = "#1f5c87")

polygon(c(725, 735, 735, 725), c(166.2, 166.2, 182.8, 182.8), border = "#77997e", col = "#77997e")
polygon(c(735, 750, 750, 735), c(166.2, 166.2, 182.8, 182.8), border = "#c05a50", col = "#c05a50")
polygon(c(780, 750, 750, 780), c(166.2, 166.2, 182.8, 182.8), border = "#1f5c87", col = "#1f5c87")
polygon(c(780, 800, 800, 780), c(166.2, 166.2, 182.8, 182.8), border = "black", col = "black")

polygon(c(725, 735, 735, 725), c(182.8, 182.8, 199.4, 199.4), border = "#77997e", col = "#77997e")
polygon(c(735, 755, 755, 735), c(182.8, 182.8, 199.4, 199.4), border = "#e8c55c", col = "#e8c55c")
polygon(c(800, 755, 755, 800), c(182.8, 182.8, 199.4, 199.4), border = "black", col = "black")

polygon(c(735, 725, 725, 735), c(216, 216, 199.4, 199.4), border = "#e8c55c", col = "#e8c55c")
polygon(c(770, 735, 735, 770), c(216, 216, 199.4, 199.4), border = "#c05a50", col = "#c05a50")
polygon(c(770, 780, 780, 770), c(216, 216, 199.4, 199.4), border = "#996f72", col = "#996f72")
polygon(c(780, 790, 790, 780), c(216, 216, 199.4, 199.4), border = "#1f5c87", col = "#1f5c87")
polygon(c(790, 800, 800, 790), c(216, 216, 199.4, 199.4), border = "black", col = "black")

polygon(c(725, 760, 760, 725), c(216, 216, 232.6, 232.6), border = "#c05a50", col = "#c05a50")
polygon(c(760, 800, 800, 760), c(216, 216, 232.6, 232.6), border = "#1f5c87", col = "#1f5c87")

polygon(c(800, 725, 725, 800), c(249.2, 249.2, 232.6, 232.6), border = "#e8c55c", col = "#e8c55c")

polygon(c(800, 725, 725, 800), c(265.8, 265.8, 249.2, 249.2), border = "#77997e", col = "#77997e")

polygon(c(800, 725, 725, 800), c(265.8, 265.8, 282.4, 282.4), border = "#e8c55c", col = "#e8c55c")

polygon(c(760, 725, 725, 760), c(299, 299, 282.4, 282.4), border = "#e8c55c", col = "#e8c55c")
polygon(c(800, 760, 760, 800), c(299, 299, 282.4, 282.4), border = "#c05a50", col = "#c05a50")

polygon(c(800, 725, 725, 800), c(299, 299, 315.6, 315.6), border = "#996f72", col = "#996f72")

polygon(c(725, 735, 735, 725), c(340.5, 340.5, 315.6, 315.6), border = "#e8c55c", col = "#e8c55c")
polygon(c(735, 780, 780, 735), c(340.5, 340.5, 315.6, 315.6), border = "#c05a50", col = "#c05a50")
polygon(c(800, 780, 780, 800), c(340.5, 340.5, 315.6, 315.6), border = "#1f5c87", col = "#1f5c87")

polygon(c(725, 780, 780, 725), c(340.5, 340.5, 365.4, 365.4), border = "#e8c55c", col = "#e8c55c")
polygon(c(800, 780, 780, 800), c(340.5, 340.5, 365.4, 365.4), border = "#1f5c87", col = "#1f5c87")

polygon(c(725, 775, 775, 725), c(382, 382, 365.4, 365.4), border = "#1f5c87", col = "#1f5c87")
polygon(c(775, 800, 800, 775), c(382, 382, 365.4, 365.4), border = "black", col = "black")

polygon(c(725, 740, 740, 725), c(382, 382, 398.6, 398.6), border = "#e8c55c", col = "#e8c55c")
polygon(c(755, 740, 740, 755), c(382, 382, 398.6, 398.6), border = "#77997e", col = "#77997e")
polygon(c(770, 755, 755, 770), c(382, 382, 398.6, 398.6), border = "#996f72", col = "#996f72")
polygon(c(785, 770, 770, 785), c(382, 382, 398.6, 398.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(785, 800, 800, 785), c(382, 382, 398.6, 398.6), border = "black", col = "black")

polygon(c(725, 740, 740, 725), c(415.2, 415.2, 398.6, 398.6), border = "#e8c55c", col = "#e8c55c")
polygon(c(755, 740, 740, 755), c(415.2, 415.2, 398.6, 398.6), border = "#c05a50", col = "#c05a50")
polygon(c(770, 755, 755, 770), c(415.2, 415.2, 398.6, 398.6), border = "#996f72", col = "#996f72")
polygon(c(770, 800, 800, 770), c(415.2, 415.2, 398.6, 398.6), border = "#1f5c87", col = "#1f5c87")

polygon(c(800, 725, 725, 800), c(415.2, 415.2, 431.8, 431.8), border = "#1f5c87", col = "#1f5c87")

polygon(c(725, 770, 770, 725), c(431.8, 431.8, 448.4, 448.4), border = "#e8c55c", col = "#e8c55c")
polygon(c(770, 800, 800, 770), c(431.8, 431.8, 448.4, 448.4), border = "#996f72", col = "#996f72")

polygon(c(725, 730, 730, 725), c(465, 465, 448.4, 448.4), border = "#e8c55c", col = "#e8c55c")
polygon(c(730, 735, 735, 730), c(465, 465, 448.4, 448.4), border = "#77997e", col = "#77997e")
polygon(c(735, 740, 740, 735), c(465, 465, 448.4, 448.4), border = "#996f72", col = "#996f72")
polygon(c(740, 770, 770, 740), c(465, 465, 448.4, 448.4), border = "#c05a50", col = "#c05a50")
polygon(c(770, 800, 800, 770), c(465, 465, 448.4, 448.4), border = "#1f5c87", col = "#1f5c87")

polygon(c(725, 740, 740, 725), c(465, 465, 481.6, 481.6), border = "#e8c55c", col = "#e8c55c")
polygon(c(750, 740, 740, 750), c(465, 465, 481.6, 481.6), border = "#77997e", col = "#77997e")
polygon(c(760, 750, 750, 760), c(465, 465, 481.6, 481.6), border = "#996f72", col = "#996f72")
polygon(c(800, 760, 760, 800), c(465, 465, 481.6, 481.6), border = "#c05a50", col = "#c05a50")

polygon(c(725, 730, 730, 725), c(481.6, 481.6, 498.2, 498.2), border = "#c05a50", col = "#c05a50")
polygon(c(730, 735, 735, 730), c(481.6, 481.6, 498.2, 498.2), border = "#996f72", col = "#996f72")
polygon(c(735, 780, 780, 735), c(481.6, 481.6, 498.2, 498.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(800, 780, 780, 800), c(481.6, 481.6, 498.2, 498.2), border = "black", col = "black")

polygon(c(800, 725, 725, 800), c(515.6, 515.6, 498.2, 498.2), border = "#77997e", col = "#77997e")

polygon(c(800, 725, 725, 800), c(515.6, 515.6, 533, 533), border = "#1f5c87", col = "#1f5c87")

polygon(c(725, 760, 760, 725), c(549.5, 549.5, 533, 533), border = "#c05a50", col = "#c05a50")
polygon(c(760, 800, 800, 760), c(549.5, 549.5, 533, 533), border = "#1f5c87", col = "#1f5c87")

polygon(c(725, 730, 730, 725), c(549.5, 549.5, 566, 566), border = "#c05a50", col = "#c05a50")
polygon(c(730, 795, 795, 730), c(549.5, 549.5, 566, 566), border = "#1f5c87", col = "#1f5c87")
polygon(c(800, 795, 795, 800), c(549.5, 549.5, 566, 566), border = "black", col = "black")

polygon(c(725, 745, 745, 725), c(583, 583, 566, 566), border = "#e8c55c", col = "#e8c55c")
polygon(c(745, 775, 775, 745), c(583, 583, 566, 566), border = "#c05a50", col = "#c05a50")
polygon(c(775, 790, 790, 775), c(583, 583, 566, 566), border = "#77997e", col = "#77997e")
polygon(c(790, 800, 800, 790), c(583, 583, 566, 566), border = "#1f5c87", col = "#1f5c87")

polygon(c(725, 745, 745, 725), c(583, 583, 600, 600), border = "#e8c55c", col = "#e8c55c")
polygon(c(745, 755, 755, 745), c(583, 583, 600, 600), border = "#77997e", col = "#77997e")
polygon(c(755, 765, 765, 755), c(583, 583, 600, 600), border = "#c05a50", col = "#c05a50")
polygon(c(765, 775, 775, 765), c(583, 583, 600, 600), border = "#996f72", col = "#996f72")
polygon(c(775, 795, 795, 775), c(583, 583, 600, 600), border = "#1f5c87", col = "#1f5c87")
polygon(c(795, 800, 800, 795), c(583, 583, 600, 600), border = "black", col = "black")

segments(x0=725, x1=725, y0=50, y1=600, lwd = 1, lty = "solid")
segments(x0=800, x1=800, y0=50, y1=600, lwd = 1, lty = "solid")
segments(x0=725, x1=800, y0=600, y1=600, lwd = 1, lty = "solid")
segments(x0=725, x1=800, y0=50, y1=50, lwd = 1, lty = "solid")

text(762.5, 58.3, "1", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=66.6, y1=66.6, lwd = 1, lty = "solid")
text(762.5, 74.9, "2", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=83.2, y1=83.2, lwd = 1, lty = "solid")
text(762.5, 91.5, "3", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=99.8, y1=99.8, lwd = 1, lty = "solid")
text(762.5, 108.1, "4", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=116.4, y1=116.4, lwd = 1, lty = "solid")
text(762.5, 124.7, "5", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=133, y1=133, lwd = 1, lty = "solid")
text(762.5, 141.3, "6", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=149.6, y1=149.6, lwd = 1, lty = "solid")
text(762.5, 157.9, "7", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=166.2, y1=166.2, lwd = 1, lty = "solid")
text(762.5, 174.5, "8", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=182.8, y1=182.8, lwd = 1, lty = "solid")
text(762.5, 191.1, "9", family = "Main", cex = .75, col = "white", srt = 270)
segments(x0=725, x1=800, y0=199.4, y1=199.4, lwd = 1, lty = "solid")
text(762.5, 207.7, "10", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=216, y1=216, lwd = 1, lty = "solid")
text(762.5, 224.3, "11", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=232.6, y1=232.6, lwd = 1, lty = "solid")
text(762.5, 240.9, "12", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=249.2, y1=249.2, lwd = 1, lty = "solid")
text(762.5, 257.5, "13", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=265.8, y1=265.8, lwd = 1, lty = "solid")
text(762.5, 274.1, "14", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=282.4, y1=282.4, lwd = 1, lty = "solid")
text(762.5, 290.7, "15", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=299, y1=299, lwd = 1, lty = "solid")
text(762.5, 307.3, "16", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=315.6, y1=315.6, lwd = 1, lty = "solid")
text(762.5, 340.6, "17", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=365.4, y1=365.4, lwd = 1, lty = "solid")
text(762.5, 382, "18", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=382, y1=382, lwd = 1, lty = "solid")
segments(x0=725, x1=800, y0=398.6, y1=398.6, lwd = 1, lty = "solid")
text(762.5, 415.2, "19", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=415.2, y1=415.2, lwd = 1, lty = "solid")
text(762.5, 448.4, "20", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=448.4, y1=448.4, lwd = 1, lty = "solid")
text(762.5, 473.3, "21", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=465, y1=465, lwd = 1, lty = "solid")
segments(x0=725, x1=800, y0=481.6, y1=481.6, lwd = 1, lty = "solid")
segments(x0=725, x1=800, y0=498.2, y1=498.2, lwd = 1, lty = "solid")
text(762.5, 515.6, "22", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=533, y1=533, lwd = 1, lty = "solid")
text(762.5, 548.8, "23", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=566, y1=566, lwd = 1, lty = "solid")
text(762.5, 585.4, "24", family = "Main", cex = .75, col = "black", srt = 270)


#right6

polygon(c(810, 825, 825, 810), c(50, 50, 60, 60), border = "#77997e", col = "#77997e")
polygon(c(810, 825, 825, 810), c(60, 60, 78, 78), border = "#c05a50", col = "#c05a50")
polygon(c(810, 825, 825, 810), c(83, 83, 78, 78), border = "#996f72", col = "#996f72")

polygon(c(840, 825, 825, 840), c(50, 50, 58, 58), border = "#e8c55c", col = "#e8c55c")
polygon(c(840, 825, 825, 840), c(58, 58, 66, 66), border = "#c05a50", col = "#c05a50")
polygon(c(840, 825, 825, 840), c(66, 66, 75, 75), border = "#1f5c87", col = "#1f5c87")
polygon(c(840, 825, 825, 840), c(83, 83, 75, 75), border = "#996f72", col = "#996f72")

polygon(c(840, 855, 855, 840), c(50, 50, 55, 55), border = "#e8c55c", col = "#e8c55c")
polygon(c(840, 855, 855, 840), c(55, 55, 65, 65), border = "#77997e", col = "#77997e")
polygon(c(840, 855, 855, 840), c(65, 65, 70, 70), border = "#c05a50", col = "#c05a50")
polygon(c(840, 855, 855, 840), c(70, 70, 78, 78), border = "#1f5c87", col = "#1f5c87")
polygon(c(840, 855, 855, 840), c(78, 78, 83, 83), border = "black", col = "black")

polygon(c(870, 855, 855, 870), c(50, 50, 55, 55), border = "#e8c55c", col = "#e8c55c")
polygon(c(870, 855, 855, 870), c(55, 55, 63, 63), border = "#77997e", col = "#77997e")
polygon(c(870, 855, 855, 870), c(63, 63, 72, 72), border = "#c05a50", col = "#c05a50")
polygon(c(870, 855, 855, 870), c(72, 72, 83, 83), border = "#1f5c87", col = "#1f5c87")

polygon(c(870, 885, 885, 870), c(50, 50, 65, 65), border = "#c05a50", col = "#c05a50")
polygon(c(870, 885, 885, 870), c(68, 68, 65, 65), border = "#996f72", col = "#996f72")
polygon(c(870, 885, 885, 870), c(68, 68, 83, 83), border = "#1f5c87", col = "#1f5c87")

polygon(c(810, 875, 875, 810), c(149.6, 149.6, 166.2, 166.2), border = "#c05a50", col = "#c05a50")
polygon(c(875, 885, 885, 875), c(149.6, 149.6, 166.2, 166.2), border = "#e8c55c", col = "#e8c55c")

polygon(c(810, 830, 830, 810), c(182.8, 182.8, 166.2, 166.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(830, 875, 875, 830), c(182.8, 182.8, 166.2, 166.2), border = "#c05a50", col = "#c05a50")
polygon(c(885, 875, 875, 885), c(182.8, 182.8, 166.2, 166.2), border = "#e8c55c", col = "#e8c55c")

polygon(c(850, 810, 810, 850), c(182.8, 182.8, 193.8, 193.8), border = "#c05a50", col = "#c05a50")
polygon(c(850, 885, 885, 850), c(182.8, 182.8, 193.8, 193.8), border = "#e8c55c", col = "#e8c55c")

polygon(c(810, 830, 830, 810), c(216, 216, 193.8, 193.8), border = "#1f5c87", col = "#1f5c87")
polygon(c(830, 865, 865, 830), c(216, 216, 193.8, 193.8), border = "#c05a50", col = "#c05a50")
polygon(c(875, 865, 865, 875), c(216, 216, 193.8, 193.8), border = "#77997e", col = "#77997e")
polygon(c(885, 875, 875, 885), c(216, 216, 193.8, 193.8), border = "#e8c55c", col = "#e8c55c")

polygon(c(810, 850, 850, 810), c(216, 216, 232.6, 232.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(885, 850, 850, 885), c(216, 216, 232.6, 232.6), border = "#77997e", col = "#77997e")

polygon(c(810, 820, 820, 810), c(249.2, 249.2, 232.6, 232.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(820, 875, 875, 820), c(249.2, 249.2, 232.6, 232.6), border = "#c05a50", col = "#c05a50")
polygon(c(885, 875, 875, 885), c(249.2, 249.2, 232.6, 232.6), border = "#e8c55c", col = "#e8c55c")

polygon(c(885, 810, 810, 885), c(249.2, 249.2, 265.8, 265.8), border = "#e8c55c", col = "#e8c55c")

polygon(c(810, 820, 820, 810), c(282.4, 282.4, 265.8, 265.8), border = "#1f5c87", col = "#1f5c87")
polygon(c(820, 850, 850, 820), c(282.4, 282.4, 265.8, 265.8), border = "#c05a50", col = "#c05a50")
polygon(c(885, 850, 850, 885), c(282.4, 282.4, 265.8, 265.8), border = "#77997e", col = "#77997e")

polygon(c(810, 885, 885, 810), c(282.4, 282.4, 299, 299), border = "#e8c55c", col = "#e8c55c")

polygon(c(810, 885, 885, 810), c(315.6, 315.6, 299, 299), border = "#996f72", col = "#996f72")

polygon(c(810, 850, 850, 810), c(315.6, 315.6, 332.2, 332.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(850, 860, 860, 850), c(315.6, 315.6, 332.2, 332.2), border = "#77997e", col = "#77997e")
polygon(c(860, 870, 870, 860), c(315.6, 315.6, 332.2, 332.2), border = "#996f72", col = "#996f72")
polygon(c(885, 870, 870, 885), c(315.6, 315.6, 332.2, 332.2), border = "#e8c55c", col = "#e8c55c")

polygon(c(810, 825, 825, 810), c(332.2, 332.2, 348.8, 348.8), border = "#1f5c87", col = "#1f5c87")
polygon(c(860, 825, 825, 860), c(332.2, 332.2, 348.8, 348.8), border = "#c05a50", col = "#c05a50")
polygon(c(870, 860, 860, 870), c(332.2, 332.2, 348.8, 348.8), border = "#77997e", col = "#77997e")
polygon(c(885, 870, 870, 885), c(332.2, 332.2, 348.8, 348.8), border = "#e8c55c", col = "#e8c55c")

polygon(c(810, 815, 815, 810), c(365.4, 365.4, 348.8, 348.8), border = "#1f5c87", col = "#1f5c87")
polygon(c(815, 875, 875, 815), c(365.4, 365.4, 348.8, 348.8), border = "#c05a50", col = "#c05a50")
polygon(c(875, 885, 885, 875), c(365.4, 365.4, 348.8, 348.8), border = "#77997e", col = "#77997e")

polygon(c(810, 855, 855, 810), c(365.4, 365.4, 382, 382), border = "#1f5c87", col = "#1f5c87")
polygon(c(885, 855, 855, 885), c(365.4, 365.4, 382, 382), border = "#c05a50", col = "#c05a50")

polygon(c(810, 885, 885, 810), c(398.6, 398.6, 382, 382), border = "#e8c55c", col = "#e8c55c")

polygon(c(810, 830, 830, 810), c(398.6, 398.6, 415.2, 415.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(830, 850, 850, 830), c(398.6, 398.6, 415.2, 415.2), border = "#c05a50", col = "#c05a50")
polygon(c(850, 870, 870, 850), c(398.6, 398.6, 415.2, 415.2), border = "#77997e", col = "#77997e")
polygon(c(870, 885, 885, 870), c(398.6, 398.6, 415.2, 415.2), border = "#e8c55c", col = "#e8c55c")

polygon(c(810, 830, 830, 810), c(431.8, 431.8, 415.2, 415.2), border = "black", col = "black")
polygon(c(830, 845, 845, 830), c(431.8, 431.8, 415.2, 415.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(845, 850, 850, 845), c(431.8, 431.8, 415.2, 415.2), border = "#996f72", col = "#996f72")
polygon(c(850, 870, 870, 850), c(431.8, 431.8, 415.2, 415.2), border = "#c05a50", col = "#c05a50")
polygon(c(870, 885, 885, 870), c(431.8, 431.8, 415.2, 415.2), border = "#e8c55c", col = "#e8c55c")

polygon(c(810, 885, 885, 810), c(431.8, 431.8, 448.4, 448.4), border = "#1f5c87", col = "#1f5c87")

polygon(c(810, 850, 850, 810), c(448.4, 448.4, 465, 465), border = "#77997e", col = "#77997e")
polygon(c(850, 885, 885, 850), c(448.4, 448.4, 465, 465), border = "#e8c55c", col = "#e8c55c")

polygon(c(810, 835, 835, 810), c(481.6, 481.6, 498.2, 498.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(885, 835, 835, 885), c(481.6, 481.6, 498.2, 498.2), border = "#996f72", col = "#996f72")

polygon(c(810, 825, 825, 810), c(533, 533, 549.5, 549.5), border = "black", col = "black")
polygon(c(825, 840, 840, 825), c(533, 533, 549.5, 549.5), border = "#c05a50", col = "#c05a50")
polygon(c(840, 855, 855, 840), c(533, 533, 549.5, 549.5), border = "#996f72", col = "#996f72")
polygon(c(855, 870, 870, 855), c(533, 533, 549.5, 549.5), border = "#77997e", col = "#77997e")
polygon(c(870, 885, 885, 870), c(533, 533, 549.5, 549.5), border = "#e8c55c", col = "#e8c55c")

polygon(c(885, 810, 810, 885), c(566, 566, 549.5, 549.5), border = "#c05a50", col = "#c05a50")

polygon(c(830, 810, 810, 830), c(566, 566, 600, 600), border = "#77997e", col = "#77997e")
polygon(c(860, 830, 830, 860), c(566, 566, 600, 600), border = "#1f5c87", col = "#1f5c87")
polygon(c(875, 860, 860, 875), c(566, 566, 600, 600), border = "#e8c55c", col = "#e8c55c")

segments(x0=885, x1=885, y0=50, y1=600, lwd = 1, lty = "solid")
segments(x0=810, x1=810, y0=50, y1=600, lwd = 1, lty = "solid")
segments(x0=810, x1=885, y0=600, y1=600, lwd = 1, lty = "solid")
segments(x0=810, x1=885, y0=50, y1=50, lwd = 1, lty = "solid")

text(847.5, 66.6, "2", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=810, x1=885, y0=83.2, y1=83.2, lwd = 1, lty = "solid")
text(847.5, 99.8, "5", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=810, x1=885, y0=116.4, y1=116.4, lwd = 1, lty = "solid")
text(847.5, 133, "8", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=810, x1=885, y0=149.6, y1=149.6, lwd = 1, lty = "solid")
text(847.5, 166.2, "11", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=810, x1=885, y0=166.2, y1=166.2, lwd = 1, lty = "solid")
text(847.5, 199.4, "14", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=810, x1=885, y0=182.8, y1=182.8, lwd = 1, lty = "solid")
text(847.5, 232.6, "17", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=810, x1=885, y0=216, y1=216, lwd = 1, lty = "solid")
text(847.5, 265.8, "20", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=810, x1=885, y0=232.6, y1=232.6, lwd = 1, lty = "solid")
text(847.5, 299, "23", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=810, x1=885, y0=249.2, y1=249.2, lwd = 1, lty = "solid")
text(847.5, 332.2, "16", family = "Main", cex = .75, col = "black", srt = 270)
text(847.5, 382, "15", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=810, x1=885, y0=282.4, y1=282.4, lwd = 1, lty = "solid")
segments(x0=810, x1=885, y0=315.6, y1=315.6, lwd = 1, lty = "solid")
segments(x0=810, x1=885, y0=365.4, y1=365.4, lwd = 1, lty = "solid")
segments(x0=810, x1=885, y0=398.6, y1=398.6, lwd = 1, lty = "solid")
text(847.5, 415.2, "14", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=810, x1=885, y0=431.8, y1=431.8, lwd = 1, lty = "solid")
text(847.5, 448.4, "13", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=810, x1=885, y0=465, y1=465, lwd = 1, lty = "solid")
text(847.5, 481.6, "12", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=810, x1=885, y0=498.2, y1=498.2, lwd = 1, lty = "solid")
text(847.5, 515.6, "11", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=810, x1=885, y0=533, y1=533, lwd = 1, lty = "solid")
text(847.5, 549.5, "10", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=810, x1=885, y0=566, y1=566, lwd = 1, lty = "solid")
text(847.5, 583, "9", family = "Main", cex = .75, col = "black", srt = 270)

#right7

polygon(c(930, 980, 980, 930), c(50, 50, 116.4, 116.4), border = "#e8c55c", col = "#e8c55c")
polygon(c(980, 1010, 1010, 980), c(50, 50, 116.4, 116.4), border = "#996f72", col = "#996f72")

polygon(c(930, 970, 970, 930), c(133, 133, 116.4, 116.4), border = "#c05a50", col = "#c05a50")
polygon(c(970, 990, 990, 970), c(133, 133, 116.4, 116.4), border = "#1f5c87", col = "#1f5c87")
polygon(c(990, 1010, 1010, 990), c(133, 133, 116.4, 116.4), border = "black", col = "black")

polygon(c(930, 935, 935, 930), c(133, 133, 149.6, 149.6), border = "#996f72", col = "#996f72")
polygon(c(935, 955, 955, 935), c(133, 133, 149.6, 149.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(1010, 955, 955, 1010), c(133, 133, 149.6, 149.6), border = "black", col = "black")

polygon(c(930, 955, 955, 930), c(166.2, 166.2, 149.6, 149.6), border = "#77997e", col = "#77997e")
polygon(c(955, 980, 980, 955), c(166.2, 166.2, 149.6, 149.6), border = "#c05a50", col = "#c05a50")
polygon(c(1010, 980, 980, 1010), c(166.2, 166.2, 149.6, 149.6), border = "#996f72", col = "#996f72")

polygon(c(930, 980, 980, 930), c(166.2, 166.2, 182.8, 182.8), border = "#e8c55c", col = "#e8c55c")
polygon(c(980, 1010, 1010, 980), c(166.2, 166.2, 182.8, 182.8), border = "#c05a50", col = "#c05a50")

polygon(c(980, 930, 930, 980), c(216, 216, 182.8, 182.8), border = "#1f5c87", col = "#1f5c87")
polygon(c(1010, 980, 980, 1010), c(216, 216, 182.8, 182.8), border = "black", col = "black")

polygon(c(930, 955, 955, 930), c(216, 216, 249.2, 249.2), border = "#e8c55c", col = "#e8c55c")
polygon(c(955, 980, 980, 955), c(216, 216, 249.2, 249.2), border = "#77997e", col = "#77997e")
polygon(c(980, 1010, 1010, 980), c(216, 216, 249.2, 249.2), border = "#c05a50", col = "#c05a50")

polygon(c(930, 960, 960, 930), c(249.2, 249.2, 265.8, 265.8), border = "#c05a50", col = "#c05a50")
polygon(c(960, 980, 980, 960), c(249.2, 249.2, 265.8, 265.8), border = "#996f72", col = "#996f72")
polygon(c(980, 1010, 1010, 980), c(249.2, 249.2, 265.8, 265.8), border = "#1f5c87", col = "#1f5c87")

polygon(c(930, 940, 940, 930), c(282.4, 282.4, 265.8, 265.8), border = "#77997e", col = "#77997e")
polygon(c(940, 965, 965, 940), c(282.4, 282.4, 265.8, 265.8), border = "#996f72", col = "#996f72")
polygon(c(1010, 965, 965, 1010), c(282.4, 282.4, 265.8, 265.8), border = "#1f5c87", col = "#1f5c87")

polygon(c(950, 930, 930, 950), c(282.4, 282.4, 299, 299), border = "#e8c55c", col = "#e8c55c")
polygon(c(990, 950, 950, 990), c(282.4, 282.4, 299, 299), border = "#1f5c87", col = "#1f5c87")
polygon(c(1010, 990, 990, 1010), c(282.4, 282.4, 299, 299), border = "black", col = "black")

polygon(c(945, 930, 930, 945), c(315.6, 315.6, 299, 299), border = "#e8c55c", col = "#e8c55c")
polygon(c(960, 945, 945, 960), c(315.6, 315.6, 299, 299), border = "#77997e", col = "#77997e")
polygon(c(990, 960, 960, 990), c(315.6, 315.6, 299, 299), border = "#996f72", col = "#996f72")
polygon(c(1010, 990, 990, 1010), c(315.6, 315.6, 299, 299), border = "#1f5c87", col = "#1f5c87")

polygon(c(930, 945, 945, 930), c(315.6, 315.6, 332.2, 332.2), border = "#77997e", col = "#77997e")
polygon(c(945, 990, 990, 945), c(315.6, 315.6, 332.2, 332.2), border = "#c05a50", col = "#c05a50")
polygon(c(990, 1010, 1010, 990), c(315.6, 315.6, 332.2, 332.2), border = "#1f5c87", col = "#1f5c87")

polygon(c(1010, 930, 930, 1010), c(348.8, 348.8, 365.4, 365.4), border = "#77997e", col = "#77997e")

polygon(c(930, 970, 970, 930), c(365.4, 365.4, 382, 382), border = "#1f5c87", col = "#1f5c87")
polygon(c(970, 1010, 1010, 970), c(365.4, 365.4, 382, 382), border = "black", col = "black")

polygon(c(935, 930, 930, 935), c(398.6, 398.6, 382, 382), border = "#c05a50", col = "#c05a50")
polygon(c(935, 1010, 1010, 935), c(398.6, 398.6, 382, 382), border = "black", col = "black")

polygon(c(930, 955, 955, 930), c(415.2, 415.2, 398.6, 398.6), border = "#e8c55c", col = "#e8c55c")
polygon(c(955, 1010, 1010, 955), c(415.2, 415.2, 398.6, 398.6), border = "#1f5c87", col = "#1f5c87")

polygon(c(1010, 930, 930, 1010), c(431.8, 431.8, 415.2, 415.2), border = "#c05a50", col = "#c05a50")

polygon(c(935, 930, 930, 935), c(431.8, 431.8, 448.4, 448.4), border = "#e8c55c", col = "#e8c55c")
polygon(c(1010, 935, 935, 1010), c(431.8, 431.8, 448.4, 448.4), border = "black", col = "black")

polygon(c(950, 930, 930, 950), c(465, 465, 448.4, 448.4), border = "#c05a50", col = "#c05a50")
polygon(c(950, 975, 975, 950), c(465, 465, 448.4, 448.4), border = "#1f5c87", col = "#1f5c87")
polygon(c(1010, 975, 975, 1010), c(465, 465, 448.4, 448.4), border = "black", col = "black")

polygon(c(930, 935, 935, 930), c(465, 465, 481.6, 481.6), border = "#e8c55c", col = "#e8c55c")
polygon(c(935, 945, 945, 935), c(465, 465, 481.6, 481.6), border = "#c05a50", col = "#c05a50")
polygon(c(945, 990, 990, 945), c(465, 465, 481.6, 481.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(990, 1010, 1010, 990), c(465, 465, 481.6, 481.6), border = "black", col = "black")

polygon(c(930, 940, 940, 930), c(498.2, 498.2, 481.6, 481.6), border = "#e8c55c", col = "#e8c55c")
polygon(c(940, 965, 965, 940), c(498.2, 498.2, 481.6, 481.6), border = "#c05a50", col = "#c05a50")
polygon(c(965, 1000, 1000, 965), c(498.2, 498.2, 481.6, 481.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(1010, 1000, 1000, 1010), c(498.2, 498.2, 481.6, 481.6), border = "black", col = "black")

polygon(c(930, 935, 935, 930), c(498.2, 498.2, 515.6, 515.6), border = "#e8c55c", col = "#e8c55c")
polygon(c(935, 955, 955, 935), c(498.2, 498.2, 515.6, 515.6), border = "#77997e", col = "#77997e")
polygon(c(995, 955, 955, 995), c(498.2, 498.2, 515.6, 515.6), border = "#c05a50", col = "#c05a50")
polygon(c(1010, 995, 995, 1010), c(498.2, 498.2, 515.6, 515.6), border = "#1f5c87", col = "#1f5c87")

polygon(c(930, 955, 955, 930), c(533, 533, 515.6, 515.6), border = "#e8c55c", col = "#e8c55c")
polygon(c(955, 975, 975, 955), c(533, 533, 515.6, 515.6), border = "#77997e", col = "#77997e")
polygon(c(975, 990, 990, 975), c(533, 533, 515.6, 515.6), border = "#c05a50", col = "#c05a50")
polygon(c(990, 1010, 1010, 990), c(533, 533, 515.6, 515.6), border = "#996f72", col = "#996f72")

polygon(c(930, 940, 940, 930), c(533, 533, 549.5, 549.5), border = "#e8c55c", col = "#e8c55c")
polygon(c(940, 960, 960, 940), c(533, 533, 549.5, 549.5), border = "#c05a50", col = "#c05a50")
polygon(c(960, 975, 975, 960), c(533, 533, 549.5, 549.5), border = "#1f5c87", col = "#1f5c87")
polygon(c(975, 1010, 1010, 975), c(533, 533, 549.5, 549.5), border = "black", col = "black")

polygon(c(930, 940, 940, 930), c(566, 566, 549.5, 549.5), border = "#e8c55c", col = "#e8c55c")
polygon(c(940, 960, 960, 940), c(566, 566, 549.5, 549.5), border = "#77997e", col = "#77997e")
polygon(c(960, 985, 985, 960), c(566, 566, 549.5, 549.5), border = "#c05a50", col = "#c05a50")
polygon(c(985, 1010, 1010, 985), c(566, 566, 549.5, 549.5), border = "#1f5c87", col = "#1f5c87")

polygon(c(930, 940, 940, 930), c(566, 566, 583, 583), border = "#c05a50", col = "#c05a50")
polygon(c(940, 980, 980, 940), c(566, 566, 583, 583), border = "#1f5c87", col = "#1f5c87")
polygon(c(980, 1010, 1010, 980), c(566, 566, 583, 583), border = "#e8c55c", col = "#e8c55c")

polygon(c(930, 980, 980, 930), c(583, 583, 600, 600), border = "#1f5c87", col = "#1f5c87")
polygon(c(980, 1010, 1010, 980), c(583, 583, 600, 600), border = "#e8c55c", col = "#e8c55c")


polygon(c(1010, 1026, 1026, 1010), c(50, 50, 60, 60), border = "#77997e", col = "#77997e")
polygon(c(1010, 1026, 1026, 1010), c(60, 60, 83.2, 83.2), border = "#1f5c87", col = "#1f5c87")

polygon(c(1026, 1042, 1042, 1026), c(50, 50, 83.2, 83.2), border = "#77997e", col = "#77997e")

polygon(c(1042, 1058, 1058, 1042), c(50, 50, 83.2, 83.2), border = "#996f72", col = "#996f72")

polygon(c(1090, 1074, 1074, 1090), c(50, 50, 83.2, 83.2), border = "#996f72", col = "#996f72")

polygon(c(1070, 1010, 1010, 1070), c(83.2, 83.2, 99.8, 99.8), border = "#c05a50", col = "#c05a50")
polygon(c(1090, 1070, 1070, 1090), c(83.2, 83.2, 99.8, 99.8), border = "#996f72", col = "#996f72")

polygon(c(1010, 1090, 1090, 1010), c(133, 133, 116.4, 116.4), border = "#996f72", col = "#996f72")

polygon(c(1010, 1090, 1090, 1010), c(133, 133, 149.6, 149.6), border = "#c05a50", col = "#c05a50")

polygon(c(1040, 1010, 1010, 1040), c(182.8, 182.8, 199.4, 199.4), border = "black", col = "black")
polygon(c(1040, 1090, 1090, 1040), c(182.8, 182.8, 199.4, 199.4), border = "#c05a50", col = "#c05a50")

polygon(c(1090, 1010, 1010, 1090), c(216, 216, 199.4, 199.4), border = "#e8c55c", col = "#e8c55c")

polygon(c(1040, 1010, 1010, 1040), c(216, 216, 232.6, 232.6), border = "black", col = "black")
polygon(c(1050, 1040, 1040, 1050), c(216, 216, 232.6, 232.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(1070, 1050, 1050, 1070), c(216, 216, 232.6, 232.6), border = "#c05a50", col = "#c05a50")
polygon(c(1090, 1070, 1070, 1090), c(216, 216, 232.6, 232.6), border = "#996f72", col = "#996f72")

polygon(c(1050, 1010, 1010, 1050), c(232.6, 232.6, 249.2, 249.2), border = "black", col = "black")
polygon(c(1090, 1050, 1050, 1090), c(232.6, 232.6, 249.2, 249.2), border = "#c05a50", col = "#c05a50")

polygon(c(1030, 1010, 1010, 1030), c(265.8, 265.8, 282.4, 282.4), border = "#1f5c87", col = "#1f5c87")
polygon(c(1065, 1030, 1030, 1065), c(265.8, 265.8, 282.4, 282.4), border = "#c05a50", col = "#c05a50")
polygon(c(1090, 1065, 1065, 1090), c(265.8, 265.8, 282.4, 282.4), border = "#996f72", col = "#996f72")

polygon(c(1050, 1010, 1010, 1050), c(299, 299, 282.4, 282.4), border = "#c05a50", col = "#c05a50")
polygon(c(1090, 1050, 1050, 1090), c(299, 299, 282.4, 282.4), border = "#e8c55c", col = "#e8c55c")

polygon(c(1030, 1010, 1010, 1030), c(299, 299, 315.6, 315.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(1060, 1030, 1030, 1060), c(299, 299, 315.6, 315.6), border = "#77997e", col = "#77997e")
polygon(c(1090, 1060, 1060, 1090), c(299, 299, 315.6, 315.6), border = "#e8c55c", col = "#e8c55c")

polygon(c(1090, 1010, 1010, 1090), c(398.6, 398.6, 365.4, 365.4), border = "#e8c55c", col = "#e8c55c")

polygon(c(1090, 1010, 1010, 1090), c(398.6, 398.6, 415.2, 415.2), border = "#c05a50", col = "#c05a50")

polygon(c(1050, 1010, 1010, 1050), c(431.8, 431.8, 415.2, 415.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(1070, 1050, 1050, 1070), c(431.8, 431.8, 415.2, 415.2), border = "#996f72", col = "#996f72")
polygon(c(1070, 1090, 1090, 1070), c(431.8, 431.8, 415.2, 415.2), border = "#c05a50", col = "#c05a50")

polygon(c(1030, 1010, 1010, 1030), c(431.8, 431.8, 448.4, 448.4), border = "black", col = "black")
polygon(c(1070, 1030, 1030, 1070), c(431.8, 431.8, 448.4, 448.4), border = "#1f5c87", col = "#1f5c87")
polygon(c(1090, 1070, 1070, 1090), c(431.8, 431.8, 448.4, 448.4), border = "#c05a50", col = "#c05a50")

polygon(c(1060, 1010, 1010, 1060), c(465, 465, 448.4, 448.4), border = "black", col = "black")
polygon(c(1080, 1060, 1060, 1080), c(465, 465, 448.4, 448.4), border = "#c05a50", col = "#c05a50")
polygon(c(1080, 1090, 1090, 1080), c(465, 465, 448.4, 448.4), border = "#77997e", col = "#77997e")

polygon(c(1090, 1010, 1010, 1090), c(465, 465, 481.6, 481.6), border = "#1f5c87", col = "#1f5c87")

polygon(c(1015, 1010, 1010, 1015), c(498.2, 498.2, 481.6, 481.6), border = "black", col = "black")
polygon(c(1085, 1015, 1015, 1085), c(498.2, 498.2, 481.6, 481.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(1085, 1090, 1090, 1085), c(498.2, 498.2, 481.6, 481.6), border = "#77997e", col = "#77997e")

polygon(c(1085, 1010, 1010, 1085), c(498.2, 498.2, 515.6, 515.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(1090, 1085, 1085, 1090), c(498.2, 498.2, 515.6, 515.6), border = "#c05a50", col = "#c05a50")

polygon(c(1090, 1010, 1010, 1090), c(533, 533, 515.6, 515.6), border = "#996f72", col = "#996f72")

polygon(c(1030, 1010, 1010, 1030), c(533, 533, 549.5, 549.5), border = "black", col = "black")
polygon(c(1050, 1030, 1030, 1050), c(533, 533, 549.5, 549.5), border = "#77997e", col = "#77997e")
polygon(c(1090, 1050, 1050, 1090), c(533, 533, 549.5, 549.5), border = "#e8c55c", col = "#e8c55c")

polygon(c(1025, 1010, 1010, 1025), c(549.5, 549.5, 566, 566), border = "black", col = "black")
polygon(c(1070, 1025, 1025, 1070), c(549.5, 549.5, 566, 566), border = "#1f5c87", col = "#1f5c87")
polygon(c(1090, 1070, 1070, 1090), c(549.5, 549.5, 566, 566), border = "#c05a50", col = "#c05a50")

polygon(c(1026, 1010, 1010, 1026), c(583, 583, 566, 566), border = "#77997e", col = "#77997e")
polygon(c(1042, 1026, 1026, 1042), c(583, 583, 566, 566), border = "#1f5c87", col = "#1f5c87")
polygon(c(1058, 1042, 1042, 1058), c(583, 583, 566, 566), border = "#e8c55c", col = "#e8c55c")
polygon(c(1074, 1058, 1058, 1074), c(583, 583, 566, 566), border = "#1f5c87", col = "#1f5c87")

polygon(c(1026, 1010, 1010, 1026), c(583, 583, 600, 600), border = "#e8c55c", col = "#e8c55c")
polygon(c(1042, 1026, 1026, 1042), c(583, 583, 600, 600), border = "#1f5c87", col = "#1f5c87")
polygon(c(1058, 1042, 1042, 1058), c(583, 583, 600, 600), border = "#e8c55c", col = "#e8c55c")
polygon(c(1074, 1058, 1058, 1074), c(583, 583, 600, 600), border = "#c05a50", col = "#c05a50")

polygon(c(1074, 1090, 1090, 1074), c(566, 566, 577, 577), border = "black", col = "black")
polygon(c(1074, 1090, 1090, 1074), c(577, 577, 588, 588), border = "#1f5c87", col = "#1f5c87")
polygon(c(1074, 1090, 1090, 1074), c(588, 588, 600, 600), border = "#77997e", col = "#77997e")

segments(x0=930, x1=930, y0=50, y1=600, lwd = 1, lty = "solid")
segments(x0=1090, x1=1090, y0=50, y1=600, lwd = 1, lty = "solid")
segments(x0=1090, x1=930, y0=600, y1=600, lwd = 1, lty = "solid")
segments(x0=1090, x1=930, y0=50, y1=50, lwd = 1, lty = "solid")
segments(x0=1010, x1=1010, y0=50, y1=600, lwd = 1, lty = "solid")

text(1018.5, 66.6, "5", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1027, x1=1027, y0=50, y1=83.2, col="black", lwd = 1, lty = "solid")
text(1035.5, 66.6, "4", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1044, x1=1044, y0=50, y1=83.2, col="black", lwd = 1, lty = "solid")
text(1052.5, 66.6, "3", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1061, x1=1061, y0=50, y1=83.2, col="black", lwd = 1, lty = "solid")
text(1069.5, 66.6, "2", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1076, x1=1076, y0=50, y1=83.2, col="black", lwd = 1, lty = "solid")
text(1084.5, 66.6, "1", family = "Main", cex = .75, col = "black", srt = 270)


text(970, 66.6, "3", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=930, x1=1010, y0=83.2, y1=83.2, lwd = 1, lty = "solid")
text(970, 99.8, "4", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=930, x1=1010, y0=116.4, y1=116.4, lwd = 1, lty = "solid")
text(970, 133, "8", family = "Main", cex = .75, col = "white", srt = 270)
segments(x0=930, x1=1010, y0=149.6, y1=149.6, lwd = 1, lty = "solid")
text(970, 166.2, "10", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=930, x1=1010, y0=166.2, y1=166.2, lwd = 1, lty = "solid")
text(970, 199.4, "15", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=930, x1=1010, y0=182.8, y1=182.8, lwd = 1, lty = "solid")
text(970, 232.6, "16", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=930, x1=1010, y0=216, y1=216, lwd = 1, lty = "solid")
text(970, 265.8, "21", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=930, x1=1010, y0=232.6, y1=232.6, lwd = 1, lty = "solid")
text(970, 299, "22", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=930, x1=1010, y0=249.2, y1=249.2, lwd = 1, lty = "solid")
text(970, 338, "1", family = "Main", cex = .75, col = "black", srt = 270)
text(970, 382, "2", family = "Main", cex = .75, col = "white", srt = 270)
segments(x0=930, x1=1010, y0=282.4, y1=282.4, lwd = 1, lty = "solid")
segments(x0=930, x1=1010, y0=315.6, y1=315.6, lwd = 1, lty = "solid")
segments(x0=930, x1=1010, y0=365.4, y1=365.4, lwd = 1, lty = "solid")
segments(x0=930, x1=1010, y0=398.6, y1=398.6, lwd = 1, lty = "solid")
text(970, 415.2, "3", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=930, x1=1010, y0=431.8, y1=431.8, lwd = 1, lty = "solid")
text(970, 448.4, "4", family = "Main", cex = .75, col = "white", srt = 270)
segments(x0=930, x1=1010, y0=465, y1=465, lwd = 1, lty = "solid")
text(970, 481.6, "5", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=930, x1=1010, y0=498.2, y1=498.2, lwd = 1, lty = "solid")
text(970, 515.6, "6", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=930, x1=1010, y0=533, y1=533, lwd = 1, lty = "solid")
text(970, 549.5, "7", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=930, x1=1010, y0=566, y1=566, lwd = 1, lty = "solid")
text(970, 583, "8", family = "Main", cex = .75, col = "black", srt = 270)

segments(x0=1010, x1=1090, y0=83.2, y1=83.2, lwd = 1, lty = "solid")
text(1050, 99.8, "6", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1010, x1=1090, y0=99.8, y1=99.8, lwd = 1, lty = "solid")
text(1050, 133, "7", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1010, x1=1090, y0=116.4, y1=116.4, lwd = 1, lty = "solid")
text(1050, 166.2, "12", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1010, x1=1090, y0=149.6, y1=149.6, lwd = 1, lty = "solid")
text(1050, 199.4, "13", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1010, x1=1090, y0=182.8, y1=182.8, lwd = 1, lty = "solid")
text(1050, 232.6, "18", family = "Main", cex = .75, col = "white", srt = 270)
segments(x0=1010, x1=1090, y0=216, y1=216, lwd = 1, lty = "solid")
text(1050, 265.8, "19", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1010, x1=1090, y0=249.2, y1=249.2, lwd = 1, lty = "solid")
text(1050, 299, "24", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1010, x1=1090, y0=282.4, y1=282.4, lwd = 1, lty = "solid")
text(1050, 338, "17", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1010, x1=1090, y0=315.6, y1=315.6, lwd = 1, lty = "solid")
segments(x0=1010, x1=1090, y0=365.4, y1=365.4, lwd = 1, lty = "solid")
text(1050, 382, "18", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1010, x1=1090, y0=398.6, y1=398.6, lwd = 1, lty = "solid")
text(1050, 415.2, "19", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1010, x1=1090, y0=431.8, y1=431.8, lwd = 1, lty = "solid")
text(1050, 448.4, "20", family = "Main", cex = .75, col = "white", srt = 270)
segments(x0=1010, x1=1090, y0=465, y1=465, lwd = 1, lty = "solid")
text(1050, 481.6, "21", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1010, x1=1090, y0=498.2, y1=498.2, lwd = 1, lty = "solid")
text(1050, 515.6, "22", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1010, x1=1090, y0=514.8, y1=514.8, lwd = 1, lty = "solid")
segments(x0=1010, x1=1090, y0=533, y1=533, lwd = 1, lty = "solid")
text(1050, 549.5, "23", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1010, x1=1090, y0=566, y1=566, lwd = 1, lty = "solid")
text(1050, 583, "24", family = "Main", cex = .75, col = "black", srt = 270)

#right8

polygon(c(1125, 1141, 1141, 1125), c(50, 50, 120, 120), border = "black", col = "black")

polygon(c(1157, 1141, 1141, 1157), c(50, 50, 65, 65), border = "#c05a50", col = "#c05a50")
polygon(c(1157, 1141, 1141, 1157), c(65, 65, 85, 85), border = "#77997e", col = "#77997e")
polygon(c(1157, 1141, 1141, 1157), c(85, 85, 120, 120), border = "#1f5c87", col = "#1f5c87")

polygon(c(1157, 1173, 1173, 1157), c(50, 50, 120, 120), border = "#996f72", col = "#996f72")

polygon(c(1189, 1173, 1173, 1189), c(50, 50, 120, 120), border = "#996f72", col = "#996f72")

segments(x0=1205, x1=1205, y0=50, y1=120, lwd = 1, lty = "solid")
segments(x0=1125, x1=1125, y0=50, y1=120, lwd = 1, lty = "solid")
segments(x0=1125, x1=1205, y0=120, y1=120, lwd = 1, lty = "solid")
segments(x0=1125, x1=1205, y0=50, y1=50, lwd = 1, lty = "solid")

text(1133, 85, "5", family = "Main", cex = .75, col = "white", srt = 270)
segments(x0=1141, x1=1141, y0=50, y1=120, lwd = 1, lty = "solid")
text(1149, 85, "4", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1157, x1=1157, y0=50, y1=120, lwd = 1, lty = "solid")
text(1165, 85, "3", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1173, x1=1173, y0=50, y1=120, lwd = 1, lty = "solid")
text(1181, 85, "2", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1189, x1=1189, y0=50, y1=120, lwd = 1, lty = "solid")
text(1197, 85, "1", family = "Main", cex = .75, col = "black", srt = 270)

#right8 down1

polygon(c(1125, 1145, 1145, 1125), c(125, 125, 137.3, 137.3), border = "#c05a50", col = "#c05a50")
polygon(c(1145, 1175, 1175, 1145), c(125, 125, 137.3, 137.3), border = "#996f72", col = "#996f72")
polygon(c(1175, 1205, 1205, 1175), c(125, 125, 137.3, 137.3), border = "#1f5c87", col = "#1f5c87")

polygon(c(1125, 1130, 1130, 1125), c(137.3, 137.3, 149.6, 149.6), border = "#77997e", col = "#77997e")
polygon(c(1130, 1170, 1170, 1130), c(137.3, 137.3, 149.6, 149.6), border = "#c05a50", col = "#c05a50")
polygon(c(1170, 1180, 1180, 1170), c(137.3, 137.3, 149.6, 149.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(1180, 1205, 1205, 1180), c(137.3, 137.3, 149.6, 149.6), border = "#996f72", col = "#996f72")

polygon(c(1125, 1145, 1145, 1125), c(166.2, 166.2, 149.6, 149.6), border = "#77997e", col = "#77997e")
polygon(c(1145, 1165, 1165, 1145), c(166.2, 166.2, 149.6, 149.6), border = "#c05a50", col = "#c05a50")
polygon(c(1165, 1185, 1185, 1165), c(166.2, 166.2, 149.6, 149.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(1205, 1185, 1185, 1205), c(166.2, 166.2, 149.6, 149.6), border = "#996f72", col = "#996f72")

polygon(c(1125, 1140, 1140, 1125), c(166.2, 166.2, 182.8, 182.8), border = "#e8c55c", col = "#e8c55c")
polygon(c(1140, 1150, 1150, 1140), c(166.2, 166.2, 182.8, 182.8), border = "#77997e", col = "#77997e")
polygon(c(1150, 1185, 1185, 1150), c(166.2, 166.2, 182.8, 182.8), border = "#c05a50", col = "#c05a50")
polygon(c(1185, 1205, 1205, 1185), c(166.2, 166.2, 182.8, 182.8), border = "black", col = "black")


polygon(c(1125, 1130, 1130, 1125), c(216, 216, 182.8, 182.8), border = "#e8c55c", col = "#e8c55c")
polygon(c(1130, 1140, 1140, 1130), c(216, 216, 182.8, 182.8), border = "#77997e", col = "#77997e")
polygon(c(1140, 1150, 1150, 1140), c(216, 216, 182.8, 182.8), border = "#c05a50", col = "#c05a50")
polygon(c(1150, 1190, 1190, 1150), c(216, 216, 182.8, 182.8), border = "#1f5c87", col = "#1f5c87")
polygon(c(1190, 1205, 1205, 1190), c(216, 216, 182.8, 182.8), border = "black", col = "black")

polygon(c(1125, 1150, 1150, 1125), c(315.6, 315.6, 340.6, 340.6), border = "#c05a50", col = "#c05a50")
polygon(c(1205, 1150, 1150, 1205), c(315.6, 315.6, 340.6, 340.6), border = "#1f5c87", col = "#1f5c87")

polygon(c(1125, 1140, 1140, 1125), c(365.4, 365.4, 340.6, 340.6), border = "#c05a50", col = "#c05a50")
polygon(c(1140, 1205, 1205, 1140), c(365.4, 365.4, 340.6, 340.6), border = "#1f5c87", col = "#1f5c87")

polygon(c(1125, 1145, 1145, 1125), c(382, 382, 365.4, 365.4), border = "#77997e", col = "#77997e")
polygon(c(1145, 1205, 1205, 1145), c(382, 382, 365.4, 365.4), border = "#c05a50", col = "#c05a50")

polygon(c(1125, 1165, 1165, 1125), c(382, 382, 398.6, 398.6), border = "#c05a50", col = "#c05a50")
polygon(c(1165, 1205, 1205, 1165), c(382, 382, 398.6, 398.6), border = "#1f5c87", col = "#1f5c87")

polygon(c(1125, 1185, 1185, 1125), c(415.2, 415.2, 398.6, 398.6), border = "#996f72", col = "#996f72")
polygon(c(1185, 1205, 1205, 1185), c(415.2, 415.2, 398.6, 398.6), border = "#1f5c87", col = "#1f5c87")

polygon(c(1125, 1185, 1185, 1125), c(415.2, 415.2, 431.8, 431.8), border = "#1f5c87", col = "#1f5c87")
polygon(c(1185, 1205, 1205, 1185), c(415.2, 415.2, 431.8, 431.8), border = "black", col = "black")

polygon(c(1125, 1150, 1150, 1125), c(448.4, 448.4, 431.8, 431.8), border = "#77997e", col = "#77997e")
polygon(c(1150, 1175, 1175, 1150), c(448.4, 448.4, 431.8, 431.8), border = "#996f72", col = "#996f72")
polygon(c(1175, 1205, 1205, 1175), c(448.4, 448.4, 431.8, 431.8), border = "#c05a50", col = "#c05a50")

polygon(c(1125, 1150, 1150, 1125), c(448.4, 448.4, 465, 465), border = "#c05a50", col = "#c05a50")
polygon(c(1150, 1190, 1190, 1150), c(448.4, 448.4, 465, 465), border = "#1f5c87", col = "#1f5c87")
polygon(c(1190, 1205, 1205, 1190), c(448.4, 448.4, 465, 465), border = "black", col = "black")

polygon(c(1125, 1155, 1155, 1125), c(465, 465, 481.6, 481.6), border = "#c05a50", col = "#c05a50")
polygon(c(1155, 1205, 1205, 1155), c(465, 465, 481.6, 481.6), border = "#1f5c87", col = "#1f5c87")

polygon(c(1125, 1145, 1145, 1125), c(481.6, 481.6, 498.2, 498.2), border = "#c05a50", col = "#c05a50")
polygon(c(1145, 1205, 1205, 1145), c(481.6, 481.6, 498.2, 498.2), border = "#1f5c87", col = "#1f5c87")

polygon(c(1125, 1165, 1165, 1125), c(515.6, 515.6, 498.2, 498.2), border = "#e8c55c", col = "#e8c55c")
polygon(c(1165, 1205, 1205, 1165), c(515.6, 515.6, 498.2, 498.2), border = "black", col = "black")

polygon(c(1125, 1145, 1145, 1125), c(515.6, 515.6, 533, 533), border = "#77997e", col = "#77997e")
polygon(c(1145, 1150, 1150, 1145), c(515.6, 515.6, 533, 533), border = "#c05a50", col = "#c05a50")
polygon(c(1150, 1165, 1165, 1150), c(515.6, 515.6, 533, 533), border = "#996f72", col = "#996f72")
polygon(c(1165, 1205, 1205, 1165), c(515.6, 515.6, 533, 533), border = "#1f5c87", col = "#1f5c87")

polygon(c(1125, 1185, 1185, 1125), c(533, 533, 549.5, 549.5), border = "#e8c55c", col = "#e8c55c")
polygon(c(1185, 1205, 1205, 1185), c(533, 533, 549.5, 549.5), border = "#c05a50", col = "#c05a50")

polygon(c(1125, 1155, 1155, 1125), c(566, 566, 549.5, 549.5), border = "#77997e", col = "#77997e")
polygon(c(1155, 1205, 1205, 1155), c(566, 566, 549.5, 549.5), border = "#c05a50", col = "#c05a50")

polygon(c(1125, 1155, 1155, 1125), c(566, 566, 583, 583), border = "#e8c55c", col = "#e8c55c")
polygon(c(1155, 1185, 1185, 1155), c(566, 566, 583, 583), border = "black", col = "black")
polygon(c(1185, 1205, 1205, 1185), c(566, 566, 570, 570), border = "#c05a50", col = "#c05a50")
polygon(c(1185, 1205, 1205, 1185), c(570, 570, 583, 583), border = "#e8c55c", col = "#e8c55c")

polygon(c(1125, 1155, 1155, 1125), c(600, 600, 583, 583), border = "#e8c55c", col = "#e8c55c")
polygon(c(1155, 1185, 1185, 1155), c(600, 600, 583, 583), border = "#77997e", col = "#77997e")
polygon(c(1185, 1205, 1205, 1185), c(600, 600, 583, 583), border = "#e8c55c", col = "#e8c55c")


segments(x0=1205, x1=1205, y0=600, y1=125, lwd = 1, lty = "solid")
segments(x0=1125, x1=1125, y0=600, y1=125, lwd = 1, lty = "solid")
segments(x0=1125, x1=1205, y0=125, y1=125, lwd = 1, lty = "solid")
segments(x0=1125, x1=1205, y0=600, y1=600, lwd = 1, lty = "solid")

segments(x0=1125, x1=1205, y0=149.6, y1=149.6, lwd = 1, lty = "solid")
text(1165, 138, "8", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1125, x1=1205, y0=166.2, y1=166.2, lwd = 1, lty = "solid")
text(1165, 232.6, "17", family = "Main", cex = .75, col = "black", srt = 270)
text(1165, 166.2, "11", family = "Main", cex = .75, col = "black", srt = 270)
text(1165, 199.4, "14", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1125, x1=1205, y0=182.8, y1=182.8, lwd = 1, lty = "solid")
text(1165, 265.8, "20", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1125, x1=1205, y0=216, y1=216, lwd = 1, lty = "solid")
text(1165, 299, "23", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1125, x1=1205, y0=249.2, y1=249.2, lwd = 1, lty = "solid")
text(1165, 338, "16", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1125, x1=1205, y0=282.4, y1=282.4, lwd = 1, lty = "solid")
segments(x0=1125, x1=1205, y0=315.6, y1=315.6, lwd = 1, lty = "solid")
text(1165, 382, "15", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1125, x1=1205, y0=365.4, y1=365.4, lwd = 1, lty = "solid")
text(1165, 415.2, "14", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1125, x1=1205, y0=398.6, y1=398.6, lwd = 1, lty = "solid")
text(1165, 448.4, "13", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1125, x1=1205, y0=431.8, y1=431.8, lwd = 1, lty = "solid")
text(1165, 481.6, "12", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1125, x1=1205, y0=448.4, y1=448.4, lwd = 1, lty = "solid")
text(1165, 515.6, "11", family = "Main", cex = .75, col = "white", srt = 270)
segments(x0=1125, x1=1205, y0=465, y1=465, lwd = 1, lty = "solid")
segments(x0=1125, x1=1205, y0=481.6, y1=481.6, lwd = 1, lty = "solid")
segments(x0=1125, x1=1205, y0=533, y1=533, lwd = 1, lty = "solid")
text(1165, 549.5, "10", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1125, x1=1205, y0=566, y1=566, lwd = 1, lty = "solid")
text(1165, 583, "9", family = "Main", cex = .75, col = "white", srt = 270)

#right9

polygon(c(1205, 1225, 1225, 1205), c(50, 50, 83.2, 83.2), border = "#996f72", col = "#996f72")

polygon(c(1265, 1285, 1285, 1265), c(50, 50, 83.2, 83.2), border = "#996f72", col = "#996f72")

polygon(c(1205, 1285, 1285, 1205), c(83.2, 83.2, 99.8, 99.8), border = "#996f72", col = "#996f72")

polygon(c(1205, 1235, 1235, 1205), c(99.8, 99.8, 116.4, 116.4), border = "black", col = "black")
polygon(c(1235, 1285, 1285, 1235), c(99.8, 99.8, 116.4, 116.4), border = "#1f5c87", col = "#1f5c87")

polygon(c(1205, 1285, 1285, 1205), c(116.4, 116.4, 133, 133), border = "#996f72", col = "#996f72")

polygon(c(1205, 1240, 1240, 1205), c(149.6, 149.6, 133, 133), border = "#1f5c87", col = "#1f5c87")
polygon(c(1240, 1285, 1285, 1240), c(149.6, 149.6, 133, 133), border = "#e8c55c", col = "#e8c55c")

polygon(c(1205, 1240, 1240, 1205), c(166.2, 166.2, 149.6, 149.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(1240, 1275, 1275, 1240), c(166.2, 166.2, 149.6, 149.6), border = "#c05a50", col = "#c05a50")
polygon(c(1275, 1285, 1285, 1275), c(166.2, 166.2, 149.6, 149.6), border = "#77997e", col = "#77997e")

polygon(c(1285, 1205, 1205, 1285), c(166.2, 166.2, 182.8, 182.8), border = "#77997e", col = "#77997e")

polygon(c(1205, 1160, 1160, 1205), c(182.8, 182.8, 199.4, 199.4), border = "#c05a50", col = "#c05a50")
polygon(c(1160, 1285, 1285, 1160), c(182.8, 182.8, 199.4, 199.4), border = "#77997e", col = "#77997e")

polygon(c(1205, 1250, 1250, 1205), c(199.4, 199.4, 216, 216), border = "#c05a50", col = "#c05a50")
polygon(c(1250, 1285, 1285, 1250), c(199.4, 199.4, 216, 216), border = "#77997e", col = "#77997e")

polygon(c(1205, 1260, 1260, 1205), c(282.4, 282.4, 299, 299), border = "black", col = "black")
polygon(c(1260, 1285, 1285, 1260), c(282.4, 282.4, 299, 299), border = "#1f5c87", col = "#1f5c87")

polygon(c(1205, 1245, 1245, 1205), c(315.6, 315.6, 299, 299), border = "black", col = "black")
polygon(c(1245, 1280, 1280, 1245), c(315.6, 315.6, 299, 299), border = "#1f5c87", col = "#1f5c87")
polygon(c(1280, 1285, 1285, 1280), c(315.6, 315.6, 299, 299), border = "#c05a50", col = "#c05a50")

polygon(c(1205, 1285, 1285, 1205), c(340.6, 340.6, 365.4, 365.4), border = "#e8c55c", col = "#e8c55c")

polygon(c(1205, 1245, 1245, 1205), c(382, 382, 365.4, 365.4), border = "#c05a50", col = "#c05a50")
polygon(c(1245, 1285, 1285, 1245), c(382, 382, 365.4, 365.4), border = "#77997e", col = "#77997e")

polygon(c(1205, 1285, 1285, 1205), c(398.6, 398.6, 382, 382), border = "#1f5c87", col = "#1f5c87")

polygon(c(1205, 1270, 1270, 1205), c(398.6, 398.6, 415.2, 415.2), border = "black", col = "black")
polygon(c(1270, 1280, 1280, 1270), c(398.6, 398.6, 415.2, 415.2), border = "#c05a50", col = "#c05a50")
polygon(c(1280, 1285, 1285, 1280), c(398.6, 398.6, 415.2, 415.2), border = "#e8c55c", col = "#e8c55c")

polygon(c(1205, 1245, 1245, 1205), c(415.2, 415.2, 431.8, 431.8), border = "black", col = "black")
polygon(c(1245, 1285, 1285, 1245), c(415.2, 415.2, 431.8, 431.8), border = "#1f5c87", col = "#1f5c87")

polygon(c(1205, 1285, 1285, 1205), c(431.8, 431.8, 448.4, 448.4), border = "#c05a50", col = "#c05a50")

polygon(c(1205, 1285, 1285, 1205), c(448.4, 448.4, 465, 465), border = "black", col = "black")

polygon(c(1205, 1285, 1285, 1205), c(465, 465, 481.6, 481.6), border = "#996f72", col = "#996f72")

polygon(c(1205, 1285, 1285, 1205), c(498.2, 498.2, 481.6, 481.6), border = "#996f72", col = "#996f72")

polygon(c(1205, 1285, 1285, 1205), c(498.2, 498.2, 515.6, 515.6), border = "black", col = "black")

polygon(c(1205, 1235, 1235, 1205), c(533, 533, 515.6, 515.6), border = "black", col = "black")
polygon(c(1235, 1265, 1265, 1235), c(533, 533, 515.6, 515.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(1265, 1285, 1285, 1265), c(533, 533, 515.6, 515.6), border = "#c05a50", col = "#c05a50")

polygon(c(1205, 1215, 1215, 1205), c(533, 533, 549.5, 549.5), border = "black", col = "black")
polygon(c(1215, 1230, 1230, 1215), c(533, 533, 549.5, 549.5), border = "#1f5c87", col = "#1f5c87")
polygon(c(1230, 1265, 1265, 1230), c(533, 533, 549.5, 549.5), border = "#c05a50", col = "#c05a50")
polygon(c(1265, 1275, 1275, 1265), c(533, 533, 549.5, 549.5), border = "#77997e", col = "#77997e")
polygon(c(1275, 1285, 1285, 1275), c(533, 533, 549.5, 549.5), border = "#e8c55c", col = "#e8c55c")

polygon(c(1205, 1245, 1245, 1205), c(565.9, 565.9, 549.5, 549.5), border = "black", col = "black")
polygon(c(1245, 1255, 1255, 1245), c(565.9, 565.9, 549.5, 549.5), border = "#1f5c87", col = "#1f5c87")
polygon(c(1255, 1275, 1275, 1255), c(565.9, 565.9, 549.5, 549.5), border = "#c05a50", col = "#c05a50")
polygon(c(1275, 1285, 1285, 1275), c(565.9, 565.9, 549.5, 549.5), border = "#e8c55c", col = "#e8c55c")

polygon(c(1205, 1225, 1225, 1205), c(566, 566, 574.5, 574.5), border = "#996f72", col = "#996f72")
polygon(c(1205, 1225, 1225, 1205), c(574.5, 574.5, 583, 583), border = "#77997e", col = "#77997e")
polygon(c(1225, 1275, 1275, 1225), c(566, 566, 583, 583), border = "black", col = "black")
polygon(c(1275, 1285, 1285, 1275), c(566, 566, 583, 583), border = "#77997e", col = "#77997e")

polygon(c(1205, 1225, 1225, 1205), c(600, 600, 583, 583), border = "#e8c55c", col = "#e8c55c")
polygon(c(1225, 1265, 1265, 1225), c(600, 600, 583, 583), border = "black", col = "black")
polygon(c(1265, 1285, 1285, 1265), c(600, 600, 583, 583), border = "#1f5c87", col = "#1f5c87")

segments(x0=1205, x1=1205, y0=50, y1=600, lwd = 1, lty = "solid")
segments(x0=1285, x1=1285, y0=50, y1=600, lwd = 1, lty = "solid")
segments(x0=1285, x1=1205, y0=600, y1=600, lwd = 1, lty = "solid")
segments(x0=1285, x1=1205, y0=50, y1=50, lwd = 1, lty = "solid")

text(1245, 66.6, "3", family = "Main", cex = .75, col = "black", srt = 270)
text(1245, 99.8, "4", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1285, x1=1205, y0=83.2, y1=83.2, lwd = 1, lty = "solid")
segments(x0=1285, x1=1205, y0=116.4, y1=116.4, lwd = 1, lty = "solid")
text(1245, 133.4, "9", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1285, x1=1205, y0=149.6, y1=149.6, lwd = 1, lty = "solid")
segments(x0=1285, x1=1205, y0=182.8, y1=182.8, lwd = 1, lty = "solid")
segments(x0=1285, x1=1205, y0=199.4, y1=199.4, lwd = 1, lty = "solid")
segments(x0=1285, x1=1205, y0=216, y1=216, lwd = 1, lty = "solid")
segments(x0=1285, x1=1205, y0=249.2, y1=249.2, lwd = 1, lty = "solid")
text(1245, 166.2, "10", family = "Main", cex = .75, col = "black", srt = 270)
text(1245, 199.4, "15", family = "Main", cex = .75, col = "black", srt = 270)
text(1245, 232.6, "16", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1285, x1=1205, y0=282.4, y1=282.4, lwd = 1, lty = "solid")
text(1245, 265.8, "21", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1285, x1=1205, y0=315.6, y1=315.6, lwd = 1, lty = "solid")
text(1245, 299, "22", family = "Main", cex = .75, col = "white", srt = 270)
segments(x0=1285, x1=1205, y0=365.4, y1=365.4, lwd = 1, lty = "solid")
text(1245, 338, "1", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1285, x1=1205, y0=398.6, y1=398.6, lwd = 1, lty = "solid")
text(1245, 382, "2", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1285, x1=1205, y0=431.8, y1=431.8, lwd = 1, lty = "solid")
text(1245, 415.2, "3", family = "Main", cex = .75, col = "white", srt = 270)
segments(x0=1285, x1=1205, y0=448.4, y1=448.4, lwd = 1, lty = "solid")
text(1245, 448.4, "4", family = "Main", cex = .75, col = "white", srt = 270)
segments(x0=1285, x1=1205, y0=465, y1=465, lwd = 1, lty = "solid")
text(1245, 481.6, "5", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1285, x1=1205, y0=481.6, y1=481.6, lwd = 1, lty = "solid")
text(1245, 515.6, "6", family = "Main", cex = .75, col = "white", srt = 270)
segments(x0=1285, x1=1205, y0=498.2, y1=498.2, lwd = 1, lty = "solid")
segments(x0=1285, x1=1205, y0=533, y1=533, lwd = 1, lty = "solid")
segments(x0=1285, x1=1205, y0=549.5, y1=549.5, lwd = 1, lty = "solid")
text(1245, 549.5, "7", family = "Main", cex = .75, col = "white", srt = 270)
segments(x0=1285, x1=1205, y0=566, y1=566, lwd = 1, lty = "solid")
text(1245, 583, "8", family = "Main", cex = .75, col = "white", srt = 270)

#down2

polygon(c(90, 100, 100, 90), c(630, 630, 643.4, 643.4), border = "#e8c55c", col = "#e8c55c")
polygon(c(100, 110, 110, 100), c(630, 630, 643.4, 643.4), border = "#c05a50", col = "#c05a50")
polygon(c(110, 125, 125, 110), c(630, 630, 643.4, 643.4), border = "#1f5c87", col = "#1f5c87")
polygon(c(125, 140, 140, 125), c(630, 630, 643.4, 643.4), border = "#c05a50", col = "#c05a50")
polygon(c(140, 150, 150, 140), c(630, 630, 643.4, 643.4), border = "#77997e", col = "#77997e")
polygon(c(150, 170, 170, 150), c(630, 630, 643.4, 643.4), border = "#c05a50", col = "#c05a50")

polygon(c(90, 115, 115, 90), c(656.8, 656.8, 643.4, 643.4), border = "#e8c55c", col = "#e8c55c")
polygon(c(115, 145, 145, 115), c(656.8, 656.8, 643.4, 643.4), border = "#1f5c87", col = "#1f5c87")
polygon(c(145, 170, 170, 145), c(656.8, 656.8, 643.4, 643.4), border = "#c05a50", col = "#c05a50")

polygon(c(90, 145, 145, 90), c(656.8, 656.8, 670.2, 670.2), border = "#e8c55c", col = "#e8c55c")
polygon(c(145, 160, 160, 145), c(656.8, 656.8, 670.2, 670.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(160, 170, 170, 160), c(656.8, 656.8, 670.2, 670.2), border = "#996f72", col = "#996f72")

polygon(c(90, 130, 130, 90), c(683.6, 683.6, 670.2, 670.2), border = "#e8c55c", col = "#e8c55c")
polygon(c(130, 170, 170, 130), c(683.6, 683.6, 670.2, 670.2), border = "#c05a50", col = "#c05a50")

polygon(c(90, 95, 95, 90), c(683.6, 683.6, 696.5, 696.5), border = "#77997e", col = "#77997e")
polygon(c(95, 110, 110, 95), c(683.6, 683.6, 696.5, 696.5), border = "#c05a50", col = "#c05a50")
polygon(c(110, 150, 150, 110), c(683.6, 683.6, 696.5, 696.5), border = "#1f5c87", col = "#1f5c87")
polygon(c(150, 170, 170, 150), c(683.6, 683.6, 696.5, 696.5), border = "black", col = "black")

polygon(c(90, 105, 105, 90), c(710.4, 710.4, 696.5, 696.5), border = "#e8c55c", col = "#e8c55c")
polygon(c(105, 160, 160, 105), c(710.4, 710.4, 696.5, 696.5), border = "#c05a50", col = "#c05a50")
polygon(c(160, 170, 170, 160), c(710.4, 710.4, 696.5, 696.5), border = "#1f5c87", col = "#1f5c87")

polygon(c(90, 160, 160, 90), c(710.4, 710.4, 723.8, 723.8), border = "#e8c55c", col = "#e8c55c")
polygon(c(160, 170, 170, 160), c(710.4, 710.4, 723.8, 723.8), border = "#c05a50", col = "#c05a50")

polygon(c(90, 120, 120, 90), c(737.2, 737.2, 723.8, 723.8), border = "#e8c55c", col = "#e8c55c")
polygon(c(120, 140, 140, 120), c(737.2, 737.2, 723.8, 723.8), border = "#77997e", col = "#77997e")
polygon(c(140, 150, 150, 140), c(737.2, 737.2, 723.8, 723.8), border = "#c05a50", col = "#c05a50")
polygon(c(150, 160, 160, 150), c(737.2, 737.2, 723.8, 723.8), border = "#1f5c87", col = "#1f5c87")
polygon(c(160, 170, 170, 160), c(737.2, 737.2, 723.8, 723.8), border = "black", col = "black")

polygon(c(90, 115, 115, 90), c(737.2, 737.2, 750.6, 750.6), border = "#e8c55c", col = "#e8c55c")
polygon(c(115, 120, 120, 115), c(737.2, 737.2, 750.6, 750.6), border = "#c05a50", col = "#c05a50")
polygon(c(120, 160, 160, 120), c(737.2, 737.2, 750.6, 750.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(160, 170, 170, 160), c(737.2, 737.2, 750.6, 750.6), border = "black", col = "black")

polygon(c(90, 115, 115, 90), c(764, 764, 750.6, 750.6), border = "#77997e", col = "#77997e")
polygon(c(115, 170, 170, 115), c(764, 764, 750.6, 750.6), border = "#1f5c87", col = "#1f5c87")

polygon(c(90, 115, 115, 90), c(764, 764, 777.4, 777.4), border = "#e8c55c", col = "#e8c55c")
polygon(c(115, 120, 120, 115), c(764, 764, 777.4, 777.4), border = "#c05a50", col = "#c05a50")
polygon(c(120, 160, 160, 120), c(764, 764, 777.4, 777.4), border = "#1f5c87", col = "#1f5c87")
polygon(c(160, 170, 170, 160), c(764, 764, 777.4, 777.4), border = "black", col = "black")

polygon(c(90, 95, 95, 90), c(790.8, 790.8, 777.4, 777.4), border = "#77997e", col = "#77997e")
polygon(c(95, 130, 130, 95), c(790.8, 790.8, 777.4, 777.4), border = "#1f5c87", col = "#1f5c87")
polygon(c(130, 170, 170, 130), c(790.8, 790.8, 777.4, 777.4), border = "black", col = "black")

polygon(c(90, 95, 95, 90), c(790.8, 790.8, 817.6, 817.6), border = "#77997e", col = "#77997e")
polygon(c(95, 150, 150, 95), c(790.8, 790.8, 817.6, 817.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(150, 170, 170, 150), c(790.8, 790.8, 817.6, 817.6), border = "black", col = "black")

polygon(c(90, 95, 95, 90), c(831.3, 831.3, 817.6, 817.6), border = "#e8c55c", col = "#e8c55c")
polygon(c(95, 150, 150, 95), c(831.3, 831.3, 817.6, 817.6), border = "#1f5c87", col = "#1f5c87")

polygon(c(90, 95, 95, 90), c(831.3, 831.3, 845, 845), border = "#e8c55c", col = "#e8c55c")
polygon(c(95, 150, 150, 95), c(831.3, 831.3, 845, 845), border = "#1f5c87", col = "#1f5c87")

polygon(c(170, 150, 150, 170), c(817.6, 817.6, 826.7, 826.7), border = "black", col = "black")
polygon(c(170, 150, 150, 170), c(826.7, 826.7, 836.2, 836.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(170, 150, 150, 170), c(836.2, 836.2, 845, 845), border = "#c05a50", col = "#c05a50")


segments(x0=90, x1=170, y0=845, y1=845, lwd = 1, lty = "solid")
segments(x0=90, x1=170, y0=630, y1=630, lwd = 1, lty = "solid")
segments(x0=90, x1=90, y0=845, y1=630, lwd = 1, lty = "solid")
segments(x0=170, x1=170, y0=845, y1=630, lwd = 1, lty = "solid")

text(130, 643.4, "24", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=170, y0=656.8, y1=656.8, lwd = 1, lty = "solid")
text(130, 670.2, "23", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=170, y0=670.2, y1=670.2, lwd = 1, lty = "solid")
text(130, 697, "22", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=170, y0=683.6, y1=683.6, lwd = 1, lty = "solid")
text(130, 723.8, "21", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=170, y0=710.4, y1=710.4, lwd = 1, lty = "solid")
text(130, 750.6, "20", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=170, y0=737.2, y1=737.2, lwd = 1, lty = "solid")
text(130, 777.4, "19", family = "Main", cex = .75, col = "white", srt = 270)
segments(x0=90, x1=170, y0=764, y1=764, lwd = 1, lty = "solid")
text(130, 804.2, "18", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=170, y0=777.4, y1=777.4, lwd = 1, lty = "solid")
text(130, 831, "17", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=90, x1=170, y0=790.8, y1=790.8, lwd = 1, lty = "solid")
segments(x0=90, x1=170, y0=817.6, y1=817.6, lwd = 1, lty = "solid")

#down1 right1 down2

polygon(c(185, 195, 195, 185), c(630, 630, 643.4, 643.4), border = "#c05a50", col = "#c05a50")
polygon(c(195, 210, 210, 195), c(630, 630, 643.4, 643.4), border = "#1f5c87", col = "#1f5c87")
polygon(c(210, 270, 270, 210), c(630, 630, 643.4, 643.4), border = "#c05a50", col = "#c05a50")

polygon(c(185, 195, 195, 185), c(656.8, 656.8, 643.4, 643.4), border = "#c05a50", col = "#c05a50")
polygon(c(195, 210, 210, 195), c(656.8, 656.8, 643.4, 643.4), border = "#1f5c87", col = "#1f5c87")
polygon(c(210, 270, 270, 210), c(656.8, 656.8, 643.4, 643.4), border = "#996f72", col = "#996f72")

polygon(c(185, 215, 215, 185), c(656.8, 656.8, 670.2, 670.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(215, 250, 250, 215), c(656.8, 656.8, 670.2, 670.2), border = "#c05a50", col = "#c05a50")
polygon(c(250, 260, 260, 250), c(656.8, 656.8, 670.2, 670.2), border = "#996f72", col = "#996f72")
polygon(c(260, 270, 270, 260), c(656.8, 656.8, 670.2, 670.2), border = "#77997e", col = "#77997e")

polygon(c(185, 215, 215, 185), c(683.6, 683.6, 670.2, 670.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(215, 245, 245, 215), c(683.6, 683.6, 670.2, 670.2), border = "#c05a50", col = "#c05a50")
polygon(c(245, 270, 270, 245), c(683.6, 683.6, 670.2, 670.2), border = "#77997e", col = "#77997e")

polygon(c(185, 225, 225, 185), c(696.8, 696.8, 683.6, 683.6), border = "#c05a50", col = "#c05a50")
polygon(c(225, 245, 245, 225), c(696.8, 696.8, 683.6, 683.6), border = "#77997e", col = "#77997e")
polygon(c(270, 245, 245, 270), c(696.8, 696.8, 683.6, 683.6), border = "#e8c55c", col = "#e8c55c")

polygon(c(270, 185, 185, 270), c(696.8, 696.8, 710.4, 710.4), border = "#77997e", col = "#77997e")

polygon(c(200, 185, 185, 200), c(723.8, 723.8, 710.4, 710.4), border = "black", col = "black")
polygon(c(200, 270, 270, 200), c(723.8, 723.8, 710.4, 710.4), border = "#c05a50", col = "#c05a50")

polygon(c(200, 185, 185, 200), c(723.8, 723.8, 737.2, 737.2), border = "black", col = "black")
polygon(c(200, 210, 210, 200), c(723.8, 723.8, 737.2, 737.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(210, 225, 225, 210), c(723.8, 723.8, 737.2, 737.2), border = "#c05a50", col = "#c05a50")
polygon(c(225, 270, 270, 225), c(723.8, 723.8, 737.2, 737.2), border = "#e8c55c", col = "#e8c55c")

polygon(c(245, 185, 185, 245), c(750.6, 750.6, 737.2, 737.2), border = "#c05a50", col = "#c05a50")
polygon(c(245, 270, 270, 245), c(750.6, 750.6, 737.2, 737.2), border = "#77997e", col = "#77997e")

polygon(c(205, 185, 185, 205), c(750.6, 750.6, 764, 764), border = "black", col = "black")
polygon(c(225, 205, 205, 225), c(750.6, 750.6, 764, 764), border = "#1f5c87", col = "#1f5c87")
polygon(c(250, 225, 225, 250), c(750.6, 750.6, 764, 764), border = "#c05a50", col = "#c05a50")
polygon(c(270, 250, 250, 270), c(750.6, 750.6, 764, 764), border = "#e8c55c", col = "#e8c55c")

polygon(c(185, 210, 210, 185), c(777.4, 777.4, 764, 764), border = "#c05a50", col = "#c05a50")
polygon(c(235, 210, 210, 235), c(777.4, 777.4, 764, 764), border = "#996f72", col = "#996f72")
polygon(c(270, 235, 235, 270), c(777.4, 777.4, 764, 764), border = "#77997e", col = "#77997e")

polygon(c(185, 255, 255, 185), c(777.4, 777.4, 790.8, 790.8), border = "#1f5c87", col = "#1f5c87")
polygon(c(255, 270, 270, 255), c(777.4, 777.4, 790.8, 790.8), border = "#77997e", col = "#77997e")

polygon(c(185, 205, 205, 185), c(804.2, 804.2, 790.8, 790.8), border = "#1f5c87", col = "#1f5c87")
polygon(c(205, 220, 220, 205), c(804.2, 804.2, 790.8, 790.8), border = "#c05a50", col = "#c05a50")
polygon(c(220, 240, 240, 220), c(804.2, 804.2, 790.8, 790.8), border = "#1f5c87", col = "#1f5c87")
polygon(c(240, 255, 255, 240), c(804.2, 804.2, 790.8, 790.8), border = "#e8c55c", col = "#e8c55c")
polygon(c(270, 255, 255, 270), c(804.2, 804.2, 790.8, 790.8), border = "#1f5c87", col = "#1f5c87")

polygon(c(185, 205, 205, 185), c(804.2, 804.2, 817.6, 817.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(205, 220, 220, 205), c(804.2, 804.2, 817.6, 817.6), border = "#e8c55c", col = "#e8c55c")
polygon(c(220, 240, 240, 220), c(804.2, 804.2, 817.6, 817.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(240, 255, 255, 240), c(804.2, 804.2, 817.6, 817.6), border = "#c05a50", col = "#c05a50")
polygon(c(270, 255, 255, 270), c(804.2, 804.2, 817.6, 817.6), border = "#1f5c87", col = "#1f5c87")

polygon(c(185, 240, 240, 185), c(831.3, 831.3, 817.6, 817.6), border = "#e8c55c", col = "#e8c55c")
polygon(c(270, 240, 240, 270), c(831.3, 831.3, 817.6, 817.6), border = "#1f5c87", col = "#1f5c87")

polygon(c(185, 240, 240, 185), c(831.3, 831.3, 845, 845), border = "#e8c55c", col = "#e8c55c")
polygon(c(270, 240, 240, 270), c(831.3, 831.3, 845, 845), border = "#1f5c87", col = "#1f5c87")

segments(x0=270, x1=185, y0=630, y1=630, lwd = 1, lty = "solid")
segments(x0=185, x1=185, y0=630, y1=845, lwd = 1, lty = "solid")
segments(x0=270, x1=270, y0=630, y1=845, lwd = 1, lty = "solid")
segments(x0=270, x1=185, y0=845, y1=845, lwd = 1, lty = "solid")

text(227.5, 643.4, "9", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=185, x1=270, y0=656.8, y1=656.8, lwd = 1, lty = "solid")
text(227.5, 670.2, "10", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=185, x1=270, y0=683.6, y1=683.6, lwd = 1, lty = "solid")
text(227.5, 697, "11", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=185, x1=270, y0=696.8, y1=696.8, lwd = 1, lty = "solid")
text(227.5, 723.8, "12", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=185, x1=270, y0=710.4, y1=710.4, lwd = 1, lty = "solid")
text(227.5, 750.6, "13", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=185, x1=270, y0=737.2, y1=737.2, lwd = 1, lty = "solid")
text(227.5, 777.4, "14", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=185, x1=270, y0=764, y1=764, lwd = 1, lty = "solid")
text(227.5, 804.2, "15", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=185, x1=270, y0=777.4, y1=777.4, lwd = 1, lty = "solid")
text(227.5, 831, "16", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=185, x1=270, y0=790.8, y1=790.8, lwd = 1, lty = "solid")
segments(x0=185, x1=270, y0=817.6, y1=817.6, lwd = 1, lty = "solid")

#right1 down2

polygon(c(310, 390, 390, 310), c(630, 630, 643.4, 643.4), border = "#1f5c87", col = "#1f5c87")

polygon(c(310, 390, 390, 310), c(656.8, 656.8, 643.4, 643.4), border = "#e8c55c", col = "#e8c55c")

polygon(c(310, 350, 350, 310), c(656.8, 656.8, 670.2, 670.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(390, 350, 350, 390), c(656.8, 656.8, 658, 658), border = "black", col = "black")

polygon(c(310, 350, 350, 310), c(683.6, 683.6, 670.2, 670.2), border = "#c05a50", col = "#c05a50")
polygon(c(390, 350, 350, 390), c(683.6, 683.6, 670.2, 670.2), border = "#1f5c87", col = "#1f5c87")

polygon(c(310, 350, 350, 310), c(683.6, 683.6, 697, 697), border = "#1f5c87", col = "#1f5c87")
polygon(c(350, 370, 370, 350), c(683.6, 683.6, 697, 697), border = "#996f72", col = "#996f72")
polygon(c(370, 390, 390, 370), c(683.6, 683.6, 697, 697), border = "black", col = "black")

polygon(c(310, 340, 340, 310), c(710.4, 710.4, 697, 697), border = "#c05a50", col = "#c05a50")
polygon(c(340, 370, 370, 340), c(710.4, 710.4, 697, 697), border = "#996f72", col = "#996f72")
polygon(c(370, 390, 390, 370), c(710.4, 710.4, 697, 697), border = "#1f5c87", col = "#1f5c87")

polygon(c(310, 360, 360, 310), c(710.4, 710.4, 723.8, 723.8), border = "#c05a50", col = "#c05a50")
polygon(c(360, 390, 390, 360), c(710.4, 710.4, 723.8, 723.8), border = "#1f5c87", col = "#1f5c87")

polygon(c(310, 320, 320, 310), c(737.2, 737.2, 723.8, 723.8), border = "#e8c55c", col = "#e8c55c")
polygon(c(320, 345, 345, 320), c(737.2, 737.2, 723.8, 723.8), border = "#77997e", col = "#77997e")
polygon(c(345, 365, 365, 345), c(737.2, 737.2, 723.8, 723.8), border = "#c05a50", col = "#c05a50")
polygon(c(365, 390, 390, 365), c(737.2, 737.2, 723.8, 723.8), border = "#1f5c87", col = "#1f5c87")

polygon(c(310, 330, 330, 310), c(764, 764, 777.4, 777.4), border = "#e8c55c", col = "#e8c55c")
polygon(c(330, 350, 350, 330), c(764, 764, 777.4, 777.4), border = "#c05a50", col = "#c05a50")
polygon(c(350, 365, 365, 350), c(764, 764, 777.4, 777.4), border = "#1f5c87", col = "#1f5c87")
polygon(c(365, 390, 390, 365), c(764, 764, 777.4, 777.4), border = "black", col = "black")

polygon(c(310, 325, 325, 310), c(790.8, 790.8, 777.4, 777.4), border = "#996f72", col = "#996f72")
polygon(c(325, 335, 335, 325), c(790.8, 790.8, 777.4, 777.4), border = "#77997e", col = "#77997e")
polygon(c(335, 350, 350, 335), c(790.8, 790.8, 777.4, 777.4), border = "#c05a50", col = "#c05a50")
polygon(c(350, 375, 375, 350), c(790.8, 790.8, 777.4, 777.4), border = "#1f5c87", col = "#1f5c87")
polygon(c(375, 390, 390, 375), c(790.8, 790.8, 777.4, 777.4), border = "black", col = "black")

polygon(c(310, 323.3, 323.3, 310), c(790.8, 790.8, 810, 810), border = "#996f72", col = "#996f72")
polygon(c(310, 323.3, 323.3, 310), c(810, 810, 845, 845), border = "#e8c55c", col = "#e8c55c")

polygon(c(336.6, 323.3, 323.3, 336.6), c(790.8, 790.8, 830, 830), border = "#1f5c87", col = "#1f5c87")
polygon(c(336.6, 323.3, 323.3, 336.6), c(830, 830, 845, 845), border = "#e8c55c", col = "#e8c55c")

polygon(c(336.6, 349.9, 349.9, 336.6), c(790.8, 790.8, 805, 805), border = "#c05a50", col = "#c05a50")
polygon(c(336.6, 349.9, 349.9, 336.6), c(845, 845, 805, 805), border = "#1f5c87", col = "#1f5c87")

polygon(c(363.2, 349.9, 349.9, 363.2), c(795, 795, 800, 800), border = "#1f5c87", col = "#1f5c87")
polygon(c(363.2, 349.9, 349.9, 363.2), c(800, 800, 840, 840), border = "#c05a50", col = "#c05a50")
polygon(c(363.2, 349.9, 349.9, 363.2), c(840, 840, 845, 845), border = "#e8c55c", col = "#e8c55c")
polygon(c(363.2, 349.9, 349.9, 363.2), c(790.8, 790.8, 795, 795), border = "black", col = "black")

polygon(c(390, 376.6, 376.6, 390), c(790.8, 790.8, 830, 830), border = "#1f5c87", col = "#1f5c87")
polygon(c(390, 376.6, 376.6, 390), c(830, 830, 840, 840), border = "#996f72", col = "#996f72")
polygon(c(390, 376.6, 376.6, 390), c(840, 840, 845, 845), border = "#77997e", col = "#77997e")

segments(x0=310, x1=310, y0=630, y1=845, lwd = 1, lty = "solid")
segments(x0=390, x1=390, y0=630, y1=845, lwd = 1, lty = "solid")
segments(x0=310, x1=390, y0=845, y1=845, lwd = 1, lty = "solid")
segments(x0=310, x1=390, y0=630, y1=630, lwd = 1, lty = "solid")

text(350, 643.4, "8", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=310, x1=390, y0=656.8, y1=656.8, lwd = 1, lty = "solid")
text(350, 670.2, "7", family = "Main", cex = .75, col = "white", srt = 270)
segments(x0=310, x1=390, y0=683.6, y1=683.6, lwd = 1, lty = "solid")
text(350, 697, "6", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=310, x1=390, y0=710.4, y1=710.4, lwd = 1, lty = "solid")
text(350, 723.8, "5", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=310, x1=390, y0=737.2, y1=737.2, lwd = 1, lty = "solid")
text(350, 750.6, "4", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=310, x1=390, y0=764, y1=764, lwd = 1, lty = "solid")
text(350, 777.4, "3", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=310, x1=390, y0=790.8, y1=790.8, lwd = 1, lty = "solid")

text(323.3, 817.9, "3", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=336.6, x1=336.6, y0=790.8, y1=845, lwd = 1, lty = "solid")
text(349.9, 817.9, "2", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=363.2, x1=363.2, y0=790.8, y1=845, lwd = 1, lty = "solid")
text(376.5, 817.9, "1", family = "Main", cex = .75, col = "black", srt = 270)

#right2 down2

polygon(c(400, 415, 415, 400), c(630, 630, 651, 651), border = "#c05a50", col = "#c05a50")
polygon(c(415, 475, 475, 415), c(630, 630, 651, 651), border = "#e8c55c", col = "#e8c55c")

polygon(c(400, 455, 455, 400), c(672, 672, 651, 651), border = "#c05a50", col = "#c05a50")
polygon(c(455, 475, 475, 455), c(672, 672, 651, 651), border = "#e8c55c", col = "#e8c55c")

polygon(c(440, 400, 400, 440), c(672, 672, 684.5, 684.5), border = "#77997e", col = "#77997e")
polygon(c(475, 440, 440, 475), c(672, 672, 684.5, 684.5), border = "#e8c55c", col = "#e8c55c")

polygon(c(420, 400, 400, 420), c(697, 697, 684.5, 684.5), border = "#1f5c87", col = "#1f5c87")
polygon(c(430, 420, 420, 430), c(697, 697, 684.5, 684.5), border = "#c05a50", col = "#c05a50")
polygon(c(455, 430, 430, 455), c(697, 697, 684.5, 684.5), border = "#77997e", col = "#77997e")
polygon(c(475, 455, 455, 475), c(697, 697, 684.5, 684.5), border = "#e8c55c", col = "#e8c55c")

polygon(c(420, 400, 400, 420), c(697, 697, 710.7, 710.7), border = "#c05a50", col = "#c05a50")
polygon(c(455, 420, 420, 455), c(697, 697, 710.7, 710.7), border = "#77997e", col = "#77997e")
polygon(c(475, 455, 455, 475), c(697, 697, 710.7, 710.7), border = "#996f72", col = "#996f72")

polygon(c(425, 400, 400, 425), c(724.5, 724.5, 710.7, 710.7), border = "#1f5c87", col = "#1f5c87")
polygon(c(430, 425, 425, 430), c(724.5, 724.5, 710.7, 710.7), border = "#996f72", col = "#996f72")
polygon(c(440, 430, 430, 440), c(724.5, 724.5, 710.7, 710.7), border = "#c05a50", col = "#c05a50")
polygon(c(475, 440, 440, 475), c(724.5, 724.5, 710.7, 710.7), border = "#e8c55c", col = "#e8c55c")

polygon(c(425, 400, 400, 425), c(724.5, 724.5, 742, 742), border = "#c05a50", col = "#c05a50")
polygon(c(430, 425, 425, 430), c(724.5, 724.5, 742, 742), border = "#996f72", col = "#996f72")
polygon(c(455, 430, 430, 455), c(724.5, 724.5, 742, 742), border = "#77997e", col = "#77997e")
polygon(c(475, 455, 455, 475), c(724.5, 724.5, 742, 742), border = "#e8c55c", col = "#e8c55c")

polygon(c(420, 400, 400, 420), c(742, 742, 759.5, 759.5), border = "black", col = "black")
polygon(c(460, 420, 420, 460), c(742, 742, 759.5, 759.5), border = "#1f5c87", col = "#1f5c87")
polygon(c(475, 460, 460, 475), c(742, 742, 759.5, 759.5), border = "#77997e", col = "#77997e")

polygon(c(420, 400, 400, 420), c(759.5, 759.5, 772.2, 772.2), border = "#77997e", col = "#77997e")
polygon(c(475, 420, 420, 475), c(759.5, 759.5, 772.2, 772.2), border = "#e8c55c", col = "#e8c55c")

polygon(c(400, 430, 430, 400), c(785, 785, 772.2, 772.2), border = "#996f72", col = "#996f72")
polygon(c(430, 445, 445, 430), c(785, 785, 772.2, 772.2), border = "#77997e", col = "#77997e")
polygon(c(445, 475, 475, 445), c(785, 785, 772.2, 772.2), border = "#e8c55c", col = "#e8c55c")

polygon(c(400, 418.7, 418.7, 400), c(785, 785, 820, 820), border = "#1f5c87", col = "#1f5c87")
polygon(c(400, 418.7, 418.7, 400), c(820, 820, 835, 835), border = "#c05a50", col = "#c05a50")
polygon(c(400, 418.7, 418.7, 400), c(835, 835, 840, 840), border = "#996f72", col = "#996f72")
polygon(c(400, 418.7, 418.7, 400), c(840, 840, 845, 845), border = "#77997e", col = "#77997e")

polygon(c(437.4, 418.7, 418.7, 437.4), c(785, 785, 845, 845), border = "#77997e", col = "#77997e")

polygon(c(437.4, 456.1, 456.1, 437.4), c(785, 785, 795, 795), border = "black", col = "black")
polygon(c(437.4, 456.1, 456.1, 437.4), c(795, 795, 835, 835), border = "#1f5c87", col = "#1f5c87")
polygon(c(437.4, 456.1, 456.1, 437.4), c(835, 835, 845, 845), border = "#e8c55c", col = "#e8c55c")

polygon(c(475, 456.1, 456.1, 475), c(785, 785, 830, 830), border = "#1f5c87", col = "#1f5c87")
polygon(c(475, 456.1, 456.1, 475), c(830, 830, 845, 845), border = "#e8c55c", col = "#e8c55c")

segments(x0=400, x1=475, y0=630, y1=630, lwd = 1, lty = "solid")
segments(x0=400, x1=475, y0=845, y1=845, lwd = 1, lty = "solid")
segments(x0=400, x1=400, y0=630, y1=845, lwd = 1, lty = "solid")
segments(x0=475, x1=475, y0=630, y1=845, lwd = 1, lty = "solid")

text(437.5, 650, "15", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=400, x1=475, y0=672, y1=672, lwd = 1, lty = "solid")
text(437.5, 684.5, "16", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=400, x1=475, y0=697, y1=697, lwd = 1, lty = "solid")
text(437.5, 710.7, "17", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=400, x1=475, y0=724.5, y1=724.5, lwd = 1, lty = "solid")
text(437.5, 741.9, "18", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=400, x1=475, y0=742, y1=742, lwd = 1, lty = "solid")
segments(x0=400, x1=475, y0=759.5, y1=759.5, lwd = 1, lty = "solid")
text(437.5, 772.2, "19", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=400, x1=475, y0=785, y1=785, lwd = 1, lty = "solid")

text(409.3, 815, "4", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=418.7, x1=418.7, y0=785, y1=845, lwd = 1, lty = "solid")
text(428, 815, "3", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=437.4, x1=437.4, y0=785, y1=845, lwd = 1, lty = "solid")
text(446.7, 815, "2", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=456.1, x1=456.1, y0=785, y1=845, lwd = 1, lty = "solid")
text(465.4, 815, "1", family = "Main", cex = .75, col = "black", srt = 270)

#right3 down2

polygon(c(520, 540, 540, 520), c(684.5, 684.5, 697, 697), border = "#e8c55c", col = "#e8c55c")
polygon(c(540, 575, 575, 540), c(684.5, 684.5, 697, 697), border = "#c05a50", col = "#c05a50")
polygon(c(575, 585, 585, 575), c(684.5, 684.5, 697, 697), border = "#1f5c87", col = "#1f5c87")
polygon(c(585, 595, 595, 585), c(684.5, 684.5, 697, 697), border = "black", col = "black")

polygon(c(520, 545, 545, 520), c(710.7, 710.7, 697, 697), border = "#c05a50", col = "#c05a50")
polygon(c(545, 555, 555, 545), c(710.7, 710.7, 697, 697), border = "black", col = "black")
polygon(c(555, 595, 595, 555), c(710.7, 710.7, 697, 697), border = "#1f5c87", col = "#1f5c87")

polygon(c(520, 540, 540, 520), c(710.7, 710.7, 724.5, 724.5), border = "#e8c55c", col = "#e8c55c")
polygon(c(540, 560, 560, 540), c(710.7, 710.7, 724.5, 724.5), border = "#77997e", col = "#77997e")
polygon(c(560, 580, 580, 560), c(710.7, 710.7, 724.5, 724.5), border = "#c05a50", col = "#c05a50")
polygon(c(580, 595, 595, 580), c(710.7, 710.7, 724.5, 724.5), border = "#1f5c87", col = "#1f5c87")

polygon(c(520, 530, 530, 520), c(740.7, 740.7, 724.5, 724.5), border = "#e8c55c", col = "#e8c55c")
polygon(c(530, 540, 540, 530), c(740.7, 740.7, 724.5, 724.5), border = "#77997e", col = "#77997e")
polygon(c(540, 560, 560, 540), c(740.7, 740.7, 724.5, 724.5), border = "#c05a50", col = "#c05a50")
polygon(c(560, 565, 565, 560), c(740.7, 740.7, 724.5, 724.5), border = "black", col = "black")
polygon(c(565, 595, 595, 565), c(740.7, 740.7, 724.5, 724.5), border = "#1f5c87", col = "#1f5c87")

polygon(c(520, 595, 595, 520), c(740.7, 740.7, 757, 757), border = "#e8c55c", col = "#e8c55c")

polygon(c(520, 550, 550, 520), c(771, 771, 757, 757), border = "#e8c55c", col = "#e8c55c")
polygon(c(550, 565, 565, 550), c(771, 771, 757, 757), border = "#77997e", col = "#77997e")
polygon(c(565, 570, 570, 565), c(771, 771, 757, 757), border = "#c05a50", col = "#c05a50")
polygon(c(570, 580, 580, 570), c(771, 771, 757, 757), border = "#996f72", col = "#996f72")
polygon(c(580, 595, 595, 580), c(771, 771, 757, 757), border = "#1f5c87", col = "#1f5c87")

polygon(c(520, 535, 535, 520), c(771, 771, 785, 785), border = "#e8c55c", col = "#e8c55c")
polygon(c(535, 550, 550, 535), c(771, 771, 785, 785), border = "#77997e", col = "#77997e")
polygon(c(550, 595, 595, 550), c(771, 771, 785, 785), border = "#1f5c87", col = "#1f5c87")

polygon(c(520, 545, 545, 520), c(800, 800, 785, 785), border = "#c05a50", col = "#c05a50")
polygon(c(545, 595, 595, 545), c(800, 800, 785, 785), border = "#1f5c87", col = "#1f5c87")

polygon(c(520, 560, 560, 520), c(800, 800, 815, 815), border = "#e8c55c", col = "#e8c55c")
polygon(c(560, 595, 595, 560), c(800, 800, 815, 815), border = "#c05a50", col = "#c05a50")

polygon(c(520, 560, 560, 520), c(830, 830, 815, 815), border = "#c05a50", col = "#c05a50")
polygon(c(560, 595, 595, 560), c(830, 830, 815, 815), border = "#996f72", col = "#996f72")

polygon(c(520, 595, 595, 520), c(845, 845, 830, 830), border = "#996f72", col = "#996f72")

segments(x0=520, x1=520, y0=630, y1=845, lwd = 1, lty = "solid")
segments(x0=595, x1=595, y0=630, y1=845, lwd = 1, lty = "solid")
segments(x0=520, x1=595, y0=845, y1=845, lwd = 1, lty = "solid")
segments(x0=520, x1=595, y0=630, y1=630, lwd = 1, lty = "solid")

text(557.5, 650, "14", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=672, y1=672, lwd = 1, lty = "solid")
text(557.5, 684.5, "13", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=684.5, y1=684.5, lwd = 1, lty = "solid")
text(557.5, 710.7, "12", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=697, y1=697, lwd = 1, lty = "solid")
text(557.5, 741.9, "11", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=724.5, y1=724.5, lwd = 1, lty = "solid")
text(557.5, 772.2, "10", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=757, y1=757, lwd = 1, lty = "solid")
text(557.5, 802.5, "9", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=785, y1=785, lwd = 1, lty = "solid")
text(557.5, 832.8, "8", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=520, x1=595, y0=815, y1=815, lwd = 1, lty = "solid")

#right4 down2

polygon(c(605, 625, 625, 605), c(655, 655, 672, 672), border = "black", col = "black")
polygon(c(625, 660, 660, 625), c(655, 655, 672, 672), border = "#1f5c87", col = "#1f5c87")
polygon(c(660, 670, 670, 660), c(655, 655, 672, 672), border = "#996f72", col = "#996f72")
polygon(c(670, 680, 680, 670), c(655, 655, 672, 672), border = "#e8c55c", col = "#e8c55c")

polygon(c(605, 645, 645, 605), c(684.5, 684.5, 697, 697), border = "#1f5c87", col = "#1f5c87")
polygon(c(645, 680, 680, 645), c(684.5, 684.5, 697, 697), border = "#996f72", col = "#996f72")

polygon(c(605, 630, 630, 605), c(710.7, 710.7, 697, 697), border = "#1f5c87", col = "#1f5c87")
polygon(c(630, 655, 655, 630), c(710.7, 710.7, 697, 697), border = "#77997e", col = "#77997e")
polygon(c(655, 680, 680, 655), c(710.7, 710.7, 697, 697), border = "#e8c55c", col = "#e8c55c")

polygon(c(605, 660, 660, 605), c(710.7, 710.7, 724.5, 724.5), border = "#1f5c87", col = "#1f5c87")
polygon(c(660, 680, 680, 660), c(710.7, 710.7, 724.5, 724.5), border = "#c05a50", col = "#c05a50")

polygon(c(605, 645, 645, 605), c(740.7, 740.7, 724.5, 724.5), border = "#1f5c87", col = "#1f5c87")
polygon(c(645, 680, 680, 645), c(740.7, 740.7, 724.5, 724.5), border = "#77997e", col = "#77997e")

polygon(c(605, 680, 680, 605), c(740.7, 740.7, 757, 757), border = "#1f5c87", col = "#1f5c87")

polygon(c(605, 630, 630, 605), c(757, 757, 771, 771), border = "#1f5c87", col = "#1f5c87")
polygon(c(630, 655, 655, 630), c(757, 757, 771, 771), border = "#996f72", col = "#996f72")
polygon(c(655, 680, 680, 655), c(757, 757, 771, 771), border = "#c05a50", col = "#c05a50")

polygon(c(605, 625, 625, 605), c(771, 771, 785, 785), border = "black", col = "black")
polygon(c(625, 650, 650, 625), c(771, 771, 785, 785), border = "#1f5c87", col = "#1f5c87")
polygon(c(650, 665, 665, 650), c(771, 771, 785, 785), border = "#996f72", col = "#996f72")
polygon(c(665, 670, 670, 665), c(771, 771, 785, 785), border = "#c05a50", col = "#c05a50")
polygon(c(670, 680, 680, 670), c(771, 771, 785, 785), border = "#77997e", col = "#77997e")

polygon(c(605, 625, 625, 605), c(785, 785, 800, 800), border = "black", col = "black")
polygon(c(625, 635, 635, 625), c(785, 785, 800, 800), border = "#1f5c87", col = "#1f5c87")
polygon(c(635, 660, 660, 635), c(785, 785, 800, 800), border = "#c05a50", col = "#c05a50")
polygon(c(660, 670, 670, 660), c(785, 785, 800, 800), border = "#77997e", col = "#77997e")
polygon(c(670, 680, 680, 670), c(785, 785, 800, 800), border = "#e8c55c", col = "#e8c55c")

polygon(c(605, 620, 620, 605), c(815, 815, 800, 800), border = "black", col = "black")
polygon(c(620, 635, 635, 620), c(815, 815, 800, 800), border = "#c05a50", col = "#c05a50")
polygon(c(635, 650, 650, 635), c(815, 815, 800, 800), border = "#77997e", col = "#77997e")
polygon(c(650, 680, 680, 650), c(815, 815, 800, 800), border = "#e8c55c", col = "#e8c55c")

polygon(c(605, 680, 680, 605), c(815, 815, 830, 830), border = "#e8c55c", col = "#e8c55c")

polygon(c(605, 625, 625, 605), c(845, 845, 830, 830), border = "#1f5c87", col = "#1f5c87")
polygon(c(625, 665, 665, 625), c(845, 845, 830, 830), border = "#c05a50", col = "#c05a50")
polygon(c(665, 675, 675, 665), c(845, 845, 830, 830), border = "#77997e", col = "#77997e")
polygon(c(675, 680, 680, 675), c(845, 845, 830, 830), border = "#e8c55c", col = "#e8c55c")

segments(x0=680, x1=680, y0=630, y1=845, lwd = 1, lty = "solid")
segments(x0=605, x1=605, y0=630, y1=845, lwd = 1, lty = "solid")
segments(x0=680, x1=605, y0=845, y1=845, lwd = 1, lty = "solid")
segments(x0=680, x1=605, y0=630, y1=630, lwd = 1, lty = "solid")

text(642.5, 650, "1", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=672, y1=672, lwd = 1, lty = "solid")
text(642.5, 684.5, "2", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=684.5, y1=684.5, lwd = 1, lty = "solid")
text(642.5, 710.7, "3", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=697, y1=697, lwd = 1, lty = "solid")
text(642.5, 741.9, "4", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=724.5, y1=724.5, lwd = 1, lty = "solid")
text(642.5, 772.2, "5", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=757, y1=757, lwd = 1, lty = "solid")
text(642.5, 802.5, "6", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=785, y1=785, lwd = 1, lty = "solid")
text(642.5, 832.8, "7", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=605, x1=680, y0=800, y1=800, lwd = 1, lty = "solid")
segments(x0=605, x1=680, y0=815, y1=815, lwd = 1, lty = "solid")

#right5 down2

polygon(c(725, 800, 800, 725), c(630, 630, 645.3, 645.3), border = "#77997e", col = "#77997e")

polygon(c(725, 750, 750, 725), c(691.2, 691.2, 706.2, 706.2), border = "#e8c55c", col = "#e8c55c")
polygon(c(750, 775, 775, 750), c(691.2, 691.2, 706.2, 706.2), border = "#77997e", col = "#77997e")
polygon(c(775, 800, 800, 775), c(691.2, 691.2, 706.2, 706.2), border = "#c05a50", col = "#c05a50")

polygon(c(725, 750, 750, 725), c(721.8, 721.8, 706.2, 706.2), border = "#77997e", col = "#77997e")
polygon(c(750, 775, 775, 750), c(721.8, 721.8, 706.2, 706.2), border = "#c05a50", col = "#c05a50")
polygon(c(775, 800, 800, 775), c(721.8, 721.8, 706.2, 706.2), border = "#1f5c87", col = "#1f5c87")

polygon(c(725, 735, 735, 725), c(721.8, 721.8, 737.1, 737.1), border = "#e8c55c", col = "#e8c55c")
polygon(c(735, 780, 780, 735), c(721.8, 721.8, 737.1, 737.1), border = "#c05a50", col = "#c05a50")
polygon(c(780, 800, 800, 780), c(721.8, 721.8, 737.1, 737.1), border = "#1f5c87", col = "#1f5c87")

polygon(c(725, 730, 730, 725), c(752.4, 752.4, 737.1, 737.1), border = "#e8c55c", col = "#e8c55c")
polygon(c(730, 735, 735, 730), c(752.4, 752.4, 737.1, 737.1), border = "#77997e", col = "#77997e")
polygon(c(735, 750, 750, 735), c(752.4, 752.4, 737.1, 737.1), border = "#c05a50", col = "#c05a50")
polygon(c(750, 800, 800, 750), c(752.4, 752.4, 737.1, 737.1), border = "#1f5c87", col = "#1f5c87")

polygon(c(725, 735, 735, 725), c(752.4, 752.4, 767.7, 767.7), border = "#e8c55c", col = "#e8c55c")
polygon(c(735, 750, 750, 735), c(752.4, 752.4, 767.7, 767.7), border = "#c05a50", col = "#c05a50")
polygon(c(750, 800, 800, 750), c(752.4, 752.4, 767.7, 767.7), border = "#1f5c87", col = "#1f5c87")

polygon(c(725, 735, 735, 725), c(783, 783, 767.7, 767.7), border = "#e8c55c", col = "#e8c55c")
polygon(c(735, 745, 745, 735), c(783, 783, 767.7, 767.7), border = "#77997e", col = "#77997e")
polygon(c(745, 785, 785, 745), c(783, 783, 767.7, 767.7), border = "#c05a50", col = "#c05a50")
polygon(c(785, 800, 800, 785), c(783, 783, 767.7, 767.7), border = "#1f5c87", col = "#1f5c87")

polygon(c(725, 745, 745, 725), c(783, 783, 798.3, 798.3), border = "#e8c55c", col = "#e8c55c")
polygon(c(745, 755, 755, 745), c(783, 783, 798.3, 798.3), border = "#c05a50", col = "#c05a50")
polygon(c(755, 760, 760, 755), c(783, 783, 798.3, 798.3), border = "#1f5c87", col = "#1f5c87")
polygon(c(760, 800, 800, 760), c(783, 783, 798.3, 798.3), border = "black", col = "black")

polygon(c(725, 800, 800, 725), c(798.3, 798.3, 813.6, 813.6), border = "#e8c55c", col = "#e8c55c")

polygon(c(725, 730, 730, 725), c(828.9, 828.9, 813.6, 813.6), border = "#c05a50", col = "#c05a50")
polygon(c(730, 795, 795, 730), c(828.9, 828.9, 813.6, 813.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(795, 800, 800, 795), c(828.9, 828.9, 813.6, 813.6), border = "black", col = "black")

polygon(c(725, 745, 745, 725), c(828.9, 828.9, 845, 845), border = "#e8c55c", col = "#e8c55c")
polygon(c(745, 790, 790, 745), c(828.9, 828.9, 845, 845), border = "#77997e", col = "#77997e")
polygon(c(790, 800, 800, 790), c(828.9, 828.9, 845, 845), border = "#1f5c87", col = "#1f5c87")


segments(x0=725, x1=725, y0=630, y1=845, lwd = 1, lty = "solid")
segments(x0=800, x1=800, y0=630, y1=845, lwd = 1, lty = "solid")
segments(x0=725, x1=800, y0=845, y1=845, lwd = 1, lty = "solid")
segments(x0=725, x1=800, y0=630, y1=630, lwd = 1, lty = "solid")

text(762.5, 637.6, "4", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=645.3, y1=645.3, lwd = 1, lty = "solid")
text(762.5, 652.9, "5", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=660.6, y1=660.6, lwd = 1, lty = "solid")
segments(x0=725, x1=800, y0=675.9, y1=675.9, lwd = 1, lty = "solid")
text(762.5, 677, "16", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=691.2, y1=691.2, lwd = 1, lty = "solid")
text(762.5, 707, "17", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=721.8, y1=721.8, lwd = 1, lty = "solid")
text(762.5, 738, "18", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=752.4, y1=752.4, lwd = 1, lty = "solid")
text(762.5, 769, "19", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=767.7, y1=767.7, lwd = 1, lty = "solid")
text(762.5, 800, "20", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=783, y1=783, lwd = 1, lty = "solid")
text(762.5, 831, "21", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=725, x1=800, y0=798.3, y1=798.3, lwd = 1, lty = "solid")
segments(x0=725, x1=800, y0=813.6, y1=813.6, lwd = 1, lty = "solid")
segments(x0=725, x1=800, y0=828.9, y1=828.9, lwd = 1, lty = "solid")

#right6 down2

polygon(c(820, 840, 840, 820), c(630, 630, 660.6, 660.6), border = "#c05a50", col = "#c05a50")

polygon(c(885, 875, 875, 885), c(630, 630, 660.6, 660.6), border = "#e8c55c", col = "#e8c55c")

polygon(c(810, 885, 885, 810), c(675.9, 675.9, 660.6, 660.6), border = "#996f72", col = "#996f72")

polygon(c(810, 820, 820, 810), c(675.9, 675.9, 691.2, 691.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(820, 885, 885, 820), c(675.9, 675.9, 691.2, 691.2), border = "#e8c55c", col = "#e8c55c")

polygon(c(810, 845, 845, 810), c(706.5, 706.5, 691.2, 691.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(845, 865, 865, 845), c(706.5, 706.5, 691.2, 691.2), border = "#77997e", col = "#77997e")
polygon(c(865, 885, 885, 865), c(706.5, 706.5, 691.2, 691.2), border = "#e8c55c", col = "#e8c55c")

polygon(c(810, 845, 845, 810), c(721.8, 721.8, 706.5, 706.5), border = "#1f5c87", col = "#1f5c87")
polygon(c(845, 865, 865, 845), c(721.8, 721.8, 706.5, 706.5), border = "#c05a50", col = "#c05a50")
polygon(c(865, 885, 885, 865), c(721.8, 721.8, 706.5, 706.5), border = "#77997e", col = "#77997e")

polygon(c(810, 845, 845, 810), c(783, 783, 798.3, 798.3), border = "#77997e", col = "#77997e")
polygon(c(845, 885, 885, 845), c(783, 783, 798.3, 798.3), border = "#e8c55c", col = "#e8c55c")

polygon(c(810, 825, 825, 810), c(798.3, 798.3, 813.6, 813.6), border = "black", col = "black")
polygon(c(825, 845, 845, 825), c(798.3, 798.3, 813.6, 813.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(845, 885, 885, 845), c(798.3, 798.3, 813.6, 813.6), border = "#c05a50", col = "#c05a50")

polygon(c(810, 835, 835, 810), c(828.9, 828.9, 845, 845), border = "#996f72", col = "#996f72")
polygon(c(865, 875, 875, 865), c(828.9, 828.9, 845, 845), border = "#1f5c87", col = "#1f5c87")
polygon(c(875, 885, 885, 875), c(828.9, 828.9, 845, 845), border = "#c05a50", col = "#c05a50")

segments(x0=885, x1=885, y0=630, y1=845, lwd = 1, lty = "solid")
segments(x0=810, x1=810, y0=630, y1=845, lwd = 1, lty = "solid")
segments(x0=810, x1=885, y0=845, y1=845, lwd = 1, lty = "solid")
segments(x0=810, x1=885, y0=630, y1=630, lwd = 1, lty = "solid")

text(847.5, 637.6, "2", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=885, x1=810, y0=645.3, y1=645.3, lwd = 1, lty = "solid")
text(847.5, 652.9, "1", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=885, x1=810, y0=660.6, y1=660.6, lwd = 1, lty = "solid")
segments(x0=885, x1=810, y0=675.9, y1=675.9, lwd = 1, lty = "solid")
text(847.5, 677, "13", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=885, x1=810, y0=691.2, y1=691.2, lwd = 1, lty = "solid")
text(847.5, 707, "12", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=885, x1=810, y0=706.5, y1=706.5, lwd = 1, lty = "solid")
text(847.5, 738, "11", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=885, x1=810, y0=721.8, y1=721.8, lwd = 1, lty = "solid")
text(847.5, 769, "10", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=885, x1=810, y0=752.4, y1=752.4, lwd = 1, lty = "solid")
text(847.5, 800, "9", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=885, x1=810, y0=783, y1=783, lwd = 1, lty = "solid")
text(847.5, 831, "8", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=885, x1=810, y0=813.6, y1=813.6, lwd = 1, lty = "solid")

#right7 down2

polygon(c(965, 1010, 1010, 965), c(630, 630, 640, 640), border = "#77997e", col = "#77997e")
polygon(c(965, 1010, 1010, 965), c(640, 640, 660.6, 660.6), border = "black", col = "black")

polygon(c(1000, 1010, 1010, 1000), c(630, 630, 635, 635), border = "#996f72", col = "#996f72")
polygon(c(1000, 1010, 1010, 1000), c(635, 635, 653, 653), border = "#1f5c87", col = "#1f5c87")
polygon(c(1000, 1010, 1010, 1000), c(653, 653, 660.6, 660.6), border = "black", col = "black")

polygon(c(930, 935, 935, 930), c(675.9, 675.9, 660.6, 660.6), border = "#e8c55c", col = "#e8c55c")
polygon(c(935, 940, 940, 935), c(675.9, 675.9, 660.6, 660.6), border = "#77997e", col = "#77997e")
polygon(c(940, 975, 975, 940), c(675.9, 675.9, 660.6, 660.6), border = "#c05a50", col = "#c05a50")
polygon(c(975, 1010, 1010, 975), c(675.9, 675.9, 660.6, 660.6), border = "#1f5c87", col = "#1f5c87")

polygon(c(930, 1010, 1010, 930), c(675.9, 675.9, 691.2, 691.2), border = "#1f5c87", col = "#1f5c87")

polygon(c(930, 940, 940, 930), c(706.5, 706.5, 691.2, 691.2), border = "#77997e", col = "#77997e")
polygon(c(940, 945, 945, 940), c(706.5, 706.5, 691.2, 691.2), border = "#996f72", col = "#996f72")
polygon(c(945, 1010, 1010, 945), c(706.5, 706.5, 691.2, 691.2), border = "#1f5c87", col = "#1f5c87")

polygon(c(930, 1010, 1010, 930), c(706.5, 706.5, 721.8, 721.8), border = "#e8c55c", col = "#e8c55c")

polygon(c(930, 955, 955, 930), c(737.1, 737.1, 721.8, 721.8), border = "#e8c55c", col = "#e8c55c")
polygon(c(955, 1010, 1010, 955), c(737.1, 737.1, 721.8, 721.8), border = "#c05a50", col = "#c05a50")

polygon(c(930, 980, 980, 930), c(737.1, 737.1, 752.4, 752.4), border = "#c05a50", col = "#c05a50")
polygon(c(980, 1010, 1010, 980), c(737.1, 737.1, 752.4, 752.4), border = "#996f72", col = "#996f72")

polygon(c(930, 1010, 1010, 930), c(767.1, 767.1, 752.4, 752.4), border = "#e8c55c", col = "#e8c55c")

polygon(c(930, 950, 950, 930), c(767.1, 767.1, 783, 783), border = "#77997e", col = "#77997e")
polygon(c(950, 970, 970, 950), c(767.1, 767.1, 783, 783), border = "#996f72", col = "#996f72")
polygon(c(970, 990, 990, 970), c(767.1, 767.1, 783, 783), border = "#1f5c87", col = "#1f5c87")
polygon(c(990, 1010, 1010, 990), c(767.1, 767.1, 783, 783), border = "black", col = "black")

polygon(c(930, 950, 950, 930), c(798.3, 798.3, 783, 783), border = "#e8c55c", col = "#e8c55c")
polygon(c(950, 985, 985, 950), c(798.3, 798.3, 783, 783), border = "#c05a50", col = "#c05a50")
polygon(c(985, 1010, 1010, 985), c(798.3, 798.3, 783, 783), border = "#1f5c87", col = "#1f5c87")

polygon(c(930, 945, 945, 930), c(798.3, 798.3, 813.6, 813.6), border = "#c05a50", col = "#c05a50")
polygon(c(945, 1010, 1010, 945), c(798.3, 798.3, 813.6, 813.6), border = "#1f5c87", col = "#1f5c87")

polygon(c(992.5, 975, 975, 992.5), c(829.3, 829.3, 813.6, 813.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(992.5, 975, 975, 992.5), c(845, 845, 829.3, 829.3), border = "#996f72", col = "#996f72")

polygon(c(1010, 992.5, 992.5, 1010), c(845, 845, 813.6, 813.6), border = "black", col = "black")



polygon(c(1042, 1026, 1026, 1042), c(630, 630, 650, 650), border = "#77997e", col = "#77997e")
polygon(c(1042, 1026, 1026, 1042), c(650, 650, 675.9, 675.9), border = "#1f5c87", col = "#1f5c87")

polygon(c(1058, 1042, 1042, 1058), c(630, 630, 650, 650), border = "#996f72", col = "#996f72")
polygon(c(1058, 1042, 1042, 1058), c(650, 650, 675.9, 675.9), border = "#1f5c87", col = "#1f5c87")

polygon(c(1074, 1058, 1058, 1074), c(630, 630, 665, 665), border = "#1f5c87", col = "#1f5c87")
polygon(c(1074, 1058, 1058, 1074), c(675.9, 675.9, 665, 665), border = "black", col = "black")

polygon(c(1074, 1090, 1090, 1074), c(630, 630, 650, 650), border = "#996f72", col = "#996f72")
polygon(c(1074, 1090, 1090, 1074), c(650, 650, 675.9, 675.9), border = "#1f5c87", col = "#1f5c87")

polygon(c(1010, 1075, 1075, 1010), c(675.9, 675.9, 691.2, 691.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(1075, 1080, 1080, 1075), c(675.9, 675.9, 691.2, 691.2), border = "#996f72", col = "#996f72")
polygon(c(1080, 1085, 1085, 1080), c(675.9, 675.9, 691.2, 691.2), border = "#c05a50", col = "#c05a50")
polygon(c(1085, 1090, 1090, 1085), c(675.9, 675.9, 691.2, 691.2), border = "#e8c55c", col = "#e8c55c")

polygon(c(1010, 1080, 1080, 1010), c(706.5, 706.5, 691.2, 691.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(1080, 1090, 1090, 1080), c(706.5, 706.5, 691.2, 691.2), border = "#c05a50", col = "#c05a50")

polygon(c(1010, 1090, 1090, 1010), c(706.5, 706.5, 721.8, 721.8), border = "#1f5c87", col = "#1f5c87")

polygon(c(1010, 1050, 1050, 1010), c(737.1, 737.1, 721.8, 721.8), border = "#1f5c87", col = "#1f5c87")
polygon(c(1050, 1090, 1090, 1050), c(737.1, 737.1, 721.8, 721.8), border = "#77997e", col = "#77997e")

polygon(c(1010, 1025, 1025, 1010), c(737.1, 737.1, 752.4, 752.4), border = "#1f5c87", col = "#1f5c87")
polygon(c(1025, 1050, 1050, 1025), c(737.1, 737.1, 752.4, 752.4), border = "#c05a50", col = "#c05a50")
polygon(c(1050, 1090, 1090, 1050), c(737.1, 737.1, 752.4, 752.4), border = "#e8c55c", col = "#e8c55c")

polygon(c(1010, 1020, 1020, 1010), c(767.1, 767.1, 752.4, 752.4), border = "black", col = "black")
polygon(c(1020, 1045, 1045, 1020), c(767.1, 767.1, 752.4, 752.4), border = "#1f5c87", col = "#1f5c87")
polygon(c(1045, 1080, 1080, 1045), c(767.1, 767.1, 752.4, 752.4), border = "#c05a50", col = "#c05a50")
polygon(c(1080, 1085, 1085, 1080), c(767.1, 767.1, 752.4, 752.4), border = "#77997e", col = "#77997e")
polygon(c(1085, 1090, 1090, 1085), c(767.1, 767.1, 752.4, 752.4), border = "#e8c55c", col = "#e8c55c")

polygon(c(1010, 1040, 1040, 1010), c(767.1, 767.1, 783, 783), border = "#1f5c87", col = "#1f5c87")
polygon(c(1040, 1050, 1050, 1040), c(767.1, 767.1, 783, 783), border = "#c05a50", col = "#c05a50")
polygon(c(1050, 1055, 1055, 1050), c(767.1, 767.1, 783, 783), border = "#77997e", col = "#77997e")
polygon(c(1055, 1090, 1090, 1055), c(767.1, 767.1, 783, 783), border = "#e8c55c", col = "#e8c55c")

polygon(c(1010, 1030, 1030, 1010), c(798.3, 798.3, 783, 783), border = "#1f5c87", col = "#1f5c87")
polygon(c(1030, 1070, 1070, 1030), c(798.3, 798.3, 783, 783), border = "#c05a50", col = "#c05a50")
polygon(c(1070, 1080, 1080, 1070), c(798.3, 798.3, 783, 783), border = "#77997e", col = "#77997e")
polygon(c(1080, 1090, 1090, 1080), c(798.3, 798.3, 783, 783), border = "#e8c55c", col = "#e8c55c")

polygon(c(1010, 1080, 1080, 1010), c(798.3, 798.3, 813.6, 813.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(1080, 1090, 1090, 1080), c(798.3, 798.3, 813.6, 813.6), border = "#e8c55c", col = "#e8c55c")

polygon(c(1010, 1035, 1035, 1010), c(829.3, 829.3, 813.6, 813.6), border = "#1f5c87", col = "#1f5c87")

polygon(c(1010, 1035, 1035, 1010), c(829.3, 829.3, 845, 845), border = "#996f72", col = "#996f72")
polygon(c(1035, 1090, 1090, 1035), c(829.3, 829.3, 845, 845), border = "#1f5c87", col = "#1f5c87")

segments(x0=930, x1=930, y0=630, y1=845, lwd = 1, lty = "solid")
segments(x0=1090, x1=1090, y0=630, y1=845, lwd = 1, lty = "solid")
segments(x0=1090, x1=930, y0=845, y1=845, lwd = 1, lty = "solid")
segments(x0=1090, x1=930, y0=630, y1=630, lwd = 1, lty = "solid")
segments(x0=1010, x1=1010, y0=630, y1=845, lwd = 1, lty = "solid")

text(970, 645.3, "1", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=930, x1=1010, y0=660.6, y1=660.6, lwd = 1, lty = "solid")
text(970, 676.9, "2", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=930, x1=1010, y0=675.9, y1=675.9, lwd = 1, lty = "solid")
segments(x0=930, x1=1010, y0=691.2, y1=691.2, lwd = 1, lty = "solid")
text(970, 707.5, "3", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=930, x1=1010, y0=706.5, y1=706.5, lwd = 1, lty = "solid")
segments(x0=930, x1=1010, y0=721.8, y1=721.8, lwd = 1, lty = "solid")
text(970, 737.1, "4", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=930, x1=1010, y0=752.4, y1=752.4, lwd = 1, lty = "solid")
text(970, 767.7, "5", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=930, x1=1010, y0=783, y1=783, lwd = 1, lty = "solid")
text(970, 798.3, "6", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=930, x1=1010, y0=813.6, y1=813.6, lwd = 1, lty = "solid")
text(970, 829.3, "7", family = "Main", cex = .75, col = "black", srt = 270)

segments(x0=1010, x1=1090, y0=675.9, y1=675.9, lwd = 1, lty = "solid")
segments(x0=1010, x1=1090, y0=691.2, y1=691.2, lwd = 1, lty = "solid")
segments(x0=1010, x1=1090, y0=721.8, y1=721.8, lwd = 1, lty = "solid")
text(1050, 707.5, "17", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1010, x1=1090, y0=752.4, y1=752.4, lwd = 1, lty = "solid")
text(1050, 737.1, "18", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1010, x1=1090, y0=783, y1=783, lwd = 1, lty = "solid")
text(1050, 767.7, "19", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1010, x1=1090, y0=813.6, y1=813.6, lwd = 1, lty = "solid")
text(1050, 798.3, "20", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1010, x1=1090, y0=828.9, y1=828.9, lwd = 1, lty = "solid")
text(1050, 829.3, "21", family = "Main", cex = .75, col = "black", srt = 270)

text(1018, 652.9, "5", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1026, x1=1026, y0=630, y1=675.9, lwd = 1, lty = "solid")
text(1032, 652.9, "4", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1042, x1=1042, y0=630, y1=675.9, lwd = 1, lty = "solid")
text(1050, 652.9, "3", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1058, x1=1058, y0=630, y1=675.9, lwd = 1, lty = "solid")
text(1066, 652.9, "2", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1074, x1=1074, y0=630, y1=675.9, lwd = 1, lty = "solid")
text(1082, 652.9, "1", family = "Main", cex = .75, col = "black", srt = 270)

#right8 down2

polygon(c(1125, 1145, 1145, 1125), c(630, 630, 645, 645), border = "#1f5c87", col = "#1f5c87")
polygon(c(1145, 1165, 1165, 1145), c(630, 630, 645, 645), border = "#e8c55c", col = "#e8c55c")
polygon(c(1165, 1185, 1185, 1165), c(630, 630, 638, 638), border = "#77997e", col = "#77997e")
polygon(c(1165, 1185, 1185, 1165), c(638, 638, 645, 645), border = "#c05a50", col = "#c05a50")
polygon(c(1185, 1205, 1205, 1185), c(630, 630, 635, 635), border = "#996f72", col = "#996f72")
polygon(c(1185, 1205, 1205, 1185), c(635, 635, 645, 645), border = "#1f5c87", col = "#1f5c87")

polygon(c(1125, 1130, 1130, 1125), c(645, 645, 660.6, 660.6), border = "#e8c55c", col = "#e8c55c")
polygon(c(1130, 1205, 1205, 1130), c(645, 645, 660.6, 660.6), border = "black", col = "black")

polygon(c(1125, 1130, 1130, 1125), c(675.9, 675.9, 660.6, 660.6), border = "#e8c55c", col = "#e8c55c")
polygon(c(1130, 1135, 1135, 1130), c(675.9, 675.9, 660.6, 660.6), border = "#77997e", col = "#77997e")
polygon(c(1135, 1140, 1140, 1135), c(675.9, 675.9, 660.6, 660.6), border = "#c05a50", col = "#c05a50")
polygon(c(1140, 1160, 1160, 1140), c(675.9, 675.9, 660.6, 660.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(1160, 1205, 1205, 1160), c(675.9, 675.9, 660.6, 660.6), border = "black", col = "black")

polygon(c(1125, 1130, 1130, 1125), c(675.9, 675.9, 691.2, 691.2), border = "#e8c55c", col = "#e8c55c")
polygon(c(1130, 1135, 1135, 1130), c(675.9, 675.9, 691.2, 691.2), border = "#c05a50", col = "#c05a50")
polygon(c(1135, 1170, 1170, 1135), c(675.9, 675.9, 691.2, 691.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(1170, 1205, 1205, 1170), c(675.9, 675.9, 691.2, 691.2), border = "black", col = "black")

polygon(c(1125, 1140, 1140, 1125), c(706.5, 706.5, 691.2, 691.2), border = "#e8c55c", col = "#e8c55c")
polygon(c(1140, 1165, 1165, 1140), c(706.5, 706.5, 691.2, 691.2), border = "#1f5c87", col = "#1f5c87")
polygon(c(1165, 1205, 1205, 1165), c(706.5, 706.5, 691.2, 691.2), border = "black", col = "black")

polygon(c(1125, 1135, 1135, 1125), c(706.5, 706.5, 721.8, 721.8), border = "#e8c55c", col = "#e8c55c")
polygon(c(1135, 1160, 1160, 1135), c(706.5, 706.5, 721.8, 721.8), border = "#1f5c87", col = "#1f5c87")
polygon(c(1160, 1205, 1205, 1160), c(706.5, 706.5, 721.8, 721.8), border = "black", col = "black")

polygon(c(1125, 1135, 1135, 1125), c(737.1, 737.1, 721.8, 721.8), border = "#e8c55c", col = "#e8c55c")
polygon(c(1135, 1150, 1150, 1135), c(737.1, 737.1, 721.8, 721.8), border = "#1f5c87", col = "#1f5c87")
polygon(c(1150, 1205, 1205, 1150), c(737.1, 737.1, 721.8, 721.8), border = "black", col = "black")

polygon(c(1125, 1130, 1130, 1125), c(737.1, 737.1, 752.4, 752.4), border = "#77997e", col = "#77997e")
polygon(c(1130, 1135, 1135, 1130), c(737.1, 737.1, 752.4, 752.4), border = "#c05a50", col = "#c05a50")
polygon(c(1135, 1160, 1160, 1135), c(737.1, 737.1, 752.4, 752.4), border = "#1f5c87", col = "#1f5c87")
polygon(c(1150, 1205, 1205, 1150), c(737.1, 737.1, 752.4, 752.4), border = "black", col = "black")

polygon(c(1125, 1130, 1130, 1125), c(767.1, 767.1, 752.4, 752.4), border = "#e8c55c", col = "#e8c55c")
polygon(c(1130, 1140, 1140, 1130), c(767.1, 767.1, 752.4, 752.4), border = "#c05a50", col = "#c05a50")
polygon(c(1140, 1160, 1160, 1140), c(767.1, 767.1, 752.4, 752.4), border = "#1f5c87", col = "#1f5c87")
polygon(c(1160, 1205, 1205, 1160), c(767.1, 767.1, 752.4, 752.4), border = "black", col = "black")

polygon(c(1125, 1130, 1130, 1125), c(767.1, 767.1, 783, 783), border = "#e8c55c", col = "#e8c55c")
polygon(c(1130, 1140, 1140, 1130), c(767.1, 767.1, 783, 783), border = "#c05a50", col = "#c05a50")
polygon(c(1140, 1160, 1160, 1140), c(767.1, 767.1, 783, 783), border = "#1f5c87", col = "#1f5c87")
polygon(c(1160, 1205, 1205, 1160), c(767.1, 767.1, 783, 783), border = "black", col = "black")

polygon(c(1125, 1141, 1141, 1125), c(783, 783, 790, 790), border = "#77997e", col = "#77997e")
polygon(c(1125, 1141, 1141, 1125), c(790, 790, 845, 845), border = "#c05a50", col = "#c05a50")

polygon(c(1157, 1141, 1141, 1157), c(783, 783, 795, 795), border = "#c05a50", col = "#c05a50")
polygon(c(1157, 1141, 1141, 1157), c(795, 795, 815, 815), border = "#1f5c87", col = "#1f5c87")
polygon(c(1157, 1141, 1141, 1157), c(815, 815, 825, 825), border = "#c05a50", col = "#c05a50")
polygon(c(1157, 1141, 1141, 1157), c(825, 825, 835, 835), border = "#996f72", col = "#996f72")
polygon(c(1157, 1141, 1141, 1157), c(835, 835, 840, 840), border = "#77997e", col = "#77997e")
polygon(c(1157, 1141, 1141, 1157), c(840, 840, 845, 845), border = "#e8c55c", col = "#e8c55c")

polygon(c(1157, 1173, 1173, 1157), c(783, 783, 790, 790), border = "#1f5c87", col = "#1f5c87")
polygon(c(1157, 1173, 1173, 1157), c(790, 790, 815, 815), border = "#c05a50", col = "#c05a50")
polygon(c(1157, 1173, 1173, 1157), c(815, 815, 830, 830), border = "#996f72", col = "#996f72")
polygon(c(1157, 1173, 1173, 1157), c(830, 830, 845, 845), border = "#e8c55c", col = "#e8c55c")

polygon(c(1189, 1173, 1173, 1189), c(783, 783, 800, 800), border = "#1f5c87", col = "#1f5c87")
polygon(c(1189, 1173, 1173, 1189), c(800, 800, 840, 840), border = "#c05a50", col = "#c05a50")
polygon(c(1189, 1173, 1173, 1189), c(845, 845, 840, 840), border = "#77997e", col = "#77997e")

polygon(c(1189, 1205, 1205, 1189), c(783, 783, 810, 810), border = "#c05a50", col = "#c05a50")
polygon(c(1189, 1205, 1205, 1189), c(810, 810, 845, 845), border = "#996f72", col = "#996f72")




polygon(c(1205, 1220, 1220, 1205), c(630, 630, 645, 645), border = "#c05a50", col = "#c05a50")
polygon(c(1220, 1235, 1235, 1220), c(630, 630, 645, 645), border = "#e8c55c", col = "#e8c55c")
polygon(c(1235, 1250, 1250, 1235), c(630, 630, 645, 645), border = "#1f5c87", col = "#1f5c87")
polygon(c(1250, 1285, 1285, 1250), c(630, 630, 645, 645), border = "#e8c55c", col = "#e8c55c")

polygon(c(1205, 1285, 1285, 1205), c(645, 645, 660.6, 660.6), border = "#1f5c87", col = "#1f5c87")

polygon(c(1205, 1285, 1285, 1205), c(675.9, 675.9, 660.6, 660.6), border = "#1f5c87", col = "#1f5c87")

polygon(c(1205, 1225, 1225, 1205), c(675.9, 675.9, 691.2, 691.2), border = "#996f72", col = "#996f72")
polygon(c(1225, 1285, 1285, 1225), c(675.9, 675.9, 691.2, 691.2), border = "#1f5c87", col = "#1f5c87")

polygon(c(1205, 1285, 1285, 1205), c(706.5, 706.5, 691.2, 691.2), border = "#c05a50", col = "#c05a50")

polygon(c(1205, 1285, 1285, 1205), c(737.1, 737.1, 721.8, 721.8), border = "#e8c55c", col = "#e8c55c")

polygon(c(1205, 1285, 1285, 1205), c(737.1, 737.1, 752.4, 752.4), border = "#c05a50", col = "#c05a50")

polygon(c(1205, 1220, 1220, 1205), c(767.1, 767.1, 752.4, 752.4), border = "#1f5c87", col = "#1f5c87")
polygon(c(1220, 1265, 1265, 1220), c(767.1, 767.1, 752.4, 752.4), border = "#c05a50", col = "#c05a50")
polygon(c(1265, 1275, 1275, 1265), c(767.1, 767.1, 752.4, 752.4), border = "#77997e", col = "#77997e")
polygon(c(1275, 1285, 1285, 1275), c(767.1, 767.1, 752.4, 752.4), border = "#e8c55c", col = "#e8c55c")

polygon(c(1205, 1225, 1225, 1205), c(767.1, 767.1, 783, 783), border = "#1f5c87", col = "#1f5c87")
polygon(c(1225, 1265, 1265, 1225), c(767.1, 767.1, 783, 783), border = "#c05a50", col = "#c05a50")
polygon(c(1265, 1285, 1285, 1265), c(767.1, 767.1, 783, 783), border = "#77997e", col = "#77997e")

polygon(c(1205, 1230, 1230, 1205), c(798.3, 798.3, 783, 783), border = "#1f5c87", col = "#1f5c87")

polygon(c(1205, 1230, 1230, 1205), c(798.3, 798.3, 813.6, 813.6), border = "#c05a50", col = "#c05a50")

polygon(c(1205, 1225, 1225, 1205), c(829.3, 829.3, 813.6, 813.6), border = "#c05a50", col = "#c05a50")
polygon(c(1225, 1245, 1245, 1225), c(829.3, 829.3, 813.6, 813.6), border = "#1f5c87", col = "#1f5c87")
polygon(c(1245, 1285, 1285, 1245), c(829.3, 829.3, 813.6, 813.6), border = "#996f72", col = "#996f72")

polygon(c(1205, 1225, 1225, 1205), c(829.3, 829.3, 845, 845), border = "#e8c55c", col = "#e8c55c")
polygon(c(1225, 1245, 1245, 1225), c(829.3, 829.3, 845, 845), border = "#c05a50", col = "#c05a50")
polygon(c(1245, 1265, 1265, 1245), c(829.3, 829.3, 845, 845), border = "#77997e", col = "#77997e")
polygon(c(1265, 1285, 1285, 1265), c(829.3, 829.3, 845, 845), border = "#996f72", col = "#996f72")

segments(x0=1205, x1=1205, y0=845, y1=630, lwd = 1, lty = "solid")
segments(x0=1125, x1=1125, y0=845, y1=630, lwd = 1, lty = "solid")
segments(x0=1285, x1=1285, y0=845, y1=630, lwd = 1, lty = "solid")
segments(x0=1125, x1=1285, y0=630, y1=630, lwd = 1, lty = "solid")
segments(x0=1125, x1=1285, y0=845, y1=845, lwd = 1, lty = "solid")

text(1165, 645.3, "14", family = "Main", cex = .75, col = "white", srt = 270)
segments(x0=1125, x1=1205, y0=660.6, y1=660.6, lwd = 1, lty = "solid")
text(1165, 676.9, "13", family = "Main", cex = .75, col = "white", srt = 270)
segments(x0=1125, x1=1205, y0=691.2, y1=691.2, lwd = 1, lty = "solid")
text(1165, 707.5, "12", family = "Main", cex = .75, col = "white", srt = 270)
segments(x0=1125, x1=1205, y0=721.8, y1=721.8, lwd = 1, lty = "solid")
text(1165, 737.1, "11", family = "Main", cex = .75, col = "white", srt = 270)
segments(x0=1125, x1=1205, y0=752.4, y1=752.4, lwd = 1, lty = "solid")
text(1165, 757.7, "10", family = "Main", cex = .75, col = "white", srt = 270)
segments(x0=1125, x1=1205, y0=783, y1=783, lwd = 1, lty = "solid")

text(1245, 645.3, "1", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1285, x1=1205, y0=660.6, y1=660.6, lwd = 1, lty = "solid")
text(1245, 676.9, "2", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1285, x1=1205, y0=691.2, y1=691.2, lwd = 1, lty = "solid")
text(1245, 707.5, "3", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1285, x1=1205, y0=706.5, y1=706.5, lwd = 1, lty = "solid")
text(1245, 737.1, "4", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1285, x1=1205, y0=721.8, y1=721.8, lwd = 1, lty = "solid")
text(1245, 767.7, "5", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1285, x1=1205, y0=752.4, y1=752.4, lwd = 1, lty = "solid")
text(1245, 798.3, "6", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1285, x1=1205, y0=783, y1=783, lwd = 1, lty = "solid")
text(1245, 829.3, "7", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1285, x1=1205, y0=813.6, y1=813.6, lwd = 1, lty = "solid")

text(1133, 814, "4", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1141, x1=1141, y0=783, y1=845, lwd = 1, lty = "solid")
text(1149, 814, "3", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1157, x1=1157, y0=783, y1=845, lwd = 1, lty = "solid")
text(1165, 814, "2", family = "Main", cex = .75, col = "black", srt = 270)
segments(x0=1173, x1=1173, y0=783, y1=845, lwd = 1, lty = "solid")
segments(x0=1189, x1=1189, y0=783, y1=845, lwd = 1, lty = "solid")
text(1189, 814, "1", family = "Main", cex = .75, col = "black", srt = 270)

#Border and street work

segments(x0=90, x1=90, y0=2, y1=12, lwd = 1, lty = "solid")
segments(x0=700, x1=700, y0=2, y1=12, lwd = 1, lty = "solid")
segments(x0=90, x1=700, y0=12, y1=12, lwd = 1, lty = "solid")

segments(x0=880, x1=880, y0=2, y1=12, lwd = 1, lty = "solid")
segments(x0=730, x1=730, y0=2, y1=12, lwd = 1, lty = "solid")
segments(x0=880, x1=730, y0=12, y1=12, lwd = 1, lty = "solid")

segments(x0=930, x1=930, y0=2, y1=12, lwd = 1, lty = "solid")
segments(x0=1080, x1=1080, y0=2, y1=12, lwd = 1, lty = "solid")
segments(x0=930, x1=1080, y0=12, y1=12, lwd = 1, lty = "solid")

segments(x0=1130, x1=1130, y0=2, y1=12, lwd = 1, lty = "solid")
segments(x0=1280, x1=1280, y0=2, y1=12, lwd = 1, lty = "solid")
segments(x0=1130, x1=1280, y0=12, y1=12, lwd = 1, lty = "solid")

text(1390, 435, "(NORTH)", family = "Text", cex = .75, col = "black", srt = 270)
text(1355, 435, "WAGE MAP NO.1 - POLK STREET TO TWELFTH.", family = "Text", cex = 1, col = "black", srt = 270)
text(1335, 435, "HALSTED STREET TO JEFFERSON, CHICAGO.", family = "Text", cex = 1, col = "black", srt = 270)
text(700, 955, "THESE FIGURES REPRESENT THE TOTAL EARNINGS PER WEEK OF A FAMILY.", family = "Text", cex = 1, col = "black")

text(1300, 105, "W.POLK", family = "Text", cex = 1.5, col = "black", srt = 270)
text(1316, 90, "227", family = "Main", cex = .75, col = "black")
text(1285, 110, "228", family = "Main", cex = .75, col = "black")
text(1316, 130, "225", family = "Main", cex = .75, col = "black")
text(1295, 140, "224", family = "Main", cex = .75, col = "black")
text(1312, 150, "221", family = "Main", cex = .75, col = "black")
text(1295, 160, "222", family = "Main", cex = .75, col = "black")
text(1295, 190, "218", family = "Main", cex = .75, col = "black")
text(1312, 200, "217", family = "Main", cex = .75, col = "black")
text(1312, 210, "213", family = "Main", cex = .75, col = "black")
text(1295, 220, "214", family = "Main", cex = .75, col = "black")
text(1312, 250, "209", family = "Main", cex = .75, col = "black")
text(1295, 270, "208", family = "Main", cex = .75, col = "black")
text(1295, 310, "204", family = "Main", cex = .75, col = "black")
text(1295, 360, "198", family = "Main", cex = .75, col = "black")
text(1295, 390, "194", family = "Main", cex = .75, col = "black")
text(1295, 425, "190", family = "Main", cex = .75, col = "black")
text(1295, 460, "186", family = "Main", cex = .75, col = "black")
text(1295, 495, "182", family = "Main", cex = .75, col = "black")
text(1295, 530, "178", family = "Main", cex = .75, col = "black")
text(1295, 563, "174", family = "Main", cex = .75, col = "black")
text(1295, 596, "170", family = "Main", cex = .75, col = "black")

text(1312, 630, "167", family = "Main", cex = .75, col = "black")
text(1295, 640, "163", family = "Main", cex = .75, col = "black")
text(1312, 650, "165", family = "Main", cex = .75, col = "black")
text(1295, 660, "166", family = "Main", cex = .75, col = "black")
text(1295, 680, "162", family = "Main", cex = .75, col = "black")
text(1312, 690, "161", family = "Main", cex = .75, col = "black")
text(1295, 700, "160", family = "Main", cex = .75, col = "black")
text(1295, 730, "154", family = "Main", cex = .75, col = "black")
text(1295, 760, "150", family = "Main", cex = .75, col = "black")
text(1295, 790, "146", family = "Main", cex = .75, col = "black")
text(1300, 830, "ST.", family = "Text", cex = 1.5, col = "black", srt = 270)
text(1312, 809, "143", family = "Main", cex = .75, col = "black")
text(1312, 840, "139", family = "Main", cex = .75, col = "black")

text(175, 860, "S.JEFFERSON", family = "Text", cex = 1.5, col = "black")
text(320, 855, "447", family = "Main", cex = .75, col = "black", srt = 270)
text(350, 855, "443", family = "Main", cex = .75, col = "black", srt = 270)
text(380, 855, "437", family = "Main", cex = .75, col = "black", srt = 270)
text(405, 855, "435", family = "Main", cex = .75, col = "black", srt = 270)
text(420, 855, "431", family = "Main", cex = .75, col = "black", srt = 270)
text(465, 855, "427", family = "Main", cex = .75, col = "black", srt = 270)
text(842, 855, "391", family = "Main", cex = .75, col = "black", srt = 270)
text(852, 855, "389", family = "Main", cex = .75, col = "black", srt = 270)
text(970, 855, "381", family = "Main", cex = .75, col = "black", srt = 270)
text(1005, 855, "377", family = "Main", cex = .75, col = "black", srt = 270)
text(1015, 855, "373", family = "Main", cex = .75, col = "black", srt = 270)
text(1130, 855, "361", family = "Main", cex = .75, col = "black", srt = 270)
text(1161, 855, "353", family = "Main", cex = .75, col = "black", srt = 270)
text(1195, 855, "349", family = "Main", cex = .75, col = "black", srt = 270)
text(1245, 855, "343", family = "Main", cex = .75, col = "black", srt = 270)
text(1282, 855, "339", family = "Main", cex = .75, col = "black", srt = 270)

text(10, 435, "(SOUTH)", family = "Text", cex = .75, col = "black", srt = 270)
text(80, 95, "W.12", family = "Text", cex = 1.5, col = "black", srt = 270)
text(84, 125, "TH", family = "Text", cex = .75, col = "black", srt = 270)
text(80, 145, "275", family = "Main", cex = .75, col = "black")
text(80, 175, "269", family = "Main", cex = .75, col = "black")
text(80, 205, "265", family = "Main", cex = .75, col = "black")
text(80, 250, "259", family = "Main", cex = .75, col = "black")
text(80, 270, "257", family = "Main", cex = .75, col = "black")
text(80, 300, "251", family = "Main", cex = .75, col = "black")
text(80, 330, "247", family = "Main", cex = .75, col = "black")
text(80, 360, "243", family = "Main", cex = .75, col = "black")
text(80, 395, "239", family = "Main", cex = .75, col = "black")
text(80, 415, "235", family = "Main", cex = .75, col = "black")
text(80, 500, "225", family = "Main", cex = .75, col = "black")
text(80, 530, "221", family = "Main", cex = .75, col = "black")
text(80, 560, "217", family = "Main", cex = .75, col = "black")
text(80, 590, "213", family = "Main", cex = .75, col = "black")

text(80, 630, "211", family = "Main", cex = .75, col = "black")
text(80, 660, "207", family = "Main", cex = .75, col = "black")
text(80, 690, "203", family = "Main", cex = .75, col = "black")
text(80, 715, "199", family = "Main", cex = .75, col = "black")
text(80, 745, "195", family = "Main", cex = .75, col = "black")
text(80, 775, "191", family = "Main", cex = .75, col = "black")
text(80, 810, "183", family = "Main", cex = .75, col = "black")
text(80, 840, "181", family = "Main", cex = .75, col = "black")
text(62, 825, "ST.", family = "Text", cex = 1.5, col = "black", srt = 270)

text(140, 30, "S.HALSTED", family = "Text", cex = 1.5, col = "black")
text(200, 38, "448", family = "Main", cex = .75, col = "black", srt = 270)
text(217, 38, "446", family = "Main", cex = .75, col = "black", srt = 270)
text(268, 38, "442", family = "Main", cex = .75, col = "black", srt = 270)
text(322, 38, "434", family = "Main", cex = .75, col = "black", srt = 270)
text(350, 32, "430", family = "Main", cex = .75, col = "black", srt = 270)
text(380, 38, "426", family = "Main", cex = .75, col = "black", srt = 270)
text(407, 38, "420", family = "Main", cex = .75, col = "black", srt = 270)
text(467, 38, "414", family = "Main", cex = .75, col = "black", srt = 270)
text(530, 38, "406", family = "Main", cex = .75, col = "black", srt = 270)
text(590, 38, "402", family = "Main", cex = .75, col = "black", srt = 270)
text(610, 38, "396", family = "Main", cex = .75, col = "black", srt = 270)
text(670, 38, "390", family = "Main", cex = .75, col = "black", srt = 270)
text(730, 38, "388", family = "Main", cex = .75, col = "black", srt = 270)
text(750, 38, "386", family = "Main", cex = .75, col = "black", srt = 270)
text(790, 38, "382", family = "Main", cex = .75, col = "black", srt = 270)
text(815, 38, "380", family = "Main", cex = .75, col = "black", srt = 270)
text(845, 32, "376", family = "Main", cex = .75, col = "black", srt = 270)
text(875, 38, "372", family = "Main", cex = .75, col = "black", srt = 270)
text(935, 38, "370", family = "Main", cex = .75, col = "black", srt = 270)
text(965, 32, "366", family = "Main", cex = .75, col = "black", srt = 270)
text(995, 38, "364", family = "Main", cex = .75, col = "black", srt = 270)
text(1020, 38, "360", family = "Main", cex = .75, col = "black", srt = 270)
text(1050, 32, "356", family = "Main", cex = .75, col = "black", srt = 270)
text(1085, 38, "352", family = "Main", cex = .75, col = "black", srt = 270)
text(1135, 38, "350", family = "Main", cex = .75, col = "black", srt = 270)
text(1165, 32, "346", family = "Main", cex = .75, col = "black", srt = 270)
text(1195, 38, "342", family = "Main", cex = .75, col = "black", srt = 270)
text(1230, 38, "338", family = "Main", cex = .75, col = "black", srt = 270)

text(295, 90, "BUNKER", family = "Text", cex = 1.5, col = "black", srt = 270)
text(306, 125, "177", family = "Main", cex = .75, col = "black")
text(306, 150, "175", family = "Main", cex = .75, col = "black")
text(284, 150, "176", family = "Main", cex = .75, col = "black")
text(284, 175, "172", family = "Main", cex = .75, col = "black")
text(306, 175, "171", family = "Main", cex = .75, col = "black")
text(284, 195, "168", family = "Main", cex = .75, col = "black")
text(306, 195, "169", family = "Main", cex = .75, col = "black")
text(306, 205, "165", family = "Main", cex = .75, col = "black")
text(284, 230, "164", family = "Main", cex = .75, col = "black")
text(306, 230, "163", family = "Main", cex = .75, col = "black")
text(284, 265, "160", family = "Main", cex = .75, col = "black")
text(306, 265, "159", family = "Main", cex = .75, col = "black")
text(284, 300, "156", family = "Main", cex = .75, col = "black")
text(306, 300, "155", family = "Main", cex = .75, col = "black")
text(279, 333, "152", family = "Main", cex = .75, col = "black")
text(301, 333, "151", family = "Main", cex = .75, col = "black")
text(301, 366, "147", family = "Main", cex = .75, col = "black")
text(301, 383, "145", family = "Main", cex = .75, col = "black")
text(301, 416, "141", family = "Main", cex = .75, col = "black")
text(301, 450, "137", family = "Main", cex = .75, col = "black")
text(301, 483, "133", family = "Main", cex = .75, col = "black")
text(301, 515, "129", family = "Main", cex = .75, col = "black")

text(279, 635, "118", family = "Main", cex = .75, col = "black")
text(301, 645, "117", family = "Main", cex = .75, col = "black")
text(279, 660, "114", family = "Main", cex = .75, col = "black")
text(301, 680, "111", family = "Main", cex = .75, col = "black")
text(279, 697, "110", family = "Main", cex = .75, col = "black")
text(301, 707, "107", family = "Main", cex = .75, col = "black")
text(279, 717, "106", family = "Main", cex = .75, col = "black")
text(279, 730, "104", family = "Main", cex = .75, col = "black")
text(301, 730, "103", family = "Main", cex = .75, col = "black")
text(279, 756, "100", family = "Main", cex = .75, col = "black")
text(301, 756, "99", family = "Main", cex = .75, col = "black")
text(279, 784, "96", family = "Main", cex = .75, col = "black")
text(301, 784, "95", family = "Main", cex = .75, col = "black")
text(290, 830, "ST.", family = "Text", cex = 1.5, col = "black", srt = 270)

text(500, 100, "DE KOVEN", family = "Text", cex = 1.5, col = "black", srt = 270)
text(485, 150, "224", family = "Main", cex = .75, col = "black")
text(511, 150, "239", family = "Main", cex = .75, col = "black")
text(485, 160, "230", family = "Main", cex = .75, col = "black")
text(511, 178, "227", family = "Main", cex = .75, col = "black")
text(485, 195, "226", family = "Main", cex = .75, col = "black")
text(511, 205, "223", family = "Main", cex = .75, col = "black")
text(485, 230, "222", family = "Main", cex = .75, col = "black")
text(511, 247, "219", family = "Main", cex = .75, col = "black")
text(485, 264, "218", family = "Main", cex = .75, col = "black")
text(511, 280, "215", family = "Main", cex = .75, col = "black")
text(485, 300, "214", family = "Main", cex = .75, col = "black")
text(511, 310, "211", family = "Main", cex = .75, col = "black")
text(485, 335, "210", family = "Main", cex = .75, col = "black")
text(511, 335, "207", family = "Main", cex = .75, col = "black")
text(485, 353, "208", family = "Main", cex = .75, col = "black")
text(485, 385, "204", family = "Main", cex = .75, col = "black")
text(511, 405, "201", family = "Main", cex = .75, col = "black")
text(485, 415, "200", family = "Main", cex = .75, col = "black")
text(511, 440, "197", family = "Main", cex = .75, col = "black")
text(485, 450, "196", family = "Main", cex = .75, col = "black")
text(511, 478, "193", family = "Main", cex = .75, col = "black")
text(485, 468, "192", family = "Main", cex = .75, col = "black")
text(511, 500, "189", family = "Main", cex = .75, col = "black")
text(485, 500, "190", family = "Main", cex = .75, col = "black")
text(485, 520, "186", family = "Main", cex = .75, col = "black")
text(511, 531, "183", family = "Main", cex = .75, col = "black")
text(485, 552, "182", family = "Main", cex = .75, col = "black")
text(511, 552, "181", family = "Main", cex = .75, col = "black")
text(485, 583, "178", family = "Main", cex = .75, col = "black")
text(511, 583, "177", family = "Main", cex = .75, col = "black")

text(485, 640, "176", family = "Main", cex = .75, col = "black")
text(485, 660, "174", family = "Main", cex = .75, col = "black")
text(485, 690, "170", family = "Main", cex = .75, col = "black")
text(511, 690, "169", family = "Main", cex = .75, col = "black")
text(485, 720, "166", family = "Main", cex = .75, col = "black")
text(511, 720, "165", family = "Main", cex = .75, col = "black")
text(485, 745, "162", family = "Main", cex = .75, col = "black")
text(511, 745, "161", family = "Main", cex = .75, col = "black")
text(485, 780, "158", family = "Main", cex = .75, col = "black")
text(511, 780, "157", family = "Main", cex = .75, col = "black")
text(511, 810, "153", family = "Main", cex = .75, col = "black")
text(511, 840, "149", family = "Main", cex = .75, col = "black")
text(498, 825, "ST.", family = "Text", cex = 1.5, col = "black", srt = 270)

text(700, 100, "W.TAYLOR", family = "Text", cex = 1.5, col = "black", srt = 270)
text(716, 91, "247", family = "Main", cex = .75, col = "black")
text(716, 106, "245", family = "Main", cex = .75, col = "black")
text(716, 143, "241", family = "Main", cex = .75, col = "black")
text(689, 145, "242", family = "Main", cex = .75, col = "black")
text(689, 180, "238", family = "Main", cex = .75, col = "black")
text(716, 175, "237", family = "Main", cex = .75, col = "black")
text(689, 210, "234", family = "Main", cex = .75, col = "black")
text(716, 205, "233", family = "Main", cex = .75, col = "black")
text(689, 245, "230", family = "Main", cex = .75, col = "black")
text(716, 240, "229", family = "Main", cex = .75, col = "black")
text(689, 277, "226", family = "Main", cex = .75, col = "black")
text(716, 272, "225", family = "Main", cex = .75, col = "black")
text(689, 309, "222", family = "Main", cex = .75, col = "black")
text(716, 304, "221", family = "Main", cex = .75, col = "black")
text(689, 338, "220", family = "Main", cex = .75, col = "black")
text(716, 348, "215", family = "Main", cex = .75, col = "black")
text(689, 380, "212", family = "Main", cex = .75, col = "black")
text(716, 380, "211", family = "Main", cex = .75, col = "black")
text(689, 410, "208", family = "Main", cex = .75, col = "black")
text(716, 415, "207", family = "Main", cex = .75, col = "black")
text(689, 440, "205", family = "Main", cex = .75, col = "black")
text(716, 445, "203", family = "Main", cex = .75, col = "black")
text(689, 475, "202", family = "Main", cex = .75, col = "black")
text(716, 490, "199", family = "Main", cex = .75, col = "black")
text(689, 505, "198", family = "Main", cex = .75, col = "black")
text(716, 525, "195", family = "Main", cex = .75, col = "black")
text(689, 540, "194", family = "Main", cex = .75, col = "black")
text(689, 560, "192", family = "Main", cex = .75, col = "black")
text(716, 560, "191", family = "Main", cex = .75, col = "black")
text(689, 590, "188", family = "Main", cex = .75, col = "black")
text(716, 590, "187", family = "Main", cex = .75, col = "black")

text(689, 660, "184", family = "Main", cex = .75, col = "black")
text(689, 690, "180", family = "Main", cex = .75, col = "black")
text(716, 687, "179", family = "Main", cex = .75, col = "black")
text(716, 698, "177", family = "Main", cex = .75, col = "black")
text(689, 718, "176", family = "Main", cex = .75, col = "black")
text(716, 728, "169", family = "Main", cex = .75, col = "black")
text(689, 750, "172", family = "Main", cex = .75, col = "black")
text(716, 750, "167", family = "Main", cex = .75, col = "black")
text(689, 760, "166", family = "Main", cex = .75, col = "black")
text(689, 780, "164", family = "Main", cex = .75, col = "black")
text(716, 780, "163", family = "Main", cex = .75, col = "black")
text(689, 810, "160", family = "Main", cex = .75, col = "black")
text(716, 810, "159", family = "Main", cex = .75, col = "black")
text(689, 840, "156", family = "Main", cex = .75, col = "black")
text(716, 840, "155", family = "Main", cex = .75, col = "black")
text(700, 820, "ST.", family = "Text", cex = 1.5, col = "black", srt = 270)

text(905, 95, "FORQUER", family = "Text", cex = 1.5, col = "black", srt = 270)
text(894, 160, "212", family = "Main", cex = .75, col = "black")
text(920, 160, "211", family = "Main", cex = .75, col = "black")
text(920, 130, "215", family = "Main", cex = .75, col = "black")
text(894, 190, "208", family = "Main", cex = .75, col = "black")
text(920, 190, "207", family = "Main", cex = .75, col = "black")
text(894, 220, "204", family = "Main", cex = .75, col = "black")
text(920, 220, "205", family = "Main", cex = .75, col = "black")
text(894, 252, "200", family = "Main", cex = .75, col = "black")
text(920, 252, "199", family = "Main", cex = .75, col = "black")
text(894, 285, "196", family = "Main", cex = .75, col = "black")
text(920, 285, "195", family = "Main", cex = .75, col = "black")
text(894, 320, "192", family = "Main", cex = .75, col = "black")
text(920, 320, "191", family = "Main", cex = .75, col = "black")
text(894, 360, "188", family = "Main", cex = .75, col = "black")
text(920, 360, "187", family = "Main", cex = .75, col = "black")
text(894, 390, "184", family = "Main", cex = .75, col = "black")
text(920, 390, "183", family = "Main", cex = .75, col = "black")
text(894, 425, "180", family = "Main", cex = .75, col = "black")
text(920, 425, "179", family = "Main", cex = .75, col = "black")
text(894, 457, "176", family = "Main", cex = .75, col = "black")
text(920, 457, "175", family = "Main", cex = .75, col = "black")
text(894, 490, "172", family = "Main", cex = .75, col = "black")
text(920, 490, "171", family = "Main", cex = .75, col = "black")
text(920, 510, "169", family = "Main", cex = .75, col = "black")
text(920, 528, "167", family = "Main", cex = .75, col = "black")
text(894, 540, "166", family = "Main", cex = .75, col = "black")
text(894, 560, "164", family = "Main", cex = .75, col = "black")
text(920, 560, "163", family = "Main", cex = .75, col = "black")
text(920, 593, "159", family = "Main", cex = .75, col = "black")

text(894, 663, "154", family = "Main", cex = .75, col = "black")
text(920, 663, "153", family = "Main", cex = .75, col = "black")
text(920, 685, "151", family = "Main", cex = .75, col = "black")
text(894, 695, "150", family = "Main", cex = .75, col = "black")
text(920, 716, "147", family = "Main", cex = .75, col = "black")
text(894, 726, "146", family = "Main", cex = .75, col = "black")
text(920, 745, "143", family = "Main", cex = .75, col = "black")
text(894, 775, "140", family = "Main", cex = .75, col = "black")
text(920, 775, "139", family = "Main", cex = .75, col = "black")
text(894, 805, "136", family = "Main", cex = .75, col = "black")
text(920, 805, "135", family = "Main", cex = .75, col = "black")
text(905, 830, "ST.", family = "Text", cex = 1.5, col = "black", srt = 270)

text(1107, 83, "EWING", family = "Text", cex = 1.5, col = "black", srt = 270)
text(1099, 130, "206", family = "Main", cex = .75, col = "black")
text(1099, 142, "204", family = "Main", cex = .75, col = "black")
text(1116, 142, "203", family = "Main", cex = .75, col = "black")
text(1116, 177, "199", family = "Main", cex = .75, col = "black")
text(1099, 188, "198", family = "Main", cex = .75, col = "black")
text(1099, 210, "196", family = "Main", cex = .75, col = "black")
text(1116, 210, "195", family = "Main", cex = .75, col = "black")
text(1099, 243, "192", family = "Main", cex = .75, col = "black")
text(1099, 275, "188", family = "Main", cex = .75, col = "black")
text(1116, 285, "181", family = "Main", cex = .75, col = "black")
text(1099, 310, "184", family = "Main", cex = .75, col = "black")
text(1116, 330, "177", family = "Main", cex = .75, col = "black")
text(1116, 355, "175", family = "Main", cex = .75, col = "black")
text(1099, 375, "174", family = "Main", cex = .75, col = "black")
text(1099, 395, "172", family = "Main", cex = .75, col = "black")
text(1116, 397, "171", family = "Main", cex = .75, col = "black")
text(1099, 425, "168", family = "Main", cex = .75, col = "black")
text(1116, 427, "167", family = "Main", cex = .75, col = "black")
text(1099, 458, "164", family = "Main", cex = .75, col = "black")
text(1116, 460, "163", family = "Main", cex = .75, col = "black")
text(1099, 490, "160", family = "Main", cex = .75, col = "black")
text(1116, 492, "159", family = "Main", cex = .75, col = "black")
text(1099, 523, "156", family = "Main", cex = .75, col = "black")
text(1116, 525, "155", family = "Main", cex = .75, col = "black")
text(1099, 553, "152", family = "Main", cex = .75, col = "black")
text(1116, 555, "151", family = "Main", cex = .75, col = "black")

text(1116, 630, "145", family = "Main", cex = .75, col = "black")
text(1116, 665, "139", family = "Main", cex = .75, col = "black")
text(1099, 685, "138", family = "Main", cex = .75, col = "black")
text(1116, 695, "135", family = "Main", cex = .75, col = "black")
text(1099, 715, "134", family = "Main", cex = .75, col = "black")
text(1116, 725, "131", family = "Main", cex = .75, col = "black")
text(1099, 745, "130", family = "Main", cex = .75, col = "black")
text(1116, 757, "127", family = "Main", cex = .75, col = "black")
text(1116, 787, "123", family = "Main", cex = .75, col = "black")
text(1099, 850, "118", family = "Main", cex = .75, col = "black")
text(1107, 830, "ST.", family = "Text", cex = 1.5, col = "black", srt = 270)

text(175, 615, "S.DESPLAINES", family = "Text", cex = 1.5, col = "black")
text(320, 610, "449", family = "Main", cex = .75, col = "black", srt = 270)
text(352, 610, "445", family = "Main", cex = .75, col = "black", srt = 270)
text(383, 610, "441", family = "Main", cex = .75, col = "black", srt = 270)
text(815, 610, "397", family = "Main", cex = .75, col = "black", srt = 270)
text(845, 610, "393", family = "Main", cex = .75, col = "black", srt = 270)
text(865, 620, "390", family = "Main", cex = .75, col = "black", srt = 270)
text(875, 610, "389", family = "Main", cex = .75, col = "black", srt = 270)
text(990, 610, "379", family = "Main", cex = .75, col = "black", srt = 270)
text(1005, 620, "378", family = "Main", cex = .75, col = "black", srt = 270)
text(1015, 610, "377", family = "Main", cex = .75, col = "black", srt = 270)
text(1035, 620, "374", family = "Main", cex = .75, col = "black", srt = 270)
text(1050, 610, "371", family = "Main", cex = .75, col = "black", srt = 270)
text(1064, 620, "370", family = "Main", cex = .75, col = "black", srt = 270)
text(1083, 620, "368", family = "Main", cex = .75, col = "black", srt = 270)
text(1130, 610, "365", family = "Main", cex = .75, col = "black", srt = 270)
text(1155, 620, "362", family = "Main", cex = .75, col = "black", srt = 270)
text(1170, 610, "361", family = "Main", cex = .75, col = "black", srt = 270)
text(1195, 620, "356", family = "Main", cex = .75, col = "black", srt = 270)
text(1210, 610, "355", family = "Main", cex = .75, col = "black", srt = 270)
text(1225, 620, "352", family = "Main", cex = .75, col = "black", srt = 270)

#Bottom Key

polygon(c(235, 270, 270, 235), c(885, 885, 915, 915), border = "black", col = "black")
text(252, 925, expression("$5"^"00"*"AND LESS"), family = "Text", cex = .75, col = "black")
segments(x0=90, x1=270, y0=885, y1=885, lwd = 1, lty = "solid")

polygon(c(440, 475, 475, 440), c(885, 885, 915, 915), border = "#1f5c87", col = "#1f5c87")
text(457, 925, expression("$5"^"00"*"TO $10"^"00"), family = "Text", cex = .75, col = "black")
segments(x0=315, x1=475, y0=885, y1=885, lwd = 1, lty = "solid")

polygon(c(650, 685, 685, 650), c(885, 885, 915, 915), border = "#c05a50", col = "#c05a50")
text(667, 925, expression("$10"^"00"*"TO $15"^"00"), family = "Text", cex = .75, col = "black")
segments(x0=515, x1=685, y0=885, y1=885, lwd = 1, lty = "solid")

polygon(c(765, 730, 730, 765), c(885, 885, 915, 915), border = "#77997e", col = "#77997e")
text(747, 925, expression("$15"^"00"*"TO $20"^"00"), family = "Text", cex = .75, col = "black")
segments(x0=730, x1=885, y0=885, y1=885, lwd = 1, lty = "solid")

polygon(c(935, 970, 970, 935), c(885, 885, 915, 915), border = "#e8c55c", col = "#e8c55c")
text(952, 925, expression("OVER $20"^"00"), family = "Text", cex = .75, col = "black")
segments(x0=935, x1=1090, y0=885, y1=885, lwd = 1, lty = "solid")

polygon(c(1135, 1100, 1100, 1135), c(885, 885, 915, 915), border = "#996f72", col = "#996f72")
text(1117, 925, "UNKNOWN", family = "Text", cex = .75, col = "black")
segments(x0=1135, x1=1290, y0=885, y1=885, lwd = 1, lty = "solid")

dev.off()

image_write(fig01, path = here::here("hull-house-map-combined", "01_full_unmasked.png"), format = "png")
