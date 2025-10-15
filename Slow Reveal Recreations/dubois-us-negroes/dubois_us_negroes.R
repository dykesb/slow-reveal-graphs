#
# FILE:
#  dubois_us_negroes.R
#
# DESCRIPTION:
# This code is for the Distribution of Negros in the United States map from Du Bois. The png's show the various stages of revealing the graphs.  
# Most graph code was taken from Alex's work: https://github.com/gichukia/Slow-Reveal/blob/main/MO-OK%20split%20map%20Slow%20Reveal.R  
# Source: https://www.loc.gov/resource/ppmsca.33900/
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC
# 1: FULLY CONCEALED GRAPHIC
# 2: REVEAL CIRCLES
# 3: REVEAL LABELS
#
# AUTHORS:
#   Alex & Robert Bilyk (main code)
#   Ian Curtis (2023, code to save plots)

library(maps)
library(mapdata)
library(ggplot2)
library(showtext)
library(tidyverse)
library(readxl)
library(ggforce)
library(cowplot)

#### FIGURE 4: RECREATED GRAPHIC ####

# fonts
font_add_google("Puritan", "Puritan")
showtext_auto()

# map data from the 'maps' package
state <- map_data("state")

# grouping the states
df <- data.frame(states = c("washington", "oregon", "idaho", "montana", "california", "arizona",
                            "new mexico", "nevada", "utah", "wyoming", "colorado", "oklahoma",
                            "kansas", "nebraska", "south dakota", "north dakota", "minnesota",
                            "iowa", "illinois", "wisconsin", "michigan", "indiana", "ohio",
                            "west virginia", "pennsylvania", "new york", "massachusetts",
                            "vermont", "new hampshire", "maine", "rhode island", "connecticut",
                            "new jersey", "texas", "missouri", "kentucky", "tennessee",
                            "alabama", "arkansas", "georgia", "florida", "north carolina", "virginia",
                            "district of columbia", "maryland", "delaware", "louisiana", "mississippi",
                            "south carolina"),
                 grp = c("A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","B","A",
                         "A","B","B","B","B","B","B","A","A","A","D","B","D","B","B","D","D","D","C","D",
                         "B","D","E","E","E","B","D","E","E"))

# Adding state abbreviations
centroids <- data.frame(region = tolower(state.name), long = state.center$x, lat = state.center$y)
centroids$abb <- state.abb[match(centroids$region, tolower(state.name))]

# creating new abbreviations 
Abb <- c("ALA.","AK","ARIZ.","ARK.","CAL.","COLO.","CONN.","DEL.","FLA.","GA.","HI",'IDAHO',"ILL.",
         "IND.","IOWA","KANS.","KY.","LA.","ME.","MD.","MASS.","MICH.","MINN.","MISS.","MO.","MONT.",
         "NEBR.","NEV.","N.H.","N.J.","N.M.","N.Y","N.C.","N.DAK.","OHIO","OKLA.","OREGON","PA.",
         "RI.","S.C.","S.DAK.","TENN.","TEXAS","UTAH","VT.","VA.","WASH.","W.VA.","WIS.","WYO.")



# Adding the new abbreviations
centroids[["abb"]] <- Abb
colnames(centroids)[colnames(centroids) == "abb"] <- "Abb"

# Removing Alaska and Hawaii Abbreviations
new_centroids <- centroids[-c(2,11),]

# joining the data frame to state table
new_data <- state %>% 
  left_join(df, by = c("region" = "states"))


# Focus on Missouri
missouri <- state %>%
  filter(region == "missouri")


# want plot to start near long = -94.7, lat = 39: around line 265 in the dataset
new_mo <- bind_rows(missouri[260:nrow(missouri),],missouri[1:259,])


# split Illinois in to - rename region/group to be informative
# copy split plot to second object to overlap edges
mo_north <- new_mo[1:106,] %>%
  mutate(group = 27.2,
         region = "missouri-north")

mo_south <- new_mo[c(106:nrow(new_mo),1),] %>%
  mutate(group = 27.1,
         region = "missouri-south")

two_mo <- bind_rows(mo_north, mo_south)

ggplot(two_mo, aes(x=long, y=lat, group = group)) +
  geom_polygon(aes(fill = region), color = "black")

add_MO <- full_join(two_mo, new_data)

add_MO <- add_MO[-(8095:8409)]


# focus on oklahoma
oklahoma <- state %>% 
  filter(region == "oklahoma")


# plotting starts in "panhandle" and goes to the right
# want plot to start near long = -96, lat = 37: around line 20 in dataset
new_ok <- bind_rows(oklahoma[21:nrow(oklahoma),],oklahoma[1:20,])


