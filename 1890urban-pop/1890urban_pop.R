#
# FILE:
#  agricultural_revolution.R
#
# DESCRIPTION:
# Two graphs from the Statistical atlas of the United States, based upon the results of the eleventh census. One showing population density over the first 11 censuses, and another showing the urban vs total population over the first 11 censuses
# 
# https://www.loc.gov/resource/g3701gm.gct00010/?sp=8&r=-0.202,0.628,1.251,0.513,0


# SLOW REVEAL ORDER:
#   1. 
#
# AUTHORS:
#   Connor Mcnamee (main code)
#   Ian Curtis (2023, code to save plots)


library(tidyverse)
library(showtext)
font_add_google("Puritan", "Puritan")
showtext_auto()
Total_Population <- read_csv(here::here("1890urban-pop", "1890urban_pop_data.csv"))

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
        panel.border = element_rect(fill = NA, size = 1.5)
  )
}

Ext_Pop_Graph <- Ext_Pop_Density %>% 
  mutate(Urban_Pop = Ext_Urban_Pop / 1000000,
         Censuses = as.character(Ext_Censuses),
         Population = Ext_Population / 1000000) %>% 
  select(Urban_Pop, Censuses, Population)

#### FIGURE 1: URBAN POPULATION FULL UNMASKED ####

png(here::here("1890urban-pop", "01_pop_full_unmasked.png"),width=900,height=500)
ggplot(Urban_Pop_Graph) +
  # Total population
  geom_col(aes(y = Censuses, x = Population), width = .6, color = "black", fill = "white", alpha = 0) +
  # Urban Population overlaid on total population
  geom_col(aes(y = Censuses, x = Urban_Pop), width = .6, fill = "black") +
  labs(x = "[Millions of Inhabitants]", y = "", title = "Urban and Total Population at Each Census: 1790 to 1890",
       subtitle = "   The total length of each bar represents the aggregate population, while the black portion of each bar indicates the urban element--that is, the population contained in cities \nhaving 8000 inhabitants or more.") +
  scale_y_discrete(limits = rev) +
  # Add box to go around the census years
  coord_cartesian(xlim = c(.4, 62)) +
  scale_x_continuous(breaks = seq(0,60, by = 10), position = "top", limits = c(0,70)) +
  theme_linedraw() +
  theme(axis.title = element_text(size = 6, family = "serif"),
        plot.title = element_text(size = 8, family = "Puritan", hjust = .5, vjust = -10),
        plot.subtitle = element_text(size = 8.5, family = "Puritan", vjust = -157, hjust = .001),
        axis.title.y = element_text(hjust = .5),
        axis.text.y = element_text(size = 7, margin = margin(l = 20, r = -29)),
        axis.text.x = element_text(size = 6),
        axis.ticks = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        # Make the graph wider instead of taller
        aspect.ratio = .3,
        panel.border = element_rect(fill = NA, size = 1.25)
  ) 
dev.off()

#### FIGURE 2: URBAN POPULATION FULL UNMASKED EXTENDED ####

# Creating graph extending through 1910
png(here::here("1890urban-pop", "02_ext_pop_full_unmasked.png"),width=900,height=500)
ggplot(Ext_Pop_Graph) +
  # Total population
  geom_col(aes(y = Censuses, x = Population), width = .6, color = "black", fill = "white", alpha = 0) +
  # Urban Population overlaid on total population
  geom_col(aes(y = Censuses, x = Urban_Pop), width = .6, fill = "black") +
  labs(x = "[Millions of Inhabitants]", y = "", title = "Urban and Total Population at Each Census: 1790 to 1890",
       subtitle = "   The total length of each bar represents the aggregate population, while the black portion of each bar indicates the urban element--that is, the population contained in cities \nhaving 8000 inhabitants or more.") +
  scale_y_discrete(limits = rev) +
  # Add box to go around the census years
  coord_cartesian(xlim = c(.4, 92)) +
  scale_x_continuous(breaks = seq(0,90, by = 10), position = "top", limits = c(0,92)) +
  theme_linedraw() +
  theme(axis.title = element_text(size = 6, family = "serif"),
        plot.title = element_text(size = 8, family = "Puritan", hjust = .5, vjust = -10),
        plot.subtitle = element_text(size = 8.5, family = "Puritan", vjust = -157, hjust = .001),
        axis.title.y = element_text(hjust = .5),
        axis.text.y = element_text(size = 7, margin = margin(l = 20, r = -29)),
        axis.text.x = element_text(size = 6),
        axis.ticks = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        # Make the graph wider instead of taller
        aspect.ratio = .3,
        panel.border = element_rect(fill = NA, size = 1.25)
  ) 
