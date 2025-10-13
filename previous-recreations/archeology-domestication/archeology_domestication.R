#
# FILE:
# archeology_domestication.R
#
# DESCRIPTION:
# This code is for the Domestication of Animals Graph from Visual Capitalist. The png's include  
# different graphs for the slow reveal.  
# Source: https://www.visualcapitalist.com/the-domestication-of-animals/
#

#
# AUTHORS:
#   Alex (main code)
# Ian Curtis (2023, code to save plots)


library(ggplot2)
library(tidyverse)
library(magick)
library(cowplot)
library(grid)


# create a data frame with a single row representing the empty rectangle
df_rect <- data.frame(xmin = 0, xmax = 29, ymin = 10.4, ymax = 10.8)


#####

#### Figure 10: full unmasked ####
fig10 <- ggplot() +
  geom_rect(data = df_rect, aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax), 
            fill = "grey70", color = "black") +
  xlim(-2, 32) +
  ylim(0, 20) +
  theme_classic() +
  # Add the Dog
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/dog.png"))), xmin = -1.7, xmax = 3, ymin = 10.5, ymax = 12.5
  ) +
  # Add the goat
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/goat.png"))), xmin = 5, xmax = 8.5, ymin = 10.5, ymax = 12.5
  ) +
  # Add the cow
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/cow.png"))), xmin = 8.1, xmax = 12.5, ymin = 10, ymax = 13.2
  ) +
  # Add the cat
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/cat.png"))), xmin = 12.1, xmax = 13.1, ymin = 10.7, ymax = 11.6
  ) +
  # Add the horse
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/horse.png"))), xmin = 15, xmax = 17, ymin = 10, ymax = 13.2
  ) +
  # Add the 2 Hump camel
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/2-hump-camel.png"))), xmin = 18.8, xmax = 21.6, ymin = 9.8, ymax = 13.5
  ) +
  # Add the 1 Hump camel
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/1-hump-camel.png"))), xmin = 22.7, xmax = 25.5, ymin = 10.7, ymax = 12.4
  ) +
  # Add the 2 duck
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/duck.png"))), xmin = 27.3, xmax = 29.3, ymin = 10.7, ymax = 11.9
  ) +
  # Add the sheep
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/sheep.png"))), xmin = 3.4, xmax = 6.9, ymin = 9, ymax = 10.3
  ) +
  # Add the pig
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/pig.png"))), xmin = 7, xmax = 11.3, ymin = 9, ymax = 10.3
  )  +
  # Add the humped cow
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/hump-cow.png"))), xmin = 11.3, xmax = 13.6, ymin = 8.5, ymax = 10.8
  ) +
  # Add the llama
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/llama.png"))), xmin = 13.8, xmax = 15.8, ymin = 9.3, ymax = 10.2
  ) +
  # Add the alpaca
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/alpaca.png"))), xmin = 16.5, xmax = 18.2, ymin = 9, ymax = 10.4
  ) +
  # Add the chicken
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/chicken.png"))), xmin = 20.3, xmax = 21.1, ymin = 9, ymax = 10.4
  ) +
  # Add the turkey
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/turkey.png"))), xmin = 24.2, xmax = 25.7, ymin = 8.9, ymax = 10.6
  ) +
  # Adding the small black circles
  geom_point(aes(x = 0, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 9, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 10.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 10.9, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 12, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 13.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 17, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 18, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 19, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 20, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 20.7, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 22.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 25, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 27.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  # Adding the vertical pointing lines
  geom_segment(aes(x = 0, y = 10.1, xend = 0, yend = 11.25), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 2.3, y = 10.4, xend = 2.3, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 4.8, y = 10.4, xend = 4.8, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 7.1, y = 10.4, xend = 7.1, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 9, y = 10.4, xend = 9, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 10.9, y = 10.6, xend = 10.9, yend = 11.4), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 11.1, y = 10.1, xend = 11.1, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 12.5, y = 10.4, xend = 12.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 13.5, y = 10.4, xend = 13.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 15, y = 10.4, xend = 15, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 17, y = 10.4, xend = 17, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 19, y = 10.1, xend = 19, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 20.7, y = 9.9, xend = 20.7, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 22.5, y = 10.4, xend = 22.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 25, y = 10.1, xend = 25, yend = 10.8), color = "black", linewidth = 0.3)  +
  geom_segment(aes(x = 27.5, y = 10.4, xend = 27.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 29, y = 10, xend = 29, yend = 10.8), color = "black", linewidth = 0.3) +
  # Adding the slanting pointing lines
  geom_segment(aes(x = 5.9, y = 9.9, xend = 9, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 7.4, y = 11.5, xend = 10.5, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 9.5, y = 10, xend = 10.9, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 12.4, y = 11, xend = 11.9, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 12.9, y = 9.9, xend = 13.5, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 15.2, y = 9.7, xend = 17, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 16.4, y = 11.5, xend = 18, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 17.9, y = 10, xend = 19, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 20.1, y = 11, xend = 20, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 23.2, y = 11.5, xend = 22.5, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 27.8, y = 11.1, xend = 27.5, yend = 10.6), color = "black", linewidth = 0.3) +
  # Adding the text
  geom_text(aes(x = 0.9, y = 15, label = "Dog"), size = 4) +
  geom_text(aes(x = 6.7, y = 15, label = "Goat"), size = 4) +
  geom_text(aes(x = 10.2, y = 15, label = "Cow"), size = 4) +
  geom_text(aes(x = 12.6, y = 15, label = "Cat"), size = 4) +
  geom_text(aes(x = 16, y = 15, label = "Horse"), size = 4)  +
  geom_text(aes(x = 20.2, y = 15, label = "Camel"), size = 4) +
  geom_text(aes(x = 24.2, y = 15, label = "Camel"), size = 4) +
  geom_text(aes(x = 28.2, y = 15, label = "Duck"), size = 4) +
  geom_text(aes(x = 20.2, y = 14.3, label = "(two-humped)"), size = 4) +
  geom_text(aes(x = 24.2, y = 14.3, label = "(one-humped)"), size = 4) +
  geom_text(aes(x = 0.9, y = 13.7, label = "Eurasia"), size = 4) +
  geom_text(aes(x = 6.7, y = 13.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 10.2, y = 13.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 12.6, y = 13.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 16, y = 13.7, label = "Central Asia"), size = 4) +
  geom_text(aes(x = 20.2, y = 13, label = "Central Asia"), size = 4) +
  geom_text(aes(x = 24.2, y = 13, label = "Middle East"), size = 4) +
  geom_text(aes(x = 28.2, y = 13.7, label = "East Asia/"), size = 4) +
  geom_text(aes(x = 28.2, y = 13, label = "Middle East"), size = 4) +
  geom_text(aes(x = 10.9, y = 9.85, label = "10,000"), size = 4) +
  geom_text(aes(x = 10.9, y = 9.4, label = "years ago"), size = 3.5) +
  geom_text(aes(x = 19, y = 9.85, label = "5,000"), size = 4) +
  geom_text(aes(x = 19, y = 9.4, label = "years ago"), size = 4) +
  geom_text(aes(x = 28.65, y = 9.9, label = "Present day"), size = 4) +
  geom_text(aes(x = 5, y = 8.7, label = "Sheep"), size = 4) +
  geom_text(aes(x = 9.1, y = 8.7, label = "Pig"), size = 4) +
  geom_text(aes(x = 12.4, y = 8.7, label = "Humped Cow"), size = 4) +
  geom_text(aes(x = 15, y = 8.7, label = "Llama"), size = 4) +
  geom_text(aes(x = 17.7, y = 8.7, label = "Alpaca"), size = 4) +
  geom_text(aes(x = 20.8, y = 8.7, label = "Chicken"), size = 4) +
  geom_text(aes(x = 25, y = 8.7, label = "Turkey"), size = 4) +
  geom_text(aes(x = 5, y = 7.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 9.1, y = 7.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 12.4, y = 7.7, label = "South Asia"), size = 4) +
  geom_text(aes(x = 15, y = 7.7, label = "South"), size = 4) +
  geom_text(aes(x = 17.7, y = 7.7, label = "South"), size = 4) +
  geom_text(aes(x = 20.8, y = 7.7, label = "East Asia/"), size = 4) +
  geom_text(aes(x = 25, y = 7.7, label = "North America"), size = 4) +
  geom_text(aes(x = 15, y = 7.1, label = "America"), size = 4) +
  geom_text(aes(x = 17.7, y = 7.1, label = "America"), size = 4) +
  geom_text(aes(x = 20.8, y = 7.1, label = "Middle East"), size = 4) +
  # Adding the title
  geom_text(aes(x = 14.5, y = 15.8, 
                label = "Approximate time frame of domestication based on archeology"), 
            size = 4, fontface = "bold") +
  # Adding "source information"
  geom_text(aes(x = 1.89, y = 1, 
                label = "From"), size = 6.5) +
  geom_text(aes(x = 15.6, y = 1, 
                label = "an article on Science News on DNA evidence of plant and animal domestication"), 
            size = 6.5, color = "red") +
  geom_text(aes(x = 28.35, y = 1, 
                label = "."), size = 6.5) +
  # Remove the axis
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank())

