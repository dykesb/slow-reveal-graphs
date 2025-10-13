#https://docs.google.com/presentation/d/1HQkkZU9aho9ZDgUHnCisjghexcrMFCvgtaFYevR1_9Q/edit#slide=id.g1f6c30b6369_0_118


#
# FILE:
# animal_domestication.R
#
# DESCRIPTION:
# This code is for the Domestication of Animals Graph from Visual Capitalist. The png's include  
# different graphs for the slow reveal.  
# Source: https://www.visualcapitalist.com/the-domestication-of-animals/
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC
# 1: FULLY CONCEALED GRAPHIC
# 2: REVEAL 15000
# 3: REVEAL MORE DATES
# 4: REVEAL CENTER
# 5: REVEAL MORE ANIMALS
# 6: REVEAL ICONS1
# 7: REVEAL ICONS2
# 8: REVEAL BOTTOM
#
# AUTHORS:
#   Robert Bilyk (main code)
# Ian Curtis (2023, code to save plots)


library(tidyverse)
library(ggpubr)
library(ggpol)
library(ggnewscale)
library(magick)
library(showtext)
library(grid)

font_add_google(name = "Roboto", regular.wt=700, family = "bold")
font_add_google(name = "Roboto", regular.wt=300, family = "skinny")
font_add_google(name = "PT Serif", regular.wt=700, family = "titles")
font_add_google(name = "PT Serif", regular.wt=400, family = "normal")

showtext_auto()


animals <- data.frame(dog = c(22000,1), sheep = c(11000, 11000), goat = c(10500,11500), pig_cow = c(10300,11700),
                      cat = c(9500,12500), zebu = c(8000,14000), llama =c(8000,20000), horse = c(7500,20000),
                      alpaca = c(7000,20000), b_camel = c(6500,20000), chicken = c(6000,20000), a_camel =c(4500,20000),
                      turkey = c(3000,20000), duck = c(1500,20000), blank = c(22000,1), type = c("yes", "no"))

#### Prepare temp files ####

graph <- ggplot(animals) + 
  
  geom_arcbar(aes(shares = blank, r0 = -9, r1 = -32, color = type, fill = type), sep=0) + 
  
  scale_fill_manual(values =c("white","white")) +
  scale_color_manual(values =c("white","white")) +
  new_scale_color() + 
  new_scale_fill() + 
  
  geom_arcbar(aes(shares = duck, r0 = -9.5, r1 = -10.5, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = turkey, r0 = -11, r1 = -12, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = a_camel, r0 = -12.5, r1 = -13.5, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = chicken, r0 = -14, r1 = -15, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = b_camel, r0 = -15.5, r1 = -16.5, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = alpaca, r0 = -17, r1 = -18, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = horse, r0 = -18.5, r1 = -19.5, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = llama, r0 = -20, r1 = -21, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = zebu, r0 = -21.5, r1 = -22.5, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = pig_cow, r0 = -24.5, r1 = -25.5, color = type, fill = type), sep=0) +
  geom_arcbar(aes(shares = pig_cow, r0 = -26, r1 = -27, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = goat, r0 = -27.5, r1 = -28.5, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = sheep, r0 = -29, r1 = -30, color = type, fill = type), sep=0) + 
  scale_fill_manual(values =c("white","#e85d41")) +
  scale_color_manual(values =c("white","#e85d41")) +
  new_scale_color() + 
  new_scale_fill() + 
  
  geom_arcbar(aes(shares = dog, r0 = -30.5, r1 = -31.5, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = cat, r0 = -23, r1 = -24, color = type, fill = type), sep=0) + 
  scale_fill_manual(values =c("white","#359dbc")) +
  scale_color_manual(values =c("white","#359dbc")) +
  new_scale_color() + 
  new_scale_fill() + 
  
  geom_arcbar(aes(shares = a_camel, r0 = -12.5, r1 = -13.5, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = b_camel, r0 = -15.5, r1 = -16.5, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = horse, r0 = -18.5, r1 = -19.5, color = type, fill = type), sep=0) + 
  scale_fill_manual(values =c("white","#dfcfb2")) +
  scale_color_manual(values =c("white","#dfcfb2"))+
  
  coord_flip() +
  theme(legend.position = "none",
        panel.grid = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        plot.background = element_rect(color="#f2ece7", fill="#f2ece7"),
        panel.background = element_rect(color="#f2ece7", fill="#f2ece7"))


graph1 <- ggplot(animals) + 
  
  geom_arcbar(aes(shares = blank, r0 = 0, r1 = -32, color = type, fill = type), sep=0) + 
  scale_fill_manual(values =c("white","white")) +
  scale_color_manual(values =c("white","white")) +
  new_scale_color() + 
  new_scale_fill() + 
  
  
  geom_arcbar(aes(shares = blank, r0 = -8.99, r1 = -9.01, color = type, fill = type), sep=0) +
  scale_fill_manual(values =c("black","black")) +
  scale_color_manual(values =c("black","black")) +
  new_scale_color() + 
  new_scale_fill() +
  
  geom_arcbar(aes(shares = duck, r0 = -9.5, r1 = -10.5, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = turkey, r0 = -11, r1 = -12, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = a_camel, r0 = -12.5, r1 = -13.5, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = chicken, r0 = -14, r1 = -15, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = b_camel, r0 = -15.5, r1 = -16.5, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = alpaca, r0 = -17, r1 = -18, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = horse, r0 = -18.5, r1 = -19.5, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = llama, r0 = -20, r1 = -21, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = zebu, r0 = -21.5, r1 = -22.5, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = pig_cow, r0 = -24.5, r1 = -25.5, color = type, fill = type), sep=0) +
  geom_arcbar(aes(shares = pig_cow, r0 = -26, r1 = -27, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = goat, r0 = -27.5, r1 = -28.5, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = sheep, r0 = -29, r1 = -30, color = type, fill = type), sep=0) + 
  scale_fill_manual(values =c("white","#e85d41")) +
  scale_color_manual(values =c("white","#e85d41")) +
  new_scale_color() + 
  new_scale_fill() + 
  
  geom_arcbar(aes(shares = dog, r0 = -30.5, r1 = -31.5, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = cat, r0 = -23, r1 = -24, color = type, fill = type), sep=0) + 
  scale_fill_manual(values =c("white","#359dbc")) +
  scale_color_manual(values =c("white","#359dbc")) +
  new_scale_color() + 
  new_scale_fill() + 
  
  geom_arcbar(aes(shares = a_camel, r0 = -12.5, r1 = -13.5, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = b_camel, r0 = -15.5, r1 = -16.5, color = type, fill = type), sep=0) + 
  geom_arcbar(aes(shares = horse, r0 = -18.5, r1 = -19.5, color = type, fill = type), sep=0) + 
  scale_fill_manual(values =c("white","#dfcfb2")) +
  scale_color_manual(values =c("white","#dfcfb2"))+
  
  coord_flip() +
  theme(legend.position = "none",
        panel.grid = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        plot.background = element_rect(color="#f2ece7", fill="#f2ece7"),
        panel.background = element_rect(color="#f2ece7", fill="#f2ece7"))

gap <- ggplot() + theme_void() + theme(plot.background = element_rect(fill="#f2ece7", color="#f2ece7"))


png(here::here("animal-domestication", "temp.png"),width=500,height=900)
ggarrange(gap, ggarrange(gap, graph, gap, ncol = 3, widths = c(.4, 1, .02)), gap, nrow = 3, heights = c(.15, 1, .3))
dev.off()

png(here::here("animal-domestication", "temp1.png"),width=500,height=900)
ggarrange(gap, ggarrange(gap, graph1, gap, ncol = 3, widths = c(.4, 1, .02)), gap, nrow = 3, heights = c(.15, 1, .3))
dev.off()

#### Read Images ####

original <- image_read(here::here("animal-domestication", "temp.png"))
original1 <- image_read(here::here("animal-domestication", "temp1.png"))
cat <- image_read(here::here("animal-domestication", "images", "cat.png"))
bottomrib <- image_read(here::here("animal-domestication", "images", "bottomribbon.png"))
camels <- image_read(here::here("animal-domestication", "images", "camels.png"))
center <- image_read(here::here("animal-domestication", "images", "centergroup.png"))
dna <- image_read(here::here("animal-domestication", "images", "dna.png"))
dogpaw <- image_read(here::here("animal-domestication", "images", "dogpaw.png"))
donkey <- image_read(here::here("animal-domestication", "images", "donkey.png"))
duck <- image_read(here::here("animal-domestication", "images", "duck.png"))
ducks <- image_read(here::here("animal-domestication", "images", "ducks.png"))
humandog <- image_read(here::here("animal-domestication", "images", "humandog.png"))
humanpigsheepgoat <- image_read(here::here("animal-domestication", "images", "humanpigsheepgoat.png"))
rduck <- image_read(here::here("animal-domestication", "images", "rduck.png"))
turkey <- image_read(here::here("animal-domestication", "images", "turkey.png"))
villagerduck <- image_read(here::here("animal-domestication", "images", "villagerduck.png"))
zebu <- image_read(here::here("animal-domestication", "images", "zebu.png"))
box <- image_read(here::here("animal-domestication", "images", "box.png"))
icons <- image_read(here::here("animal-domestication", "images", "icons.png"))
source <- image_read(here::here("animal-domestication", "images", "source.png"))


#### FIGURE 9: RECREATED GRAPHIC ####

fig09 <- image_draw(original)

segments(x0=473,y0=325, x1=473, y1=125, lwd = 1, lty = "solid")
segments(x0=473,y0=30, x1=473, y1=125, lwd = 1, lty = "solid", col="#359dbc")

segments(x0=461,y0=325, x1=431, y1=142, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=447,y0=327, x1=382, y1=152, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=433,y0=332, x1=337, y1=168, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=423,y0=339, x1=297, y1=191, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=412,y0=346, x1=269, y1=213, lwd = 1, lty = "solid")
segments(x0=262,y0=205, x1=259, y1=202, lwd = 1, lty = "solid")

segments(x0=405,y0=354, x1=242, y1=238, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=397,y0=362, x1=222, y1=264, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=393,y0=371, x1=205, y1=294, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=389,y0=381, x1=193, y1=325, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=386,y0=392, x1=183, y1=360, lwd = 1, lty = "solid")
segments(x0=172,y0=357, x1=168, y1=356, lwd = 1, lty = "solid")

segments(x0=179,y0=402, x1=385, y1=402, lwd = 1, lty = "solid", col="#b6b1ad") #hori
segments(x0=193,y0=402, x1=179, y1=402, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=168,y0=402, x1=164, y1=402, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=402, x1=164, y1=402, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=387,y0=414, x1=239, y1=429, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=208,y0=420, x1=179, y1=417, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=168,y0=418, x1=163, y1=418, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=418, x1=163, y1=418, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=389,y0=424, x1=260, y1=454, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=237,y0=423, x1=181, y1=426, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=169,y0=427, x1=164, y1=427, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=427, x1=164, y1=427, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=283,y0=479, x1=392, y1=431, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=243,y0=447, x1=256, y1=444, lwd = 1, lty = "solid", col="#359dbc")
segments(x0=171,y0=461, x1=189, y1=458, lwd = 1, lty = "solid", col="#359dbc")
segments(x0=0,y0=461, x1=171, y1=461, lwd = 1, lty = "solid", col="#359dbc")

