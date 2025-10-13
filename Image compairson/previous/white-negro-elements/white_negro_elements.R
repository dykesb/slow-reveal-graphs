#
# FILE:
#  white_negro_elements.R
#
# DESCRIPTION:
# This code is for the Growth Rate Increase by Element Graph from Dubois. The pngs show the graphs in various stages of slow reveal.  
# Most graph code was taken from Travis's work: https://github.com/ajstarks/dubois-data-portraits/tree/master/plate40   
# Source: https://www.loc.gov/resource/ppmsca.33902/
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC
# 1: FULLY CONCEALED GRAPHIC
# 2: REVEAL YEAR
# 3: REVEAL UNITS
# 4: REVEAL TAG
# 5: REVEAL LABEL
# 6: REVEAL SMALL LABELS2
# 7: REVEAL SMALL LABELS1
# 8: REVEAL TITLE1
# 9: REVEAL TITLE2
#
# AUTHORS:
#   Travis & Robert Bilyk (main code)
#   Ian Curtis (2023, code to save plots)


library(magick)


#### FIGURE 10: RECREATED GRAPHIC ####

original <- image_read(here::here("white-negro-elements", "original_image.png"))

image_write(original, path = here::here("white-negro-elements", "10_full_unmasked.png"), format = "png")


#### FIGURE 1: FULLY CONCEALED GRAPHIC ####

fig01 <- image_draw(original)

#title and subtitle
polygon(c(545, 150, 150, 545), c(80, 80, 120, 120), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(645, 50, 50, 645), c(70, 70, 10, 10), border = "#fbf3e3", col = "#fbf3e3")

#yaxis
polygon(c(10, 62, 62, 10), c(585, 585, 160, 160), border = "#fbf3e3", col = "#fbf3e3")

#xaxis
polygon(c(665, 50, 50, 665), c(595, 595, 610, 610), border = "#fbf3e3", col = "#fbf3e3")

#small figures
polygon(c(80, 300, 300, 80), c(280, 280, 340, 340), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=70,y0=333.5, x1=320, y1=333.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=70,y0=299.5, x1=320, y1=299.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=124.5,y0=275, x1=124.5, y1=340, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=182.5,y0=275, x1=182.5, y1=340, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=240.5,y0=275, x1=240.5, y1=340, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=298.5,y0=275, x1=298.5, y1=340, lwd = 1, lty = "solid", col = "#88847c")

#supression 
polygon(c(190, 170, 170, 190), c(515, 515, 375, 375), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=165,y0=402.5, x1=197, y1=402.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=165,y0=437.5, x1=197, y1=437.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=165,y0=471.5, x1=197, y1=471.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=165,y0=506, x1=197, y1=506, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=182.5,y0=365, x1=182.5, y1=520, lwd = 1, lty = "solid", col = "#88847c")

#european
polygon(c(410, 365, 365, 410), c(200, 200, 320, 320), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=415,y0=230, x1=360, y1=230, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=415,y0=264.5, x1=360, y1=264.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=415,y0=298.7, x1=360, y1=298.7, lwd = 1, lty = "solid", col = "#88847c")

#emancipation
polygon(c(490, 510, 510, 490), c(200, 200, 290, 290), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=520,y0=230, x1=485, y1=230, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=520,y0=264.5, x1=485, y1=264.5, lwd = 1, lty = "solid", col = "#88847c")

#green labels
polygon(c(80, 110, 110, 80), c(543, 543, 530, 530), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(145, 170, 170, 145), c(522, 522, 533, 533), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(220, 190, 190, 220), c(520, 520, 508, 508), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(260, 280, 280, 260), c(500, 500, 487, 487), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(340, 315, 315, 340), c(480, 480, 465, 465), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(395, 370, 370, 395), c(425, 425, 440, 440), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(455, 430, 430, 455), c(370, 370, 385, 385), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(515, 490, 490, 515), c(345, 345, 330, 330), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(570, 550, 550, 570), c(260, 260, 275, 275), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(630, 610, 610, 630), c(195, 195, 180, 180), border = "#fbf3e3", col = "#fbf3e3")

segments(x0=570,y0=264.5, x1=550, y1=264.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=480,y0=333.5, x1=515, y1=333.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=370,y0=436.6, x1=415, y1=436.6, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=345,y0=471.5, x1=315, y1=471.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=75,y0=540.5, x1=115, y1=540.5, lwd = 1, lty = "solid", col = "#88847c")

