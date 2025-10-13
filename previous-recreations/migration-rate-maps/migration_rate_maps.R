#
# FILE:
# migration_rate_maps.R
#
# DESCRIPTION:
# This code is for Internal Migration Graph by State from the U.S. Census Bureau. The png's include   
# different maps being created into the final png named "Migration Rate Map.png".   
# Source: https://www.census.gov/content/dam/Census/library/publications/2007/dec/7_migration.pdf (page 3)
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC
#
# AUTHORS:
#   Robert Bilyk (main code)
#   Ian Curtis (2023, code to save plots)

library(tidyverse)
library(usmap)
library(readxl)
library(showtext)
library(maps)
library(mapdata)
library(ggpubr)
library(magick)
library(grid)



#### importing fonts ####
font_add_google(name = "Encode Sans", family = "Main")
font_add_google(name = "Bree Serif", family = "alt")

showtext_auto()



##### creating alaska pngs for map ####
png(here::here("migration-rate-maps", "minor-areas", "alaska1.png"),width=120,height=80)
alaska1 <- plot_usmap(
  regions = c("state"),
  include = c("Alaska"),
  color = "black",
  fill = "#c5c9cc") +
  theme(plot.background = element_rect(fill = "#e3f4fe", color = "#e3f4fe"))
alaska1
dev.off()


png(here::here("migration-rate-maps", "minor-areas", "alaska2.png"),width=120,height=80)
alaska2 <- plot_usmap(
  regions = c("state"),
  include = c("Alaska"),
  color = "black",
  fill = "#00867c") +
  theme(plot.background = element_rect(fill = "#e3f4fe", color = "#e3f4fe"))
alaska2
dev.off()


png(here::here("migration-rate-maps", "minor-areas", "alaska3.png"),width=120,height=80)
alaska3 <- plot_usmap(
  regions = c("state"),
  include = c("Alaska"),
  color = "black",
  fill = "#ba7733") +
  theme(plot.background = element_rect(fill = "#e3f4fe", color = "#e3f4fe"))
alaska3
dev.off()



#### creating hawaii pngs for map ####
png(here::here("migration-rate-maps", "minor-areas", "hawaii1.png"),width=65,height=50)
hawaii1 <- plot_usmap(
  regions = c("state"),
  include = c("Hawaii"),
  color = "black",
  fill = "#c5c9cc") +
  theme(plot.background = element_rect(fill = "#e3f4fe", color = "#e3f4fe"))
hawaii1
dev.off()


png(here::here("migration-rate-maps", "minor-areas", "hawaii2.png"),width=65,height=50)

hawaii2 <- plot_usmap(
  regions = c("state"),
  include = c("Hawaii"),
  color = "black",
  fill = "#ffe0c1") +
  theme(plot.background = element_rect(fill = "#e3f4fe", color = "#e3f4fe"))
hawaii2
dev.off()


png(here::here("migration-rate-maps", "minor-areas", "hawaii3.png"),width=65,height=50)
hawaii3 <- plot_usmap(
  regions = c("state"),
  include = c("Hawaii"),
  color = "black",
  fill = "#ba7733") +
  theme(plot.background = element_rect(fill = "#e3f4fe", color = "#e3f4fe"))
hawaii3
dev.off()



#### creating pr png for map ####
pr <- ggplot2::map_data('world', 'puerto rico')

picture <- image_graph(width = 65, height = 50)
ggplot(pr, aes(x = long, y = lat, group = group)) +
  geom_polygon(color="black", fill="#c5c9cc") +
  theme_void()+
  theme(plot.background = element_rect(fill = "#e3f4fe", color = "#e3f4fe")) +
  theme(plot.margin = margin(21,18,21,13, "pt"))

dev.off()

image_write(picture, path = here::here("migration-rate-maps", "minor-areas", "pr.png"), format = "png")


#### N: RECREATED GRAPHIC ####

#### Creating map1 ####
map <- map_data("state")
types <- read_xlsx(here::here("migration-rate-maps", "migration_1935.xlsx"))
types$state <- tolower(types$state)

newmap <- map %>%
  inner_join(types, by = c("region" = "state")) %>%
  mutate(Type = coalesce(case_when(test == 1 ~ '30 to 108.6',
                                   test == 2 ~ '0.0 to 29.9',
                                   test == 3 ~ '-30.0 to -0.1',
                                   test == 4 ~ '-121.4 to -30.1',
  ))) 

newmap$Type <- factor(newmap$Type, levels=c("30 to 108.6", "0.0 to 29.9", "-30.0 to -0.1", "-121.4 to -30.1"))

map1 <- ggplot(data = newmap) + 
  geom_polygon(aes(x=long, y=lat, group=group, 
                   fill = Type),
               color="black",
               linewidth = .5) +
  theme(legend.direction = "vertical",
        legend.title = element_blank()) +
  theme(axis.title = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        plot.title = element_text(size = 20, hjust = .5, family = "Title"),
        plot.margin = margin(30,10,10,10),
        plot.background = element_rect(fill = "white")) +
  scale_fill_manual(values = c("#00867c","#ffe0c1","#bee0e9","#ba7733")) +
  guides(fill = guide_legend(nrow = 4))



#### Creating map2 ####
types2 <- read_xlsx(here::here("migration-rate-maps", "migration_1965.xlsx"))
types2$state <- tolower(types2$state)

newmap2 <- map %>%
  inner_join(types2, by = c("region" = "state")) %>%
  mutate(Type = coalesce(case_when(test == 1 ~ '30 to 108.6',
                                   test == 2 ~ '0.0 to 29.9',
                                   test == 3 ~ '-30.0 to -0.1',
                                   test == 4 ~ '-121.4 to -30.1',
  )))
