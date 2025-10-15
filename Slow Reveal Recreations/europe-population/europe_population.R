#
# FILE:
# europe_population.R
#
# DESCRIPTION:
# This code is for the Population of Europe graph by Du Bois. The png shows the final recreated graph.  
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
library(magick)



font_add_google(name = "Lato", family = "alt")
showtext_auto()

pie_data <- data.frame(country=c('Russians','Poles','Croats, Servians','Czechs,Slovak.','Ruthen','Bulgarians','Slovenes','Lithuan.','Wends','Magyars','Turks, Tatars',"Finns",
                                 'Greeks','Celts','Gipsies','Iranians','Basques','Albanians','Armenias','Caucasians','Rhaetoromans and Furlans','Walloons','Portuguese','Rumanians',
                                 'Spaniards','Italians','French','Norwegians','Danes','Flemings','Dutch','Swedes','English and Scotch','Germans'),
                       value=c(96.5,19,9,9,4.3,4.5,1.32,4.3,.12,9,8.5,7.5,5,3.2,.3,.4,.6,1.5,1.8,3,.5,2.5,5.5,11,19.5,36,44,2.5,2.8,4.2,5.5,6,43,81))

pie_data$country <- factor(pie_data$country, levels = rev(c('Russians','Poles','Croats, Servians','Czechs,Slovak.','Ruthen','Bulgarians','Slovenes','Lithuan.','Wends','Magyars','Turks, Tatars',"Finns",
                                                            'Greeks','Celts','Gipsies','Iranians','Basques','Albanians','Armenias','Caucasians','Rhaetoromans and Furlans','Walloons','Portuguese','Rumanians',
                                                            'Spaniards','Italians','French','Norwegians','Danes','Flemings','Dutch','Swedes','English and Scotch','Germans')))



picture <- image_graph(width = 900, height = 900)
pie_data %>% ggplot(aes(x="",y=value))+
  geom_col(position='fill',width=1,color='black', fill='#d7d2bf')+
  coord_polar(theta = 'y', start = -.65)+
  geom_col(aes(x=.5,y=0))+
  theme_void()+
  theme(legend.position = "none",
        plot.background = element_rect(color = "#d7d2bf", fill = "#d7d2bf"))
dev.off()


#### N: RECREATED GRAPHIC ####

fig01 <- image_draw(picture)

polygon(c(450, 450, 383, 383), c(362, 450, 450, 362), border = "#d7d2bf", col = "#d7d2bf")

text(450, 450, "POPULATION \n OF EUROPE \n 453 MILLIONS", family = "alt", cex =1.5, col = "#383227")
text(450, 200, "RUSSIANS \n 96.5 MILLIONS", family = "alt", cex =1.25, col = "#383227")
text(225, 365, "GERMANS \n 81 MILLIONS", family = "alt", cex =1.25, col = "#383227")
text(240, 565, "ENGLISH AND SCOTCH \n 43 MILLIONS", family = "alt", cex =1.25, col = "#383227")
text(410, 675, "FRENCH \n 44 MILL.", family = "alt", cex =1.25, col = "#383227")
text(540, 665, "ITALIAN \n 36 MILL.", family = "alt", cex =1.25, col = "#383227")
text(170, 720, "SWEDES 6", family = "alt", cex =1.15, col = "#383227")
text(190, 735, "DUTCH 5.5", family = "alt", cex =1.15, col = "#383227")
text(198, 750, "FLEMINGS 4.2", family = "alt", cex =1.15, col = "#383227")
text(225, 765, "DANES 2.8", family = "alt", cex =1.15, col = "#383227")
text(230, 780, "NORWEGIANS 2.5", family = "alt", cex =1.15, col = "#383227")
text(800, 675, "WALLOONS 2.5", family = "alt", cex =1.15, col = "#383227")
text(820, 645, "RHAETOROMANS \n AND FURLANS 0.5", family = "alt", cex =1.15, col = "#383227")
text(830, 620, "CAUCASIANS 3", family = "alt", cex =1.15, col = "#383227")
text(840, 605, "ARMENIANS 1.8", family = "alt", cex =1.15, col = "#383227")
text(850, 590, "ALBANIANS 1.5", family = "alt", cex =1.15, col = "#383227")
text(845, 575, "BASQUES 0.6", family = "alt", cex =1.15, col = "#383227")
text(845, 560, "IRANIANS 0.4", family = "alt", cex =1.15, col = "#383227")
text(850, 545, "GIPSIES 0.3", family = "alt", cex =1.15, col = "#383227")
text(850, 395, "WENDS 0.12", family = "alt", cex =1.15, col = "#383227")
text(850, 380, "LITHUAN. 4.3", family = "alt", cex =1.15, col = "#383227")
text(850, 365, "SLOVENES 1.32", family = "alt", cex =1.15, col = "#383227")
text(740, 420, "MAYGARS 9", family = "alt", cex =1.25, col = "#383227")
text(680, 230, "POLES \n 19 MILL", family = "alt", cex =1.25, col = "#383227")
text(650, 665, "SPANIARDS \n 19.5", family = "alt", cex =1.25, srt = -45,col = "#383227")
text(690, 610, "RUMANIANS 11", family = "alt", cex =1.25, srt = -35,col = "#383227")
text(705, 585, "PORTUGUESE 5.5", family = "alt", cex =1.25, srt = -27,col = "#383227")
text(760, 535, "KELTS 3.2", family = "alt", cex =1.15, srt = -15,col = "#383227")
text(765, 520, "GREEKS 5", family = "alt", cex =1.25, srt = -10,col = "#383227")
text(765, 490, "FINNS 7.5", family = "alt", cex =1.25, srt = -10,col = "#383227")
text(730, 455, "TURKS, TATARS 8.5", family = "alt", cex =1.25,col = "#383227")
text(735, 370, "BULGARIANS 4.5", family = "alt", cex =1.15, srt=15,col = "#383227")
text(740, 350, "RUTHEN 4.3", family = "alt", cex =1.15, srt=17,col = "#383227")
text(715, 330, "CZECHS, SLOVAK. 9", family = "alt", cex =1.15, srt=25,col = "#383227")
text(700, 295, "CROATS, SERVIANS 9", family = "alt", cex =1.15, srt=30,col = "#383227")

text(660, 130, "SLAVS", family = "alt", cex =1.5, srt=-35,col = "#383227")
text(720, 185, "148 MILL =", family = "alt", cex =1.5, srt=-50,col = "#383227")
text(770, 250, "32.7 p.c.", family = "alt", cex =1.5, srt=-60,col = "#383227")

text(365, 815, "ROMANIC", family = "alt", cex =1.5, srt=-10,col = "#383227")
text(478, 822, "RACE 119 MILL", family = "alt", cex =1.5,srt=1, col = "#383227")
text(585, 813, "= 26.3 p.c.", family = "alt", cex =1.5,srt=12, col = "#383227")

text(105, 600, "TEUTONIC", family = "alt", cex =1.5, srt=115,col = "#383227")
text(75, 510, "RACE 145", family = "alt", cex =1.5, srt=100,col = "#383227")
text(70, 420, "MILL = 32", family = "alt", cex =1.5, srt=85,col = "#383227")
text(92, 318, "p.c. of EUROPE", family = "alt", cex =1.5, srt=70,col = "#383227")

text(450, 875, "THE RACES OF MANKIND.", family = "serif", cex =2, col = "#383227")

dev.off()


image_write(fig01, path = here::here("europe-population", "01_full_unmasked.png"), format = "png")