# Saving the full plot slide 10
fig10
dev.copy(png, here::here("archeology-domestication", "10_full_unmasked.png"), width = 1340, height = 700, units = "px")
dev.off()


#####
#### Figure 9: title unmasked ####
fig09 <- ggplot() +
  geom_rect(data = df_rect, aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax), 
            fill = "grey70", color = "black") +
  xlim(-2, 32) +
  ylim(0, 20) +
  theme_classic() +
  # Add the Dog
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/dog.png"))), xmin = -1.7, xmax = 3, ymin = 10.5, ymax = 12.5
  ) +
  # Add the goat
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/goat.png"))), xmin = 5, xmax = 8.5, ymin = 10.5, ymax = 12.5
  ) +
  # Add the cow
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/cow.png"))), xmin = 8.1, xmax = 12.5, ymin = 10, ymax = 13.2
  ) +
  # Add the cat
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/cat.png"))), xmin = 12.1, xmax = 13.1, ymin = 10.7, ymax = 11.6
  ) +
  # Add the horse
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/horse.png"))), xmin = 15, xmax = 17, ymin = 10, ymax = 13.2
  ) +
  # Add the 2 Hump camel
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/2-hump-camel.png"))), xmin = 18.8, xmax = 21.6, ymin = 9.8, ymax = 13.5
  ) +
  # Add the 1 Hump camel
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/1-hump-camel.png"))), xmin = 22.7, xmax = 25.5, ymin = 10.7, ymax = 12.4
  ) +
  # Add the 2 duck
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/duck.png"))), xmin = 27.3, xmax = 29.3, ymin = 10.7, ymax = 11.9
  ) +
  # Add the sheep
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/sheep.png"))), xmin = 3.4, xmax = 6.9, ymin = 9, ymax = 10.3
  ) +
  # Add the pig
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/pig.png"))), xmin = 7, xmax = 11.3, ymin = 9, ymax = 10.3
  )  +
  # Add the humped cow
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/hump-cow.png"))), xmin = 11.3, xmax = 13.6, ymin = 8.5, ymax = 10.8
  ) +
  # Add the llama
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/llama.png"))), xmin = 13.8, xmax = 15.8, ymin = 9.3, ymax = 10.2
  ) +
  # Add the alpaca
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/alpaca.png"))), xmin = 16.5, xmax = 18.2, ymin = 9, ymax = 10.4
  ) +
  # Add the chicken
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/chicken.png"))), xmin = 20.3, xmax = 21.1, ymin = 9, ymax = 10.4
  ) +
  # Add the turkey
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/turkey.png"))), xmin = 24.2, xmax = 25.7, ymin = 8.9, ymax = 10.6
  ) +
  # Adding the small black circles
  geom_point(aes(x = 0, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 9, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 10.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 10.9, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 12, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 13.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 17, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 18, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 19, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 20, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 20.7, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 22.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 25, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 27.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  # Adding the vertical pointing lines
  geom_segment(aes(x = 0, y = 10.1, xend = 0, yend = 11.25), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 2.3, y = 10.4, xend = 2.3, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 4.8, y = 10.4, xend = 4.8, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 7.1, y = 10.4, xend = 7.1, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 9, y = 10.4, xend = 9, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 10.9, y = 10.6, xend = 10.9, yend = 11.4), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 11.1, y = 10.1, xend = 11.1, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 12.5, y = 10.4, xend = 12.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 13.5, y = 10.4, xend = 13.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 15, y = 10.4, xend = 15, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 17, y = 10.4, xend = 17, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 19, y = 10.1, xend = 19, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 20.7, y = 9.9, xend = 20.7, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 22.5, y = 10.4, xend = 22.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 25, y = 10.1, xend = 25, yend = 10.8), color = "black", linewidth = 0.3)  +
  geom_segment(aes(x = 27.5, y = 10.4, xend = 27.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 29, y = 10, xend = 29, yend = 10.8), color = "black", linewidth = 0.3) +
  # Adding the slanting pointing lines
  geom_segment(aes(x = 5.9, y = 9.9, xend = 9, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 7.4, y = 11.5, xend = 10.5, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 9.5, y = 10, xend = 10.9, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 12.4, y = 11, xend = 11.9, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 12.9, y = 9.9, xend = 13.5, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 15.2, y = 9.7, xend = 17, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 16.4, y = 11.5, xend = 18, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 17.9, y = 10, xend = 19, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 20.1, y = 11, xend = 20, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 23.2, y = 11.5, xend = 22.5, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 27.8, y = 11.1, xend = 27.5, yend = 10.6), color = "black", linewidth = 0.3) +
  # Adding the text
  geom_text(aes(x = 0.9, y = 13.7, label = "Eurasia"), size = 4) +
  geom_text(aes(x = 6.7, y = 13.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 10.2, y = 13.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 12.6, y = 13.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 16, y = 13.7, label = "Central Asia"), size = 4) +
  geom_text(aes(x = 20.2, y = 13, label = "Central Asia"), size = 4) +
  geom_text(aes(x = 24.2, y = 13, label = "Middle East"), size = 4) +
  geom_text(aes(x = 28.2, y = 13.7, label = "East Asia/"), size = 4) +
  geom_text(aes(x = 28.2, y = 13, label = "Middle East"), size = 4) +
  geom_text(aes(x = 10.9, y = 9.85, label = "10,000"), size = 4) +
  geom_text(aes(x = 10.9, y = 9.4, label = "years ago"), size = 3.5) +
  geom_text(aes(x = 19, y = 9.85, label = "5,000"), size = 4) +
  geom_text(aes(x = 19, y = 9.4, label = "years ago"), size = 4) +
  geom_text(aes(x = 28.65, y = 9.9, label = "Present day"), size = 4) +
  geom_text(aes(x = 5, y = 7.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 9.1, y = 7.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 12.4, y = 7.7, label = "South Asia"), size = 4) +
  geom_text(aes(x = 15, y = 7.7, label = "South"), size = 4) +
  geom_text(aes(x = 17.7, y = 7.7, label = "South"), size = 4) +
  geom_text(aes(x = 20.8, y = 7.7, label = "East Asia/"), size = 4) +
  geom_text(aes(x = 25, y = 7.7, label = "North America"), size = 4) +
  geom_text(aes(x = 15, y = 7.1, label = "America"), size = 4) +
  geom_text(aes(x = 17.7, y = 7.1, label = "America"), size = 4) +
  geom_text(aes(x = 20.8, y = 7.1, label = "Middle East"), size = 4) +
  # Adding the title
  geom_text(aes(x = 14.5, y = 15.8, 
                label = "Approximate time frame of domestication based on archeology"), 
            size = 4, fontface = "bold") +
  # Remove the axis
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank())


