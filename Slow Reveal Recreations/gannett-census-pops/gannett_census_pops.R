#
# FILE:
# gannett_census_pops.R
#
# DESCRIPTION:
# This code is for the Urban and Total Population by Census Graph from Henry Gannett. The png's show the various stages of revealing the graphs.  
# Most graph code was taken from Connor's work: https://github.com/connormcnamee/1890-Population-Density/blob/main/Urban_Population.R  
# Source: https://www.loc.gov/resource/g3701gm.gct00010/?sp=8&r=-0.174,0.457,1.303,0.828,0
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC
# 1: FULLY CONCEALED GRAPHIC
# 2: REVEAL POPULATION
# 3: REVEAL YEAR
#
# AUTHORS:
#   Connor & Robert Bilyk (main code)
#   Ian Curtis (2023, code to save plots)


library(tidyverse)
library(showtext)


font_add_google("Puritan", "Puritan")
showtext_auto()

Censuses <- c("1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890")
Population <- c(3929214,5308483,7239881,9633822,12866020,17069453,23191876,31443321,38558371,50155783,62622250)
Density <- c(4.75,6.41,3.62,4.82,6.25,8.29,7.78,10.39,12.74,16.58,20.70)
# Urban_Pop <- c(119748,201806,315653,467252,856512,1449569,2896539,4645000,7538000,10794000,17446000)
Urban_Pop <- c(600000,500000,650000,830000,1300000,2000000,3600000,5500000,8000000,12000000,18000000)
Population_Density <- tibble(Censuses,Population,Density,Urban_Pop)

Urban_Pop_Graph <- Population_Density %>% 
  mutate(Urban_Pop = Urban_Pop / 1000000,
         Censuses = as.character(Censuses),
         Population = Population / 1000000) %>% 
  select(Urban_Pop, Censuses, Population)

Ext_Censuses <- c("1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890", "1900", "1910")
Ext_Population <- c(3929214,5308483,7239881,9633822,12866020,17069453,23191876,31443321,38558371,50155783,62622250,75994575,91972266)
Ext_Urban_Pop <- c(600000,500000,650000,830000,1300000,2000000,3600000,5072256,8071875,11450894,18327987,25142978,35726720)
Ext_Pop_Density <- tibble(Ext_Censuses, Ext_Population, Ext_Urban_Pop)

gannett <- function() {
  theme(axis.title = element_text(size = 6, family = "serif"),
        plot.title = element_text(size = 8, family = "Puritan", hjust = .5, vjust = -.5),
        axis.title.y = element_text(hjust = .5),
        axis.text.y = element_text(size = 7, margin = margin(l = 20, r = -21)),
        axis.text.x = element_text(size = 6),
        axis.ticks = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        # Make the graph wider instead of taller
        aspect.ratio = .3,
        panel.border = element_rect(fill = NA, linewidth = 1.5),
        panel.background = element_rect(fill = "#f1d9b5"),
        plot.background = element_rect(fill = "#f1d9b5")
  )
}

Ext_Pop_Graph <- Ext_Pop_Density %>% 
  mutate(Urban_Pop = Ext_Urban_Pop / 1000000,
         Censuses = as.character(Ext_Censuses),
         Population = Ext_Population / 1000000) %>% 
  select(Urban_Pop, Censuses, Population)


#### FIGURE 4: RECREATED GRAPHIC ####

png(here::here("gannett-census-pops", "04_full_unmasked.png"),width=1000,height=400)

ggplot(Urban_Pop_Graph) +
  # Total population
  geom_col(aes(y = Censuses, x = Population), width = .6, color = "black", fill = "#f1d9b5", alpha = 0) +
  # Urban Population overlaid on total population
  geom_col(aes(y = Censuses, x = Urban_Pop), width = .6, fill = "black") +
  labs(x = "[Millions of Inhabitants]", y = "", title = "Urban and Total Population at Each Census from 1790 to 1890") +
  scale_y_discrete(limits = rev) +
  # Add box to go around the census years
  coord_cartesian(xlim = c(.4, 62)) +
  scale_x_continuous(breaks = seq(0,60, by = 10), position = "top", limits = c(0,70)) +
  theme_linedraw() +
  theme(axis.title = element_text(size = 6, family = "serif"),
        plot.title = element_text(size = 10, family = "Puritan", hjust = .5, vjust = -1),
        axis.title.y = element_text(hjust = .5),
        axis.text.y = element_text(size = 7, margin = margin(l = 20, r = -29), color="black"),
        axis.text.x = element_text(size = 6, color="black"),
        axis.ticks = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_line(linewidth = .4),
        panel.border = element_rect(linewidth = .9),
        panel.background = element_rect(fill = "#f1d9b5"),
        plot.background = element_rect(fill = "#f1d9b5"))