#red labels
polygon(c(80, 110, 110, 80), c(555, 555, 565, 565), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(145, 170, 170, 145), c(550, 550, 562, 562), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(220, 190, 190, 220), c(548, 548, 560, 560), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(260, 280, 280, 260), c(544, 544, 556, 556), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(340, 315, 315, 340), c(540, 540, 552, 552), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(395, 370, 370, 395), c(536, 536, 548, 548), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(455, 430, 430, 455), c(533, 533, 543, 543), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(515, 490, 490, 515), c(525, 525, 535, 535), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(570, 550, 550, 570), c(529, 529, 519, 519), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(630, 610, 610, 630), c(510, 510, 520, 520), border = "#fbf3e3", col = "#fbf3e3")

segments(x0=545,y0=540.5, x1=314, y1=540.5, lwd = 1, lty = "solid", col = "#88847c")

dev.off()

image_write(fig01, path = here::here("white-negro-elements", "01_full_masked.png"), format = "png")


#### FIGURE 2: REVEAL YEAR ####

fig02 <- image_draw(original)

#title and subtitle
polygon(c(545, 150, 150, 545), c(80, 80, 120, 120), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(645, 50, 50, 645), c(70, 70, 10, 10), border = "#fbf3e3", col = "#fbf3e3")

#yaxis
polygon(c(10, 62, 62, 10), c(585, 585, 160, 160), border = "#fbf3e3", col = "#fbf3e3")


#small figures
polygon(c(80, 300, 300, 80), c(280, 280, 340, 340), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=70,y0=333.5, x1=320, y1=333.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=70,y0=299.5, x1=320, y1=299.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=124.5,y0=275, x1=124.5, y1=340, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=182.5,y0=275, x1=182.5, y1=340, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=240.5,y0=275, x1=240.5, y1=340, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=298.5,y0=275, x1=298.5, y1=340, lwd = 1, lty = "solid", col = "#88847c")

#supression 
polygon(c(190, 170, 170, 190), c(515, 515, 375, 375), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=165,y0=402.5, x1=197, y1=402.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=165,y0=437.5, x1=197, y1=437.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=165,y0=471.5, x1=197, y1=471.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=165,y0=506, x1=197, y1=506, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=182.5,y0=365, x1=182.5, y1=520, lwd = 1, lty = "solid", col = "#88847c")

#european
polygon(c(410, 365, 365, 410), c(200, 200, 320, 320), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=415,y0=230, x1=360, y1=230, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=415,y0=264.5, x1=360, y1=264.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=415,y0=298.7, x1=360, y1=298.7, lwd = 1, lty = "solid", col = "#88847c")

#emancipation
polygon(c(490, 510, 510, 490), c(200, 200, 290, 290), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=520,y0=230, x1=485, y1=230, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=520,y0=264.5, x1=485, y1=264.5, lwd = 1, lty = "solid", col = "#88847c")

#green labels
polygon(c(80, 110, 110, 80), c(543, 543, 530, 530), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(145, 170, 170, 145), c(522, 522, 533, 533), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(220, 190, 190, 220), c(520, 520, 508, 508), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(260, 280, 280, 260), c(500, 500, 487, 487), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(340, 315, 315, 340), c(480, 480, 465, 465), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(395, 370, 370, 395), c(425, 425, 440, 440), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(455, 430, 430, 455), c(370, 370, 385, 385), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(515, 490, 490, 515), c(345, 345, 330, 330), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(570, 550, 550, 570), c(260, 260, 275, 275), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(630, 610, 610, 630), c(195, 195, 180, 180), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=570,y0=264.5, x1=550, y1=264.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=480,y0=333.5, x1=515, y1=333.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=370,y0=436.6, x1=415, y1=436.6, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=345,y0=471.5, x1=315, y1=471.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=75,y0=540.5, x1=115, y1=540.5, lwd = 1, lty = "solid", col = "#88847c")

#red labels
polygon(c(80, 110, 110, 80), c(555, 555, 565, 565), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(145, 170, 170, 145), c(550, 550, 562, 562), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(220, 190, 190, 220), c(548, 548, 560, 560), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(260, 280, 280, 260), c(544, 544, 556, 556), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(340, 315, 315, 340), c(540, 540, 552, 552), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(395, 370, 370, 395), c(536, 536, 548, 548), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(455, 430, 430, 455), c(533, 533, 543, 543), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(515, 490, 490, 515), c(525, 525, 535, 535), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(570, 550, 550, 570), c(529, 529, 519, 519), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(630, 610, 610, 630), c(510, 510, 520, 520), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=545,y0=540.5, x1=314, y1=540.5, lwd = 1, lty = "solid", col = "#88847c")

