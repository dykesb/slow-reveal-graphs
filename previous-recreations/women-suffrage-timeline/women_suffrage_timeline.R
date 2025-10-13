#
# FILE:
# women_suffrage_timeline.R
#
# DESCRIPTION:
# This code is for the Population of Europe graph by Du Bois. The png shows the final recreated graph.  
# Source: https://blogs.scientificamerican.com/sa-visual/w-e-b-du-bois-scientific-american-and-data-stories-of-the-early-1900s/
#
# SLOW REVEAL ORDER:
#   
# 1-27: Changing States to Blue w/ Names
#
# AUTHORS:
#   Robert Bilyk (main code)
#   Ian Curtis (2023, code to save plots)

library(tidyverse)
library(leaflet)
library(maps)
library(mapdata)
library(mapview)
library(readxl)
library(magick)


mapStates <- map("state", fill = TRUE, plot = FALSE)


#### Graph 1: FULLY MASKED ####
fig01 <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor="#ededed", color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(fig01, file = here::here("women-suffrage-timeline", "01_full_masked.png"), vwidth = 1400, vheight = 800)


#### Graph 2: Wyoming Blue Revealed ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data1.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

fig02 <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(fig02, file = here::here("women-suffrage-timeline", "02_WYblue_unmasked.png"), vwidth = 1400, vheight = 800)


#### Graph 3: WY name revealed ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data1.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "03_WYname_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "03_WYname_unmasked.png"))

fig03 <- image_draw(original)
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig03, path = here::here("women-suffrage-timeline", "03_WYname_unmasked.png"), format = "png")


#### Graph 4: UT blue revealed ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data2.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "04_UTblue_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "04_UTblue_unmasked.png"))

fig04 <- image_draw(original)
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig04, path = here::here("women-suffrage-timeline", "04_UTblue_unmasked.png"), format = "png")


#### Graph 5: UT name revealed ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data2.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "05_UTname_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "05_UTname_unmasked.png"))

fig05 <- image_draw(original)
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig05, path = here::here("women-suffrage-timeline", "05_UTname_unmasked.png"), format = "png")


#### Graph 6: WA blue ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data3.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "06_WAblue_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "06_WAblue_unmasked.png"))

fig06 <- image_draw(original)
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig06, path = here::here("women-suffrage-timeline", "06_WAblue_unmasked.png"), format = "png")


#### Graph 7: WA name ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data3.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "07_WAname_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "07_WAname_unmasked.png"))

fig07 <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig07, path = here::here("women-suffrage-timeline", "07_WAname_unmasked.png"), format = "png")


#### Graph 8: remove UT blue ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data4.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "08_UTblue_masked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "08_UTblue_masked.png"))

fig08 <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig08, path = here::here("women-suffrage-timeline", "08_UTblue_masked.png"), format = "png")


#### Graph 9: add CO blue ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data5.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "09_COblue_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "09_COblue_unmasked.png"))

fig09 <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig09, path = here::here("women-suffrage-timeline", "09_COblue_unmasked.png"), format = "png")


#### Graph 10: CO name revealed ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data5.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "10_COname_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "10_COname_unmasked.png"))

fig10 <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
text(480, 400, "Colorado", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig10, path = here::here("women-suffrage-timeline", "10_COname_unmasked.png"), format = "png")


#### Graph 11: ID, UT blue revealed ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data6.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "11_IDUTblue_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "11_IDUTblue_unmasked.png"))

fig11 <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
text(480, 400, "Colorado", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig11, path = here::here("women-suffrage-timeline", "11_IDUTblue_unmasked.png"), format = "png")


#### Graph 12: ID name revealed ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data6.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "12_IDname_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "12_IDname_unmasked.png"))

