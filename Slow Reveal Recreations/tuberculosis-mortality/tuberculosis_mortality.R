#
# FILE:
# tuberculosis_mortality.R
#
# DESCRIPTION:
# This code is from a 1918 Red Cross Report. The png shows the final recreation of the graph.  
# Source: https://www.loc.gov/resource/anrc.16954/
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

country <- read_xlsx(here::here("tuberculosis-mortality", "tuberculosis_mortality_country_data.xlsx")) %>% 
  mutate(Country = as_factor(Country))

#### COUNTRY PLOT ####

countryplot <- ggplot(country) +
  geom_line(aes(x=Year, y= Death, group = Country, linetype = Country, size = Country)) +
  labs(title= expression(underline(COVNTRIES))) +
  scale_x_continuous(limits = c(1906,1913), breaks = seq(1906,1913,1)) +
  scale_y_continuous(limits = c(0,5), breaks = seq(.25, 5,.25)) +
  theme(panel.grid.minor = element_blank(),
        panel.grid.major = element_line(color= "white"),
        panel.background = element_rect(fill="white"),
        axis.text = element_text(family = "Main", size = 12),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.title = element_text(family = "Main", size = 18),
        legend.position = "none") +
  scale_linetype_manual(values = c("solid", "longdash", "twodash")) +
  scale_size_manual(values = c(1.5, 1.5, 1.5))

#### TOWN PLOT ####

town <- read_xlsx(here::here("tuberculosis-mortality", "tuberculosis_mortality_town_data.xlsx")) %>% 
  mutate(Area = as_factor(Area))

townplot <- ggplot(town) +
  geom_line(aes(x=Year, y= Death, group = Area, linetype = Area, size = Area)) +
  labs(title= expression(underline(TOWNS))) +
  scale_x_continuous(limits = c(1906,1913), breaks = seq(1906,1913,1)) +
  scale_y_continuous(position = "right", limits = c(0,5), breaks = seq(.25 ,5,.25)) +
  theme(panel.grid.minor = element_blank(),
        panel.grid.major = element_line(color= "white"),
        panel.background = element_rect(fill="white"),
        axis.text = element_text(family = "Main", size = 12),
        axis.text.x = element_text(margin = margin(r= -10)),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.title = element_text(family = "Main", size = 18),
        legend.position = "none") +
  scale_linetype_manual(values = c("solid","solid", "solid", "twodash","longdash")) +
  scale_size_manual(values = c(1.5, .5, .5, 1.5, 1.5))

gap <- ggplot() + theme_void()


#### FIGURE 1: RECREATED GRAPHIC ####


png(here::here("tuberculosis-mortality", "01_full_unmasked.png"),width=1000,height=700)

ggarrange(gap,
          ggarrange(gap, countryplot, gap, townplot, gap, ncol=5, widths = c(.1, .5, .15, .5, .1)),
          gap,
          nrow = 3, heights = c(.15, .7, .1))

#Grid Left
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.134, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.175, x1 = 0.175, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.217, x1 = 0.217, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.259, x1 = 0.259, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.301, x1 = 0.301, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.343, x1 = 0.343, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.385, x1 = 0.385, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.425, x1 = 0.425, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))

grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.164, y1 = 0.164, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.194, y1 = 0.194, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.224, y1 = 0.224, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.254, y1 = 0.254, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.284, y1 = 0.284, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.314, y1 = 0.314, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.344, y1 = 0.344, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.374, y1 = 0.374, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.404, y1 = 0.404, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.434, y1 = 0.434, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.464, y1 = 0.464, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.494, y1 = 0.494, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.524, y1 = 0.524, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.554, y1 = 0.554, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.584, y1 = 0.584, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.614, y1 = 0.614, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.644, y1 = 0.644, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.674, y1 = 0.674, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.704, y1 = 0.704, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.734, y1 = 0.734, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.77, y1 = 0.77, gp = gpar(lwd = .5)))