dev.off()

image_write(fig02, path = here::here("white-negro-elements", "02_xlabel_unmasked.png"), format = "png")


#### FIGURE 3: REVEAL TAG ####

fig03 <- image_draw(original)

#title and subtitle
polygon(c(645, 50, 50, 645), c(100, 100, 10, 10), border = "#fbf3e3", col = "#fbf3e3")

#yaxis
polygon(c(10, 62, 62, 10), c(585, 585, 160, 160), border = "#fbf3e3", col = "#fbf3e3")

#small figures
polygon(c(80, 300, 300, 80), c(280, 280, 340, 340), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=70,y0=333.5, x1=320, y1=333.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=70,y0=299.5, x1=320, y1=299.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=124.5,y0=275, x1=124.5, y1=340, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=182.5,y0=275, x1=182.5, y1=340, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=240.5,y0=275, x1=240.5, y1=340, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=298.5,y0=275, x1=298.5, y1=340, lwd = 1, lty = "solid", col = "#88847c")

#supression 
polygon(c(190, 170, 170, 190), c(515, 515, 375, 375), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=165,y0=402.5, x1=197, y1=402.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=165,y0=437.5, x1=197, y1=437.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=165,y0=471.5, x1=197, y1=471.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=165,y0=506, x1=197, y1=506, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=182.5,y0=365, x1=182.5, y1=520, lwd = 1, lty = "solid", col = "#88847c")

#european
polygon(c(410, 365, 365, 410), c(200, 200, 320, 320), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=415,y0=230, x1=360, y1=230, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=415,y0=264.5, x1=360, y1=264.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=415,y0=298.7, x1=360, y1=298.7, lwd = 1, lty = "solid", col = "#88847c")

#emancipation
polygon(c(490, 510, 510, 490), c(200, 200, 290, 290), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=520,y0=230, x1=485, y1=230, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=520,y0=264.5, x1=485, y1=264.5, lwd = 1, lty = "solid", col = "#88847c")

#green labels
polygon(c(80, 110, 110, 80), c(543, 543, 530, 530), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(145, 170, 170, 145), c(522, 522, 533, 533), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(220, 190, 190, 220), c(520, 520, 508, 508), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(260, 280, 280, 260), c(500, 500, 487, 487), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(340, 315, 315, 340), c(480, 480, 465, 465), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(395, 370, 370, 395), c(425, 425, 440, 440), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(455, 430, 430, 455), c(370, 370, 385, 385), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(515, 490, 490, 515), c(345, 345, 330, 330), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(570, 550, 550, 570), c(260, 260, 275, 275), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(630, 610, 610, 630), c(195, 195, 180, 180), border = "#fbf3e3", col = "#fbf3e3")

segments(x0=570,y0=264.5, x1=550, y1=264.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=480,y0=333.5, x1=515, y1=333.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=370,y0=436.6, x1=415, y1=436.6, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=345,y0=471.5, x1=315, y1=471.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=75,y0=540.5, x1=115, y1=540.5, lwd = 1, lty = "solid", col = "#88847c")

#red labels
polygon(c(80, 110, 110, 80), c(555, 555, 565, 565), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(145, 170, 170, 145), c(550, 550, 562, 562), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(220, 190, 190, 220), c(548, 548, 560, 560), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(260, 280, 280, 260), c(544, 544, 556, 556), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(340, 315, 315, 340), c(540, 540, 552, 552), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(395, 370, 370, 395), c(536, 536, 548, 548), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(455, 430, 430, 455), c(533, 533, 543, 543), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(515, 490, 490, 515), c(525, 525, 535, 535), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(570, 550, 550, 570), c(529, 529, 519, 519), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(630, 610, 610, 630), c(510, 510, 520, 520), border = "#fbf3e3", col = "#fbf3e3")

segments(x0=545,y0=540.5, x1=314, y1=540.5, lwd = 1, lty = "solid", col = "#88847c")

dev.off()

image_write(fig03, path = here::here("white-negro-elements", "03_tag_unmasked.png"), format = "png")


#### FIGURE 4: REVEAL UNITS ####

fig04 <- image_draw(original)

#title and subtitle
polygon(c(645, 50, 50, 645), c(100, 100, 10, 10), border = "#fbf3e3", col = "#fbf3e3")