# Saving the slide9 Plot
fig09
dev.copy(png, here::here("archeology-domestication", "09_title_unmasked.png"), width = 1340, height = 700, units = "px")
dev.off()


###
#### Figure 8: add second round of animals ####
fig08 <- ggplot() +
  geom_rect(data = df_rect, aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax), 
            fill = "grey70", color = "black") +
  xlim(-2, 32) +
  ylim(0, 20) +
  theme_classic() +
  # Add the Dog
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/dog.png"))), xmin = -1.7, xmax = 3, ymin = 10.5, ymax = 12.5
  ) +
  # Add the goat
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/goat.png"))), xmin = 5, xmax = 8.5, ymin = 10.5, ymax = 12.5
  ) +
  # Add the cow
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/cow.png"))), xmin = 8.1, xmax = 12.5, ymin = 10, ymax = 13.2
  ) +
  # Add the cat
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/cat.png"))), xmin = 12.1, xmax = 13.1, ymin = 10.7, ymax = 11.6
  ) +
  # Add the horse
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/horse.png"))), xmin = 15, xmax = 17, ymin = 10, ymax = 13.2
  ) +
  # Add the 2 Hump camel
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/2-hump-camel.png"))), xmin = 18.8, xmax = 21.6, ymin = 9.8, ymax = 13.5
  ) +
  # Add the 1 Hump camel
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/1-hump-camel.png"))), xmin = 22.7, xmax = 25.5, ymin = 10.7, ymax = 12.4
  ) +
  # Add the 2 duck
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/duck.png"))), xmin = 27.3, xmax = 29.3, ymin = 10.7, ymax = 11.9
  ) +
  # Add the sheep
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/sheep.png"))), xmin = 3.4, xmax = 6.9, ymin = 9, ymax = 10.3
  ) +
  # Add the pig
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/pig.png"))), xmin = 7, xmax = 11.3, ymin = 9, ymax = 10.3
  )  +
  # Add the humped cow
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/hump-cow.png"))), xmin = 11.3, xmax = 13.6, ymin = 8.5, ymax = 10.8
  ) +
  # Add the llama
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/llama.png"))), xmin = 13.8, xmax = 15.8, ymin = 9.3, ymax = 10.2
  ) +
  # Add the alpaca
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/alpaca.png"))), xmin = 16.5, xmax = 18.2, ymin = 9, ymax = 10.4
  ) +
  # Add the chicken
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/chicken.png"))), xmin = 20.3, xmax = 21.1, ymin = 9, ymax = 10.4
  ) +
  # Add the turkey
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/turkey.png"))), xmin = 24.2, xmax = 25.7, ymin = 8.9, ymax = 10.6
  ) +
  # Adding the small black circles
  geom_point(aes(x = 0, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 9, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 10.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 10.9, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 12, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 13.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 17, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 18, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 19, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 20, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 20.7, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 22.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 25, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 27.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  # Adding the vertical pointing lines
  geom_segment(aes(x = 0, y = 10.1, xend = 0, yend = 11.25), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 2.3, y = 10.4, xend = 2.3, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 4.8, y = 10.4, xend = 4.8, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 7.1, y = 10.4, xend = 7.1, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 9, y = 10.4, xend = 9, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 10.9, y = 10.6, xend = 10.9, yend = 11.4), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 11.1, y = 10.1, xend = 11.1, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 12.5, y = 10.4, xend = 12.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 13.5, y = 10.4, xend = 13.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 15, y = 10.4, xend = 15, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 17, y = 10.4, xend = 17, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 19, y = 10.1, xend = 19, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 20.7, y = 9.9, xend = 20.7, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 22.5, y = 10.4, xend = 22.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 25, y = 10.1, xend = 25, yend = 10.8), color = "black", linewidth = 0.3)  +
  geom_segment(aes(x = 27.5, y = 10.4, xend = 27.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 29, y = 10, xend = 29, yend = 10.8), color = "black", linewidth = 0.3) +
  # Adding the slanting pointing lines
  geom_segment(aes(x = 5.9, y = 9.9, xend = 9, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 7.4, y = 11.5, xend = 10.5, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 9.5, y = 10, xend = 10.9, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 12.4, y = 11, xend = 11.9, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 12.9, y = 9.9, xend = 13.5, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 15.2, y = 9.7, xend = 17, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 16.4, y = 11.5, xend = 18, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 17.9, y = 10, xend = 19, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 20.1, y = 11, xend = 20, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 23.2, y = 11.5, xend = 22.5, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 27.8, y = 11.1, xend = 27.5, yend = 10.6), color = "black", linewidth = 0.3) +
  # Adding the text
  geom_text(aes(x = 0.9, y = 13.7, label = "Eurasia"), size = 4) +
  geom_text(aes(x = 6.7, y = 13.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 10.2, y = 13.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 12.6, y = 13.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 16, y = 13.7, label = "Central Asia"), size = 4) +
  geom_text(aes(x = 20.2, y = 13, label = "Central Asia"), size = 4) +
  geom_text(aes(x = 24.2, y = 13, label = "Middle East"), size = 4) +
  geom_text(aes(x = 28.2, y = 13.7, label = "East Asia/"), size = 4) +
  geom_text(aes(x = 28.2, y = 13, label = "Middle East"), size = 4) +
  geom_text(aes(x = 10.9, y = 9.85, label = "10,000"), size = 4) +
  geom_text(aes(x = 10.9, y = 9.4, label = "years ago"), size = 3.5) +
  geom_text(aes(x = 19, y = 9.85, label = "5,000"), size = 4) +
  geom_text(aes(x = 19, y = 9.4, label = "years ago"), size = 4) +
  geom_text(aes(x = 28.65, y = 9.9, label = "Present day"), size = 4) +
  geom_text(aes(x = 5, y = 7.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 9.1, y = 7.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 12.4, y = 7.7, label = "South Asia"), size = 4) +
  geom_text(aes(x = 15, y = 7.7, label = "South"), size = 4) +
  geom_text(aes(x = 17.7, y = 7.7, label = "South"), size = 4) +
  geom_text(aes(x = 20.8, y = 7.7, label = "East Asia/"), size = 4) +
  geom_text(aes(x = 25, y = 7.7, label = "North America"), size = 4) +
  geom_text(aes(x = 15, y = 7.1, label = "America"), size = 4) +
  geom_text(aes(x = 17.7, y = 7.1, label = "America"), size = 4) +
  geom_text(aes(x = 20.8, y = 7.1, label = "Middle East"), size = 4) +
  # Remove the axis
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank())


