#
# FILE:
# consumption_mortality.R
#
# DESCRIPTION:
# This code is for the Mortality From Consumption graph by Du Bois. The png shows the final recreated graph.  
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
library(ggpubr)
library(magick)


font_add_google(name = "Cagliostro", family = "Main")
showtext_auto()

mort <- read_xlsx(here::here("consumption-mortality", "consumption_mortality_data.xlsx")) 

first <- mort %>%
  filter(type == "total")

second <- mort %>%
  filter(type == "white" | type == "colored")

plot1 <- ggplot(first) +
  geom_line(aes(x=year, y= rate, group = type), size=1.25) +
  scale_y_continuous(limits = c(1750,5500), breaks = seq(1800, 5400,200)) +
  scale_x_continuous(limits = c(1887,1906), breaks = seq(1887,1906,1)) +
  theme(panel.grid.minor.y = element_line(color= "black"),
        panel.grid.minor.x = element_blank(),
        panel.grid.major = element_line(color= "black"),
        panel.background = element_rect(fill="white"),
        axis.text.y = element_text(family = "Main", size = 9),
        axis.text.x = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.title = element_text(family = "Main", size = 18),
        legend.position = "none")

print(plot1)

plot2 <- ggplot(second) +
  geom_line(aes(x=year, y= rate, group = type), size=1.25) +
  scale_y_continuous(limits = c(1750,5500), breaks = seq(1800, 5400,200), position = "right") +
  scale_x_continuous(limits = c(1887,1906), breaks = seq(1887,1906,1)) +
  theme(panel.grid.minor.y = element_line(color= "black"),
        panel.grid.minor.x = element_blank(),
        panel.grid.major = element_line(color= "black"),
        panel.background = element_rect(fill="white"),
        axis.text.y = element_text(family = "Main", color = "white", size = 9),
        axis.text.x = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.title = element_text(family = "Main", size = 18),
        legend.position = "none")

print(plot2)


mort2 <- read_xlsx(here::here("consumption-mortality", "consumption_mortality_data2.xlsx")) 

third <- mort2 %>%
  filter(type == "white")

fourth <- mort2 %>%
  filter(type == "negroes")

fifth <- mort2 %>%
  filter(type == "indians")

sixth <- mort2 %>%
  filter(type == "chinese")

plot3 <- ggplot(third, aes(x = percent, y = fct_rev(age)), fill = NA) +
  geom_col(color = "black", fill= "black", width = .5) +
  labs(tag = "(In thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,50), breaks=seq(0,50,10)) +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "white"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="white", size=.25),
        axis.ticks.y = element_blank(), 
        axis.ticks.x = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(20,10,10,10))

print(plot3)

plot4 <- ggplot(fourth, aes(x = percent, y = fct_rev(age)), fill = NA) +
  geom_col(color = "black", fill= "black", width = .5) +
  labs(tag = "(In thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,50), breaks=seq(0,50,10)) +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "white"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="white", size=.25),
        axis.ticks.y = element_blank(), 
        axis.ticks.x = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(20,10,10,10))

print(plot4)

plot5 <- ggplot(fifth, aes(x = percent, y = fct_rev(age)), fill = NA) +
  geom_col(color = "black", fill= "black", width = .5) +
  labs(tag = "(In thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,50), breaks=seq(0,50,10)) +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "white"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="white", size=.25),
        axis.ticks.y = element_blank(), 
        axis.ticks.x = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(20,10,10,10))

print(plot5)

plot6 <- ggplot(sixth, aes(x = percent, y = fct_rev(age)), fill = NA) +
  geom_col(color = "black", fill= "black", width = .5) +
  labs(tag = "(In thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,50), breaks=seq(0,50,10)) +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "white"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="white", size=.25),
        axis.ticks.y = element_blank(), 
        axis.ticks.x = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(20,10,10,10))

print(plot6)


gap <- ggplot() + theme_void()


png(here::here("consumption-mortality", "unfinished.png"),width=1000,height=700)


print(ggarrange(gap,
                ggarrange(gap, plot1, gap, plot2, gap, ncol=5, widths = c(.15, 1, .01, 1, .15)),
                gap,
                ggarrange(gap, plot3, gap, plot4, gap, plot5, gap, plot6, gap, ncol = 9, widths = c(.1, 1, .01, 1, .01, 1, .01, 1, .1)), 
                gap,
                nrow = 5, heights = c(.5, .75, .25, .4, .25))
)

dev.off()

original <- image_read(here::here("consumption-mortality", "unfinished.png"))


## N: RECREATED GRAPHIC

fig01 <- image_draw(original)