dev.off()



#### FIGURE 3: URBAN POPULATION 20TH CENTURY ####


year <- c("1910", "1920", "1930", "1940")
total <- c(91972266,105710620,122775046,131669275)
urban <- c(42166120,54304603,68954823,74423702)

New_Urban_Pop <- tibble(year,total,urban)

New_Pop_Graph <- New_Urban_Pop %>% 
  mutate(Urban_Pop = urban / 1000000,
         Censuses = as.character(year),
         Population = total / 1000000) %>% 
  select(Urban_Pop, Censuses, Population)




png(here::here("1890urban-pop", "03_20th_century_full_unmasked.png"),width=700,height=280)
ggplot(New_Pop_Graph) +
  # Total population
  geom_col(aes(y = Censuses, x = Population), width = .4, color = "black", fill = "white", alpha = 0) +
  # Urban Population overlaid on total population
  geom_col(aes(y = Censuses, x = Urban_Pop), width = .4, fill = "black") +
  labs(x = "[Millions of Inhabitants]", y = "", title = "Urban and Total Population at Each Census: 1910 to 1940",
       caption = "   The total length of each bar represents the aggregate population, while the black portion of each bar indicates the urban element--that is, the population contained in cities \nhaving 2500 inhabitants or more.") +
  scale_y_discrete(limits = rev) +
  # Add box to go around the census years
  coord_cartesian(xlim = c(0, 130), ylim = c()) +
  scale_x_continuous(breaks = seq(0,130, by = 10), position = "top", limits = c(0,150)) +
  theme_linedraw() +
  theme(axis.title = element_text(size = 6, family = "serif"),
        plot.title = element_text(size = 8, family = "Puritan", hjust = .5, vjust = -1.5),
        plot.caption = element_text(size = 7, family = "Puritan", vjust = 0, hjust = .001),
        axis.title.y = element_text(hjust = .5),
        axis.text.y = element_text(size = 7, margin = margin(l = 20, r = -27)),
        axis.text.x = element_text(size = 6),
        axis.ticks = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        # Make the graph wider instead of taller
        aspect.ratio = .3,
        panel.border = element_rect(fill = NA, size = 1.25)
  ) 
dev.off()


#### FIGURE 4: PEOPLE PER SQUARE MILE ####

Censuses <- c("1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890")
Population <- c(3929214,5308483,7239881,9633822,12866020,17069453,23191876,31443321,38558371,50155783,62622250)
Density <- c(4.75,6.41,3.62,4.82,6.25,8.29,7.78,10.39,12.74,16.58,20.70)
Urban_Pop <- c(119748,201806,315653,467252,856512,1449569,2896539,4645000,7538000,10794000,17446000)
Population_Density <- tibble(Censuses,Population,Density,Urban_Pop)


gannett <- function() {
  theme(axis.title = element_text(size = 9, family = "serif"),
        axis.text = element_text(size = 7, family = "serif"),
        plot.title = element_text(size = 10, family = "Puritan", hjust = .5, vjust = -3),
        axis.title.y = element_text(hjust = .5),
        axis.ticks = element_blank(),
        axis.text.y = element_text(size = 7.5, margin = margin(l = 20, r = -20.5)),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        aspect.ratio = 1.2,
        panel.border = element_rect(fill = NA, size = 1.5)
  )
}
Mod_Total_Population <- Population_Density %>% 
  mutate(New_censuses = as.character(Censuses)) %>% 
  select(New_censuses, Density)