#Grid Right
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.575, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.617, x1 = 0.617, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.657, x1 = 0.657, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.699, x1 = 0.699, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.741, x1 = 0.741, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.783, x1 = 0.783, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.825, x1 = 0.825, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.867, x1 = 0.867, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))

grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.164, y1 = 0.164, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.194, y1 = 0.194, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.224, y1 = 0.224, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.254, y1 = 0.254, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.284, y1 = 0.284, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.314, y1 = 0.314, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.344, y1 = 0.344, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.374, y1 = 0.374, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.404, y1 = 0.404, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.434, y1 = 0.434, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.464, y1 = 0.464, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.494, y1 = 0.494, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.524, y1 = 0.524, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.554, y1 = 0.554, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.584, y1 = 0.584, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.614, y1 = 0.614, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.644, y1 = 0.644, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.674, y1 = 0.674, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.704, y1 = 0.704, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.734, y1 = 0.734, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.77, y1 = 0.77, gp = gpar(lwd = .5)))

grid.draw(segmentsGrob(x0 = 0.05, x1 = .95, y0 = 0.87, y1 = 0.87))
grid.draw(segmentsGrob(x0 = 0.05, x1 = .95, y0 = 0.085, y1 = 0.085))
grid.draw(segmentsGrob(x0 = 0.05, x1 = .05, y0 = 0.085, y1 = 0.87))
grid.draw(segmentsGrob(x0 = 0.95, x1 = .95, y0 = 0.085, y1 = 0.87))

grid.draw(segmentsGrob(x0 = 0, x1 = 1, y0 = 0.9, y1 = 0.9, gp = gpar(lwd = 5)))
grid.draw(segmentsGrob(x0 = 0, x1 = 1, y0 = 0.89, y1 = 0.89))

grid.draw(textGrob("En Angleterre, en France et aux Etats - Unis", x=.5,y=.98, gp=gpar(fontsize=26, fontfamily = "serif")))
grid.draw(textGrob("durant les années 1906 à 1913.*", x=.5,y=.928, gp=gpar(fontsize=26, fontfamily = "serif")))
grid.draw(textGrob("Year:", x=.082, y=.124, gp=gpar(fontsize=14, fontfamily = "Main")))
grid.draw(textGrob("3513", x=.92, y=.05, gp=gpar(fontsize=30, fontfamily = "Main")))

grid.draw(textGrob("5.00", x=.5,y=.77, gp=gpar(fontsize=14, fontfamily = "Main")))
grid.draw(textGrob("4.00", x=.5,y=.65, gp=gpar(fontsize=14, fontfamily = "Main")))
grid.draw(textGrob("3.00", x=.5,y=.53, gp=gpar(fontsize=14, fontfamily = "Main")))
grid.draw(textGrob("2.00", x=.5,y=.41, gp=gpar(fontsize=14, fontfamily = "Main")))
grid.draw(textGrob("1.00", x=.5,y=.29, gp=gpar(fontsize=14, fontfamily = "Main")))
grid.draw(textGrob("0", x=.5,y=.17, gp=gpar(fontsize=14, fontfamily = "Main")))

grid.draw(textGrob("France", x=.155, y=.45, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.22", x=.123, y=.43, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.29", x=.185, y=.452, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.26", x=.226, y=.448, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.13", x=.267, y=.415, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.15", x=.308, y=.415, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.16", x=.345, y=.414, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.11", x=.385, y=.412, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.15", x=.426, y=.415, gp=gpar(fontsize=7, fontfamily = "Main")))

grid.draw(textGrob("United States", x=.17, y=.397, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.80", x=.123, y=.383, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.79", x=.17, y=.372, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.68", x=.226, y=.385, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.61", x=.267, y=.375, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.60", x=.308, y=.373, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.59", x=.345, y=.37, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.50", x=.385, y=.36, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.48", x=.426, y=.357, gp=gpar(fontsize=7, fontfamily = "Main")))