newmap2$Type <- factor(newmap2$Type, levels=c("30 to 108.6", "0.0 to 29.9", "-30.0 to -0.1", "-121.4 to -30.1"))

map2 <- ggplot(data = newmap2) + 
  geom_polygon(aes(x=long, y=lat, group=group, 
                   fill = Type),
               color="black",
               linewidth = .5) +
  theme(legend.direction = "vertical",
        legend.title = element_blank()) +
  theme(axis.title = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        plot.title = element_text(size = 20, hjust = .5, family = "Title"),
        plot.margin = margin(30,10,10,10),
        plot.background = element_rect(fill = "white")) +
  scale_fill_manual(values = c("#00867c","#ffe0c1","#bee0e9","#ba7733")) +
  guides(fill = guide_legend(nrow = 4))



#### Creating map3 ####
types3 <- read_xlsx(here::here("migration-rate-maps", "migration_1995.xlsx"))
types3$state <- tolower(types3$state)

newmap3 <- map %>%
  inner_join(types3, by = c("region" = "state")) %>%
  mutate(Type = coalesce(case_when(test == 1 ~ '30 to 108.6',
                                   test == 2 ~ '0.0 to 29.9',
                                   test == 3 ~ '-30.0 to -0.1',
                                   test == 4 ~ '-121.4 to -30.1',
  )))
newmap3$Type <- factor(newmap3$Type, levels=c("30 to 108.6", "0.0 to 29.9", "-30.0 to -0.1", "-121.4 to -30.1"))

map3 <- ggplot(data = newmap3) + 
  geom_polygon(aes(x=long, y=lat, group=group, 
                   fill = Type),
               color="black",
               linewidth = .5) +
  theme(legend.direction = "vertical",
        legend.title = element_blank()) +
  theme(axis.title = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        plot.title = element_text(size = 20, hjust = .5, family = "Title"),
        plot.margin = margin(30,10,10,10),
        plot.background = element_rect(fill = "white")) +
  scale_fill_manual(values = c("#00867c","#ffe0c1","#bee0e9","#ba7733")) +
  guides(fill = guide_legend(nrow = 4))
map3



#### creating a gap graph and combining all maps into 1 image ####
gap <- ggplot() + theme_void()
png(here::here("migration-rate-maps", "unfinished.png"),width=1700,height=400)
print(ggarrange(gap,
                ggarrange(gap, map1, gap, map2, gap, map3, gap, ncol=7, widths = c(.05, 20, .05, 20, .05, 20, .05)), nrow=2, heights =c(.20, .6)))
dev.off()



#### importing the unfinished image and alaska, hawaii, and pr pngs ####
original <- image_read(here::here("migration-rate-maps", "unfinished.png"))
alaska1 <- image_read(here::here("migration-rate-maps", "minor-areas", "alaska1.png"))
alaska2 <- image_read(here::here("migration-rate-maps", "minor-areas", "alaska2.png"))
alaska3 <- image_read(here::here("migration-rate-maps", "minor-areas", "alaska3.png"))
hawaii1 <- image_read(here::here("migration-rate-maps", "minor-areas", "hawaii1.png"))
hawaii2 <- image_read(here::here("migration-rate-maps", "minor-areas", "hawaii2.png"))
hawaii3 <- image_read(here::here("migration-rate-maps", "minor-areas", "hawaii3.png"))
pr <- image_read(here::here("migration-rate-maps", "minor-areas", "pr.png"))



#### combining all images together and adding text ####
fig01 <- image_draw(original)

text(325, 65, "Migration Rate, 1935 to 1940", cex = 1.5, col = "black")
text(330, 105, "Rate of net domestic migration", cex = 1, family="Main", col = "#313131")
text(312, 120, "per 1,000 people in 1935", cex = 1, family="Main", col = "#313131")
text(446, 223, "Gain", cex = .75, family="alt", col = "#313131")
text(446, 293, "Loss", cex = .75, family="alt", col = "#313131")
text(290, 375, "07-01", cex = .75, family="Main", col = "#313131")
grid.raster(alaska1, .055, .82, height = .20)
grid.raster(hawaii1, .04, .1, height = .12)
grid.raster(pr, .24, .1, height = .12)

text(885, 65, "Migration Rate, 1965 to 1970", cex = 1.5, col = "black")
text(890, 105, "Rate of net domestic migration", cex = 1, family="Main", col = "#313131")
text(872, 120, "per 1,000 people in 1965", cex = 1, family="Main", col = "#313131")
text(1013, 223, "Gain", cex = .75, family="alt", col = "#313131")
text(1013, 293, "Loss", cex = .75, family="alt", col = "#313131")
text(850, 375, "07-02", cex = .75, family="Main", col = "#313131")
grid.raster(alaska2, .385, .82, height = .20)
grid.raster(hawaii2, .37, .1, height = .12)
grid.raster(pr, .57, .1, height = .12)

text(1450, 65, "Migration Rate, 1995 to 2000", cex = 1.5, col = "black")
text(1455, 105, "Rate of net domestic migration", cex = 1, family="Main", col = "#313131")
text(1437, 120, "per 1,000 people in 1995", cex = 1, family="Main", col = "#313131")
text(1580, 223, "Gain", cex = .75, family="alt", col = "#313131")
text(1580, 293, "Loss", cex = .75, family="alt", col = "#313131")
text(1415, 375, "07-03", cex = .75, family="Main", col = "#313131")
grid.raster(alaska3, .72, .82, height = .20)
grid.raster(hawaii3, .705, .1, height = .12)
grid.raster(pr, .905, .1, height = .12)

dev.off()

image_write(fig01, path = here::here("migration-rate-maps", "01_full_unmasked.png"), format = "png")












