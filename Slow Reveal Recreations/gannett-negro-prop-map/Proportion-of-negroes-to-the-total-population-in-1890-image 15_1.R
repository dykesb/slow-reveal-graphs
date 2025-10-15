# Author: Robert Bilyk
# Code to Save Plots: Louis Cousino


# DESCRIPTION
# Proportion of negroes to the total population in 1890

# https://www.loc.gov/resource/rbaapc.10601/?sp=15

# AUTHOR: 
# Alex Gichuki


# setup
library(usmap)
library(maps)
library(mapdata)
library(ggplot2)
library(showtext)
library(tidyverse)


# fonts
font_add_google("Puritan", "Puritan")
showtext_auto()

# data frame from mapdata library
state <- map_data("state")


#Data frame with data from census.gov
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
                 percentage = c(0.5, 0.4, 0.2, 1.1, 0.9, 2.3, 1.2, 0.5, 0.3, 1.5, 1.5, 4.8, 3.5, 0.9,
                                0.2, 0.2, 0.3, 0.6, 1.5, 0.1, 0.7, 2.0, 2.37, 4.3, 2.0, 1.2, 1.0, 0.3, 0.2,
                                0.2, 2.1, 1.7, 3.3, 21.8, 5.6, 14.4, 24.4, 44.8, 46.7, 42.5, 34.7, 38.4, 32.8,
                                20.7, 16.8, 27.4, 50.0, 57.6, 59.8))



#Adding state abbreviations
centroids <- data.frame(region = tolower(state.name), long = state.center$x, lat = state.center$y)
centroids$abb <- state.abb[match(centroids$region, tolower(state.name))]

#creating new abbreviations 
Abb <- c("ALA.","AK","ARIZ.","ARK.","CAL.","COLO.","CONN.","DEL.","FLA.","GA.","HI",'IDAHO',"ILL.",
         "IND.","IOWA","KANS.","KY.","LA.","ME.","MD.","MASS.","MICH.","MINN.","MISS.","MO.","MONT.",
         "NEBR.","NEV.","N.H.","N.J.","N.M.","N.Y","N.C.","N.DAK.","OHIO","OKLA.","OREGON","PA.",
         "RI.","S.C.","S.DAK.","TENN.","TEXAS","UTAH","VT.","VA.","WASH.","W.VA.","WIS.","WYO.")


#Adding the new abbreviations
centroids[["abb"]] <- Abb
colnames(centroids)[colnames(centroids) == "abb"] <- "Abb"

#Removing Alaska and Hawaii Abbreviations
new_centroids <- centroids[-c(2,11),]


#joining the data frame to state table
new_data <- state %>% 
  left_join(df, by = c("region" = "states"))

grouped_data <- new_data %>%
  mutate(grp = case_when(percentage <= 5 ~ 'A',
                         percentage > 5 & percentage <= 25 ~ 'B',
                         percentage > 25 & percentage < 50 ~ 'C',
                         percentage >= 50 ~ 'D'))
x <- grouped_data %>%
  left_join(centroids, by = c("region" = "region"))

#plot with data from census.gov
plot <- ggplot(data = grouped_data, aes(x=long, y=lat, group = group, fill = grp)) +
  geom_polygon(color = "black") +
  coord_map("azequidistant") + # to make the shape of the map look globular
  labs(title = "PLATE III.", 
       subtitle = "PROPORTION OF NEGROES TO TOTAL POPULATION IN 1890.") +
  theme(plot.title = element_text(hjust = 1, family = "Puritan", size = 10),
        plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 17)) +
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
plot
#modifying the legend
plot2 <- plot + scale_fill_manual(name = NULL,
                          labels = c("Less than 5%",
                                    "5 - 25",
                                    "25 - 50",
                                    "Over 50"),
                          values = c("A" = "white",
                                     "B" = "#F7d3cf",
                                     "C" = "#Ee938b",
                                     "D" = "#Ae4c42")) +
  guides(fill = guide_legend(label.position = "left", label.hjust = 1))

#plot with state abbreviations
plot3 <- plot2 + with(new_centroids, 
                      annotate(geom = "text", x = long, y = lat, label = Abb, family = "Puritan"))


png(here::here("Slow Reveal Recreations", "gannett-negro-prop-map", "recreated-imgs", "01-full-unmasked.png"), width = 950)

plot3

dev.off()












           