#small figures
polygon(c(80, 300, 300, 80), c(280, 280, 340, 340), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=70,y0=333.5, x1=320, y1=333.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=70,y0=299.5, x1=320, y1=299.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=124.5,y0=275, x1=124.5, y1=340, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=182.5,y0=275, x1=182.5, y1=340, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=240.5,y0=275, x1=240.5, y1=340, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=298.5,y0=275, x1=298.5, y1=340, lwd = 1, lty = "solid", col = "#88847c")

#supression 
polygon(c(190, 170, 170, 190), c(515, 515, 375, 375), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=165,y0=402.5, x1=197, y1=402.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=165,y0=437.5, x1=197, y1=437.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=165,y0=471.5, x1=197, y1=471.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=165,y0=506, x1=197, y1=506, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=182.5,y0=365, x1=182.5, y1=520, lwd = 1, lty = "solid", col = "#88847c")

#european
polygon(c(410, 365, 365, 410), c(200, 200, 320, 320), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=415,y0=230, x1=360, y1=230, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=415,y0=264.5, x1=360, y1=264.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=415,y0=298.7, x1=360, y1=298.7, lwd = 1, lty = "solid", col = "#88847c")

#emancipation
polygon(c(490, 510, 510, 490), c(200, 200, 290, 290), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=520,y0=230, x1=485, y1=230, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=520,y0=264.5, x1=485, y1=264.5, lwd = 1, lty = "solid", col = "#88847c")

#green labels
polygon(c(80, 110, 110, 80), c(543, 543, 530, 530), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(145, 170, 170, 145), c(522, 522, 533, 533), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(220, 190, 190, 220), c(520, 520, 508, 508), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(260, 280, 280, 260), c(500, 500, 487, 487), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(340, 315, 315, 340), c(480, 480, 465, 465), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(395, 370, 370, 395), c(425, 425, 440, 440), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(455, 430, 430, 455), c(370, 370, 385, 385), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(515, 490, 490, 515), c(345, 345, 330, 330), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(570, 550, 550, 570), c(260, 260, 275, 275), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(630, 610, 610, 630), c(195, 195, 180, 180), border = "#fbf3e3", col = "#fbf3e3")

segments(x0=570,y0=264.5, x1=550, y1=264.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=480,y0=333.5, x1=515, y1=333.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=370,y0=436.6, x1=415, y1=436.6, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=345,y0=471.5, x1=315, y1=471.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=75,y0=540.5, x1=115, y1=540.5, lwd = 1, lty = "solid", col = "#88847c")

#red labels
polygon(c(80, 110, 110, 80), c(555, 555, 565, 565), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(145, 170, 170, 145), c(550, 550, 562, 562), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(220, 190, 190, 220), c(548, 548, 560, 560), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(260, 280, 280, 260), c(544, 544, 556, 556), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(340, 315, 315, 340), c(540, 540, 552, 552), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(395, 370, 370, 395), c(536, 536, 548, 548), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(455, 430, 430, 455), c(533, 533, 543, 543), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(515, 490, 490, 515), c(525, 525, 535, 535), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(570, 550, 550, 570), c(529, 529, 519, 519), border = "#fbf3e3", col = "#fbf3e3")
polygon(c(630, 610, 610, 630), c(510, 510, 520, 520), border = "#fbf3e3", col = "#fbf3e3")

segments(x0=545,y0=540.5, x1=314, y1=540.5, lwd = 1, lty = "solid", col = "#88847c")

dev.off()

image_write(fig04, path = here::here("white-negro-elements", "04_ylabel_unmasked.png"), format = "png")


#### FIGURE 5: REVEAL LABEL ####

fig05 <- image_draw(original)

#title and subtitle
polygon(c(645, 50, 50, 645), c(100, 100, 10, 10), border = "#fbf3e3", col = "#fbf3e3")

#small figures
polygon(c(80, 300, 300, 80), c(280, 280, 340, 340), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=70,y0=333.5, x1=320, y1=333.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=70,y0=299.5, x1=320, y1=299.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=124.5,y0=275, x1=124.5, y1=340, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=182.5,y0=275, x1=182.5, y1=340, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=240.5,y0=275, x1=240.5, y1=340, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=298.5,y0=275, x1=298.5, y1=340, lwd = 1, lty = "solid", col = "#88847c")

#supression 
polygon(c(190, 170, 170, 190), c(515, 515, 375, 375), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=165,y0=402.5, x1=197, y1=402.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=165,y0=437.5, x1=197, y1=437.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=165,y0=471.5, x1=197, y1=471.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=165,y0=506, x1=197, y1=506, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=182.5,y0=365, x1=182.5, y1=520, lwd = 1, lty = "solid", col = "#88847c")