segments(x0=296,y0=498, x1=397, y1=440, lwd = 1, lty = "solid")

segments(x0=322,y0=508, x1=401, y1=447, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=283,y0=479, x1=272, y1=484, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=206,y0=512, x1=261, y1=488, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=197,y0=519, x1=194, y1=520, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=520, x1=194, y1=520, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=353,y0=502, x1=406, y1=452, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=322,y0=508, x1=300, y1=525, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=290,y0=530, x1=243, y1=564, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=232,y0=569, x1=227, y1=572, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=572, x1=227, y1=572, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=383,y0=492, x1=411, y1=456, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=337,y0=506, x1=327, y1=514, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=243,y0=581, x1=240, y1=583, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=0,y0=583, x1=240, y1=583, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=353,y0=502, x1=344, y1=511, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=335,y0=519, x1=312, y1=537, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=303,y0=544, x1=261, y1=584, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=252,y0=590, x1=249, y1=592, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=592, x1=249, y1=592, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=368,y0=497, x1=359, y1=506, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=258,y0=595, x1=246, y1=606, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=0,y0=606, x1=246, y1=606, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=383,y0=492, x1=373, y1=501, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=365,y0=508, x1=354, y1=519, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=345,y0=527, x1=322, y1=546, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=313,y0=553, x1=271, y1=593, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=263,y0=599, x1=238, y1=619, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=619, x1=238, y1=619, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=346,y0=650, x1=339, y1=664, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=0,y0=664, x1=339, y1=664, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=430,y0=489, x1=425, y1=500, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=422,y0=510, x1=416, y1=525, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=413,y0=535, x1=407, y1=549, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=402,y0=559, x1=392, y1=585, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=388,y0=595, x1=367, y1=646, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=363,y0=656, x1=354, y1=677, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=677, x1=354, y1=677, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=452,y0=482, x1=447, y1=506, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=443,y0=516, x1=440, y1=531, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=438,y0=542, x1=433, y1=556, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=430,y0=567, x1=423, y1=594, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=418,y0=604, x1=404, y1=656, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=401,y0=667, x1=393, y1=705, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=705, x1=393, y1=705, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=406,y0=492, x1=420, y1=463, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=430,y0=489, x1=437, y1=472, lwd = 1, lty = "solid")

segments(x0=452,y0=482, x1=454, y1=477, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=473,y0=479, x1=473, y1=677, lwd = 1, lty = "solid")

segments(x0=283,y0=504, x1=286, y1=502, lwd = 1, lty = "solid")
segments(x0=273,y0=509, x1=221, y1=537, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=211,y0=541, x1=207, y1=543, lwd = 1, lty = "solid")

text(427, 138, "13,000-34,000 BCE", family="bold", cex = .75, srt=7, col = "black")
text(189, 424, "9,000 BCE", family="bold", cex = .75, srt=275, col = "black")
text(206, 441, "8,500 BCE", family="bold", cex = .75, srt=282, col = "black")
text(223, 448, "8,300 BCE", family="bold", cex = .75, srt=284, col = "black")
text(237, 447, "8,300 BCE", family="bold", cex = .75, srt=285, col = "black")
text(258, 469, "7,500 BCE", family="bold", cex = .75, srt=290, col = "black")
text(290, 500, "6,000 BCE", family="bold", cex = .75, srt=301, col = "black")
text(332, 527, "4,000 BCE", family="bold", cex = .75, srt=317, col = "black")
text(351, 525, "3,500 BCE", family="bold", cex = .75, srt=319, col = "black")
text(368, 520, "3,000 BCE", family="bold", cex = .75, srt=323, col = "black")
text(383, 514, "2,500 BCE", family="bold", cex = .75, srt=325, col = "black")
text(399, 509, "2,000 BCE", family="bold", cex = .75, srt=329, col = "black")
text(422, 505, "1,000 BCE", family="bold", cex = .75, srt=340, col = "black")
text(438, 496, "0 CE", family="bold", cex = .75, srt=348, col = "black")
text(462, 488, "1,000", family="bold", cex = .75, srt=355, col = "black")

text(180, 40, "Domestication", family="titles", cex = 4, col = "black")
text(137, 85, "of Animals", family="titles", cex = 4, col = "black")
text(88, 119, "A BRIEF TIMELINE", family="skinny", cex = 1.5, col = "black")
text(142, 140, "Humans have domesticated animals for materials,", family="titles", cex = .9, col = "black")
text(136, 150, "work, and companionship all around the world.", family="titles", cex = .9, col = "black")

text(107, 170, "When did each animal get domesticated?", family="titles", cex = .8, col = "black")
text(107, 180, "Though exact dating is tricky and ongoing, this", family="normal", cex = .75, col = "black")
text(108, 190, "timeline highlights the domestication period of", family="normal", cex = .75, col = "black")
text(106, 200, "some animals based on arcaeological findings.", family="normal", cex = .75, col = "black")

text(92, 220, "Domesticated animals fall into roughly", family="normal", cex = .75, col = "black")
text(92, 230, "three categories [though many animals", family="normal", cex = .75, col = "black")
text(55, 240, "fall under multiple]:", family="normal", cex = .75, col = "black")

text(240, 185, "15,000 BCE", family="skinny", cex = .7, srt=315, col = "black")
text(145, 350, "10,000 BCE", family="skinny", cex = .7, srt=350, col = "black")
text(185, 552, "5,000 BCE", family="skinny", cex = .7, srt=20, col = "black")
text(473, 464, "2022 CE", family="skinny", cex = .6, srt=90, col = "black")
text(473, 348, "20,000 BCE", family="skinny", cex = .6, srt=270, col = "black")
text(442, 463, "0 CE", family="skinny", cex = .6, srt=65, col = "black")

text(435, 34, "13,000-34,000 BCE", family="skinny", cex = .7, col = "black")
text(461, 42, "Dog", family="bold", cex = .75, col = "black")

text(135, 390, "Sheep", family="bold", cex = .75, col = "black")
text(133, 398, "9,000 BCE", family="skinny", cex = .65, col = "black")

text(109, 412, "Goat", family="bold", cex = .75, col = "black")
text(138, 413, "8,500 BCE", family="skinny", cex = .65, col = "black")

text(98, 422.5, "Pig & Cow", family="bold", cex = .75, col = "black")
text(138, 422.5, "8,300 BCE", family="skinny", cex = .65, col = "black")

text(110, 456, "Cat", family="bold", cex = .75, col = "black")
text(138, 456, "7,500 BCE", family="skinny", cex = .65, col = "black")

text(140, 515, "Zebu (Humped Cow)", family="bold", cex = .75, col = "black")
text(163, 507, "6,000 BCE", family="skinny", cex = .65, col = "black")

text(150, 567, "Llama", family="bold", cex = .75, col = "black")
text(183, 567, "4,000 BCE", family="skinny", cex = .65, col = "black")

text(150, 579, "Horse", family="bold", cex = .75, col = "black")
text(183, 579, "3,500 BCE", family="skinny", cex = .65, col = "black")

text(150, 589, "Alpaca", family="bold", cex = .75, col = "black")
text(183, 589, "3,000 BCE", family="skinny", cex = .65, col = "black")

text(150, 602, "Bactrian Camel (two-humped)", family="bold", cex = .75, col = "black")
text(230, 602, "2,500 BCE", family="skinny", cex = .65, col = "black")

text(180, 615, "Chicken", family="bold", cex = .75, col = "black")
text(220, 615, "2,000 BCE", family="skinny", cex = .65, col = "black")

text(160, 659, "Arabian Camel (one-humped)", family="bold", cex = .75, col = "black")
text(240, 659, "1,000 BCE", family="skinny", cex = .65, col = "black")

text(205, 672, "Turkey", family="bold", cex = .75, col = "black")
text(250, 672, "0 CE", family="skinny", cex = .65, col = "black")

text(209, 700, "Duck", family="bold", cex = .75, col = "black")
text(244, 700, "1,000 CE", family="skinny", cex = .65, col = "black")

text(81, 755, "Though this timeline uses", family="skinny", cex = .6, col = "black")
text(85, 762, "archaeological findings as a", family="skinny", cex = .6, col = "black")
text(87, 769, "base, genomic sequencing is", family="skinny", cex = .6, col = "black")
text(82, 776, "also used to narrow down", family="skinny", cex = .6, col = "black")
text(89, 783, "domestication event timelines.", family="skinny", cex = .6, col = "black")

text(84, 800, "Domestication is still being", family="skinny", cex = .6, col = "black")
text(75, 807, "researched, with new", family="skinny", cex = .6, col = "black")
text(86, 814, "archaeological and genomic", family="skinny", cex = .6, col = "black")
text(77, 821, "discoveries constantly", family="skinny", cex = .6, col = "black")
text(74, 828, "shaking up timelines.", family="skinny", cex = .6, col = "black")

text(230, 755, "Many other animals have been", family="skinny", cex = .6, col = "black")
text(235, 763, "domesticated that aren't included", family="skinny", cex = .6, col = "black")
text(234, 773, "in this timeline, such as donkeys,", family="skinny", cex = .6, col = "black")
text(224, 781, "pigeons, rats, and goldfish.", family="skinny", cex = .6, col = "black")

text(370, 755, "Domesticated timeline", family="skinny", cex = .6, col = "black")
text(380, 763, "estimates vary by thousands", family="skinny", cex = .6, col = "black")
text(380, 771, "of years. The domestic duck,", family="skinny", cex = .6, col = "black")
text(382, 778, "for example, is also thought to", family="skinny", cex = .6, col = "black")
text(383, 785, "have been domesticated more", family="skinny", cex = .6, col = "black")
text(382, 793, "than 4,000 years ago from the", family="skinny", cex = .6, col = "black")
text(376, 801, "mallard in Southeast Asia.", family="skinny", cex = .6, col = "black")

grid.raster(icons, .16, .67, height = .1)
grid.raster(cat, .165, .505, height = .064)
grid.raster(humandog, .9, .9, height = .11)
grid.raster(humanpigsheepgoat, .09, .575, height = .11)
grid.raster(zebu, .1, .455, height = .075)
grid.raster(camels, .1, .358, height = .15)
grid.raster(turkey, .15, .27, height = .06)
grid.raster(duck, .25, .23, height = .04)

grid.raster(dna, .11, .19, height = .035)
grid.raster(dogpaw, .39, .19, height = .035)
grid.raster(rduck, .7, .19, height = .035)



grid.raster(donkey, .495, .085, height = .075)
grid.raster(ducks, .69, .075, height = .04)
grid.raster(villagerduck, .95, .105, height = .1)