# Saving the slide8 Plot
fig08
dev.copy(png, here::here("archeology-domestication", "08_animals2_unmasked.png"), width = 1340, height = 700, units = "px")
dev.off()



#### Figure 7: second round of animals unmasked ####
fig07 <- ggplot() +
  geom_rect(data = df_rect, aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax), 
            fill = "grey70", color = "black") +
  xlim(-2, 32) +
  ylim(0, 20) +
  theme_classic() +
  # Add the Dog
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/dog.png"))), xmin = -1.7, xmax = 3, ymin = 10.5, ymax = 12.5
  ) +
  # Add the goat
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/goat.png"))), xmin = 5, xmax = 8.5, ymin = 10.5, ymax = 12.5
  ) +
  # Add the 2 Hump camel
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/2-hump-camel.png"))), xmin = 18.8, xmax = 21.6, ymin = 9.8, ymax = 13.5
  ) +
  # Add the 1 Hump camel
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/1-hump-camel.png"))), xmin = 22.7, xmax = 25.5, ymin = 10.7, ymax = 12.4
  ) +
  # Add the alpaca
  annotation_custom(
    rasterGrob(image_read(here::here("archeology-domestication/img/alpaca.png"))), xmin = 16.5, xmax = 18.2, ymin = 9, ymax = 10.4
  ) +
  # Adding the small black circles
  geom_point(aes(x = 0, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 9, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 10.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 10.9, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 12, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 13.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 17, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 18, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 19, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 20, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 20.7, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 22.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 25, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 27.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  # Adding the vertical pointing lines
  geom_segment(aes(x = 0, y = 10.1, xend = 0, yend = 11.25), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 2.3, y = 10.4, xend = 2.3, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 4.8, y = 10.4, xend = 4.8, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 7.1, y = 10.4, xend = 7.1, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 9, y = 10.4, xend = 9, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 11.1, y = 10.1, xend = 11.1, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 12.5, y = 10.4, xend = 12.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 13.5, y = 10.4, xend = 13.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 15, y = 10.4, xend = 15, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 17, y = 10.4, xend = 17, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 19, y = 10.1, xend = 19, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 22.5, y = 10.4, xend = 22.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 27.5, y = 10.4, xend = 27.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 29, y = 10, xend = 29, yend = 10.8), color = "black", linewidth = 0.3) +
  # Add the slanting lines
  geom_segment(aes(x = 7.4, y = 11.5, xend = 10.5, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 17.9, y = 10, xend = 19, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 20.1, y = 11, xend = 20, yend = 10.6), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 23.2, y = 11.5, xend = 22.5, yend = 10.6), color = "black", linewidth = 0.3) +
  # Adding the text
  geom_text(aes(x = 0.9, y = 13.7, label = "Eurasia"), size = 4) +
  geom_text(aes(x = 6.7, y = 13.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 10.2, y = 13.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 12.6, y = 13.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 16, y = 13.7, label = "Central Asia"), size = 4) +
  geom_text(aes(x = 20.2, y = 13, label = "Central Asia"), size = 4) +
  geom_text(aes(x = 24.2, y = 13, label = "Middle East"), size = 4) +
  geom_text(aes(x = 28.2, y = 13.7, label = "East Asia/"), size = 4) +
  geom_text(aes(x = 28.2, y = 13, label = "Middle East"), size = 4) +
  geom_text(aes(x = 10.9, y = 9.85, label = "10,000"), size = 4) +
  geom_text(aes(x = 10.9, y = 9.4, label = "years ago"), size = 3.5) +
  geom_text(aes(x = 19, y = 9.85, label = "5,000"), size = 4) +
  geom_text(aes(x = 19, y = 9.4, label = "years ago"), size = 4) +
  geom_text(aes(x = 28.65, y = 9.9, label = "Present day"), size = 4) +
  geom_text(aes(x = 5, y = 7.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 9.1, y = 7.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 12.4, y = 7.7, label = "South Asia"), size = 4) +
  geom_text(aes(x = 15, y = 7.7, label = "South"), size = 4) +
  geom_text(aes(x = 17.7, y = 7.7, label = "South"), size = 4) +
  geom_text(aes(x = 20.8, y = 7.7, label = "East Asia/"), size = 4) +
  geom_text(aes(x = 25, y = 7.7, label = "North America"), size = 4) +
  geom_text(aes(x = 15, y = 7.1, label = "America"), size = 4) +
  geom_text(aes(x = 17.7, y = 7.1, label = "America"), size = 4) +
  geom_text(aes(x = 20.8, y = 7.1, label = "Middle East"), size = 4) +
  # Remove the axis
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank())



