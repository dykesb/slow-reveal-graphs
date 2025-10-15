#
# FILE:
# tuberculosis_mortality_country.R
#
# DESCRIPTION:
# 
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
library(ggpubr)

font_add_google(name = "Cagliostro", family = "Main")
showtext_auto()

country <- read_xlsx(here::here("tuberculosis-mortality-country", "tuberculosis_mortality_country_data.xlsx")) %>% 
  mutate(Country = as_factor(Country))




plot <- ggplot(country) +
  geom_line(aes(x=Year, y= Rate, group = Country, linetype = Country, size = Country)) +
  scale_x_continuous(limits = c(1906,1916), breaks = seq(1906,1916,1)) +
  scale_y_continuous(limits = c(0,200), breaks = seq(0, 200,10), sec.axis = sec_axis(~ ., breaks = seq(0, 200,10))) +
  theme(panel.grid.minor = element_blank(),
        panel.grid.major = element_line(color= "white"),
        panel.background = element_rect(fill="white"),
        axis.text = element_text(family = "Main", size = 12),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.title = element_text(family = "Main", size = 18),
        legend.position = "none") +
  scale_linetype_manual(values = c("twodash", "longdash", "solid", "solid", "solid")) +
  scale_size_manual(values = c(1.75, 1.75, .5, .5, 1.75))


gap <- ggplot() + theme_void()


#### FIGURE 1: UNTRANSLATED PLOT ####


png(here::here("tuberculosis-mortality-country", "01_full_unmasked.png"),width=1000,height=700)

ggarrange(gap,
          ggarrange(gap, plot, gap, ncol=3, widths = c(.07, 1, .07)),
          gap,
          nrow = 3, heights = c(.15, 1, .1))

grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.135, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.208, x1 = 0.208, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.281, x1 = 0.281, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.354, x1 = 0.354, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.427, x1 = 0.427, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.5, x1 = 0.5, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.572, x1 = 0.572, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.645, x1 = 0.645, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.718, x1 = 0.718, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.791, x1 = 0.791, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.864, x1 = 0.864, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))

grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.137, y1 = 0.137, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.177, y1 = 0.177, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.213, y1 = 0.213, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.248, y1 = 0.248, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.282, y1 = 0.282, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.317, y1 = 0.317, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.351, y1 = 0.351, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.385, y1 = 0.385, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.419, y1 = 0.419, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.453, y1 = 0.453, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.487, y1 = 0.487, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.526, y1 = 0.526, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.563, y1 = 0.563, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.597, y1 = 0.597, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.631, y1 = 0.631, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.665, y1 = 0.665, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.699, y1 = 0.699, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.733, y1 = 0.733, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.767, y1 = 0.767, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.801, y1 = 0.801, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.835, y1 = 0.835, gp = gpar(lwd = .5)))

grid.draw(segmentsGrob(x0 = 0.04, x1 = 0.04, y0 = 0.07, y1 = 0.91, gp = gpar(lwd = 5)))
grid.draw(segmentsGrob(x0 = 0.96, x1 = 0.96, y0 = 0.07, y1 = 0.91, gp = gpar(lwd = 5)))
grid.draw(segmentsGrob(x0 = 0.04, x1 = 0.96, y0 = 0.07, y1 = 0.07, gp = gpar(lwd = 5)))
grid.draw(segmentsGrob(x0 = 0.04, x1 = 0.96, y0 = 0.91, y1 = 0.91, gp = gpar(lwd = 5)))

grid.draw(segmentsGrob(x0 = 0.045, x1 = 0.045, y0 = 0.077, y1 = 0.903))
grid.draw(segmentsGrob(x0 = 0.955, x1 = 0.955, y0 = 0.077, y1 = 0.903))
grid.draw(segmentsGrob(x0 = 0.045, x1 = 0.955, y0 = 0.077, y1 = 0.077))
grid.draw(segmentsGrob(x0 = 0.045, x1 = 0.955, y0 = 0.903, y1 = 0.903))