png(here::here("1890urban-pop", "04_density_full_unmasked.png"),width=500,height=550)
ggplot(Mod_Total_Population) +
  annotate("segment", x = seq(0,20,2), xend = seq(0,20,2), y = 0, yend = 11.38) +
  annotate("segment", x = -2, xend = 22, y = 11.38, yend = 11.38) +
  geom_col(aes(y = New_censuses, x = Density), width = .4, color = "#1a1e19", fill = "#100e05") +
  labs(y = NULL, x = NULL, title = "Number of Inhabitants to the Square Mile \nat Each Census: 1790 to 1890") +
  scale_y_discrete(limits = rev) +
  scale_x_continuous(breaks = seq(0,20,2), position = "top", limit = c(-2,22)) +
  theme_linedraw() +
  coord_cartesian(xlim = c(-.5,20.85), ylim = c(1, 11.15)) +
  theme(axis.title = element_text(size = 9, family = "serif"),
        axis.text = element_text(size = 7.5, family = "serif"),
        plot.title = element_text(size = 13, family = "Puritan", hjust = .5, vjust = -3),
        axis.title.y = element_text(hjust = .5),
        axis.ticks = element_blank(),
        axis.text.y = element_text(size = 7.5, vjust = .75, margin = margin(r = -26)),
        axis.text.x.top = element_text(margin = margin(b = -16.5, t = 15)),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.x = element_blank(),
        aspect.ratio = 1.2,
        panel.border = element_rect(fill = NA, size = 1.05)
  )
dev.off()

#### FIGURE 5: PEOPLE PER SQUARE MILE EXTENDED ####

Ext_Censuses <- c("1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890", "1900","1910","1920","1930")
Ext_Density <- c(4.75,6.41,3.62,4.82,6.25,8.29,7.78,10.39,12.74,16.58,20.70,25.6,30.9,35.5,41.3)
Ext_Pop_Density <- tibble(Ext_Censuses,Ext_Density)
Ext_Density <- Ext_Pop_Density %>% 
  mutate(New_censuses = as.character(Ext_Censuses)) %>% 
  select(New_censuses, Ext_Density)

# Extended Graph

png(here::here("1890urban-pop", "05_ext_density_full_unmasked.png"),width=500,height=575)
ggplot(Ext_Density) +
  annotate("segment", x = seq(0,40,4), xend = seq(0,40,4), y = 0, yend = 15.4) +
  annotate("segment", x = -4, xend = 44, y = 15.4, yend = 15.4) +
  geom_col(aes(y = New_censuses, x = Ext_Density), width = .4, color = "#1a1e19", fill = "#100e05") +
  labs(y = NULL, x = NULL, title = "Number of Inhabitants to the Square Mile \nat Each Census: 1790 to 1930") +
  scale_y_discrete(limits = rev) +
  scale_x_continuous(breaks = seq(0,40,4), position = "top", limit = c(-4,44)) +
  theme_linedraw() +
  coord_cartesian(xlim = c(-.9,42), ylim = c(1, 15.22)) +
  theme(axis.title = element_text(size = 9, family = "serif"),
        axis.text = element_text(size = 7.5, family = "serif"),
        plot.title = element_text(size = 13, family = "Puritan", hjust = .5, vjust = -2),
        axis.title.y = element_text(hjust = .5),
        axis.ticks = element_blank(),
        axis.text.y = element_text(size = 7.5, vjust = .75, margin = margin(r = -25.5)),
        axis.text.x.top = element_text(margin = margin(b = -15.5, t = 14)),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.x = element_blank(),
        aspect.ratio = 1.2,
        panel.border = element_rect(fill = NA, size = 1.05)
  )
dev.off()