segments(x0=8,y0=850, x1=490, y1=850, lwd = 1, lty = "solid", col="#b6b1ad")

grid.raster(box, .7, .67, height = .2)
grid.raster(center, .9, .55, height = .11)
grid.raster(bottomrib, .5, .025, height = .05)
grid.raster(source, .89, .23, height = .015)

dev.off()

image_write(fig09, path = here::here("animal-domestication", "09_full_unmasked.png"), format = "png")


#### FIGURE 1: FULLY CONCEALED GRAPHIC ####

fig01 <- image_draw(original1)

segments(x0=473,y0=325, x1=473, y1=125, lwd = 1, lty = "solid")

segments(x0=461,y0=325, x1=431, y1=142, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=447,y0=327, x1=382, y1=152, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=433,y0=332, x1=337, y1=168, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=423,y0=339, x1=297, y1=191, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=412,y0=346, x1=269, y1=213, lwd = 1, lty = "solid")
segments(x0=262,y0=205, x1=259, y1=202, lwd = 1, lty = "solid")

segments(x0=405,y0=354, x1=242, y1=238, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=397,y0=362, x1=222, y1=264, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=393,y0=371, x1=205, y1=294, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=389,y0=381, x1=193, y1=325, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=386,y0=392, x1=183, y1=360, lwd = 1, lty = "solid")
segments(x0=172,y0=357, x1=168, y1=356, lwd = 1, lty = "solid")

segments(x0=179,y0=402, x1=385, y1=402, lwd = 1, lty = "solid", col="#b6b1ad") #hori
segments(x0=193,y0=402, x1=179, y1=402, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=168,y0=402, x1=164, y1=402, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=387,y0=414, x1=239, y1=429, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=208,y0=420, x1=179, y1=417, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=168,y0=418, x1=163, y1=418, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=389,y0=424, x1=260, y1=454, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=237,y0=423, x1=181, y1=426, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=169,y0=427, x1=164, y1=427, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=283,y0=479, x1=392, y1=431, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=243,y0=447, x1=256, y1=444, lwd = 1, lty = "solid", col="#359dbc")
segments(x0=171,y0=461, x1=189, y1=458, lwd = 1, lty = "solid", col="#359dbc")

segments(x0=296,y0=498, x1=397, y1=440, lwd = 1, lty = "solid")

segments(x0=322,y0=508, x1=401, y1=447, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=283,y0=479, x1=272, y1=484, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=206,y0=512, x1=261, y1=488, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=197,y0=519, x1=194, y1=520, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=353,y0=502, x1=406, y1=452, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=322,y0=508, x1=300, y1=525, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=290,y0=530, x1=243, y1=564, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=232,y0=569, x1=227, y1=572, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=383,y0=492, x1=411, y1=456, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=337,y0=506, x1=327, y1=514, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=243,y0=581, x1=240, y1=583, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=353,y0=502, x1=344, y1=511, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=335,y0=519, x1=312, y1=537, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=303,y0=544, x1=261, y1=584, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=252,y0=590, x1=249, y1=592, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=368,y0=497, x1=359, y1=506, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=383,y0=492, x1=373, y1=501, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=365,y0=508, x1=354, y1=519, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=345,y0=527, x1=322, y1=546, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=313,y0=553, x1=271, y1=593, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=430,y0=489, x1=425, y1=500, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=422,y0=510, x1=416, y1=525, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=413,y0=535, x1=407, y1=549, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=402,y0=559, x1=392, y1=585, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=388,y0=595, x1=367, y1=646, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=452,y0=482, x1=447, y1=506, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=443,y0=516, x1=440, y1=531, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=438,y0=542, x1=433, y1=556, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=430,y0=567, x1=423, y1=594, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=418,y0=604, x1=404, y1=656, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=406,y0=492, x1=420, y1=463, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=430,y0=489, x1=437, y1=472, lwd = 1, lty = "solid")

segments(x0=452,y0=482, x1=454, y1=477, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=473,y0=479, x1=473, y1=677, lwd = 1, lty = "solid")

segments(x0=283,y0=504, x1=286, y1=502, lwd = 1, lty = "solid")
segments(x0=273,y0=509, x1=221, y1=537, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=211,y0=541, x1=207, y1=543, lwd = 1, lty = "solid")

text(427, 138, "13,000-34,000 BCE", family="bold", cex = .75, srt=7, col = "black")
text(189, 424, "9,000 BCE", family="bold", cex = .75, srt=275, col = "black")
text(206, 441, "8,500 BCE", family="bold", cex = .75, srt=282, col = "black")
text(223, 448, "8,300 BCE", family="bold", cex = .75, srt=284, col = "black")
text(237, 447, "8,300 BCE", family="bold", cex = .75, srt=285, col = "black")
text(258, 469, "7,500 BCE", family="bold", cex = .75, srt=290, col = "black")
text(290, 500, "6,000 BCE", family="bold", cex = .75, srt=301, col = "black")
text(332, 527, "4,000 BCE", family="bold", cex = .75, srt=317, col = "black")
text(351, 525, "3,500 BCE", family="bold", cex = .75, srt=319, col = "black")
text(368, 520, "3,000 BCE", family="bold", cex = .75, srt=323, col = "black")
text(383, 514, "2,500 BCE", family="bold", cex = .75, srt=325, col = "black")
text(399, 509, "2,000 BCE", family="bold", cex = .75, srt=329, col = "black")
text(422, 505, "1,000 BCE", family="bold", cex = .75, srt=340, col = "black")
text(438, 496, "0 CE", family="bold", cex = .75, srt=348, col = "black")
text(462, 488, "1,000", family="bold", cex = .75, srt=355, col = "black")

dev.off()

image_write(fig01, path = here::here("animal-domestication", "01_full_masked.png"), format = "png")


#### 2: REVEAL 15000 ####

fig02 <- image_draw(original1)

segments(x0=473,y0=325, x1=473, y1=125, lwd = 1, lty = "solid")

segments(x0=461,y0=325, x1=431, y1=142, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=447,y0=327, x1=382, y1=152, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=433,y0=332, x1=337, y1=168, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=423,y0=339, x1=297, y1=191, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=412,y0=346, x1=269, y1=213, lwd = 1, lty = "solid")
segments(x0=262,y0=205, x1=259, y1=202, lwd = 1, lty = "solid")

segments(x0=405,y0=354, x1=242, y1=238, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=397,y0=362, x1=222, y1=264, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=393,y0=371, x1=205, y1=294, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=389,y0=381, x1=193, y1=325, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=386,y0=392, x1=183, y1=360, lwd = 1, lty = "solid")
segments(x0=172,y0=357, x1=168, y1=356, lwd = 1, lty = "solid")

segments(x0=179,y0=402, x1=385, y1=402, lwd = 1, lty = "solid", col="#b6b1ad") #hori
segments(x0=193,y0=402, x1=179, y1=402, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=168,y0=402, x1=164, y1=402, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=387,y0=414, x1=239, y1=429, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=208,y0=420, x1=179, y1=417, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=168,y0=418, x1=163, y1=418, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=389,y0=424, x1=260, y1=454, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=237,y0=423, x1=181, y1=426, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=169,y0=427, x1=164, y1=427, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=283,y0=479, x1=392, y1=431, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=243,y0=447, x1=256, y1=444, lwd = 1, lty = "solid", col="#359dbc")
segments(x0=171,y0=461, x1=189, y1=458, lwd = 1, lty = "solid", col="#359dbc")

segments(x0=296,y0=498, x1=397, y1=440, lwd = 1, lty = "solid")

segments(x0=322,y0=508, x1=401, y1=447, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=283,y0=479, x1=272, y1=484, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=206,y0=512, x1=261, y1=488, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=197,y0=519, x1=194, y1=520, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=353,y0=502, x1=406, y1=452, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=322,y0=508, x1=300, y1=525, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=290,y0=530, x1=243, y1=564, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=232,y0=569, x1=227, y1=572, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=383,y0=492, x1=411, y1=456, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=337,y0=506, x1=327, y1=514, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=243,y0=581, x1=240, y1=583, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=353,y0=502, x1=344, y1=511, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=335,y0=519, x1=312, y1=537, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=303,y0=544, x1=261, y1=584, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=252,y0=590, x1=249, y1=592, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=368,y0=497, x1=359, y1=506, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=383,y0=492, x1=373, y1=501, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=365,y0=508, x1=354, y1=519, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=345,y0=527, x1=322, y1=546, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=313,y0=553, x1=271, y1=593, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=430,y0=489, x1=425, y1=500, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=422,y0=510, x1=416, y1=525, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=413,y0=535, x1=407, y1=549, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=402,y0=559, x1=392, y1=585, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=388,y0=595, x1=367, y1=646, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=452,y0=482, x1=447, y1=506, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=443,y0=516, x1=440, y1=531, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=438,y0=542, x1=433, y1=556, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=430,y0=567, x1=423, y1=594, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=418,y0=604, x1=404, y1=656, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=406,y0=492, x1=420, y1=463, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=430,y0=489, x1=437, y1=472, lwd = 1, lty = "solid")

segments(x0=452,y0=482, x1=454, y1=477, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=473,y0=479, x1=473, y1=677, lwd = 1, lty = "solid")

segments(x0=283,y0=504, x1=286, y1=502, lwd = 1, lty = "solid")
segments(x0=273,y0=509, x1=221, y1=537, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=211,y0=541, x1=207, y1=543, lwd = 1, lty = "solid")

text(427, 138, "13,000-34,000 BCE", family="bold", cex = .75, srt=7, col = "black")
text(189, 424, "9,000 BCE", family="bold", cex = .75, srt=275, col = "black")
text(206, 441, "8,500 BCE", family="bold", cex = .75, srt=282, col = "black")
text(223, 448, "8,300 BCE", family="bold", cex = .75, srt=284, col = "black")
text(237, 447, "8,300 BCE", family="bold", cex = .75, srt=285, col = "black")
text(258, 469, "7,500 BCE", family="bold", cex = .75, srt=290, col = "black")
text(290, 500, "6,000 BCE", family="bold", cex = .75, srt=301, col = "black")
text(332, 527, "4,000 BCE", family="bold", cex = .75, srt=317, col = "black")
text(351, 525, "3,500 BCE", family="bold", cex = .75, srt=319, col = "black")
text(368, 520, "3,000 BCE", family="bold", cex = .75, srt=323, col = "black")
text(383, 514, "2,500 BCE", family="bold", cex = .75, srt=325, col = "black")
text(399, 509, "2,000 BCE", family="bold", cex = .75, srt=329, col = "black")
text(422, 505, "1,000 BCE", family="bold", cex = .75, srt=340, col = "black")
text(438, 496, "0 CE", family="bold", cex = .75, srt=348, col = "black")
text(462, 488, "1,000", family="bold", cex = .75, srt=355, col = "black")

text(240, 185, "15,000 BCE", family="skinny", cex = .7, srt=315, col = "black")

dev.off()

image_write(fig02, path = here::here("animal-domestication", "02_15000_unmasked.png"), format = "png")


