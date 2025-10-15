#
# FILE:
# rural_pop_rates.R
#
# DESCRIPTION
# Increase or Decrease of the rural population
# https://www.loc.gov/resource/g3701gm.gct00010/?sp=22&r=-0.182,0.083,1.465,0.589,0
#
#
# AUTHORS:
#   Alex Gichuki (main code)
# 



###############################################################

# THIS CODE IS NOT COMPLETE AS IMAGES ARE MISSING AS OF 07/2023

###############################################################


# Setup
library(usmap)
library(maps)
library(mapdata)
library(ggplot2)
library(showtext)
library(tidyverse)
library(magick)
library(ggpubr)
library(cowplot)
library(pacman)
library(grid)
library(ggpubr)

# fonts
font_add_google("Puritan", "Puritan")
showtext_auto()

image1 <- image_read("C:/Users/User/OneDrive/Desktop/GA/Job/Negro Stats 22-23/Increase or decrease of the rural population 1880 to 1890 image 1.jpg")
print(image1)

image2 <- rasterGrob(image1, interpolate = TRUE)

# data frame from mapdata library
state <- map_data("state")
state


map <- ggplot(data = state, aes(x=long, y=lat, group = group)) +
  #coord_map("azequidistant") +
  annotation_raster(image1, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  scale_x_continuous(breaks = seq(-125,65, by = 2))+
  scale_y_continuous(breaks = seq(26,50, by = 2)) +
  geom_polygon(color = "black", fill = "white") +
  geom_vline(xintercept = -125:-65 , linetype = "solid", 
             color = "gray21", linewidth = 0.6, alpha = 0.2) +
  geom_hline(yintercept = 26:50, linetype = "solid", 
             color = "gray21", linewidth = 0.6, alpha = 0.2) +
  labs(x = NULL, y = NULL) +
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank())
map





plt <- ggplot(data = state, aes(x=long, y=lat, group = group)) +
  coord_map("azequidistant") +
  #background_image(image1) +
  scale_x_continuous(breaks = seq(-125,65, by = 2))+
  scale_y_continuous(breaks = seq(26,50, by = 2)) +
  geom_polygon(color = "black", fill = "white") +
  geom_vline(xintercept = -125:-65 , linetype = "solid", 
             color = "gray21", linewidth = 0.6, alpha = 0.2) +
  geom_hline(yintercept = 26:50, linetype = "solid", 
             color = "gray21", linewidth = 0.6, alpha = 0.2) +
  labs(x = NULL, y = NULL) +
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank())

plt


plt1 <- ggdraw(plt)

plt1 + draw_grob(image2, 0.4, 0.48, 0.07, 0.07)






view(state)
minus_mi <- state[!(state$region == "michigan"),]
minus_mi

minus_mi_map <- ggplot(data = minus_mi, aes(x=long, y=lat, group = group)) +
  annotation_raster(image1, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +
  scale_x_continuous(breaks = seq(-125,65, by = 2))+
  scale_y_continuous(breaks = seq(26,50, by = 2)) +
  geom_polygon(fill = "white") +
  geom_polygon(color = "black", alpha = 0.4) +
  #coord_map("azequidistant") +
  geom_vline(xintercept = -125:-65 , linetype = "solid", 
             color = "gray21", linewidth = 0.6, alpha = 0.2) +
  geom_hline(yintercept = 26:50, linetype = "solid", 
             color = "gray21", linewidth = 0.6, alpha = 0.2) +
  labs(x = NULL, y = NULL) +
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank())

minus_mi_map



#################### pacman
pic <- jpeg::readJPEG("Increase or decrease of the rural population 1880 to 1890 image 1.jpg")


ggplot(data = state, aes(x=long, y=lat, group = group)) +
  annotation_custom(rasterGrob(pic,
                               width = unit(1,"npc"),
                               height = unit(1,"npc")),
                    -Inf, Inf, -Inf, Inf) +
  scale_x_continuous(breaks = seq(-125,65, by = 2))+
  scale_y_continuous(breaks = seq(26,50, by = 2)) +
  geom_polygon(color = "black", fill = "white") +
  #coord_map("azequidistant") +
  geom_vline(xintercept = -125:-65 , linetype = "solid", 
             color = "gray21", linewidth = 0.6, alpha = 0.2) +
  geom_hline(yintercept = 26:50, linetype = "solid", 
             color = "gray21", linewidth = 0.6, alpha = 0.2) +
  labs(x = NULL, y = NULL) +
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank())


p <- ggplot() +
  annotation_custom(rasterGrob(pic,
                               width = unit(1,"npc"),
                               height = unit(1,"npc")),
                    -Inf, Inf, -Inf, Inf)
ggsave("p.png")


p + 
  ggplot(data = state, aes(x=long, y=lat, group = group)) +
  scale_x_continuous(breaks = seq(-125,65, by = 2))+
  scale_y_continuous(breaks = seq(26,50, by = 2)) +
  geom_polygon(color = "black", fill = "white") +
  #coord_map("azequidistant") +
  geom_vline(xintercept = -125:-65 , linetype = "solid", 
             color = "gray21", linewidth = 0.6, alpha = 0.2) +
  geom_hline(yintercept = 26:50, linetype = "solid", 
             color = "gray21", linewidth = 0.6, alpha = 0.2) +
  labs(x = NULL, y = NULL) +
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank())
