# Author: Robert Bilyk
# Code to Save Plots: Louis Cousino



# https://www.loc.gov/resource/rbaapc.10601/?sp=15
# setup
library(maps)
library(mapdata)
library(ggplot2)
library(showtext)
library(tidyverse)
library(readxl)

#f onts
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

# plot with data from census.gov
plot <- ggplot(data = new_data, aes(x=long, y=lat, group = group, fill = grp)) +
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

# modifying the legend
plot2 <- plot + scale_fill_manual(name = NULL,
                                  labels = c("Less than 1 to sq. m,",
                                             "1 - 4",
                                             "4 - 8",
                                             "8 - 15",
                                             '15 - 25'),
                                  values = c("A" = "#E0c2c2",
                                             "B" = "#De9898",
                                             "C" = "#Cd7272",
                                             "D" = "#E85050",
                                             "E" = "#E20f0f")) +
  guides(fill = guide_legend(label.position = "left", label.hjust = 1))

# plot the initial map with state abbreviations
plot3 <- plot2 + with(new_centroids, 
                      annotate(geom = "text", x = long, y = lat, label = Abb, family = "Puritan"))

png(here::here("Slow Reveal Recreations", "gannett-negro-pop", "recreated-imgs", "01-full-unmasked.png"), width = 950)

plot3

dev.off()