#### 3:REVEAL MORE DATES ####

fig03 <- image_draw(original1)

segments(x0=473,y0=325, x1=473, y1=125, lwd = 1, lty = "solid")

segments(x0=461,y0=325, x1=431, y1=142, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=447,y0=327, x1=382, y1=152, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=433,y0=332, x1=337, y1=168, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=423,y0=339, x1=297, y1=191, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=412,y0=346, x1=269, y1=213, lwd = 1, lty = "solid")
segments(x0=262,y0=205, x1=259, y1=202, lwd = 1, lty = "solid")

segments(x0=405,y0=354, x1=242, y1=238, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=397,y0=362, x1=222, y1=264, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=393,y0=371, x1=205, y1=294, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=389,y0=381, x1=193, y1=325, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=386,y0=392, x1=183, y1=360, lwd = 1, lty = "solid")
segments(x0=172,y0=357, x1=168, y1=356, lwd = 1, lty = "solid")

segments(x0=179,y0=402, x1=385, y1=402, lwd = 1, lty = "solid", col="#b6b1ad") #hori
segments(x0=193,y0=402, x1=179, y1=402, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=168,y0=402, x1=164, y1=402, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=387,y0=414, x1=239, y1=429, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=208,y0=420, x1=179, y1=417, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=168,y0=418, x1=163, y1=418, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=389,y0=424, x1=260, y1=454, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=237,y0=423, x1=181, y1=426, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=169,y0=427, x1=164, y1=427, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=283,y0=479, x1=392, y1=431, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=243,y0=447, x1=256, y1=444, lwd = 1, lty = "solid", col="#359dbc")
segments(x0=171,y0=461, x1=189, y1=458, lwd = 1, lty = "solid", col="#359dbc")

segments(x0=296,y0=498, x1=397, y1=440, lwd = 1, lty = "solid")

segments(x0=322,y0=508, x1=401, y1=447, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=283,y0=479, x1=272, y1=484, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=206,y0=512, x1=261, y1=488, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=197,y0=519, x1=194, y1=520, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=353,y0=502, x1=406, y1=452, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=322,y0=508, x1=300, y1=525, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=290,y0=530, x1=243, y1=564, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=232,y0=569, x1=227, y1=572, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=165,y0=572, x1=227, y1=572, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=383,y0=492, x1=411, y1=456, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=337,y0=506, x1=327, y1=514, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=243,y0=581, x1=240, y1=583, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=165,y0=583, x1=240, y1=583, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=353,y0=502, x1=344, y1=511, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=335,y0=519, x1=312, y1=537, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=303,y0=544, x1=261, y1=584, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=252,y0=590, x1=249, y1=592, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=165,y0=592, x1=249, y1=592, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=368,y0=497, x1=359, y1=506, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=258,y0=595, x1=246, y1=606, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=165,y0=606, x1=246, y1=606, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=383,y0=492, x1=373, y1=501, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=365,y0=508, x1=354, y1=519, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=345,y0=527, x1=322, y1=546, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=313,y0=553, x1=271, y1=593, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=263,y0=599, x1=238, y1=619, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=165,y0=619, x1=238, y1=619, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=346,y0=650, x1=339, y1=664, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=165,y0=664, x1=339, y1=664, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=430,y0=489, x1=425, y1=500, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=422,y0=510, x1=416, y1=525, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=413,y0=535, x1=407, y1=549, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=402,y0=559, x1=392, y1=585, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=388,y0=595, x1=367, y1=646, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=363,y0=656, x1=354, y1=677, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=165,y0=677, x1=354, y1=677, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=452,y0=482, x1=447, y1=506, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=443,y0=516, x1=440, y1=531, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=438,y0=542, x1=433, y1=556, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=430,y0=567, x1=423, y1=594, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=418,y0=604, x1=404, y1=656, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=401,y0=667, x1=393, y1=705, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=165,y0=705, x1=393, y1=705, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=406,y0=492, x1=420, y1=463, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=430,y0=489, x1=437, y1=472, lwd = 1, lty = "solid")

segments(x0=452,y0=482, x1=454, y1=477, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=473,y0=479, x1=473, y1=677, lwd = 1, lty = "solid")

segments(x0=283,y0=504, x1=286, y1=502, lwd = 1, lty = "solid")
segments(x0=273,y0=509, x1=221, y1=537, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=211,y0=541, x1=207, y1=543, lwd = 1, lty = "solid")

text(427, 138, "13,000-34,000 BCE", family="bold", cex = .75, srt=7, col = "black")
text(189, 424, "9,000 BCE", family="bold", cex = .75, srt=275, col = "black")
text(206, 441, "8,500 BCE", family="bold", cex = .75, srt=282, col = "black")
text(223, 448, "8,300 BCE", family="bold", cex = .75, srt=284, col = "black")
text(237, 447, "8,300 BCE", family="bold", cex = .75, srt=285, col = "black")
text(258, 469, "7,500 BCE", family="bold", cex = .75, srt=290, col = "black")
text(290, 500, "6,000 BCE", family="bold", cex = .75, srt=301, col = "black")
text(332, 527, "4,000 BCE", family="bold", cex = .75, srt=317, col = "black")
text(351, 525, "3,500 BCE", family="bold", cex = .75, srt=319, col = "black")
text(368, 520, "3,000 BCE", family="bold", cex = .75, srt=323, col = "black")
text(383, 514, "2,500 BCE", family="bold", cex = .75, srt=325, col = "black")
text(399, 509, "2,000 BCE", family="bold", cex = .75, srt=329, col = "black")
text(422, 505, "1,000 BCE", family="bold", cex = .75, srt=340, col = "black")
text(438, 496, "0 CE", family="bold", cex = .75, srt=348, col = "black")
text(462, 488, "1,000", family="bold", cex = .75, srt=355, col = "black")


text(240, 185, "15,000 BCE", family="skinny", cex = .7, srt=315, col = "black")
text(185, 552, "5,000 BCE", family="skinny", cex = .7, srt=20, col = "black")


text(183, 567, "4,000 BCE", family="skinny", cex = .65, col = "black")

text(183, 579, "3,500 BCE", family="skinny", cex = .65, col = "black")

text(183, 589, "3,000 BCE", family="skinny", cex = .65, col = "black")

text(230, 602, "2,500 BCE", family="skinny", cex = .65, col = "black")

text(220, 615, "2,000 BCE", family="skinny", cex = .65, col = "black")

text(240, 659, "1,000 BCE", family="skinny", cex = .65, col = "black")

text(250, 672, "0 CE", family="skinny", cex = .65, col = "black")

text(244, 700, "1,000 CE", family="skinny", cex = .65, col = "black")


dev.off()

image_write(fig03, path = here::here("animal-domestication", "03_more_years_unmasked.png"), format = "png")


#### 4: REVEAL CENTER ####

fig04 <- image_draw(original)

segments(x0=473,y0=325, x1=473, y1=125, lwd = 1, lty = "solid")

segments(x0=461,y0=325, x1=431, y1=142, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=447,y0=327, x1=382, y1=152, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=433,y0=332, x1=337, y1=168, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=423,y0=339, x1=297, y1=191, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=412,y0=346, x1=269, y1=213, lwd = 1, lty = "solid")
segments(x0=262,y0=205, x1=259, y1=202, lwd = 1, lty = "solid")

segments(x0=405,y0=354, x1=242, y1=238, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=397,y0=362, x1=222, y1=264, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=393,y0=371, x1=205, y1=294, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=389,y0=381, x1=193, y1=325, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=386,y0=392, x1=183, y1=360, lwd = 1, lty = "solid")
segments(x0=172,y0=357, x1=168, y1=356, lwd = 1, lty = "solid")

segments(x0=179,y0=402, x1=385, y1=402, lwd = 1, lty = "solid", col="#b6b1ad") #hori
segments(x0=193,y0=402, x1=179, y1=402, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=168,y0=402, x1=164, y1=402, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=387,y0=414, x1=239, y1=429, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=208,y0=420, x1=179, y1=417, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=168,y0=418, x1=163, y1=418, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=389,y0=424, x1=260, y1=454, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=237,y0=423, x1=181, y1=426, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=169,y0=427, x1=164, y1=427, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=283,y0=479, x1=392, y1=431, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=243,y0=447, x1=256, y1=444, lwd = 1, lty = "solid", col="#359dbc")
segments(x0=171,y0=461, x1=189, y1=458, lwd = 1, lty = "solid", col="#359dbc")

segments(x0=296,y0=498, x1=397, y1=440, lwd = 1, lty = "solid")

segments(x0=322,y0=508, x1=401, y1=447, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=283,y0=479, x1=272, y1=484, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=206,y0=512, x1=261, y1=488, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=197,y0=519, x1=194, y1=520, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=353,y0=502, x1=406, y1=452, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=322,y0=508, x1=300, y1=525, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=290,y0=530, x1=243, y1=564, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=232,y0=569, x1=227, y1=572, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=165,y0=572, x1=227, y1=572, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=383,y0=492, x1=411, y1=456, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=337,y0=506, x1=327, y1=514, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=243,y0=581, x1=240, y1=583, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=165,y0=583, x1=240, y1=583, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=353,y0=502, x1=344, y1=511, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=335,y0=519, x1=312, y1=537, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=303,y0=544, x1=261, y1=584, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=252,y0=590, x1=249, y1=592, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=165,y0=592, x1=249, y1=592, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=368,y0=497, x1=359, y1=506, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=258,y0=595, x1=246, y1=606, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=165,y0=606, x1=246, y1=606, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=383,y0=492, x1=373, y1=501, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=365,y0=508, x1=354, y1=519, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=345,y0=527, x1=322, y1=546, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=313,y0=553, x1=271, y1=593, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=263,y0=599, x1=238, y1=619, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=165,y0=619, x1=238, y1=619, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=346,y0=650, x1=339, y1=664, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=165,y0=664, x1=339, y1=664, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=430,y0=489, x1=425, y1=500, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=422,y0=510, x1=416, y1=525, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=413,y0=535, x1=407, y1=549, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=402,y0=559, x1=392, y1=585, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=388,y0=595, x1=367, y1=646, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=363,y0=656, x1=354, y1=677, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=165,y0=677, x1=354, y1=677, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=452,y0=482, x1=447, y1=506, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=443,y0=516, x1=440, y1=531, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=438,y0=542, x1=433, y1=556, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=430,y0=567, x1=423, y1=594, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=418,y0=604, x1=404, y1=656, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=401,y0=667, x1=393, y1=705, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=165,y0=705, x1=393, y1=705, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=406,y0=492, x1=420, y1=463, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=430,y0=489, x1=437, y1=472, lwd = 1, lty = "solid")

segments(x0=452,y0=482, x1=454, y1=477, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=473,y0=479, x1=473, y1=677, lwd = 1, lty = "solid")

segments(x0=283,y0=504, x1=286, y1=502, lwd = 1, lty = "solid")
segments(x0=273,y0=509, x1=221, y1=537, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=211,y0=541, x1=207, y1=543, lwd = 1, lty = "solid")