# Saving the slide7 Plot
fig07
dev.copy(png, here::here("archeology-domestication", "07_animals1_unmasked.png"), width = 1340, height = 700, units = "px")
dev.off()



#### Figure 6: 3rd round of countries added ####
fig06 <- ggplot() +
  geom_rect(data = df_rect, aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax), 
            fill = "grey70", color = "black") +
  xlim(-2, 32) +
  ylim(0, 20) +
  theme_classic() +
  # Adding the small black circles
  geom_point(aes(x = 0, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 9, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 10.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 10.9, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 12, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 13.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 17, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 18, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 19, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 20, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 20.7, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 22.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 25, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 27.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  # Adding the vertical pointing lines
  geom_segment(aes(x = 0, y = 10.1, xend = 0, yend = 11.25), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 2.3, y = 10.4, xend = 2.3, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 4.8, y = 10.4, xend = 4.8, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 7.1, y = 10.4, xend = 7.1, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 9, y = 10.4, xend = 9, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 11.1, y = 10.1, xend = 11.1, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 12.5, y = 10.4, xend = 12.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 13.5, y = 10.4, xend = 13.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 15, y = 10.4, xend = 15, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 17, y = 10.4, xend = 17, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 19, y = 10.1, xend = 19, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 22.5, y = 10.4, xend = 22.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 27.5, y = 10.4, xend = 27.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 29, y = 10, xend = 29, yend = 10.8), color = "black", linewidth = 0.3) +
  # Adding the text
  geom_text(aes(x = 0.9, y = 13.7, label = "Eurasia"), size = 4) +
  geom_text(aes(x = 6.7, y = 13.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 10.2, y = 13.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 12.6, y = 13.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 16, y = 13.7, label = "Central Asia"), size = 4) +
  geom_text(aes(x = 20.2, y = 13, label = "Central Asia"), size = 4) +
  geom_text(aes(x = 24.2, y = 13, label = "Middle East"), size = 4) +
  geom_text(aes(x = 28.2, y = 13.7, label = "East Asia/"), size = 4) +
  geom_text(aes(x = 28.2, y = 13, label = "Middle East"), size = 4) +
  geom_text(aes(x = 10.9, y = 9.85, label = "10,000"), size = 4) +
  geom_text(aes(x = 10.9, y = 9.4, label = "years ago"), size = 3.5) +
  geom_text(aes(x = 19, y = 9.85, label = "5,000"), size = 4) +
  geom_text(aes(x = 19, y = 9.4, label = "years ago"), size = 4) +
  geom_text(aes(x = 28.65, y = 9.9, label = "Present day"), size = 4) +
  geom_text(aes(x = 5, y = 7.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 9.1, y = 7.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 12.4, y = 7.7, label = "South Asia"), size = 4) +
  geom_text(aes(x = 15, y = 7.7, label = "South"), size = 4) +
  geom_text(aes(x = 17.7, y = 7.7, label = "South"), size = 4) +
  geom_text(aes(x = 20.8, y = 7.7, label = "East Asia/"), size = 4) +
  geom_text(aes(x = 25, y = 7.7, label = "North America"), size = 4) +
  geom_text(aes(x = 15, y = 7.1, label = "America"), size = 4) +
  geom_text(aes(x = 17.7, y = 7.1, label = "America"), size = 4) +
  geom_text(aes(x = 20.8, y = 7.1, label = "Middle East"), size = 4) +
  # Remove the axis
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank())