# split oklahoma in two - rename region/group to be informative
# copy split points to second object to overlap edges
ok_east <- new_ok[1:166,] %>% 
  mutate(group = 43.1,
         region = "oklahoma-east")

ok_west <- new_ok[c(166:nrow(new_ok),1),] %>% #adding back split points (line 166 and line 1)
  mutate(group = 43.2,
         region = "oklahoma-west") 

# add back into one object
two_ok <- bind_rows(ok_east, ok_west)

# check two shapes
ggplot(two_ok, aes(x=long, y=lat, group = group)) +
  geom_polygon(aes(fill = region), color = "black")

# add point in middle of state for more "pizzazz" - must be added to both sides
ok_east <- ok_east %>% 
  add_case(long = -96, lat = 35.5, group = 43.1, region = "oklahoma-east")

ok_west <- ok_west %>% 
  add_case(long = -96, lat = 35.5, group = 43.2, region = "oklahoma-west")

# add back into one object
two_ok <- bind_rows(ok_east, ok_west)

add_OK<- full_join(two_ok, add_MO)

add_OK <- add_OK[-(11242:11525),]

# Plotting the Map
split_plot <- ggplot(data = add_OK, aes(x=long, y=lat, group = group, fill = grp)) +
  geom_polygon(color = "black") +
  labs(title = "DENSITY OF NEGRO POPULATION IN 1890.") +
  theme(plot.title = element_text(hjust = 0.5, family = "Puritan", size = 17)) +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(colour = "black", fill =  "white")) +
  theme(legend.position = "bottom",
        legend.text = element_text(family = "Puritan", size = 12))


df1 <- data.frame(states = c("washington", "oregon", "idaho", "montana", "california", "arizona",
                             "new mexico", "nevada", "utah", "wyoming", "colorado", "oklahoma-east", "oklahoma-west",
                             "kansas", "nebraska", "south dakota", "north dakota", "minnesota",
                             "iowa", "illinois", "wisconsin", "michigan", "indiana", "ohio",
                             "west virginia", "pennsylvania", "new york", "massachusetts",
                             "vermont", "new hampshire", "maine", "rhode island", "connecticut",
                             "new jersey", "texas", "missouri-north", "missouri-south", "kentucky", "tennessee",
                             "alabama", "arkansas", "georgia", "florida", "north carolina", "virginia",
                             "district of columbia", "maryland", "delaware", "louisiana", "mississippi",
                             "south carolina"),
                  grp = c("A","A","A","A","A","A","A","A","A","A","A","F","A","A","A","A","A","A","A","B","A",
                          "A","B","B","B","B","B","B","A","A","A","D","B","C","B","G","B","C","D","D","C","D",
                          "B","D","E","E","E","B","D","E","E"))


new_usa_data <- add_OK %>%
  left_join(df1, by = c("region" = "states"))

# Slow Reveal

plt <- ggplot(data = new_usa_data, aes(x=long, y=lat, group = group, fill = grp.y)) +
  geom_polygon(color = "black") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white")) +
  theme(legend.position = "none",
        legend.text = element_text(family = "Puritan", size = 12))

MapPlot <- plt + scale_fill_manual(name = NULL,
                                   labels = c("Less than 1",
                                              "1 - 4",
                                              "4 - 8",
                                              "8 - 15",
                                              '15 - 25',
                                              "IND. TER.",
                                              "MO_North"),
                                   values = c("A" = "#Fbe206",
                                              "B" = "#061e73",
                                              "C" = "#E02641",
                                              "D" = "#5a2f0b",
                                              "E" = "#000000",
                                              "F" = "#ffffff",
                                              "G" = "#070326")) +
  guides(fill = guide_legend(label.position = "left", label.hjust = 1))

MapPlot


#creating the legend
circleDF <- data.frame(group = c("A", "B", "C", "D", "E"),
                       x = c(1, 2, 3, 4, 5),
                       y = c(0.6, 0.6, 0.6, 0.6, 0.6))
#c = c("#Fbe206", "#061e73", "#E02641", "#5a2f0b", "#000000"))


LegendPlot1 <- ggplot(circleDF, aes(x0 = x, y0 = y, r = 0.1, fill = group)) +
  geom_circle(color = "black") +
  coord_equal() +
  xlim(0, 6) +
  ylim(-0.2, 1) +
  scale_fill_manual(values = c("#Fbe206", "#061e73", "#E02641", "#5a2f0b", "#000000"))+
  theme(plot.title = element_text(hjust = 0.5, family = "Puritan", size = 20),
        plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 17)) +
  annotate("text", x = 1, y = 0.3, label = "less than 1", family = "Puritan") +
  annotate("text", x = 2, y = 0.3, label = "1-4", family = "Puritan") +
  annotate("text", x = 3, y = 0.3, label = "4-8", family = "Puritan") +
  annotate("text", x = 4, y = 0.3, label = "8-15", family = "Puritan") +
  annotate("text", x = 5, y = 0.3, label = "15-25", family = "Puritan") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank()) +
  theme(legend.position = "none")