text(427, 138, "13,000-34,000 BCE", family="bold", cex = .75, srt=7, col = "black")
text(189, 424, "9,000 BCE", family="bold", cex = .75, srt=275, col = "black")
text(206, 441, "8,500 BCE", family="bold", cex = .75, srt=282, col = "black")
text(223, 448, "8,300 BCE", family="bold", cex = .75, srt=284, col = "black")
text(237, 447, "8,300 BCE", family="bold", cex = .75, srt=285, col = "black")
text(258, 469, "7,500 BCE", family="bold", cex = .75, srt=290, col = "black")
text(290, 500, "6,000 BCE", family="bold", cex = .75, srt=301, col = "black")
text(332, 527, "4,000 BCE", family="bold", cex = .75, srt=317, col = "black")
text(351, 525, "3,500 BCE", family="bold", cex = .75, srt=319, col = "black")
text(368, 520, "3,000 BCE", family="bold", cex = .75, srt=323, col = "black")
text(383, 514, "2,500 BCE", family="bold", cex = .75, srt=325, col = "black")
text(399, 509, "2,000 BCE", family="bold", cex = .75, srt=329, col = "black")
text(422, 505, "1,000 BCE", family="bold", cex = .75, srt=340, col = "black")
text(438, 496, "0 CE", family="bold", cex = .75, srt=348, col = "black")
text(462, 488, "1,000", family="bold", cex = .75, srt=355, col = "black")

text(473, 348, "20,000 BCE", family="skinny", cex = .6, srt=270, col = "black")
text(240, 185, "15,000 BCE", family="skinny", cex = .7, srt=315, col = "black")
text(185, 552, "5,000 BCE", family="skinny", cex = .7, srt=20, col = "black")
text(473, 464, "2022 CE", family="skinny", cex = .6, srt=90, col = "black")
text(442, 463, "0 CE", family="skinny", cex = .6, srt=65, col = "black")

text(183, 567, "4,000 BCE", family="skinny", cex = .65, col = "black")

text(183, 579, "3,500 BCE", family="skinny", cex = .65, col = "black")

text(183, 589, "3,000 BCE", family="skinny", cex = .65, col = "black")

text(230, 602, "2,500 BCE", family="skinny", cex = .65, col = "black")

text(220, 615, "2,000 BCE", family="skinny", cex = .65, col = "black")

text(240, 659, "1,000 BCE", family="skinny", cex = .65, col = "black")

text(250, 672, "0 CE", family="skinny", cex = .65, col = "black")

text(244, 700, "1,000 CE", family="skinny", cex = .65, col = "black")


grid.raster(center, .9, .55, height = .11)

dev.off()

image_write(fig04, path = here::here("animal-domestication", "04_center_unmasked.png"), format = "png")


#### 5: REVEAL MORE ANIMALS ####

fig05 <- image_draw(original)

segments(x0=473,y0=325, x1=473, y1=125, lwd = 1, lty = "solid")

segments(x0=461,y0=325, x1=431, y1=142, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=447,y0=327, x1=382, y1=152, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=433,y0=332, x1=337, y1=168, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=423,y0=339, x1=297, y1=191, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=412,y0=346, x1=269, y1=213, lwd = 1, lty = "solid")
segments(x0=262,y0=205, x1=259, y1=202, lwd = 1, lty = "solid")

segments(x0=405,y0=354, x1=242, y1=238, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=397,y0=362, x1=222, y1=264, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=393,y0=371, x1=205, y1=294, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=389,y0=381, x1=193, y1=325, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=386,y0=392, x1=183, y1=360, lwd = 1, lty = "solid")
segments(x0=172,y0=357, x1=168, y1=356, lwd = 1, lty = "solid")

segments(x0=179,y0=402, x1=385, y1=402, lwd = 1, lty = "solid", col="#b6b1ad") #hori
segments(x0=193,y0=402, x1=179, y1=402, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=168,y0=402, x1=164, y1=402, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=402, x1=164, y1=402, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=387,y0=414, x1=239, y1=429, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=208,y0=420, x1=179, y1=417, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=168,y0=418, x1=163, y1=418, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=418, x1=163, y1=418, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=389,y0=424, x1=260, y1=454, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=237,y0=423, x1=181, y1=426, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=169,y0=427, x1=164, y1=427, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=427, x1=164, y1=427, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=283,y0=479, x1=392, y1=431, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=243,y0=447, x1=256, y1=444, lwd = 1, lty = "solid", col="#359dbc")
segments(x0=171,y0=461, x1=189, y1=458, lwd = 1, lty = "solid", col="#359dbc")
segments(x0=0,y0=461, x1=171, y1=461, lwd = 1, lty = "solid", col="#359dbc")

segments(x0=296,y0=498, x1=397, y1=440, lwd = 1, lty = "solid")

segments(x0=322,y0=508, x1=401, y1=447, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=283,y0=479, x1=272, y1=484, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=206,y0=512, x1=261, y1=488, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=197,y0=519, x1=194, y1=520, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=520, x1=194, y1=520, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=353,y0=502, x1=406, y1=452, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=322,y0=508, x1=300, y1=525, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=290,y0=530, x1=243, y1=564, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=232,y0=569, x1=227, y1=572, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=572, x1=227, y1=572, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=383,y0=492, x1=411, y1=456, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=337,y0=506, x1=327, y1=514, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=243,y0=581, x1=240, y1=583, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=0,y0=583, x1=240, y1=583, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=353,y0=502, x1=344, y1=511, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=335,y0=519, x1=312, y1=537, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=303,y0=544, x1=261, y1=584, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=252,y0=590, x1=249, y1=592, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=592, x1=249, y1=592, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=368,y0=497, x1=359, y1=506, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=258,y0=595, x1=246, y1=606, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=0,y0=606, x1=246, y1=606, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=383,y0=492, x1=373, y1=501, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=365,y0=508, x1=354, y1=519, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=345,y0=527, x1=322, y1=546, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=313,y0=553, x1=271, y1=593, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=263,y0=599, x1=238, y1=619, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=619, x1=238, y1=619, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=346,y0=650, x1=339, y1=664, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=0,y0=664, x1=339, y1=664, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=430,y0=489, x1=425, y1=500, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=422,y0=510, x1=416, y1=525, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=413,y0=535, x1=407, y1=549, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=402,y0=559, x1=392, y1=585, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=388,y0=595, x1=367, y1=646, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=363,y0=656, x1=354, y1=677, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=677, x1=354, y1=677, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=452,y0=482, x1=447, y1=506, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=443,y0=516, x1=440, y1=531, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=438,y0=542, x1=433, y1=556, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=430,y0=567, x1=423, y1=594, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=418,y0=604, x1=404, y1=656, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=401,y0=667, x1=393, y1=705, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=705, x1=393, y1=705, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=406,y0=492, x1=420, y1=463, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=430,y0=489, x1=437, y1=472, lwd = 1, lty = "solid")

segments(x0=452,y0=482, x1=454, y1=477, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=473,y0=479, x1=473, y1=677, lwd = 1, lty = "solid")

segments(x0=283,y0=504, x1=286, y1=502, lwd = 1, lty = "solid")
segments(x0=273,y0=509, x1=221, y1=537, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=211,y0=541, x1=207, y1=543, lwd = 1, lty = "solid")

text(427, 138, "13,000-34,000 BCE", family="bold", cex = .75, srt=7, col = "black")
text(189, 424, "9,000 BCE", family="bold", cex = .75, srt=275, col = "black")
text(206, 441, "8,500 BCE", family="bold", cex = .75, srt=282, col = "black")
text(223, 448, "8,300 BCE", family="bold", cex = .75, srt=284, col = "black")
text(237, 447, "8,300 BCE", family="bold", cex = .75, srt=285, col = "black")
text(258, 469, "7,500 BCE", family="bold", cex = .75, srt=290, col = "black")
text(290, 500, "6,000 BCE", family="bold", cex = .75, srt=301, col = "black")
text(332, 527, "4,000 BCE", family="bold", cex = .75, srt=317, col = "black")
text(351, 525, "3,500 BCE", family="bold", cex = .75, srt=319, col = "black")
text(368, 520, "3,000 BCE", family="bold", cex = .75, srt=323, col = "black")
text(383, 514, "2,500 BCE", family="bold", cex = .75, srt=325, col = "black")
text(399, 509, "2,000 BCE", family="bold", cex = .75, srt=329, col = "black")
text(422, 505, "1,000 BCE", family="bold", cex = .75, srt=340, col = "black")
text(438, 496, "0 CE", family="bold", cex = .75, srt=348, col = "black")
text(462, 488, "1,000", family="bold", cex = .75, srt=355, col = "black")

text(240, 185, "15,000 BCE", family="skinny", cex = .7, srt=315, col = "black")
text(145, 350, "10,000 BCE", family="skinny", cex = .7, srt=350, col = "black")
text(185, 552, "5,000 BCE", family="skinny", cex = .7, srt=20, col = "black")
text(473, 464, "2022 CE", family="skinny", cex = .6, srt=90, col = "black")
text(473, 348, "20,000 BCE", family="skinny", cex = .6, srt=270, col = "black")
text(442, 463, "0 CE", family="skinny", cex = .6, srt=65, col = "black")

text(135, 390, "Sheep", family="bold", cex = .75, col = "black")
text(133, 398, "9,000 BCE", family="skinny", cex = .65, col = "black")

text(109, 412, "Goat", family="bold", cex = .75, col = "black")
text(138, 413, "8,500 BCE", family="skinny", cex = .65, col = "black")

text(98, 422.5, "Pig & Cow", family="bold", cex = .75, col = "black")
text(138, 422.5, "8,300 BCE", family="skinny", cex = .65, col = "black")

text(110, 456, "Cat", family="bold", cex = .75, col = "black")
text(138, 456, "7,500 BCE", family="skinny", cex = .65, col = "black")

text(140, 515, "Zebu (Humped Cow)", family="bold", cex = .75, col = "black")
text(163, 507, "6,000 BCE", family="skinny", cex = .65, col = "black")

text(150, 567, "Llama", family="bold", cex = .75, col = "black")
text(183, 567, "4,000 BCE", family="skinny", cex = .65, col = "black")

text(150, 579, "Horse", family="bold", cex = .75, col = "black")
text(183, 579, "3,500 BCE", family="skinny", cex = .65, col = "black")

text(150, 589, "Alpaca", family="bold", cex = .75, col = "black")
text(183, 589, "3,000 BCE", family="skinny", cex = .65, col = "black")

text(150, 602, "Bactrian Camel (two-humped)", family="bold", cex = .75, col = "black")
text(230, 602, "2,500 BCE", family="skinny", cex = .65, col = "black")

text(180, 615, "Chicken", family="bold", cex = .75, col = "black")
text(220, 615, "2,000 BCE", family="skinny", cex = .65, col = "black")

text(160, 659, "Arabian Camel (one-humped)", family="bold", cex = .75, col = "black")
text(240, 659, "1,000 BCE", family="skinny", cex = .65, col = "black")