#graphs on edge
polygon(c(50, 120, 120, 50), c(170, 170, 410, 410), border = "white", col = "white")
polygon(c(900, 120, 120, 900), c(165, 165, 183, 183), border = "white", col = "white")
text(105, 184, "5400", family = "Main", cex = .75, col = "#383227")
text(105, 195, "5200", family = "Main", cex = .75, col = "#383227")
text(105, 206, "5000", family = "Main", cex = .75, col = "#383227")
text(105, 217, "4800", family = "Main", cex = .75, col = "#383227")
text(105, 228, "4600", family = "Main", cex = .75, col = "#383227")
text(105, 239, "4400", family = "Main", cex = .75, col = "#383227")
text(105, 250, "4200", family = "Main", cex = .75, col = "#383227")
text(105, 261, "4000", family = "Main", cex = .75, col = "#383227")
text(105, 272, "3800", family = "Main", cex = .75, col = "#383227")
text(105, 283, "3600", family = "Main", cex = .75, col = "#383227")
text(105, 294, "3400", family = "Main", cex = .75, col = "#383227")
text(105, 305, "3200", family = "Main", cex = .75, col = "#383227")
text(105, 316, "3000", family = "Main", cex = .75, col = "#383227")
text(105, 327, "2800", family = "Main", cex = .75, col = "#383227")
text(105, 338, "2600", family = "Main", cex = .75, col = "#383227")
text(105, 349, "2400", family = "Main", cex = .75, col = "#383227")
text(105, 360, "2200", family = "Main", cex = .75, col = "#383227")
text(105, 371, "2000", family = "Main", cex = .75, col = "#383227")
text(105, 382, "1800", family = "Main", cex = .75, col = "#383227")

polygon(c(900, 879, 879, 900), c(170, 170, 410, 410), border = "white", col = "white")
polygon(c(900, 120, 120, 900), c(392, 392, 410, 410), border = "white", col = "white")
text(890, 184, "5400", family = "Main", cex = .75, col = "#383227")
text(890, 195, "5200", family = "Main", cex = .75, col = "#383227")
text(890, 206, "5000", family = "Main", cex = .75, col = "#383227")
text(890, 217, "4800", family = "Main", cex = .75, col = "#383227")
text(890, 228, "4600", family = "Main", cex = .75, col = "#383227")
text(890, 239, "4400", family = "Main", cex = .75, col = "#383227")
text(890, 250, "4200", family = "Main", cex = .75, col = "#383227")
text(890, 261, "4000", family = "Main", cex = .75, col = "#383227")
text(890, 272, "3800", family = "Main", cex = .75, col = "#383227")
text(890, 283, "3600", family = "Main", cex = .75, col = "#383227")
text(890, 294, "3400", family = "Main", cex = .75, col = "#383227")
text(890, 305, "3200", family = "Main", cex = .75, col = "#383227")
text(890, 316, "3000", family = "Main", cex = .75, col = "#383227")
text(890, 327, "2800", family = "Main", cex = .75, col = "#383227")
text(890, 338, "2600", family = "Main", cex = .75, col = "#383227")
text(890, 349, "2400", family = "Main", cex = .75, col = "#383227")
text(890, 360, "2200", family = "Main", cex = .75, col = "#383227")
text(890, 371, "2000", family = "Main", cex = .75, col = "#383227")
text(890, 382, "1800", family = "Main", cex = .75, col = "#383227")
polygon(c(475, 524, 524, 475), c(170, 170, 410, 410), border = "white", col = "white")

text(122, 397, "1887", family = "Main", cex = .75, col = "#383227")
text(138, 397, "'88", family = "Main", cex = .75, col = "#383227")
text(157, 397, "'89", family = "Main", cex = .75, col = "#383227")
text(176, 397, "'90", family = "Main", cex = .75, col = "#383227")
text(195, 397, "'91", family = "Main", cex = .75, col = "#383227")
text(214, 397, "'92", family = "Main", cex = .75, col = "#383227")
text(233, 397, "'93", family = "Main", cex = .75, col = "#383227")
text(252, 397, "'94", family = "Main", cex = .75, col = "#383227")
text(271, 397, "'95", family = "Main", cex = .75, col = "#383227")
text(290, 397, "'96", family = "Main", cex = .75, col = "#383227")
text(309, 397, "'97", family = "Main", cex = .75, col = "#383227")
text(328, 397, "'98", family = "Main", cex = .75, col = "#383227")
text(347, 397, "'99", family = "Main", cex = .75, col = "#383227")
text(364, 397, "1900", family = "Main", cex = .75, col = "#383227")
text(381, 397, "'01", family = "Main", cex = .75, col = "#383227")
text(401, 397, "'02", family = "Main", cex = .75, col = "#383227")
text(420, 397, "'03", family = "Main", cex = .75, col = "#383227")
text(439, 397, "'04", family = "Main", cex = .75, col = "#383227")
text(457, 397, "'05", family = "Main", cex = .75, col = "#383227")
text(476, 397, "1906", family = "Main", cex = .75, col = "#383227")