MapLegend1 <- plot_grid(LegendPlot1, MapPlot,
                        labels = NA, ncol = 1)

LegendPlot2 <- ggplot(circleDF, aes(x0 = x, y0 = y, r = 0.1, fill = group)) +
  geom_circle(color = "black") +
  coord_equal() +
  xlim(0, 6) +
  ylim(-0.2, 1) +
  scale_fill_manual(values = c("#Fbe206", "#061e73", "#E02641", "#5a2f0b", "#000000"))+
  theme(plot.title = element_text(hjust = 0.5, family = "Puritan", size = 20),
        plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 17)) +
  annotate("text", x = 1, y = 0.3, label = "less than 1", family = "Puritan") +
  annotate("text", x = 2, y = 0.3, label = "1-4", family = "Puritan") +
  annotate("text", x = 3, y = 0.3, label = "4-8", family = "Puritan") +
  annotate("text", x = 4, y = 0.3, label = "8-15", family = "Puritan") +
  annotate("text", x = 5, y = 0.3, label = "15-25", family = "Puritan") +
  annotate("text", x = 3, y = 0, label ="NEGROES TO THE SQUARE MILE.", family = "Puritan") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank()) +
  theme(legend.position = "none")


MapLegend2 <- plot_grid(LegendPlot2, MapPlot,
                        labels = NA, ncol = 1)

LegendPlot3 <- ggplot(circleDF, aes(x0 = x, y0 = y, r = 0.1, fill = group)) +
  geom_circle(color = "black") +
  coord_equal() +
  xlim(0, 6) +
  ylim(-0.2, 1) +
  scale_fill_manual(values = c("#Fbe206", "#061e73", "#E02641", "#5a2f0b", "#000000")) +
  labs(title = "DISTRIBUTION OF NEGROES IN THE UNITED STATES.",
       subtitle = "DISTRIBUTION DES NEGRES DAN LES E TATS UNIS.\n") +
  theme(plot.title = element_text(hjust = 0.5, family = "Puritan", size = 20),
        plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 17)) +
  annotate("text", x = 1, y = 0.3, label = "less than 1", family = "Puritan") +
  annotate("text", x = 2, y = 0.3, label = "1-4", family = "Puritan") +
  annotate("text", x = 3, y = 0.3, label = "4-8", family = "Puritan") +
  annotate("text", x = 4, y = 0.3, label = "8-15", family = "Puritan") +
  annotate("text", x = 5, y = 0.3, label = "15-25", family = "Puritan") +
  annotate("text", x = 3, y = 0, label ="NEGROES TO THE SQUARE MILE.", family = "Puritan") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank()) +
  theme(legend.position = "none")

FinalPlot <- plot_grid(LegendPlot3, MapPlot,
                       labels = NA, ncol = 1)



# Complete Slow Reveal

MapPlot
MapLegend1
MapLegend2


#Final Graph

png(here::here("dubois-us-negroes", "04_full_unmasked.png"),width=800,height=1000)

LegendPlot3 <- ggplot(circleDF, aes(x0 = x, y0 = y, r = 0.1, fill = group)) +
  geom_circle(color = "black") +
  coord_equal() +
  xlim(0, 6) +
  ylim(-0.2, 1) +
  scale_fill_manual(values = c("#Fbe206", "#061e73", "#E02641", "#5a2f0b", "#000000")) +
  labs(title = "DISTRIBUTION OF NEGROES IN THE UNITED STATES.",
       subtitle = "DISTRIBUTION DES NEGRES DAN LES E TATS UNIS.\n") +
  theme(plot.title = element_text(hjust = 0.5, family = "Puritan", size = 20),
        plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 17)) +
  annotate("text", x = 1, y = 0.3, label = "less than 1", family = "Puritan") +
  annotate("text", x = 2, y = 0.3, label = "1-4", family = "Puritan") +
  annotate("text", x = 3, y = 0.3, label = "4-8", family = "Puritan") +
  annotate("text", x = 4, y = 0.3, label = "8-15", family = "Puritan") +
  annotate("text", x = 5, y = 0.3, label = "15-25", family = "Puritan") +
  annotate("text", x = 3, y = 0, label ="NEGROES TO THE SQUARE MILE.", family = "Puritan") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank()) +
  theme(legend.position = "none")