# Saving the slide6 Plot
fig06
dev.copy(png, here::here("archeology-domestication", "06_countries3_unmasked.png"), width = 1340, height = 700, units = "px")
dev.off()



#### Figure 5: 2nd round of countries revealed ####
fig05 <- ggplot() +
  geom_rect(data = df_rect, aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax), 
            fill = "grey70", color = "black") +
  xlim(-2, 32) +
  ylim(0, 20) +
  theme_classic() +
  # Adding the small black circles
  geom_point(aes(x = 0, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 9, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 10.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 10.9, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 12, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 13.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 17, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 18, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 19, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 20, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 20.7, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 22.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 25, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 27.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  # Adding the vertical pointing lines
  geom_segment(aes(x = 0, y = 10.1, xend = 0, yend = 11.25), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 2.3, y = 10.4, xend = 2.3, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 4.8, y = 10.4, xend = 4.8, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 7.1, y = 10.4, xend = 7.1, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 9, y = 10.4, xend = 9, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 11.1, y = 10.1, xend = 11.1, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 12.5, y = 10.4, xend = 12.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 13.5, y = 10.4, xend = 13.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 15, y = 10.4, xend = 15, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 17, y = 10.4, xend = 17, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 19, y = 10.1, xend = 19, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 22.5, y = 10.4, xend = 22.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 27.5, y = 10.4, xend = 27.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 29, y = 10, xend = 29, yend = 10.8), color = "black", linewidth = 0.3) +
  # Adding the text
  geom_text(aes(x = 0.9, y = 13.7, label = "Eurasia"), size = 4) +
  geom_text(aes(x = 6.7, y = 13.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 10.2, y = 13.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 12.6, y = 13.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 16, y = 13.7, label = "Central Asia"), size = 4) +
  geom_text(aes(x = 20.2, y = 13, label = "Central Asia"), size = 4) +
  geom_text(aes(x = 24.2, y = 13, label = "Middle East"), size = 4) +
  geom_text(aes(x = 28.2, y = 13.7, label = "East Asia/"), size = 4) +
  geom_text(aes(x = 28.2, y = 13, label = "Middle East"), size = 4) +
  geom_text(aes(x = 10.9, y = 9.85, label = "10,000"), size = 4) +
  geom_text(aes(x = 10.9, y = 9.4, label = "years ago"), size = 3.5) +
  geom_text(aes(x = 19, y = 9.85, label = "5,000"), size = 4) +
  geom_text(aes(x = 19, y = 9.4, label = "years ago"), size = 4) +
  geom_text(aes(x = 28.65, y = 9.9, label = "Present day"), size = 4) +
  geom_text(aes(x = 5, y = 7.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 9.1, y = 7.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 12.4, y = 7.7, label = "South Asia"), size = 4) +
  geom_text(aes(x = 20.8, y = 7.7, label = "East Asia/"), size = 4) +
  geom_text(aes(x = 20.8, y = 7.1, label = "Middle East"), size = 4) +
  # Remove the axis
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank())