text(525, 397, "1887", family = "Main", cex = .75, col = "#383227")
text(541, 397, "'88", family = "Main", cex = .75, col = "#383227")
text(560, 397, "'89", family = "Main", cex = .75, col = "#383227")
text(579, 397, "'90", family = "Main", cex = .75, col = "#383227")
text(598, 397, "'91", family = "Main", cex = .75, col = "#383227")
text(617, 397, "'92", family = "Main", cex = .75, col = "#383227")
text(636, 397, "'93", family = "Main", cex = .75, col = "#383227")
text(655, 397, "'94", family = "Main", cex = .75, col = "#383227")
text(674, 397, "'95", family = "Main", cex = .75, col = "#383227")
text(693, 397, "'96", family = "Main", cex = .75, col = "#383227")
text(712, 397, "'97", family = "Main", cex = .75, col = "#383227")
text(731, 397, "'98", family = "Main", cex = .75, col = "#383227")
text(750, 397, "'99", family = "Main", cex = .75, col = "#383227")
text(768, 397, "1900", family = "Main", cex = .75, col = "#383227")
text(786, 397, "'01", family = "Main", cex = .75, col = "#383227")
text(805, 397, "'02", family = "Main", cex = .75, col = "#383227")
text(824, 397, "'03", family = "Main", cex = .75, col = "#383227")
text(843, 397, "'04", family = "Main", cex = .75, col = "#383227")
text(862, 397, "'05", family = "Main", cex = .75, col = "#383227")
text(881, 397, "1906", family = "Main", cex = .75, col = "#383227")


text(500, 50, "Mortality from Consumption ~ General Population", family = "Main", cex = 2.5, col = "#383227")
text(500, 80, "1887-1906.", family = "Main", cex = 2, col = "#383227")

segments(x0=15,y0=110, x1=985, y1=110, lwd = 3, lty = "solid")
segments(x0=20,y0=115, x1=980, y1=115, lwd = 1, lty = "solid")

segments(x0=15,y0=680, x1=985, y1=680, lwd = 3, lty = "solid")
segments(x0=20,y0=675, x1=980, y1=675, lwd = 1, lty = "solid")

segments(x0=15,y0=110, x1=15, y1=680, lwd = 3, lty = "solid")
segments(x0=20,y0=115, x1=20, y1=675, lwd = 1, lty = "solid")

segments(x0=985,y0=110, x1=985, y1=680, lwd = 3, lty = "solid")
segments(x0=980,y0=115, x1=980, y1=675, lwd = 1, lty = "solid")

text(290, 150, "Mortality of Northern Cities.", family = "Main", cex = 2.25, col = "#383227")
text(105, 175, "Rate per 10,000", family = "Main", cex = .5, col = "#383227")
text(290, 170, "RATE PER 10,000", family = "Main", cex = 1, col = "#383227")

text(720, 150, "Mortality of Southern Cities.", family = "Main", cex = 2.25, col = "#383227")
text(890, 175, "Rate per 10,000", family = "Main", cex = .5, col = "#383227")
text(720, 170, "RATE PER 10,000", family = "Main", cex = 1, col = "#383227")

text(500, 465, "Proportionate Consumption Mortality ~ MALES.", family = "Main", cex = 2.25, col = "#383227")
text(130, 500, "Ages at Death. WHITES.", family = "Main", cex = 1.5, col = "#383227")
text(375, 500, "Ages at Death. NEGROES.", family = "Main", cex = 1.5, col = "#383227")
text(610, 500, "Ages at Death. INDIANS.", family = "Main", cex = 1.5, col = "#383227")
text(850, 500, "Ages at Death. CHINESE.", family = "Main", cex = 1.5, col = "#383227")


segments(x0=70,y0=523, x1=70, y1=603, lwd = 1, lty = "solid")
text(105, 517, "10%", family = "Main", cex = .5, col = "#383227")
segments(x0=105,y0=523, x1=105, y1=574, lwd = 1, lty = "solid")
text(140, 517, "20%", family = "Main", cex = .5, col = "#383227")
segments(x0=140,y0=523, x1=140, y1=559, lwd = 1, lty = "solid")