text(205, 672, "Turkey", family="bold", cex = .75, col = "black")
text(250, 672, "0 CE", family="skinny", cex = .65, col = "black")

text(209, 700, "Duck", family="bold", cex = .75, col = "black")
text(244, 700, "1,000 CE", family="skinny", cex = .65, col = "black")

grid.raster(cat, .165, .505, height = .064)
grid.raster(humanpigsheepgoat, .09, .575, height = .11)
grid.raster(zebu, .1, .455, height = .075)
grid.raster(camels, .1, .358, height = .15)
grid.raster(turkey, .15, .27, height = .06)
grid.raster(duck, .25, .23, height = .04)

grid.raster(center, .9, .55, height = .11)

dev.off()

image_write(fig05, path = here::here("animal-domestication", "05_more_animals_unmasked.png"), format = "png")


#### 6: REVEAL ICONS1 ####

fig06 <- image_draw(original)

segments(x0=473,y0=325, x1=473, y1=125, lwd = 1, lty = "solid")

segments(x0=461,y0=325, x1=431, y1=142, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=447,y0=327, x1=382, y1=152, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=433,y0=332, x1=337, y1=168, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=423,y0=339, x1=297, y1=191, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=412,y0=346, x1=269, y1=213, lwd = 1, lty = "solid")
segments(x0=262,y0=205, x1=259, y1=202, lwd = 1, lty = "solid")

segments(x0=405,y0=354, x1=242, y1=238, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=397,y0=362, x1=222, y1=264, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=393,y0=371, x1=205, y1=294, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=389,y0=381, x1=193, y1=325, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=386,y0=392, x1=183, y1=360, lwd = 1, lty = "solid")
segments(x0=172,y0=357, x1=168, y1=356, lwd = 1, lty = "solid")

segments(x0=179,y0=402, x1=385, y1=402, lwd = 1, lty = "solid", col="#b6b1ad") #hori
segments(x0=193,y0=402, x1=179, y1=402, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=168,y0=402, x1=164, y1=402, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=402, x1=164, y1=402, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=387,y0=414, x1=239, y1=429, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=208,y0=420, x1=179, y1=417, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=168,y0=418, x1=163, y1=418, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=418, x1=163, y1=418, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=389,y0=424, x1=260, y1=454, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=237,y0=423, x1=181, y1=426, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=169,y0=427, x1=164, y1=427, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=427, x1=164, y1=427, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=283,y0=479, x1=392, y1=431, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=243,y0=447, x1=256, y1=444, lwd = 1, lty = "solid", col="#359dbc")
segments(x0=171,y0=461, x1=189, y1=458, lwd = 1, lty = "solid", col="#359dbc")
segments(x0=0,y0=461, x1=171, y1=461, lwd = 1, lty = "solid", col="#359dbc")

segments(x0=296,y0=498, x1=397, y1=440, lwd = 1, lty = "solid")

segments(x0=322,y0=508, x1=401, y1=447, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=283,y0=479, x1=272, y1=484, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=206,y0=512, x1=261, y1=488, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=197,y0=519, x1=194, y1=520, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=520, x1=194, y1=520, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=353,y0=502, x1=406, y1=452, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=322,y0=508, x1=300, y1=525, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=290,y0=530, x1=243, y1=564, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=232,y0=569, x1=227, y1=572, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=572, x1=227, y1=572, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=383,y0=492, x1=411, y1=456, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=337,y0=506, x1=327, y1=514, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=243,y0=581, x1=240, y1=583, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=0,y0=583, x1=240, y1=583, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=353,y0=502, x1=344, y1=511, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=335,y0=519, x1=312, y1=537, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=303,y0=544, x1=261, y1=584, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=252,y0=590, x1=249, y1=592, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=592, x1=249, y1=592, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=368,y0=497, x1=359, y1=506, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=258,y0=595, x1=246, y1=606, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=0,y0=606, x1=246, y1=606, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=383,y0=492, x1=373, y1=501, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=365,y0=508, x1=354, y1=519, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=345,y0=527, x1=322, y1=546, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=313,y0=553, x1=271, y1=593, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=263,y0=599, x1=238, y1=619, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=619, x1=238, y1=619, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=346,y0=650, x1=339, y1=664, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=0,y0=664, x1=339, y1=664, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=430,y0=489, x1=425, y1=500, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=422,y0=510, x1=416, y1=525, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=413,y0=535, x1=407, y1=549, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=402,y0=559, x1=392, y1=585, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=388,y0=595, x1=367, y1=646, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=363,y0=656, x1=354, y1=677, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=677, x1=354, y1=677, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=452,y0=482, x1=447, y1=506, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=443,y0=516, x1=440, y1=531, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=438,y0=542, x1=433, y1=556, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=430,y0=567, x1=423, y1=594, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=418,y0=604, x1=404, y1=656, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=401,y0=667, x1=393, y1=705, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=705, x1=393, y1=705, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=406,y0=492, x1=420, y1=463, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=430,y0=489, x1=437, y1=472, lwd = 1, lty = "solid")

segments(x0=452,y0=482, x1=454, y1=477, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=473,y0=479, x1=473, y1=677, lwd = 1, lty = "solid")

segments(x0=283,y0=504, x1=286, y1=502, lwd = 1, lty = "solid")
segments(x0=273,y0=509, x1=221, y1=537, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=211,y0=541, x1=207, y1=543, lwd = 1, lty = "solid")

text(427, 138, "13,000-34,000 BCE", family="bold", cex = .75, srt=7, col = "black")
text(189, 424, "9,000 BCE", family="bold", cex = .75, srt=275, col = "black")
text(206, 441, "8,500 BCE", family="bold", cex = .75, srt=282, col = "black")
text(223, 448, "8,300 BCE", family="bold", cex = .75, srt=284, col = "black")
text(237, 447, "8,300 BCE", family="bold", cex = .75, srt=285, col = "black")
text(258, 469, "7,500 BCE", family="bold", cex = .75, srt=290, col = "black")
text(290, 500, "6,000 BCE", family="bold", cex = .75, srt=301, col = "black")
text(332, 527, "4,000 BCE", family="bold", cex = .75, srt=317, col = "black")
text(351, 525, "3,500 BCE", family="bold", cex = .75, srt=319, col = "black")
text(368, 520, "3,000 BCE", family="bold", cex = .75, srt=323, col = "black")
text(383, 514, "2,500 BCE", family="bold", cex = .75, srt=325, col = "black")
text(399, 509, "2,000 BCE", family="bold", cex = .75, srt=329, col = "black")
text(422, 505, "1,000 BCE", family="bold", cex = .75, srt=340, col = "black")
text(438, 496, "0 CE", family="bold", cex = .75, srt=348, col = "black")
text(462, 488, "1,000", family="bold", cex = .75, srt=355, col = "black")

text(240, 185, "15,000 BCE", family="skinny", cex = .7, srt=315, col = "black")
text(145, 350, "10,000 BCE", family="skinny", cex = .7, srt=350, col = "black")
text(185, 552, "5,000 BCE", family="skinny", cex = .7, srt=20, col = "black")
text(473, 464, "2022 CE", family="skinny", cex = .6, srt=90, col = "black")
text(473, 348, "20,000 BCE", family="skinny", cex = .6, srt=270, col = "black")
text(442, 463, "0 CE", family="skinny", cex = .6, srt=65, col = "black")

text(135, 390, "Sheep", family="bold", cex = .75, col = "black")
text(133, 398, "9,000 BCE", family="skinny", cex = .65, col = "black")

text(109, 412, "Goat", family="bold", cex = .75, col = "black")
text(138, 413, "8,500 BCE", family="skinny", cex = .65, col = "black")

text(98, 422.5, "Pig & Cow", family="bold", cex = .75, col = "black")
text(138, 422.5, "8,300 BCE", family="skinny", cex = .65, col = "black")

text(110, 456, "Cat", family="bold", cex = .75, col = "black")
text(138, 456, "7,500 BCE", family="skinny", cex = .65, col = "black")

text(140, 515, "Zebu (Humped Cow)", family="bold", cex = .75, col = "black")
text(163, 507, "6,000 BCE", family="skinny", cex = .65, col = "black")

text(150, 567, "Llama", family="bold", cex = .75, col = "black")
text(183, 567, "4,000 BCE", family="skinny", cex = .65, col = "black")

text(150, 579, "Horse", family="bold", cex = .75, col = "black")
text(183, 579, "3,500 BCE", family="skinny", cex = .65, col = "black")

text(150, 589, "Alpaca", family="bold", cex = .75, col = "black")
text(183, 589, "3,000 BCE", family="skinny", cex = .65, col = "black")

text(150, 602, "Bactrian Camel (two-humped)", family="bold", cex = .75, col = "black")
text(230, 602, "2,500 BCE", family="skinny", cex = .65, col = "black")

text(180, 615, "Chicken", family="bold", cex = .75, col = "black")
text(220, 615, "2,000 BCE", family="skinny", cex = .65, col = "black")

text(160, 659, "Arabian Camel (one-humped)", family="bold", cex = .75, col = "black")
text(240, 659, "1,000 BCE", family="skinny", cex = .65, col = "black")

text(205, 672, "Turkey", family="bold", cex = .75, col = "black")
text(250, 672, "0 CE", family="skinny", cex = .65, col = "black")

text(209, 700, "Duck", family="bold", cex = .75, col = "black")
text(244, 700, "1,000 CE", family="skinny", cex = .65, col = "black")

grid.raster(cat, .165, .505, height = .064)
grid.raster(humanpigsheepgoat, .09, .575, height = .11)
grid.raster(zebu, .1, .455, height = .075)
grid.raster(camels, .1, .358, height = .15)
grid.raster(turkey, .15, .27, height = .06)
grid.raster(duck, .25, .23, height = .04)

grid.raster(box, .7, .67, height = .2)
grid.raster(center, .9, .55, height = .11)


dev.off()

image_write(fig06, path = here::here("animal-domestication", "06_legend1_unmasked.png"), format = "png")


#### 7: REVEAL ICONS2 ####

fig07 <- image_draw(original)

segments(x0=473,y0=325, x1=473, y1=125, lwd = 1, lty = "solid")

segments(x0=461,y0=325, x1=431, y1=142, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=447,y0=327, x1=382, y1=152, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=433,y0=332, x1=337, y1=168, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=423,y0=339, x1=297, y1=191, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=412,y0=346, x1=269, y1=213, lwd = 1, lty = "solid")
segments(x0=262,y0=205, x1=259, y1=202, lwd = 1, lty = "solid")

segments(x0=405,y0=354, x1=242, y1=238, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=397,y0=362, x1=222, y1=264, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=393,y0=371, x1=205, y1=294, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=389,y0=381, x1=193, y1=325, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=386,y0=392, x1=183, y1=360, lwd = 1, lty = "solid")
segments(x0=172,y0=357, x1=168, y1=356, lwd = 1, lty = "solid")