# Saving the slide5 Plot
fig05
dev.copy(png, here::here("archeology-domestication", "05_countries2_unmasked.png"), width = 1340, height = 700, units = "px")
dev.off()



#### Figure 4: 1st round of countries revealed ####
fig04 <- ggplot() +
  geom_rect(data = df_rect, aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax), 
            fill = "grey70", color = "black") +
  xlim(-2, 32) +
  ylim(0, 20) +
  theme_classic() +
  # Adding the small black circles
  geom_point(aes(x = 0, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 9, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 10.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 10.9, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 12, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 13.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 17, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 18, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 19, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 20, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 20.7, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 22.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 25, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 27.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  # Adding the vertical pointing lines
  geom_segment(aes(x = 0, y = 10.1, xend = 0, yend = 11.25), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 2.3, y = 10.4, xend = 2.3, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 4.8, y = 10.4, xend = 4.8, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 7.1, y = 10.4, xend = 7.1, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 9, y = 10.4, xend = 9, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 11.1, y = 10.1, xend = 11.1, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 12.5, y = 10.4, xend = 12.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 13.5, y = 10.4, xend = 13.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 15, y = 10.4, xend = 15, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 17, y = 10.4, xend = 17, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 19, y = 10.1, xend = 19, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 22.5, y = 10.4, xend = 22.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 27.5, y = 10.4, xend = 27.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 29, y = 10, xend = 29, yend = 10.8), color = "black", linewidth = 0.3) +
  # Adding the text
  geom_text(aes(x = 6.7, y = 13.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 10.2, y = 13.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 12.6, y = 13.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 24.2, y = 13, label = "Middle East"), size = 4) +
  geom_text(aes(x = 10.9, y = 9.85, label = "10,000"), size = 4) +
  geom_text(aes(x = 10.9, y = 9.4, label = "years ago"), size = 3.5) +
  geom_text(aes(x = 19, y = 9.85, label = "5,000"), size = 4) +
  geom_text(aes(x = 19, y = 9.4, label = "years ago"), size = 4) +
  geom_text(aes(x = 28.65, y = 9.9, label = "Present day"), size = 4) +
  geom_text(aes(x = 5, y = 7.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 9.1, y = 7.7, label = "Middle East"), size = 4) +
  geom_text(aes(x = 20.8, y = 7.7, label = "East Asia/"), size = 4) +
  geom_text(aes(x = 20.8, y = 7.1, label = "Middle East"), size = 4) +
  # Remove the axis
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank())



# Saving the slide4 Plot
fig04
dev.copy(png, here::here("archeology-domestication", "04_countries1_unmasked.png"), width = 1340, height = 700, units = "px")
dev.off()