text(77, 527, "21.7", family = "Main", cex = .55, col = "white")
text(77, 541, "28.8", family = "Main", cex = .55, col = "white")
text(77, 555, "21.9", family = "Main", cex = .55, col = "white")
text(77, 570, "14.5", family = "Main", cex = .55, col = "white")
text(77, 585, "9.0", family = "Main", cex = .55, col = "white")
text(82, 600, "3.6", family = "Main", cex = .55, col = "black")


segments(x0=310,y0=523, x1=310, y1=603, lwd = 1, lty = "solid")
text(345, 517, "10%", family = "Main", cex = .5, col = "#383227")
segments(x0=345,y0=523, x1=345, y1=588, lwd = 1, lty = "solid")
text(380, 517, "20%", family = "Main", cex = .5, col = "#383227")
segments(x0=380,y0=523, x1=380, y1=559, lwd = 1, lty = "solid")

text(317, 527, "27.8", family = "Main", cex = .55, col = "white")
text(317, 541, "28.7", family = "Main", cex = .55, col = "white")
text(317, 555, "24.4", family = "Main", cex = .55, col = "white")
text(317, 570, "17.6", family = "Main", cex = .55, col = "white")
text(317, 585, "11.8", family = "Main", cex = .55, col = "white")
text(317, 600, "5.3", family = "Main", cex = .55, col = "white")

segments(x0=549,y0=523, x1=549, y1=603, lwd = 1, lty = "solid")
text(583, 517, "10%", family = "Main", cex = .5, col = "#383227")
segments(x0=583,y0=523, x1=583, y1=603, lwd = 1, lty = "solid")
text(617, 517, "20%", family = "Main", cex = .5, col = "#383227")
segments(x0=617,y0=523, x1=617, y1=588, lwd = 1, lty = "solid")
text(651, 517, "30%", family = "Main", cex = .5, col = "#383227")
segments(x0=651,y0=523, x1=651, y1=544, lwd = 1, lty = "solid")
text(685, 517, "40%", family = "Main", cex = .5, col = "#383227")
segments(x0=685,y0=523, x1=685, y1=544, lwd = 1, lty = "solid")
text(719, 517, "50%", family = "Main", cex = .5, col = "#383227")

text(556, 527, "50.0", family = "Main", cex = .55, col = "white")
text(556, 541, "40.6", family = "Main", cex = .55, col = "white")
text(556, 555, "25.3", family = "Main", cex = .55, col = "white")
text(556, 570, "21.7", family = "Main", cex = .55, col = "white")
text(556, 585, "20.4", family = "Main", cex = .55, col = "white")
text(556, 600, "11.9", family = "Main", cex = .55, col = "white")

segments(x0=788,y0=523, x1=788, y1=603, lwd = 1, lty = "solid")
text(822, 517, "10%", family = "Main", cex = .5, col = "#383227")
segments(x0=822,y0=523, x1=822, y1=603, lwd = 1, lty = "solid")
text(856, 517, "20%", family = "Main", cex = .5, col = "#383227")
segments(x0=856,y0=523, x1=856, y1=603, lwd = 1, lty = "solid")
text(890, 517, "30%", family = "Main", cex = .5, col = "#383227")
segments(x0=890,y0=523, x1=890, y1=574, lwd = 1, lty = "solid")
text(924, 517, "40%", family = "Main", cex = .5, col = "#383227")
segments(x0=924,y0=523, x1=924, y1=559, lwd = 1, lty = "solid")

text(795, 527, "37.2", family = "Main", cex = .55, col = "white")
text(795, 541, "44.7", family = "Main", cex = .55, col = "white")
text(795, 555, "43.5", family = "Main", cex = .55, col = "white")
text(795, 570, "33.2", family = "Main", cex = .55, col = "white")
text(795, 585, "23.7", family = "Main", cex = .55, col = "white")
text(795, 600, "22.1", family = "Main", cex = .55, col = "white")

text(500, 630, "NOTE: The proportionate consumption mortality is determined by calculating the percentage of deaths from consumption in the mortality", family = "Main", cex = 1, col = "#383227")
text(500, 645, "from all causes at specified periods of life. For illustration: at ages 15-24, out of every 100 deaths from all causes, among white", family = "Main", cex = 1, col = "black")
text(500, 660, "males 21.7 are from consumption, among negro males 27.8, among male Indians 50.0, and among Chinese (in the US) 37.2", family = "Main", cex = 1, col = "black")

text(280, 355, "Total Population", family = "Main", cex = 1, srt = -13, col = "black")
text(695, 210, "Colored Population", family = "Main", cex = 1, srt = -15, col = "black")
text(725, 370, "White Population", family = "Main", cex = 1, srt = -10, col = "black")

dev.off()

image_write(fig01, path = here::here("consumption-mortality", "01_full_unmasked.png"), format = "png")