dev.off()


#### FIGURE 1: CONCEALED GRAPHIC ####

png(here::here("gannett-census-pops", "01_full_masked.png"),width=1000,height=400)

ggplot(Urban_Pop_Graph) +
  # Total population
  geom_col(aes(y = Censuses, x = Population), width = .6, color = "black", fill = "#f1d9b5", alpha = 0) +
  # Urban Population overlaid on total population
  geom_col(aes(y = Censuses, x = Urban_Pop), width = .6, fill = "black") +
  labs(x = "[Millions of Inhabitants]", y = "", title = "Urban and Total Population at Each Census from 1790 to 1890") +
  scale_y_discrete(limits = rev) +
  # Add box to go around the census years
  coord_cartesian(xlim = c(.4, 62)) +
  scale_x_continuous(breaks = seq(0,60, by = 10), position = "top", limits = c(0,70)) +
  theme_linedraw() +
  theme(axis.title = element_text(size = 6, family = "serif",color="#f1d9b5"),
        plot.title = element_text(size = 10, family = "Puritan", hjust = .5, vjust = -1, color="#f1d9b5"),
        axis.title.y = element_text(hjust = .5, color="#f1d9b5"),
        axis.text.y = element_text(size = 7, margin = margin(l = 20, r = -29), color="#f1d9b5"),
        axis.text.x = element_text(size = 6, color="#f1d9b5"),
        axis.ticks = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_line(linewidth = .4),
        panel.border = element_rect(linewidth = .9),
        panel.background = element_rect(fill = "#f1d9b5"),
        plot.background = element_rect(fill = "#f1d9b5"))

dev.off()


#### FIGURE 2: REVEAL POPULATION ####

png(here::here("gannett-census-pops", "02_xlabel_unmasked.png"),width=1000,height=400)

ggplot(Urban_Pop_Graph) +
  # Total population
  geom_col(aes(y = Censuses, x = Population), width = .6, color = "black", fill = "#f1d9b5", alpha = 0) +
  # Urban Population overlaid on total population
  geom_col(aes(y = Censuses, x = Urban_Pop), width = .6, fill = "black") +
  labs(x = "[Millions of Inhabitants]", y = "", title = "Urban and Total Population at Each Census from 1790 to 1890") +
  scale_y_discrete(limits = rev) +
  # Add box to go around the census years
  coord_cartesian(xlim = c(.4, 62)) +
  scale_x_continuous(breaks = seq(0,60, by = 10), position = "top", limits = c(0,70)) +
  theme_linedraw() +
  theme(axis.title = element_text(size = 6, family = "serif",color="black"),
        plot.title = element_text(size = 10, family = "Puritan", hjust = .5, vjust = -1, color="#f1d9b5"),
        axis.title.y = element_text(hjust = .5, color="#f1d9b5"),
        axis.text.y = element_text(size = 7, margin = margin(l = 20, r = -29), color="#f1d9b5"),
        axis.text.x = element_text(size = 6, color="black"),
        axis.ticks = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_line(linewidth = .4),
        panel.border = element_rect(linewidth = .9),
        panel.background = element_rect(fill = "#f1d9b5"),
        plot.background = element_rect(fill = "#f1d9b5"))

dev.off()


#### FIGURE 3: REVEAL YEAR ####

png(here::here("gannett-census-pops", "03_ylabel_unmasked.png"),width=1000,height=400)

ggplot(Urban_Pop_Graph) +
  # Total population
  geom_col(aes(y = Censuses, x = Population), width = .6, color = "black", fill = "#f1d9b5", alpha = 0) +
  # Urban Population overlaid on total population
  geom_col(aes(y = Censuses, x = Urban_Pop), width = .6, fill = "black") +
  labs(x = "[Millions of Inhabitants]", y = "", title = "Urban and Total Population at Each Census from 1790 to 1890") +
  scale_y_discrete(limits = rev) +
  # Add box to go around the census years
  coord_cartesian(xlim = c(.4, 62)) +
  scale_x_continuous(breaks = seq(0,60, by = 10), position = "top", limits = c(0,70)) +
  theme_linedraw() +
  theme(axis.title = element_text(size = 6, family = "serif",color="black"),
        plot.title = element_text(size = 10, family = "Puritan", hjust = .5, vjust = -1, color="#f1d9b5"),
        axis.title.y = element_text(hjust = .5, color="#f1d9b5"),
        axis.text.y = element_text(size = 7, margin = margin(l = 20, r = -29), color="black"),
        axis.text.x = element_text(size = 6, color="black"),
        axis.ticks = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_line(linewidth = .4),
        panel.border = element_rect(linewidth = .9),
        panel.background = element_rect(fill = "#f1d9b5"),
        plot.background = element_rect(fill = "#f1d9b5"))

dev.off()