fig12 <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(280, 255, "Idaho", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
text(480, 400, "Colorado", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig12, path = here::here("women-suffrage-timeline", "12_IDname_unmasked.png"), format = "png")


#### Graph 13: WA blue revealed ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data7.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "13_WAblue_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "13_WAblue_unmasked.png"))

fig13 <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(280, 255, "Idaho", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
text(480, 400, "Colorado", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig13, path = here::here("women-suffrage-timeline", "13_WAblue_unmasked.png"), format = "png")


#### Graph 14: CA blue revealed ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data8.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "14_CAblue_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "14_CAblue_unmasked.png"))

fig14 <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(280, 255, "Idaho", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
text(480, 400, "Colorado", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig14, path = here::here("women-suffrage-timeline", "14_CAblue_unmasked.png"), format = "png")


#### Graph 15: CA name revealed ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data8.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "15_CAname_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "15_CAname_unmasked.png"))

fig15 <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(140, 440, "California", cex = 1, family="Main", col = "#313131")
text(280, 255, "Idaho", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
text(480, 400, "Colorado", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig15, path = here::here("women-suffrage-timeline", "15_CAname_unmasked.png"), format = "png")


#### Graph 16: OR, AZ, KS blue revealed ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data9.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "16_ORAZKSblue_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "16_ORAZKSblue_unmasked.png"))

fig16 <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(140, 440, "California", cex = 1, family="Main", col = "#313131")
text(280, 255, "Idaho", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
text(480, 400, "Colorado", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig16, path = here::here("women-suffrage-timeline", "16_ORAZKSblue_unmasked.png"), format = "png")


#### Graph 17: OR, AZ, KS names revealed ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data9.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "17_ORAZKSname_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "17_ORAZKSname_unmasked.png"))

fig17 <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(135, 255, "Oregon", cex = 1, family="Main", col = "#313131")
text(140, 440, "California", cex = 1, family="Main", col = "#313131")
text(280, 255, "Idaho", cex = 1, family="Main", col = "#313131")
text(340, 535, "Arizona", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
text(480, 400, "Colorado", cex = 1, family="Main", col = "#313131")
text(645, 415, "Kansas", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig17, path = here::here("women-suffrage-timeline", "17_ORAZKSname_unmasked.png"), format = "png")


#### Graph 18: NV, MT blue revealed ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data10.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "18_NVMTblue_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "18_NVMTblue_unmasked.png"))

fig18 <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(135, 255, "Oregon", cex = 1, family="Main", col = "#313131")
text(140, 440, "California", cex = 1, family="Main", col = "#313131")
text(280, 255, "Idaho", cex = 1, family="Main", col = "#313131")
text(340, 535, "Arizona", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
text(480, 400, "Colorado", cex = 1, family="Main", col = "#313131")
text(645, 415, "Kansas", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig18, path = here::here("women-suffrage-timeline", "18_NVMTblue_unmasked.png"), format = "png")


#### Graph 19: NV, MT names revealed ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data10.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "19_NVMTname_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "19_NVMTname_unmasked.png"))

fig19 <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(135, 255, "Oregon", cex = 1, family="Main", col = "#313131")
text(140, 440, "California", cex = 1, family="Main", col = "#313131")
text(280, 255, "Idaho", cex = 1, family="Main", col = "#313131")
text(225, 390, "Nevada", cex = 1, family="Main", col = "#313131")
text(340, 535, "Arizona", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(385, 145, "Montana", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
text(480, 400, "Colorado", cex = 1, family="Main", col = "#313131")
text(645, 415, "Kansas", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig19, path = here::here("women-suffrage-timeline", "19_NVMTname_unmasked.png"), format = "png")


#### Graph 20: ND, NY blue revealed ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data11.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "20_NDNYblue_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "20_NDNYblue_unmasked.png"))

fig20 <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(135, 255, "Oregon", cex = 1, family="Main", col = "#313131")
text(140, 440, "California", cex = 1, family="Main", col = "#313131")
text(280, 255, "Idaho", cex = 1, family="Main", col = "#313131")
text(225, 390, "Nevada", cex = 1, family="Main", col = "#313131")
text(340, 535, "Arizona", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(385, 145, "Montana", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
text(480, 400, "Colorado", cex = 1, family="Main", col = "#313131")
text(645, 415, "Kansas", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig20, path = here::here("women-suffrage-timeline", "20_NDNYblue_unmasked.png"), format = "png")


#### Graph 21: ND, NY names revealed ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data11.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "21_NDNYname_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "21_NDNYname_unmasked.png"))

fig21 <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(135, 255, "Oregon", cex = 1, family="Main", col = "#313131")
text(140, 440, "California", cex = 1, family="Main", col = "#313131")
text(280, 255, "Idaho", cex = 1, family="Main", col = "#313131")
text(225, 390, "Nevada", cex = 1, family="Main", col = "#313131")
text(340, 535, "Arizona", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(385, 145, "Montana", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
text(480, 400, "Colorado", cex = 1, family="Main", col = "#313131")
text(595, 135, "North Dakota", cex = 1, family="Main", col = "#313131")
text(645, 415, "Kansas", cex = 1, family="Main", col = "#313131")
text(1165, 280, "New York", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig21, path = here::here("women-suffrage-timeline", "21_NDNYname_unmasked.png"), format = "png")


#### Graph 22: SD, MI, OK, AK, LO blue revealed ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data12.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "22_SDMIOKAKLOblue_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "22_SDMIOKAKLOblue_unmasked.png"))

fig22 <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(135, 255, "Oregon", cex = 1, family="Main", col = "#313131")
text(140, 440, "California", cex = 1, family="Main", col = "#313131")
text(280, 255, "Idaho", cex = 1, family="Main", col = "#313131")
text(225, 390, "Nevada", cex = 1, family="Main", col = "#313131")
text(340, 535, "Arizona", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(385, 145, "Montana", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
text(480, 400, "Colorado", cex = 1, family="Main", col = "#313131")
text(595, 135, "North Dakota", cex = 1, family="Main", col = "#313131")
text(645, 415, "Kansas", cex = 1, family="Main", col = "#313131")
text(1165, 280, "New York", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig22, path = here::here("women-suffrage-timeline", "22_SDMIOKAKLOblue_unmasked.png"), format = "png")


#### Graph 23: SD, MI, OK, AK, LO name revealed ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data12.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "23_SDMIOKAKLOname_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "23_SDMIOKAKLOname_unmasked.png"))

fig23 <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(135, 255, "Oregon", cex = 1, family="Main", col = "#313131")
text(140, 440, "California", cex = 1, family="Main", col = "#313131")
text(280, 255, "Idaho", cex = 1, family="Main", col = "#313131")
text(225, 390, "Nevada", cex = 1, family="Main", col = "#313131")
text(340, 535, "Arizona", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(385, 145, "Montana", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
text(480, 400, "Colorado", cex = 1, family="Main", col = "#313131")
text(595, 135, "North Dakota", cex = 1, family="Main", col = "#313131")
text(600, 235, "South Dakota", cex = 1, family="Main", col = "#313131")
text(645, 415, "Kansas", cex = 1, family="Main", col = "#313131")
text(670, 500, "Oklahoma", cex = 1, family="Main", col = "#313131")
text(780, 520, "Arkansas", cex = 1, family="Main", col = "#313131")
text(790, 630, "Louisiana", cex = 1, family="Main", col = "#313131")
text(958, 275, "Michigan", cex = 1, family="Main", col = "#313131")
text(1165, 280, "New York", cex = 1, family="Main", col = "#313131")

dev.off()
image_write(fig23, path = here::here("women-suffrage-timeline", "23_SDMIOKAKLOname_unmasked.png"), format = "png")


#### Graph 24: IA blue revealed ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data13.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "24_IAblue_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "24_IAblue_unmasked.png"))

fig24 <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(135, 255, "Oregon", cex = 1, family="Main", col = "#313131")
text(140, 440, "California", cex = 1, family="Main", col = "#313131")
text(280, 255, "Idaho", cex = 1, family="Main", col = "#313131")
text(225, 390, "Nevada", cex = 1, family="Main", col = "#313131")
text(340, 535, "Arizona", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(385, 145, "Montana", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
text(480, 400, "Colorado", cex = 1, family="Main", col = "#313131")
text(595, 135, "North Dakota", cex = 1, family="Main", col = "#313131")
text(600, 235, "South Dakota", cex = 1, family="Main", col = "#313131")
text(645, 415, "Kansas", cex = 1, family="Main", col = "#313131")
text(670, 500, "Oklahoma", cex = 1, family="Main", col = "#313131")
text(780, 520, "Arkansas", cex = 1, family="Main", col = "#313131")
text(790, 630, "Louisiana", cex = 1, family="Main", col = "#313131")
text(958, 275, "Michigan", cex = 1, family="Main", col = "#313131")
text(1165, 280, "New York", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig24, path = here::here("women-suffrage-timeline", "24_IAblue_unmasked.png"), format = "png")


#### Graph 25: IA name revealed ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data13.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "25_IAname_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "25_IAname_unmasked.png"))

fig25 <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(135, 255, "Oregon", cex = 1, family="Main", col = "#313131")
text(140, 440, "California", cex = 1, family="Main", col = "#313131")
text(280, 255, "Idaho", cex = 1, family="Main", col = "#313131")
text(225, 390, "Nevada", cex = 1, family="Main", col = "#313131")
text(340, 535, "Arizona", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(385, 145, "Montana", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
text(480, 400, "Colorado", cex = 1, family="Main", col = "#313131")
text(595, 135, "North Dakota", cex = 1, family="Main", col = "#313131")
text(600, 235, "South Dakota", cex = 1, family="Main", col = "#313131")
text(645, 415, "Kansas", cex = 1, family="Main", col = "#313131")
text(670, 500, "Oklahoma", cex = 1, family="Main", col = "#313131")
text(780, 520, "Arkansas", cex = 1, family="Main", col = "#313131")
text(790, 630, "Louisiana", cex = 1, family="Main", col = "#313131")
text(958, 275, "Michigan", cex = 1, family="Main", col = "#313131")
text(1165, 280, "New York", cex = 1, family="Main", col = "#313131")
text(760, 310, "Iowa", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig25, path = here::here("women-suffrage-timeline", "25_IAname_unmasked.png"), format = "png")


#### Graph 26: rest of US blue revealed ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data14.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "26_restofUSblue_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "26_restofUSblue_unmasked.png"))

fig26 <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(135, 255, "Oregon", cex = 1, family="Main", col = "#313131")
text(140, 440, "California", cex = 1, family="Main", col = "#313131")
text(280, 255, "Idaho", cex = 1, family="Main", col = "#313131")
text(225, 390, "Nevada", cex = 1, family="Main", col = "#313131")
text(340, 535, "Arizona", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(385, 145, "Montana", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
text(480, 400, "Colorado", cex = 1, family="Main", col = "#313131")
text(595, 135, "North Dakota", cex = 1, family="Main", col = "#313131")
text(600, 235, "South Dakota", cex = 1, family="Main", col = "#313131")
text(610, 325, "Nebraska", cex = 1, family="Main", col = "#313131")
text(645, 415, "Kansas", cex = 1, family="Main", col = "#313131")
text(670, 500, "Oklahoma", cex = 1, family="Main", col = "#313131")
text(760, 310, "Iowa", cex = 1, family="Main", col = "#313131")
text(780, 520, "Arkansas", cex = 1, family="Main", col = "#313131")
text(790, 630, "Louisiana", cex = 1, family="Main", col = "#313131")
text(958, 275, "Michigan", cex = 1, family="Main", col = "#313131")
text(1165, 280, "New York", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig26, path = here::here("women-suffrage-timeline", "26_restofUSblue_unmasked.png"), format = "png")


#### Graph 27: rest of US names revealed ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data14.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "27_restofUSname_unmasked.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "27_restofUSname_unmasked.png"))

fig27 <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(135, 255, "Oregon", cex = 1, family="Main", col = "#313131")
text(140, 440, "California", cex = 1, family="Main", col = "#313131")
text(280, 255, "Idaho", cex = 1, family="Main", col = "#313131")
text(225, 390, "Nevada", cex = 1, family="Main", col = "#313131")
text(340, 535, "Arizona", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(385, 145, "Montana", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
text(480, 400, "Colorado", cex = 1, family="Main", col = "#313131")
text(470, 525, "New Mexico", cex = 1, family="Main", col = "#313131")
text(595, 135, "North Dakota", cex = 1, family="Main", col = "#313131")
text(600, 235, "South Dakota", cex = 1, family="Main", col = "#313131")
text(610, 325, "Nebraska", cex = 1, family="Main", col = "#313131")
text(645, 415, "Kansas", cex = 1, family="Main", col = "#313131")
text(670, 500, "Oklahoma", cex = 1, family="Main", col = "#313131")
text(620, 610, "Texas", cex = 1, family="Main", col = "#313131")
text(735, 175, "Minnesota", cex = 1, family="Main", col = "#313131")
text(760, 310, "Iowa", cex = 1, family="Main", col = "#313131")
text(780, 415, "Missouri", cex = 1, family="Main", col = "#313131")
text(780, 520, "Arkansas", cex = 1, family="Main", col = "#313131")
text(790, 630, "Louisiana", cex = 1, family="Main", col = "#313131")
text(835, 230, "Wisconsin", cex = 1, family="Main", col = "#313131")
text(850, 365, "Illinois", cex = 1, family="Main", col = "#313131")
text(958, 275, "Michigan", cex = 1, family="Main", col = "#313131")
text(920, 370, "Indiana", cex = 1, family="Main", col = "#313131")
text(1005, 365, "Ohio", cex = 1, family="Main", col = "#313131")
text(1110, 345, "Pennsylvania", cex = 1, family="Main", col = "#313131")
text(1165, 280, "New York", cex = 1, family="Main", col = "#313131")
text(1230, 245, "VT", cex = 1, family="Main", col = "#313131")
text(1255, 265, "NH", cex = 1, family="Main", col = "#313131")
text(1310, 205, "Maine", cex = 1, family="Main", col = "#313131")
text(1245, 300, "MASS", cex = 1, family="Main", col = "#313131")
text(1230, 320, "CT", cex = 1, family="Main", col = "#313131")
text(1190, 365, "NJ", cex = 1, family="Main", col = "#313131")
text(1140, 390, "MD", cex = 1, family="Main", col = "#313131")
text(1050, 402, "West", cex = 1, family="Main", col = "#313131")
text(1050, 410, "Virginia", cex = 1, family="Main", col = "#313131")
text(1090, 440, "Virginia", cex = 1, family="Main", col = "#313131")
text(950, 440, "Kentucky", cex = 1, family="Main", col = "#313131")
text(920, 490, "Tennessee", cex = 1, family="Main", col = "#313131")
text(1085, 490, "North", cex = 1, family="Main", col = "#313131")
text(1085, 498, "Carolina", cex = 1, family="Main", col = "#313131")
text(1045, 540, "South", cex = 1, family="Main", col = "#313131")
text(1045, 548, "Carolina", cex = 1, family="Main", col = "#313131")
text(845, 570, "Mississippi", cex = 1, family="Main", col = "#313131")
text(910, 570, "Alabama", cex = 1, family="Main", col = "#313131")
text(985, 575, "Georgia", cex = 1, family="Main", col = "#313131")
text(1005, 650, "Florida", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig27, path = here::here("women-suffrage-timeline", "27_restofUSname_unmasked.png"), format = "png")








#### Graph 8a ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data4a.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "8a.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "8a.png"))

fig8a <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig8a, path = here::here("women-suffrage-timeline", "8a.png"), format = "png")


#### Graph 9a ####
types1 <- read_xlsx(here::here("women-suffrage-timeline", "data", "data5a.xlsx"))

mapStates <- maps::map("state", fill = TRUE, plot = TRUE)

mapStates$test <- types1$test
factpal <- colorFactor(c("#ededed","#6d8fb4"), mapStates$test)

leaf <- leaflet(data = mapStates) %>% 
  addTiles() %>%
  addPolygons(stroke = TRUE, fillColor = ~factpal(test), color="black", fillOpacity = 1, weight=.5) %>%
  setView(lng = -96, lat = 39, zoom = 5) %>%
  addProviderTiles("CartoDB.PositronNoLabels")


mapshot(leaf, file = here::here("women-suffrage-timeline", "9a.png"), vwidth = 1400, vheight = 800)

original <- image_read(here::here("women-suffrage-timeline", "9a.png"))

fig9a <- image_draw(original)
text(140, 140, "Washington", cex = 1, family="Main", col = "#313131")
text(345, 395, "Utah", cex = 1, family="Main", col = "#313131")
text(435, 280, "Wyoming", cex = 1, family="Main", col = "#313131")
dev.off()
image_write(fig9a, path = here::here("women-suffrage-timeline", "9a.png"), format = "png")