grid.draw(textGrob("Rate per", x=.082, y=.88, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1000 Birth", x=.082, y=.865, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("Years:", x=.09, y=.097, gp=gpar(fontsize=12, fontfamily = "Main")))
grid.draw(textGrob("New-York durant les années 1906 à 1916.*", x=.5,y=.95, gp=gpar(fontsize=26, fontfamily = "serif")))
grid.draw(textGrob("3510", x=.92, y=.035, gp=gpar(fontsize=30, fontfamily = "Main")))

grid.draw(textGrob("LEGEND", x=.675, y=.055, gp=gpar(fontsize=8, fontfamily = "Main")))
grid.draw(textGrob("ENGLAND AND WALES", x=.625, y=.04, gp=gpar(fontsize=6, fontfamily = "Main")))
grid.draw(textGrob("FRANCE", x=.595, y=.03, gp=gpar(fontsize=6, fontfamily = "Main")))
grid.draw(textGrob("NEW YORK STATE", x=.615, y=.02, gp=gpar(fontsize=6, fontfamily = "Main")))
grid.draw(textGrob("GERMANY", x=.6, y=.01, gp=gpar(fontsize=6, fontfamily = "Main")))
grid.draw(segmentsGrob(x0 = 0.7, x1 = 0.775, y0 = 0.04, y1 = 0.04, gp = gpar(lwd = 5)))
grid.draw(segmentsGrob(x0 = 0.699, x1 = 0.776, y0 = 0.032, y1 = 0.032, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.699, x1 = 0.776, y0 = 0.028, y1 = 0.028, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.776, x1 = 0.776, y0 = 0.028, y1 = 0.032, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.699, x1 = 0.699, y0 = 0.028, y1 = 0.032, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.7, x1 = 0.775, y0 = 0.02, y1 = 0.02, gp = gpar(lwd = 5, lty = "dashed")))
grid.draw(segmentsGrob(x0 = 0.7, x1 = 0.775, y0 = 0.01, y1 = 0.01, gp = gpar(lwd = 5, lty = "dotdash")))

grid.draw(textGrob("ENGLAND AND WALES", x=.19, y=.545, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("132", x=.145, y=.61, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("116", x=.215, y=.57, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("120", x=.29, y=.57, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("109", x=.362, y=.51, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("105", x=.435, y=.498, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("130", x=.507, y=.605, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("95", x=.579, y=.463, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("108", x=.652, y=.505, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("99", x=.722, y=.478, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("99", x=.792, y=.475, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("94", x=.873, y=.475, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("ENGLAND AND WALES", x=.815, y=.45, gp=gpar(fontsize=7, fontfamily = "Main")))


grid.draw(textGrob("FRANCE", x=.155, y=.63, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("148", x=.125, y=.652, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("135", x=.215, y=.62, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("129", x=.27, y=.58, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("120", x=.362, y=.545, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("114", x=.425, y=.555, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("159", x=.507, y=.705, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("106", x=.579, y=.496, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("114", x=.652, y=.55, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("110", x=.722, y=.54, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("130", x=.792, y=.605, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("114", x=.873, y=.54, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("FRANCE", x=.845, y=.58, gp=gpar(fontsize=7, fontfamily = "Main")))


grid.draw(textGrob("NEW YORK STATE", x=.178, y=.675, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("148", x=.126, y=.666, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("143", x=.215, y=.65, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("131", x=.29, y=.61, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("129", x=.362, y=.607, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("129", x=.425, y=.61, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("114", x=.507, y=.553, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("109", x=.579, y=.533, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("109", x=.652, y=.532, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("105", x=.722, y=.5, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("110", x=.792, y=.535, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("91", x=.873, y=.46, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("NEW YORK STATE", x=.85, y=.52, gp=gpar(fontsize=7, fontfamily = "Main")))

grid.draw(textGrob("GERMANY", x=.16, y=.755, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("185", x=.145, y=.793, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("176", x=.215, y=.742, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("178", x=.29, y=.745, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("170", x=.362, y=.745, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("162", x=.425, y=.695, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("192", x=.507, y=.818, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("147", x=.579, y=.645, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("151", x=.652, y=.675, gp=gpar(fontsize=7, fontfamily = "Main")))

dev.off()


#### FIGURE 2: TRANSLATED PLOT ####

png(here::here("tuberculosis-mortality-country", "02_full_unmasked_translated.png"),width=1000,height=700)

ggarrange(gap,
          ggarrange(gap, plot, gap, ncol=3, widths = c(.07, 1, .07)),
          gap,
          nrow = 3, heights = c(.15, 1, .1))

grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.135, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.208, x1 = 0.208, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.281, x1 = 0.281, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.354, x1 = 0.354, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.427, x1 = 0.427, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.5, x1 = 0.5, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.572, x1 = 0.572, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.645, x1 = 0.645, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.718, x1 = 0.718, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.791, x1 = 0.791, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.864, x1 = 0.864, y0 = 0.137, y1 = 0.835, gp = gpar(lwd = .5)))

grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.137, y1 = 0.137, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.177, y1 = 0.177, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.213, y1 = 0.213, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.248, y1 = 0.248, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.282, y1 = 0.282, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.317, y1 = 0.317, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.351, y1 = 0.351, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.385, y1 = 0.385, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.419, y1 = 0.419, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.453, y1 = 0.453, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.487, y1 = 0.487, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.526, y1 = 0.526, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.563, y1 = 0.563, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.597, y1 = 0.597, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.631, y1 = 0.631, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.665, y1 = 0.665, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.699, y1 = 0.699, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.733, y1 = 0.733, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.767, y1 = 0.767, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.801, y1 = 0.801, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.135, x1 = 0.864, y0 = 0.835, y1 = 0.835, gp = gpar(lwd = .5)))

grid.draw(segmentsGrob(x0 = 0.04, x1 = 0.04, y0 = 0.07, y1 = 0.91, gp = gpar(lwd = 5)))
grid.draw(segmentsGrob(x0 = 0.96, x1 = 0.96, y0 = 0.07, y1 = 0.91, gp = gpar(lwd = 5)))
grid.draw(segmentsGrob(x0 = 0.04, x1 = 0.96, y0 = 0.07, y1 = 0.07, gp = gpar(lwd = 5)))
grid.draw(segmentsGrob(x0 = 0.04, x1 = 0.96, y0 = 0.91, y1 = 0.91, gp = gpar(lwd = 5)))

grid.draw(segmentsGrob(x0 = 0.045, x1 = 0.045, y0 = 0.077, y1 = 0.903))
grid.draw(segmentsGrob(x0 = 0.955, x1 = 0.955, y0 = 0.077, y1 = 0.903))
grid.draw(segmentsGrob(x0 = 0.045, x1 = 0.955, y0 = 0.077, y1 = 0.077))
grid.draw(segmentsGrob(x0 = 0.045, x1 = 0.955, y0 = 0.903, y1 = 0.903))

grid.draw(textGrob("Rate per", x=.082, y=.88, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1000 Birth", x=.082, y=.865, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("Years:", x=.09, y=.097, gp=gpar(fontsize=12, fontfamily = "Main")))
grid.draw(textGrob("in Europian countries and the United States", x=.5,y=.94, gp=gpar(fontsize=23, fontfamily = "serif")))
grid.draw(textGrob("Chart showing comparison of infant mortality", x=.5,y=.98, gp=gpar(fontsize=23, fontfamily = "serif")))
grid.draw(textGrob("3510", x=.92, y=.035, gp=gpar(fontsize=30, fontfamily = "Main")))

grid.draw(textGrob("LEGEND", x=.675, y=.055, gp=gpar(fontsize=8, fontfamily = "Main")))
grid.draw(textGrob("ENGLAND AND WALES", x=.625, y=.04, gp=gpar(fontsize=6, fontfamily = "Main")))
grid.draw(textGrob("FRANCE", x=.595, y=.03, gp=gpar(fontsize=6, fontfamily = "Main")))
grid.draw(textGrob("NEW YORK STATE", x=.615, y=.02, gp=gpar(fontsize=6, fontfamily = "Main")))
grid.draw(textGrob("GERMANY", x=.6, y=.01, gp=gpar(fontsize=6, fontfamily = "Main")))
grid.draw(segmentsGrob(x0 = 0.7, x1 = 0.775, y0 = 0.04, y1 = 0.04, gp = gpar(lwd = 5)))
grid.draw(segmentsGrob(x0 = 0.699, x1 = 0.776, y0 = 0.032, y1 = 0.032, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.699, x1 = 0.776, y0 = 0.028, y1 = 0.028, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.776, x1 = 0.776, y0 = 0.028, y1 = 0.032, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.699, x1 = 0.699, y0 = 0.028, y1 = 0.032, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.7, x1 = 0.775, y0 = 0.02, y1 = 0.02, gp = gpar(lwd = 5, lty = "dashed")))
grid.draw(segmentsGrob(x0 = 0.7, x1 = 0.775, y0 = 0.01, y1 = 0.01, gp = gpar(lwd = 5, lty = "dotdash")))

grid.draw(textGrob("ENGLAND AND WALES", x=.19, y=.545, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("132", x=.145, y=.61, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("116", x=.215, y=.57, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("120", x=.29, y=.57, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("109", x=.362, y=.51, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("105", x=.435, y=.498, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("130", x=.507, y=.605, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("95", x=.579, y=.463, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("108", x=.652, y=.505, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("99", x=.722, y=.478, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("99", x=.792, y=.475, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("94", x=.873, y=.475, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("ENGLAND AND WALES", x=.815, y=.45, gp=gpar(fontsize=7, fontfamily = "Main")))


grid.draw(textGrob("FRANCE", x=.155, y=.63, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("148", x=.125, y=.652, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("135", x=.215, y=.62, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("129", x=.27, y=.58, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("120", x=.362, y=.545, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("114", x=.425, y=.555, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("159", x=.507, y=.705, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("106", x=.579, y=.496, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("114", x=.652, y=.55, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("110", x=.722, y=.54, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("130", x=.792, y=.605, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("114", x=.873, y=.54, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("FRANCE", x=.845, y=.58, gp=gpar(fontsize=7, fontfamily = "Main")))


grid.draw(textGrob("NEW YORK STATE", x=.178, y=.675, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("148", x=.126, y=.666, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("143", x=.215, y=.65, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("131", x=.29, y=.61, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("129", x=.362, y=.607, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("129", x=.425, y=.61, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("114", x=.507, y=.553, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("109", x=.579, y=.533, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("109", x=.652, y=.532, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("105", x=.722, y=.5, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("110", x=.792, y=.535, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("91", x=.873, y=.46, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("NEW YORK STATE", x=.85, y=.52, gp=gpar(fontsize=7, fontfamily = "Main")))

grid.draw(textGrob("GERMANY", x=.16, y=.755, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("185", x=.145, y=.793, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("176", x=.215, y=.742, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("178", x=.29, y=.745, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("170", x=.362, y=.745, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("162", x=.425, y=.695, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("192", x=.507, y=.818, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("147", x=.579, y=.645, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("151", x=.652, y=.675, gp=gpar(fontsize=7, fontfamily = "Main")))

dev.off()