grid.draw(textGrob("England", x=.152, y=.35, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("& Wales", x=.152, y=.338, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.65", x=.123, y=.37, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.62", x=.176, y=.35, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.60", x=.221, y=.35, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.54", x=.26, y=.34, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.43", x=.305, y=.328, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.47", x=.342, y=.33, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.37", x=.382, y=.32, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.35", x=.423, y=.317, gp=gpar(fontsize=7, fontfamily = "Main")))


grid.draw(textGrob("Paris", x=.585, y=.73, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("4.49", x=.562, y=.71, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("4.84", x=.617, y=.735, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("4.50", x=.658, y=.725, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("4.18", x=.7, y=.685, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("4.15", x=.742, y=.673, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("4.06", x=.783, y=.665, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("3.87", x=.825, y=.65, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("3.79", x=.87, y=.637, gp=gpar(fontsize=7, fontfamily = "Main")))

grid.draw(textGrob("French Cities", x=.602, y=.58, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("3.28", x=.562, y=.558, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("3.35", x=.617, y=.555, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("3.29", x=.658, y=.569, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("3.16", x=.7, y=.557, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("3.17", x=.742, y=.557, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("3.18", x=.783, y=.56, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("3.06", x=.825, y=.543, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("3.10", x=.87, y=.548, gp=gpar(fontsize=7, fontfamily = "Main")))

grid.draw(textGrob("New York City", x=.606, y=.48, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.48", x=.562, y=.465, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.39", x=.617, y=.445, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.29", x=.658, y=.452, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.17", x=.7, y=.44, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.10", x=.742, y=.43, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.07", x=.783, y=.425, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.97", x=.825, y=.415, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.92", x=.87, y=.41, gp=gpar(fontsize=7, fontfamily = "Main")))

grid.draw(textGrob("Rural France", x=.601, y=.38, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.60", x=.565, y=.355, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.67", x=.617, y=.353, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.62", x=.658, y=.37, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.54", x=.7, y=.36, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.53", x=.742, y=.36, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.54", x=.783, y=.36, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.49", x=.825, y=.358, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.52", x=.87, y=.359, gp=gpar(fontsize=7, fontfamily = "Main")))

grid.draw(textGrob("France", x=.15, y=.055, gp=gpar(fontsize=8, fontfamily = "Main")))
grid.draw(textGrob("England and Wales", x=.18, y=.040, gp=gpar(fontsize=8, fontfamily = "Main")))
grid.draw(textGrob("United States of America", x=.195, y=.023, gp=gpar(fontsize=8, fontfamily = "Main")))
grid.draw(segmentsGrob(x0 = 0.28, x1 = 0.35, y0 = .055, y1 = .055, gp = gpar(lwd = 5, lty = "solid")))
grid.draw(segmentsGrob(x0 = 0.28, x1 = 0.35, y0 = .04, y1 = .04, gp = gpar(lwd = 5, lty = "dotdash")))
grid.draw(segmentsGrob(x0 = 0.28, x1 = 0.35, y0 = .025, y1 = .023, gp = gpar(lwd = 5, lty = "dashed")))

grid.draw(textGrob("Cities of 5000 and over", x=.68, y=.065, gp=gpar(fontsize=8, fontfamily = "Main")))
grid.draw(textGrob("Communes under 5000", x=.68, y=.05, gp=gpar(fontsize=8, fontfamily = "Main")))
grid.draw(textGrob("Paris", x=.634, y=.035, gp=gpar(fontsize=8, fontfamily = "Main")))
grid.draw(textGrob("New York", x=.648, y=.02, gp=gpar(fontsize=8, fontfamily = "Main")))
grid.draw(segmentsGrob(x0 = 0.7573, x1 = 0.8322, y0 = .0673, y1 = .0673, gp = gpar(lwd = .5, lty = "solid")))
grid.draw(segmentsGrob(x0 = 0.7573, x1 = 0.8322, y0 = .0627, y1 = .0627, gp = gpar(lwd = .5, lty = "solid")))
grid.draw(segmentsGrob(x0 = 0.7573, x1 = 0.7573, y0 = .0627, y1 = .0673, gp = gpar(lwd = .5, lty = "solid")))
grid.draw(segmentsGrob(x0 = 0.8322, x1 = 0.8322, y0 = .0627, y1 = .0673, gp = gpar(lwd = .5, lty = "solid")))
grid.draw(segmentsGrob(x0 = 0.76, x1 = 0.83, y0 = .05, y1 = .05, gp = gpar(lwd = 5, lty = "dashed")))
grid.draw(segmentsGrob(x0 = 0.76, x1 = 0.83, y0 = .035, y1 = .035, gp = gpar(lwd = 5, lty = "solid")))
grid.draw(segmentsGrob(x0 = 0.76, x1 = 0.83, y0 = .02, y1 = .02, gp = gpar(lwd = 5, lty = "dotdash")))

dev.off()



#### FIGURE 2: TRANSLATED FULL PLOT ####


png(here::here("tuberculosis-mortality", "02_full_unmasked_translated.png"),width=1000,height=700)

ggarrange(gap,
          ggarrange(gap, countryplot, gap, townplot, gap, ncol=5, widths = c(.1, .5, .15, .5, .1)),
          gap,
          nrow = 3, heights = c(.15, .7, .1))

#Grid Left
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.134, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.175, x1 = 0.175, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.217, x1 = 0.217, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.259, x1 = 0.259, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.301, x1 = 0.301, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.343, x1 = 0.343, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.385, x1 = 0.385, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.425, x1 = 0.425, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))

grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.164, y1 = 0.164, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.194, y1 = 0.194, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.224, y1 = 0.224, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.254, y1 = 0.254, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.284, y1 = 0.284, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.314, y1 = 0.314, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.344, y1 = 0.344, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.374, y1 = 0.374, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.404, y1 = 0.404, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.434, y1 = 0.434, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.464, y1 = 0.464, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.494, y1 = 0.494, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.524, y1 = 0.524, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.554, y1 = 0.554, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.584, y1 = 0.584, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.614, y1 = 0.614, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.644, y1 = 0.644, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.674, y1 = 0.674, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.704, y1 = 0.704, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.734, y1 = 0.734, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.134, x1 = 0.425, y0 = 0.77, y1 = 0.77, gp = gpar(lwd = .5)))

#Grid Right
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.575, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.617, x1 = 0.617, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.657, x1 = 0.657, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.699, x1 = 0.699, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.741, x1 = 0.741, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.783, x1 = 0.783, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.825, x1 = 0.825, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.867, x1 = 0.867, y0 = 0.164, y1 = 0.77, gp = gpar(lwd = .5)))

grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.164, y1 = 0.164, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.194, y1 = 0.194, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.224, y1 = 0.224, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.254, y1 = 0.254, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.284, y1 = 0.284, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.314, y1 = 0.314, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.344, y1 = 0.344, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.374, y1 = 0.374, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.404, y1 = 0.404, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.434, y1 = 0.434, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.464, y1 = 0.464, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.494, y1 = 0.494, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.524, y1 = 0.524, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.554, y1 = 0.554, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.584, y1 = 0.584, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.614, y1 = 0.614, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.644, y1 = 0.644, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.674, y1 = 0.674, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.704, y1 = 0.704, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.734, y1 = 0.734, gp = gpar(lwd = .5)))
grid.draw(segmentsGrob(x0 = 0.575, x1 = 0.867, y0 = 0.77, y1 = 0.77, gp = gpar(lwd = .5)))

grid.draw(segmentsGrob(x0 = 0.05, x1 = .95, y0 = 0.87, y1 = 0.87))
grid.draw(segmentsGrob(x0 = 0.05, x1 = .95, y0 = 0.085, y1 = 0.085))
grid.draw(segmentsGrob(x0 = 0.05, x1 = .05, y0 = 0.085, y1 = 0.87))
grid.draw(segmentsGrob(x0 = 0.95, x1 = .95, y0 = 0.085, y1 = 0.87))

grid.draw(segmentsGrob(x0 = 0, x1 = 1, y0 = 0.9, y1 = 0.9, gp = gpar(lwd = 5)))
grid.draw(segmentsGrob(x0 = 0, x1 = 1, y0 = 0.89, y1 = 0.89))

grid.draw(textGrob("Chart showing mortality by Tuberculosis of all forms in England,", x=.5,y=.977, gp=gpar(fontsize=26, fontfamily = "serif")))
grid.draw(textGrob("France and the United States, during the years 1906 to 1913", x=.5,y=.93, gp=gpar(fontsize=26, fontfamily = "serif")))
grid.draw(textGrob("Year:", x=.082, y=.124, gp=gpar(fontsize=14, fontfamily = "Main")))
grid.draw(textGrob("3513", x=.92, y=.05, gp=gpar(fontsize=30, fontfamily = "Main")))

grid.draw(textGrob("5.00", x=.5,y=.77, gp=gpar(fontsize=14, fontfamily = "Main")))
grid.draw(textGrob("4.00", x=.5,y=.65, gp=gpar(fontsize=14, fontfamily = "Main")))
grid.draw(textGrob("3.00", x=.5,y=.53, gp=gpar(fontsize=14, fontfamily = "Main")))
grid.draw(textGrob("2.00", x=.5,y=.41, gp=gpar(fontsize=14, fontfamily = "Main")))
grid.draw(textGrob("1.00", x=.5,y=.29, gp=gpar(fontsize=14, fontfamily = "Main")))
grid.draw(textGrob("0", x=.5,y=.17, gp=gpar(fontsize=14, fontfamily = "Main")))

grid.draw(textGrob("France", x=.155, y=.45, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.22", x=.123, y=.43, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.29", x=.185, y=.452, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.26", x=.226, y=.448, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.13", x=.267, y=.415, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.15", x=.308, y=.415, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.16", x=.345, y=.414, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.11", x=.385, y=.412, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.15", x=.426, y=.415, gp=gpar(fontsize=7, fontfamily = "Main")))

grid.draw(textGrob("United States", x=.17, y=.397, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.80", x=.123, y=.383, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.79", x=.17, y=.372, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.68", x=.226, y=.385, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.61", x=.267, y=.375, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.60", x=.308, y=.373, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.59", x=.345, y=.37, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.50", x=.385, y=.36, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.48", x=.426, y=.357, gp=gpar(fontsize=7, fontfamily = "Main")))

grid.draw(textGrob("England", x=.152, y=.35, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("& Wales", x=.152, y=.338, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.65", x=.123, y=.37, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.62", x=.176, y=.35, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.60", x=.221, y=.35, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.54", x=.26, y=.34, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.43", x=.305, y=.328, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.47", x=.342, y=.33, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.37", x=.382, y=.32, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.35", x=.423, y=.317, gp=gpar(fontsize=7, fontfamily = "Main")))


grid.draw(textGrob("Paris", x=.585, y=.73, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("4.49", x=.562, y=.71, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("4.84", x=.617, y=.735, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("4.50", x=.658, y=.725, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("4.18", x=.7, y=.685, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("4.15", x=.742, y=.673, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("4.06", x=.783, y=.665, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("3.87", x=.825, y=.65, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("3.79", x=.87, y=.637, gp=gpar(fontsize=7, fontfamily = "Main")))

grid.draw(textGrob("French Cities", x=.602, y=.58, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("3.28", x=.562, y=.558, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("3.35", x=.617, y=.555, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("3.29", x=.658, y=.569, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("3.16", x=.7, y=.557, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("3.17", x=.742, y=.557, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("3.18", x=.783, y=.56, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("3.06", x=.825, y=.543, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("3.10", x=.87, y=.548, gp=gpar(fontsize=7, fontfamily = "Main")))

grid.draw(textGrob("New York City", x=.606, y=.48, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.48", x=.562, y=.465, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.39", x=.617, y=.445, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.29", x=.658, y=.452, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.17", x=.7, y=.44, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.10", x=.742, y=.43, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("2.07", x=.783, y=.425, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.97", x=.825, y=.415, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.92", x=.87, y=.41, gp=gpar(fontsize=7, fontfamily = "Main")))

grid.draw(textGrob("Rural France", x=.601, y=.38, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.60", x=.565, y=.355, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.67", x=.617, y=.353, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.62", x=.658, y=.37, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.54", x=.7, y=.36, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.53", x=.742, y=.36, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.54", x=.783, y=.36, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.49", x=.825, y=.358, gp=gpar(fontsize=7, fontfamily = "Main")))
grid.draw(textGrob("1.52", x=.87, y=.359, gp=gpar(fontsize=7, fontfamily = "Main")))

grid.draw(textGrob("France", x=.15, y=.055, gp=gpar(fontsize=8, fontfamily = "Main")))
grid.draw(textGrob("England and Wales", x=.18, y=.040, gp=gpar(fontsize=8, fontfamily = "Main")))
grid.draw(textGrob("United States of America", x=.195, y=.023, gp=gpar(fontsize=8, fontfamily = "Main")))
grid.draw(segmentsGrob(x0 = 0.28, x1 = 0.35, y0 = .055, y1 = .055, gp = gpar(lwd = 5, lty = "solid")))
grid.draw(segmentsGrob(x0 = 0.28, x1 = 0.35, y0 = .04, y1 = .04, gp = gpar(lwd = 5, lty = "dotdash")))
grid.draw(segmentsGrob(x0 = 0.28, x1 = 0.35, y0 = .025, y1 = .023, gp = gpar(lwd = 5, lty = "dashed")))

grid.draw(textGrob("Cities of 5000 and over", x=.68, y=.065, gp=gpar(fontsize=8, fontfamily = "Main")))
grid.draw(textGrob("Towns under 5000", x=.668, y=.05, gp=gpar(fontsize=8, fontfamily = "Main")))
grid.draw(textGrob("Paris", x=.634, y=.035, gp=gpar(fontsize=8, fontfamily = "Main")))
grid.draw(textGrob("New York", x=.648, y=.02, gp=gpar(fontsize=8, fontfamily = "Main")))
grid.draw(segmentsGrob(x0 = 0.7573, x1 = 0.8322, y0 = .0673, y1 = .0673, gp = gpar(lwd = .5, lty = "solid")))
grid.draw(segmentsGrob(x0 = 0.7573, x1 = 0.8322, y0 = .0627, y1 = .0627, gp = gpar(lwd = .5, lty = "solid")))
grid.draw(segmentsGrob(x0 = 0.7573, x1 = 0.7573, y0 = .0627, y1 = .0673, gp = gpar(lwd = .5, lty = "solid")))
grid.draw(segmentsGrob(x0 = 0.8322, x1 = 0.8322, y0 = .0627, y1 = .0673, gp = gpar(lwd = .5, lty = "solid")))
grid.draw(segmentsGrob(x0 = 0.76, x1 = 0.83, y0 = .05, y1 = .05, gp = gpar(lwd = 5, lty = "dashed")))
grid.draw(segmentsGrob(x0 = 0.76, x1 = 0.83, y0 = .035, y1 = .035, gp = gpar(lwd = 5, lty = "solid")))
grid.draw(segmentsGrob(x0 = 0.76, x1 = 0.83, y0 = .02, y1 = .02, gp = gpar(lwd = 5, lty = "dotdash")))

dev.off()