plot_grid(LegendPlot3, MapPlot,
          labels = NA, ncol = 1)

dev.off()


#### FIGURE 1: FULLY CONCEALED GRAPHIC ####

png(here::here("dubois-us-negroes", "01_full_masked.png"),width=800,height=1000)

LegendPlot3 <- ggplot(circleDF, aes(x0 = x, y0 = y, r = 0.1, fill = group)) +
  geom_circle(color = "white") +
  coord_equal() +
  xlim(0, 6) +
  ylim(-0.2, 1) +
  scale_fill_manual(values = c("white", "white", "white", "white", "white")) +
  labs(title = "DISTRIBUTION OF NEGROES IN THE UNITED STATES.",
       subtitle = "DISTRIBUTION DES NEGRES DAN LES E TATS UNIS.\n") +
  theme(plot.title = element_text(hjust = 0.5, family = "Puritan", size = 20, color = "white"),
        plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 17, color = "white")) +
  annotate("text", x = 3, y = 0, label ="NEGROES TO THE SQUARE MILE.", family = "Puritan", color = "white") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank()) +
  theme(legend.position = "none")

plot_grid(LegendPlot3, MapPlot,
          labels = NA, ncol = 1)

dev.off()


#### FIGURE 2: REVEAL CIRCLES ####

png(here::here("dubois-us-negroes", "02_circles_unmasked.png"),width=800,height=1000)

LegendPlot3 <- ggplot(circleDF, aes(x0 = x, y0 = y, r = 0.1, fill = group)) +
  geom_circle(color = "black") +
  coord_equal() +
  xlim(0, 6) +
  ylim(-0.2, 1) +
  scale_fill_manual(values = c("#Fbe206", "#061e73", "#E02641", "#5a2f0b", "#000000")) +
  labs(title = "DISTRIBUTION OF NEGROES IN THE UNITED STATES.",
       subtitle = "DISTRIBUTION DES NEGRES DAN LES E TATS UNIS.\n") +
  theme(plot.title = element_text(hjust = 0.5, family = "Puritan", size = 20, color = "white"),
        plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 17, color = "white")) +
  annotate("text", x = 1, y = 0.3, label = "less than 1", family = "Puritan") +
  annotate("text", x = 2, y = 0.3, label = "1-4", family = "Puritan") +
  annotate("text", x = 3, y = 0.3, label = "4-8", family = "Puritan") +
  annotate("text", x = 4, y = 0.3, label = "8-15", family = "Puritan") +
  annotate("text", x = 5, y = 0.3, label = "15-25", family = "Puritan") +
  annotate("text", x = 3, y = 0, label ="NEGROES TO THE SQUARE MILE.", family = "Puritan", color = "white") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank()) +
  theme(legend.position = "none")

plot_grid(LegendPlot3, MapPlot,
          labels = NA, ncol = 1)

dev.off()


#### FIGURE 3: REVEAL LABELS ####

png(here::here("dubois-us-negroes", "03_labels_unmasked.png"),width=800,height=1000)

LegendPlot3 <- ggplot(circleDF, aes(x0 = x, y0 = y, r = 0.1, fill = group)) +
  geom_circle(color = "black") +
  coord_equal() +
  xlim(0, 6) +
  ylim(-0.2, 1) +
  scale_fill_manual(values = c("#Fbe206", "#061e73", "#E02641", "#5a2f0b", "#000000")) +
  labs(title = "DISTRIBUTION OF NEGROES IN THE UNITED STATES.",
       subtitle = "DISTRIBUTION DES NEGRES DAN LES E TATS UNIS.\n") +
  theme(plot.title = element_text(hjust = 0.5, family = "Puritan", size = 20, color = "white"),
        plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 17, color = "white")) +
  annotate("text", x = 1, y = 0.3, label = "less than 1", family = "Puritan") +
  annotate("text", x = 2, y = 0.3, label = "1-4", family = "Puritan") +
  annotate("text", x = 3, y = 0.3, label = "4-8", family = "Puritan") +
  annotate("text", x = 4, y = 0.3, label = "8-15", family = "Puritan") +
  annotate("text", x = 5, y = 0.3, label = "15-25", family = "Puritan") +
  annotate("text", x = 3, y = 0, label ="NEGROES TO THE SQUARE MILE.", family = "Puritan") +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank()) +
  theme(legend.position = "none")

plot_grid(LegendPlot3, MapPlot,
          labels = NA, ncol = 1)

dev.off()