segments(x0=179,y0=402, x1=385, y1=402, lwd = 1, lty = "solid", col="#b6b1ad") #hori
segments(x0=193,y0=402, x1=179, y1=402, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=168,y0=402, x1=164, y1=402, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=402, x1=164, y1=402, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=387,y0=414, x1=239, y1=429, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=208,y0=420, x1=179, y1=417, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=168,y0=418, x1=163, y1=418, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=418, x1=163, y1=418, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=389,y0=424, x1=260, y1=454, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=237,y0=423, x1=181, y1=426, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=169,y0=427, x1=164, y1=427, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=427, x1=164, y1=427, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=283,y0=479, x1=392, y1=431, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=243,y0=447, x1=256, y1=444, lwd = 1, lty = "solid", col="#359dbc")
segments(x0=171,y0=461, x1=189, y1=458, lwd = 1, lty = "solid", col="#359dbc")
segments(x0=0,y0=461, x1=171, y1=461, lwd = 1, lty = "solid", col="#359dbc")

segments(x0=296,y0=498, x1=397, y1=440, lwd = 1, lty = "solid")

segments(x0=322,y0=508, x1=401, y1=447, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=283,y0=479, x1=272, y1=484, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=206,y0=512, x1=261, y1=488, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=197,y0=519, x1=194, y1=520, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=520, x1=194, y1=520, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=353,y0=502, x1=406, y1=452, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=322,y0=508, x1=300, y1=525, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=290,y0=530, x1=243, y1=564, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=232,y0=569, x1=227, y1=572, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=572, x1=227, y1=572, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=383,y0=492, x1=411, y1=456, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=337,y0=506, x1=327, y1=514, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=243,y0=581, x1=240, y1=583, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=0,y0=583, x1=240, y1=583, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=353,y0=502, x1=344, y1=511, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=335,y0=519, x1=312, y1=537, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=303,y0=544, x1=261, y1=584, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=252,y0=590, x1=249, y1=592, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=592, x1=249, y1=592, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=368,y0=497, x1=359, y1=506, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=258,y0=595, x1=246, y1=606, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=0,y0=606, x1=246, y1=606, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=383,y0=492, x1=373, y1=501, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=365,y0=508, x1=354, y1=519, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=345,y0=527, x1=322, y1=546, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=313,y0=553, x1=271, y1=593, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=263,y0=599, x1=238, y1=619, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=619, x1=238, y1=619, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=346,y0=650, x1=339, y1=664, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=0,y0=664, x1=339, y1=664, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=430,y0=489, x1=425, y1=500, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=422,y0=510, x1=416, y1=525, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=413,y0=535, x1=407, y1=549, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=402,y0=559, x1=392, y1=585, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=388,y0=595, x1=367, y1=646, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=363,y0=656, x1=354, y1=677, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=677, x1=354, y1=677, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=452,y0=482, x1=447, y1=506, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=443,y0=516, x1=440, y1=531, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=438,y0=542, x1=433, y1=556, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=430,y0=567, x1=423, y1=594, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=418,y0=604, x1=404, y1=656, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=401,y0=667, x1=393, y1=705, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=705, x1=393, y1=705, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=406,y0=492, x1=420, y1=463, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=430,y0=489, x1=437, y1=472, lwd = 1, lty = "solid")

segments(x0=452,y0=482, x1=454, y1=477, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=473,y0=479, x1=473, y1=677, lwd = 1, lty = "solid")

segments(x0=283,y0=504, x1=286, y1=502, lwd = 1, lty = "solid")
segments(x0=273,y0=509, x1=221, y1=537, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=211,y0=541, x1=207, y1=543, lwd = 1, lty = "solid")

text(427, 138, "13,000-34,000 BCE", family="bold", cex = .75, srt=7, col = "black")
text(189, 424, "9,000 BCE", family="bold", cex = .75, srt=275, col = "black")
text(206, 441, "8,500 BCE", family="bold", cex = .75, srt=282, col = "black")
text(223, 448, "8,300 BCE", family="bold", cex = .75, srt=284, col = "black")
text(237, 447, "8,300 BCE", family="bold", cex = .75, srt=285, col = "black")
text(258, 469, "7,500 BCE", family="bold", cex = .75, srt=290, col = "black")
text(290, 500, "6,000 BCE", family="bold", cex = .75, srt=301, col = "black")
text(332, 527, "4,000 BCE", family="bold", cex = .75, srt=317, col = "black")
text(351, 525, "3,500 BCE", family="bold", cex = .75, srt=319, col = "black")
text(368, 520, "3,000 BCE", family="bold", cex = .75, srt=323, col = "black")
text(383, 514, "2,500 BCE", family="bold", cex = .75, srt=325, col = "black")
text(399, 509, "2,000 BCE", family="bold", cex = .75, srt=329, col = "black")
text(422, 505, "1,000 BCE", family="bold", cex = .75, srt=340, col = "black")
text(438, 496, "0 CE", family="bold", cex = .75, srt=348, col = "black")
text(462, 488, "1,000", family="bold", cex = .75, srt=355, col = "black")

text(142, 140, "Humans have domesticated animals for materials,", family="titles", cex = .9, col = "black")
text(136, 150, "work, and companionship all around the world.", family="titles", cex = .9, col = "black")

text(107, 170, "When did each animal get domesticated?", family="titles", cex = .8, col = "black")
text(107, 180, "Though exact dating is tricky and ongoing, this", family="normal", cex = .75, col = "black")
text(108, 190, "timeline highlights the domestication period of", family="normal", cex = .75, col = "black")
text(106, 200, "some animals based on arcaeological findings.", family="normal", cex = .75, col = "black")

text(92, 220, "Domesticated animals fall into roughly", family="normal", cex = .75, col = "black")
text(92, 230, "three categories [though many animals", family="normal", cex = .75, col = "black")
text(55, 240, "fall under multiple]:", family="normal", cex = .75, col = "black")

text(240, 185, "15,000 BCE", family="skinny", cex = .7, srt=315, col = "black")
text(145, 350, "10,000 BCE", family="skinny", cex = .7, srt=350, col = "black")
text(185, 552, "5,000 BCE", family="skinny", cex = .7, srt=20, col = "black")
text(473, 464, "2022 CE", family="skinny", cex = .6, srt=90, col = "black")
text(473, 348, "20,000 BCE", family="skinny", cex = .6, srt=270, col = "black")
text(442, 463, "0 CE", family="skinny", cex = .6, srt=65, col = "black")

text(135, 390, "Sheep", family="bold", cex = .75, col = "black")
text(133, 398, "9,000 BCE", family="skinny", cex = .65, col = "black")

text(109, 412, "Goat", family="bold", cex = .75, col = "black")
text(138, 413, "8,500 BCE", family="skinny", cex = .65, col = "black")

text(98, 422.5, "Pig & Cow", family="bold", cex = .75, col = "black")
text(138, 422.5, "8,300 BCE", family="skinny", cex = .65, col = "black")

text(110, 456, "Cat", family="bold", cex = .75, col = "black")
text(138, 456, "7,500 BCE", family="skinny", cex = .65, col = "black")

text(140, 515, "Zebu (Humped Cow)", family="bold", cex = .75, col = "black")
text(163, 507, "6,000 BCE", family="skinny", cex = .65, col = "black")

text(150, 567, "Llama", family="bold", cex = .75, col = "black")
text(183, 567, "4,000 BCE", family="skinny", cex = .65, col = "black")

text(150, 579, "Horse", family="bold", cex = .75, col = "black")
text(183, 579, "3,500 BCE", family="skinny", cex = .65, col = "black")

text(150, 589, "Alpaca", family="bold", cex = .75, col = "black")
text(183, 589, "3,000 BCE", family="skinny", cex = .65, col = "black")

text(150, 602, "Bactrian Camel (two-humped)", family="bold", cex = .75, col = "black")
text(230, 602, "2,500 BCE", family="skinny", cex = .65, col = "black")

text(180, 615, "Chicken", family="bold", cex = .75, col = "black")
text(220, 615, "2,000 BCE", family="skinny", cex = .65, col = "black")

text(160, 659, "Arabian Camel (one-humped)", family="bold", cex = .75, col = "black")
text(240, 659, "1,000 BCE", family="skinny", cex = .65, col = "black")

text(205, 672, "Turkey", family="bold", cex = .75, col = "black")
text(250, 672, "0 CE", family="skinny", cex = .65, col = "black")

text(209, 700, "Duck", family="bold", cex = .75, col = "black")
text(244, 700, "1,000 CE", family="skinny", cex = .65, col = "black")

grid.raster(icons, .16, .67, height = .1)
grid.raster(cat, .165, .505, height = .064)
grid.raster(humanpigsheepgoat, .09, .575, height = .11)
grid.raster(zebu, .1, .455, height = .075)
grid.raster(camels, .1, .358, height = .15)
grid.raster(turkey, .15, .27, height = .06)
grid.raster(duck, .25, .23, height = .04)

grid.raster(box, .7, .67, height = .2)
grid.raster(center, .9, .55, height = .11)

dev.off()

image_write(fig07, path = here::here("animal-domestication", "07_legend2_unmasked.png"), format = "png")


#### 8: REVEAL BOTTOM ####

fig08 <- image_draw(original)

segments(x0=473,y0=325, x1=473, y1=125, lwd = 1, lty = "solid")

segments(x0=461,y0=325, x1=431, y1=142, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=447,y0=327, x1=382, y1=152, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=433,y0=332, x1=337, y1=168, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=423,y0=339, x1=297, y1=191, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=412,y0=346, x1=269, y1=213, lwd = 1, lty = "solid")
segments(x0=262,y0=205, x1=259, y1=202, lwd = 1, lty = "solid")

segments(x0=405,y0=354, x1=242, y1=238, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=397,y0=362, x1=222, y1=264, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=393,y0=371, x1=205, y1=294, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=389,y0=381, x1=193, y1=325, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=386,y0=392, x1=183, y1=360, lwd = 1, lty = "solid")
segments(x0=172,y0=357, x1=168, y1=356, lwd = 1, lty = "solid")

segments(x0=179,y0=402, x1=385, y1=402, lwd = 1, lty = "solid", col="#b6b1ad") #hori
segments(x0=193,y0=402, x1=179, y1=402, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=168,y0=402, x1=164, y1=402, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=402, x1=164, y1=402, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=387,y0=414, x1=239, y1=429, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=208,y0=420, x1=179, y1=417, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=168,y0=418, x1=163, y1=418, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=418, x1=163, y1=418, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=389,y0=424, x1=260, y1=454, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=237,y0=423, x1=181, y1=426, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=169,y0=427, x1=164, y1=427, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=427, x1=164, y1=427, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=283,y0=479, x1=392, y1=431, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=243,y0=447, x1=256, y1=444, lwd = 1, lty = "solid", col="#359dbc")
segments(x0=171,y0=461, x1=189, y1=458, lwd = 1, lty = "solid", col="#359dbc")
segments(x0=0,y0=461, x1=171, y1=461, lwd = 1, lty = "solid", col="#359dbc")