#### Figure 3: years revealed ####
fig03 <- ggplot() +
  geom_rect(data = df_rect, aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax), 
            fill = "grey70", color = "black") +
  xlim(-2, 32) +
  ylim(0, 20) +
  theme_classic() +
  # Adding the small black circles
  geom_point(aes(x = 0, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 9, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 10.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 10.9, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 12, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 13.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 17, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 18, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 19, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 20, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 20.7, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 22.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 25, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 27.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  # Adding the vertical pointing lines
  geom_segment(aes(x = 0, y = 10.1, xend = 0, yend = 11.25), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 2.3, y = 10.4, xend = 2.3, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 4.8, y = 10.4, xend = 4.8, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 7.1, y = 10.4, xend = 7.1, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 9, y = 10.4, xend = 9, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 11.1, y = 10.1, xend = 11.1, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 12.5, y = 10.4, xend = 12.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 13.5, y = 10.4, xend = 13.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 15, y = 10.4, xend = 15, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 17, y = 10.4, xend = 17, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 19, y = 10.1, xend = 19, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 22.5, y = 10.4, xend = 22.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 27.5, y = 10.4, xend = 27.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 29, y = 10, xend = 29, yend = 10.8), color = "black", linewidth = 0.3) +
  # Adding the text
  geom_text(aes(x = 10.9, y = 9.85, label = "10,000"), size = 4) +
  geom_text(aes(x = 10.9, y = 9.4, label = "years ago"), size = 3.5) +
  geom_text(aes(x = 19, y = 9.85, label = "5,000"), size = 4) +
  geom_text(aes(x = 19, y = 9.4, label = "years ago"), size = 4) +
  geom_text(aes(x = 28.65, y = 9.9, label = "Present day"), size = 4) +
  # Remove the axis
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank())



# Saving the full plot slide3 Plot
fig03
dev.copy(png, here::here("archeology-domestication", "03_years_unmasked.png"), width = 1340, height = 700, units = "px")
dev.off()



#### Figure 2: circles revealed #### 
fig02 <- ggplot() +
  geom_rect(data = df_rect, aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax), 
            fill = "grey70", color = "black") +
  xlim(-2, 32) +
  ylim(0, 20) +
  theme_classic() +
  # Adding the small black circles
  geom_point(aes(x = 0, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 9, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 10.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 10.9, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 12, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 13.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 17, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 18, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 19, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 20, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 20.7, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 22.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 25, y = 10.6), shape = 19, fill = "black", size = 2) +
  geom_point(aes(x = 27.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  # Adding the vertical pointing lines
  geom_segment(aes(x = 2.3, y = 10.4, xend = 2.3, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 4.8, y = 10.4, xend = 4.8, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 7.1, y = 10.4, xend = 7.1, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 9, y = 10.4, xend = 9, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 12.5, y = 10.4, xend = 12.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 13.5, y = 10.4, xend = 13.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 15, y = 10.4, xend = 15, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 17, y = 10.4, xend = 17, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 22.5, y = 10.4, xend = 22.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 27.5, y = 10.4, xend = 27.5, yend = 10.8), color = "black", linewidth = 0.3) +
  # Remove the axis
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank())



# Saving the slide2 Plot
fig02
dev.copy(png, here::here("archeology-domestication", "02_circles_unmasked.png"), width = 1340, height = 700, units = "px")
dev.off()

#### Figure 1: full masked ####

fig01 <- ggplot() +
  geom_rect(data = df_rect, aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax), 
            fill = "grey70", color = "black") +
  xlim(-2, 32) +
  ylim(0, 20) +
  theme_classic() +
  # Adding the small black circles
  # geom_point(aes(x = 0, y = 10.6), shape = 19, fill = "black", size = 2) +
  # geom_point(aes(x = 9, y = 10.6), shape = 19, fill = "black", size = 2) +
  # geom_point(aes(x = 10.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  # geom_point(aes(x = 10.9, y = 10.6), shape = 19, fill = "black", size = 2) +
  # geom_point(aes(x = 12, y = 10.6), shape = 19, fill = "black", size = 2) +
  # geom_point(aes(x = 13.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  # geom_point(aes(x = 17, y = 10.6), shape = 19, fill = "black", size = 2) +
  # geom_point(aes(x = 18, y = 10.6), shape = 19, fill = "black", size = 2) +
  # geom_point(aes(x = 19, y = 10.6), shape = 19, fill = "black", size = 2) +
  # geom_point(aes(x = 20, y = 10.6), shape = 19, fill = "black", size = 2) +
  # geom_point(aes(x = 20.7, y = 10.6), shape = 19, fill = "black", size = 2) +
  # geom_point(aes(x = 22.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  # geom_point(aes(x = 25, y = 10.6), shape = 19, fill = "black", size = 2) +
  # geom_point(aes(x = 27.5, y = 10.6), shape = 19, fill = "black", size = 2) +
  # Adding the vertical pointing lines
  geom_segment(aes(x = 2.3, y = 10.4, xend = 2.3, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 4.8, y = 10.4, xend = 4.8, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 7.1, y = 10.4, xend = 7.1, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 9, y = 10.4, xend = 9, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 12.5, y = 10.4, xend = 12.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 13.5, y = 10.4, xend = 13.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 15, y = 10.4, xend = 15, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 17, y = 10.4, xend = 17, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 22.5, y = 10.4, xend = 22.5, yend = 10.8), color = "black", linewidth = 0.3) +
  geom_segment(aes(x = 27.5, y = 10.4, xend = 27.5, yend = 10.8), color = "black", linewidth = 0.3) +
  # Remove the axis
  theme(axis.line = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank())



# Saving the slide2 Plot
fig01
dev.copy(png, here::here("archeology-domestication", "01_full_masked.png"), width = 1340, height = 700, units = "px")
dev.off()