#european
polygon(c(410, 365, 365, 410), c(200, 200, 320, 320), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=415,y0=230, x1=360, y1=230, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=415,y0=264.5, x1=360, y1=264.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=415,y0=298.7, x1=360, y1=298.7, lwd = 1, lty = "solid", col = "#88847c")

#emancipation
polygon(c(490, 510, 510, 490), c(200, 200, 290, 290), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=520,y0=230, x1=485, y1=230, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=520,y0=264.5, x1=485, y1=264.5, lwd = 1, lty = "solid", col = "#88847c")

dev.off()

image_write(fig05, path = here::here("white-negro-elements", "05_linelabels_unmasked.png"), format = "png")


#### 6: REVEAL SMALL FIGURES1 ####

fig06 <- image_draw(original)

#title and subtitle
polygon(c(645, 50, 50, 645), c(100, 100, 10, 10), border = "#fbf3e3", col = "#fbf3e3")

#supression 
polygon(c(190, 170, 170, 190), c(515, 515, 375, 375), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=165,y0=402.5, x1=197, y1=402.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=165,y0=437.5, x1=197, y1=437.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=165,y0=471.5, x1=197, y1=471.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=165,y0=506, x1=197, y1=506, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=182.5,y0=365, x1=182.5, y1=520, lwd = 1, lty = "solid", col = "#88847c")

#european
polygon(c(410, 365, 365, 410), c(200, 200, 320, 320), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=415,y0=230, x1=360, y1=230, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=415,y0=264.5, x1=360, y1=264.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=415,y0=298.7, x1=360, y1=298.7, lwd = 1, lty = "solid", col = "#88847c")

#emancipation
polygon(c(490, 510, 510, 490), c(200, 200, 290, 290), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=520,y0=230, x1=485, y1=230, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=520,y0=264.5, x1=485, y1=264.5, lwd = 1, lty = "solid", col = "#88847c")

dev.off()

image_write(fig06, path = here::here("white-negro-elements", "06_plotlabel1_unmasked.png"), format = "png")


#### 7: REVEAL SMALL FIGURES2 ####

fig07 <- image_draw(original)

#title and subtitle
polygon(c(645, 50, 50, 645), c(100, 100, 10, 10), border = "#fbf3e3", col = "#fbf3e3")

#european
polygon(c(410, 365, 365, 410), c(200, 200, 320, 320), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=415,y0=230, x1=360, y1=230, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=415,y0=264.5, x1=360, y1=264.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=415,y0=298.7, x1=360, y1=298.7, lwd = 1, lty = "solid", col = "#88847c")

#emancipation
polygon(c(490, 510, 510, 490), c(200, 200, 290, 290), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=520,y0=230, x1=485, y1=230, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=520,y0=264.5, x1=485, y1=264.5, lwd = 1, lty = "solid", col = "#88847c")

dev.off()

image_write(fig07, path = here::here("white-negro-elements", "07_plotlabel2_unmasked.png"), format = "png")


#### FIGURE 8: REVEAL TITLE1 ####
fig08 <- image_draw(original)

#european
polygon(c(410, 365, 365, 410), c(200, 200, 320, 320), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=415,y0=230, x1=360, y1=230, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=415,y0=264.5, x1=360, y1=264.5, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=415,y0=298.7, x1=360, y1=298.7, lwd = 1, lty = "solid", col = "#88847c")

#emancipation
polygon(c(490, 510, 510, 490), c(200, 200, 290, 290), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=520,y0=230, x1=485, y1=230, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=520,y0=264.5, x1=485, y1=264.5, lwd = 1, lty = "solid", col = "#88847c")

dev.off()

image_write(fig08, path = here::here("white-negro-elements", "08_title_unmasked.png"), format = "png")


#### 9: REVEAL TITLE2 ####
fig09 <- image_draw(original)

#emancipation
polygon(c(490, 510, 510, 490), c(200, 200, 290, 290), border = "#fbf3e3", col = "#fbf3e3")
segments(x0=520,y0=230, x1=485, y1=230, lwd = 1, lty = "solid", col = "#88847c")
segments(x0=520,y0=264.5, x1=485, y1=264.5, lwd = 1, lty = "solid", col = "#88847c")

dev.off()

image_write(fig09, path = here::here("white-negro-elements", "09_plotlabel3_unmasked.png"), format = "png")