segments(x0=296,y0=498, x1=397, y1=440, lwd = 1, lty = "solid")

segments(x0=322,y0=508, x1=401, y1=447, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=283,y0=479, x1=272, y1=484, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=206,y0=512, x1=261, y1=488, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=197,y0=519, x1=194, y1=520, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=520, x1=194, y1=520, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=353,y0=502, x1=406, y1=452, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=322,y0=508, x1=300, y1=525, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=290,y0=530, x1=243, y1=564, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=232,y0=569, x1=227, y1=572, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=572, x1=227, y1=572, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=383,y0=492, x1=411, y1=456, lwd = 1, lty = "solid", col="#b6b1ad")
segments(x0=337,y0=506, x1=327, y1=514, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=243,y0=581, x1=240, y1=583, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=0,y0=583, x1=240, y1=583, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=353,y0=502, x1=344, y1=511, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=335,y0=519, x1=312, y1=537, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=303,y0=544, x1=261, y1=584, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=252,y0=590, x1=249, y1=592, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=592, x1=249, y1=592, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=368,y0=497, x1=359, y1=506, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=258,y0=595, x1=246, y1=606, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=0,y0=606, x1=246, y1=606, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=383,y0=492, x1=373, y1=501, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=365,y0=508, x1=354, y1=519, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=345,y0=527, x1=322, y1=546, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=313,y0=553, x1=271, y1=593, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=263,y0=599, x1=238, y1=619, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=619, x1=238, y1=619, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=346,y0=650, x1=339, y1=664, lwd = 1, lty = "solid", col="#dfcfb2")
segments(x0=0,y0=664, x1=339, y1=664, lwd = 1, lty = "solid", col="#dfcfb2")

segments(x0=430,y0=489, x1=425, y1=500, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=422,y0=510, x1=416, y1=525, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=413,y0=535, x1=407, y1=549, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=402,y0=559, x1=392, y1=585, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=388,y0=595, x1=367, y1=646, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=363,y0=656, x1=354, y1=677, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=677, x1=354, y1=677, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=452,y0=482, x1=447, y1=506, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=443,y0=516, x1=440, y1=531, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=438,y0=542, x1=433, y1=556, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=430,y0=567, x1=423, y1=594, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=418,y0=604, x1=404, y1=656, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=401,y0=667, x1=393, y1=705, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=0,y0=705, x1=393, y1=705, lwd = 1, lty = "solid", col="#e85d41")

segments(x0=406,y0=492, x1=420, y1=463, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=430,y0=489, x1=437, y1=472, lwd = 1, lty = "solid")

segments(x0=452,y0=482, x1=454, y1=477, lwd = 1, lty = "solid", col="#b6b1ad")

segments(x0=473,y0=479, x1=473, y1=677, lwd = 1, lty = "solid")

segments(x0=283,y0=504, x1=286, y1=502, lwd = 1, lty = "solid")
segments(x0=273,y0=509, x1=221, y1=537, lwd = 1, lty = "solid", col="#e85d41")
segments(x0=211,y0=541, x1=207, y1=543, lwd = 1, lty = "solid")

text(427, 138, "13,000-34,000 BCE", family="bold", cex = .75, srt=7, col = "black")
text(189, 424, "9,000 BCE", family="bold", cex = .75, srt=275, col = "black")
text(206, 441, "8,500 BCE", family="bold", cex = .75, srt=282, col = "black")
text(223, 448, "8,300 BCE", family="bold", cex = .75, srt=284, col = "black")
text(237, 447, "8,300 BCE", family="bold", cex = .75, srt=285, col = "black")
text(258, 469, "7,500 BCE", family="bold", cex = .75, srt=290, col = "black")
text(290, 500, "6,000 BCE", family="bold", cex = .75, srt=301, col = "black")
text(332, 527, "4,000 BCE", family="bold", cex = .75, srt=317, col = "black")
text(351, 525, "3,500 BCE", family="bold", cex = .75, srt=319, col = "black")
text(368, 520, "3,000 BCE", family="bold", cex = .75, srt=323, col = "black")
text(383, 514, "2,500 BCE", family="bold", cex = .75, srt=325, col = "black")
text(399, 509, "2,000 BCE", family="bold", cex = .75, srt=329, col = "black")
text(422, 505, "1,000 BCE", family="bold", cex = .75, srt=340, col = "black")
text(438, 496, "0 CE", family="bold", cex = .75, srt=348, col = "black")
text(462, 488, "1,000", family="bold", cex = .75, srt=355, col = "black")

text(142, 140, "Humans have domesticated animals for materials,", family="titles", cex = .9, col = "black")
text(136, 150, "work, and companionship all around the world.", family="titles", cex = .9, col = "black")

text(107, 170, "When did each animal get domesticated?", family="titles", cex = .8, col = "black")
text(107, 180, "Though exact dating is tricky and ongoing, this", family="normal", cex = .75, col = "black")
text(108, 190, "timeline highlights the domestication period of", family="normal", cex = .75, col = "black")
text(106, 200, "some animals based on arcaeological findings.", family="normal", cex = .75, col = "black")

text(92, 220, "Domesticated animals fall into roughly", family="normal", cex = .75, col = "black")
text(92, 230, "three categories [though many animals", family="normal", cex = .75, col = "black")
text(55, 240, "fall under multiple]:", family="normal", cex = .75, col = "black")

text(240, 185, "15,000 BCE", family="skinny", cex = .7, srt=315, col = "black")
text(145, 350, "10,000 BCE", family="skinny", cex = .7, srt=350, col = "black")
text(185, 552, "5,000 BCE", family="skinny", cex = .7, srt=20, col = "black")
text(473, 464, "2022 CE", family="skinny", cex = .6, srt=90, col = "black")
text(473, 348, "20,000 BCE", family="skinny", cex = .6, srt=270, col = "black")
text(442, 463, "0 CE", family="skinny", cex = .6, srt=65, col = "black")


text(135, 390, "Sheep", family="bold", cex = .75, col = "black")
text(133, 398, "9,000 BCE", family="skinny", cex = .65, col = "black")

text(109, 412, "Goat", family="bold", cex = .75, col = "black")
text(138, 413, "8,500 BCE", family="skinny", cex = .65, col = "black")

text(98, 422.5, "Pig & Cow", family="bold", cex = .75, col = "black")
text(138, 422.5, "8,300 BCE", family="skinny", cex = .65, col = "black")

text(110, 456, "Cat", family="bold", cex = .75, col = "black")
text(138, 456, "7,500 BCE", family="skinny", cex = .65, col = "black")

text(140, 515, "Zebu (Humped Cow)", family="bold", cex = .75, col = "black")
text(163, 507, "6,000 BCE", family="skinny", cex = .65, col = "black")

text(150, 567, "Llama", family="bold", cex = .75, col = "black")
text(183, 567, "4,000 BCE", family="skinny", cex = .65, col = "black")

text(150, 579, "Horse", family="bold", cex = .75, col = "black")
text(183, 579, "3,500 BCE", family="skinny", cex = .65, col = "black")

text(150, 589, "Alpaca", family="bold", cex = .75, col = "black")
text(183, 589, "3,000 BCE", family="skinny", cex = .65, col = "black")

text(150, 602, "Bactrian Camel (two-humped)", family="bold", cex = .75, col = "black")
text(230, 602, "2,500 BCE", family="skinny", cex = .65, col = "black")

text(180, 615, "Chicken", family="bold", cex = .75, col = "black")
text(220, 615, "2,000 BCE", family="skinny", cex = .65, col = "black")

text(160, 659, "Arabian Camel (one-humped)", family="bold", cex = .75, col = "black")
text(240, 659, "1,000 BCE", family="skinny", cex = .65, col = "black")

text(205, 672, "Turkey", family="bold", cex = .75, col = "black")
text(250, 672, "0 CE", family="skinny", cex = .65, col = "black")

text(209, 700, "Duck", family="bold", cex = .75, col = "black")
text(244, 700, "1,000 CE", family="skinny", cex = .65, col = "black")

text(81, 755, "Though this timeline uses", family="skinny", cex = .6, col = "black")
text(85, 762, "archaeological findings as a", family="skinny", cex = .6, col = "black")
text(87, 769, "base, genomic sequencing is", family="skinny", cex = .6, col = "black")
text(82, 776, "also used to narrow down", family="skinny", cex = .6, col = "black")
text(89, 783, "domestication event timelines.", family="skinny", cex = .6, col = "black")

text(84, 800, "Domestication is still being", family="skinny", cex = .6, col = "black")
text(75, 807, "researched, with new", family="skinny", cex = .6, col = "black")
text(86, 814, "archaeological and genomic", family="skinny", cex = .6, col = "black")
text(77, 821, "discoveries constantly", family="skinny", cex = .6, col = "black")
text(74, 828, "shaking up timelines.", family="skinny", cex = .6, col = "black")

text(230, 755, "Many other animals have been", family="skinny", cex = .6, col = "black")
text(235, 763, "domesticated that aren't included", family="skinny", cex = .6, col = "black")
text(234, 773, "in this timeline, such as donkeys,", family="skinny", cex = .6, col = "black")
text(224, 781, "pigeons, rats, and goldfish.", family="skinny", cex = .6, col = "black")

text(370, 755, "Domesticated timeline", family="skinny", cex = .6, col = "black")
text(380, 763, "estimates vary by thousands", family="skinny", cex = .6, col = "black")
text(380, 771, "of years. The domestic duck,", family="skinny", cex = .6, col = "black")
text(382, 778, "for example, is also thought to", family="skinny", cex = .6, col = "black")
text(383, 785, "have been domesticated more", family="skinny", cex = .6, col = "black")
text(382, 793, "than 4,000 years ago from the", family="skinny", cex = .6, col = "black")
text(376, 801, "mallard in Southeast Asia.", family="skinny", cex = .6, col = "black")

grid.raster(icons, .16, .67, height = .1)
grid.raster(cat, .165, .505, height = .064)
grid.raster(humanpigsheepgoat, .09, .575, height = .11)
grid.raster(zebu, .1, .455, height = .075)
grid.raster(camels, .1, .358, height = .15)
grid.raster(turkey, .15, .27, height = .06)
grid.raster(duck, .25, .23, height = .04)

grid.raster(dna, .11, .19, height = .035)
grid.raster(dogpaw, .39, .19, height = .035)
grid.raster(rduck, .7, .19, height = .035)



grid.raster(donkey, .495, .085, height = .075)
grid.raster(ducks, .69, .075, height = .04)
grid.raster(villagerduck, .95, .105, height = .1)

segments(x0=8,y0=850, x1=490, y1=850, lwd = 1, lty = "solid", col="#b6b1ad")

grid.raster(box, .7, .67, height = .2)
grid.raster(center, .9, .55, height = .11)
grid.raster(bottomrib, .5, .025, height = .05)
grid.raster(source, .89, .23, height = .015)

dev.off()

image_write(fig08, path = here::here("animal-domestication", "08_title_unmasked.png"), format = "png")
