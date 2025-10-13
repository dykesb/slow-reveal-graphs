#
# FILE:
# race_by_year_state.R
#
# DESCRIPTION
# Percent of white and negroes in certain state at each census: 1790 to 1890

# https://www.loc.gov/resource/g3701gm.gct00010/?sp=25&r=0.134,0.019,0.795,0.356,0
#
#
# AUTHORS:
#   Alex Gichuki (main code)
# Ian Curtis (2023, code to save plots)


# setup
library(tidyverse)
library(showtext)
library(ggpattern)
library(cowplot)

# Fonts
font_add_google("Dynalight", "Dynalight")
font_add_google("Puritan", "Puritan")
showtext_auto()

#### Creating dataframes for individual states ####
DelawareDF <- data.frame(year = c("1780", "1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890"),
                         percent = c(0, 22, 22, 24, 24, 25, 25, 22, 19, 18, 18, 17))

KentuckyDF <- data.frame(year = c("1780","1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890"),
                         percent = c(0, 17, 19, 20, 23, 25, 24, 22, 20, 17, 16, 14.5))

NorthCarolinaDF <- data.frame(year = c("1780","1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890"),
                              percent = c(0, 28, 29, 32, 34, 36, 36, 36, 36, 37, 38, 35))

ArkansasDF <- data.frame(year = c("1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890"),
                         percent = c(0, 0, 0, 12, 16.5, 21, 23, 27, 26, 27, 28))

MarylandDF <- data.frame(year = c("1780", "1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890"),
                         percent = c(0, 35, 38, 38.5, 35.5, 35, 32, 28, 26, 22, 22, 21))

MissouriDF <- data.frame(year = c("1780", "1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890"),
                         percent = c(0, 0, 0, 18, 17, 18, 17, 13, 10, 8, 8, 6.5))

SouthCarolinaDF <- data.frame(year = c("1780", "1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890"),
                              percent = c(0, 44, 43, 48, 52, 56, 56, 59, 58, 59, 61, 60))

MississippiDF <- data.frame(year = c("1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890"),
                            percent = c(0, 41, 43, 44, 48, 52, 51, 55, 54, 58, 59))

DCdf <- data.frame(year = c("1780", "1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890"),
                   percent = c(0, 0, 29, 33, 32, 31, 30, 27, 19, 33, 34, 33))

TennesseeDF <- data.frame(year = c("1780", "1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890"),
                          percent = c(0, 11, 14, 18, 20, 21, 23, 28, 26.5, 26.5, 26.5, 24.5))

GeorgiaDF <- data.frame(year = c("1780", "1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890"),
                        percent = c(0, 36, 37, 42, 44, 42.5, 42, 42, 44, 46, 47, 47))

LouisianaDF <- data.frame(year = c("1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890"),
                          percent = c(0, 0, 56, 53, 59, 56, 51, 49, 50, 51, 50))

TexasDF <-data.frame(year = c("1780", "1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890"),
                     percent = c(0, 0, 0, 0, 0, 0, 0, 28, 30, 31, 26, 23))

AlabamaDF <- data.frame(year = c("1780", "1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890"),
                        percent = c(0, 0, 0, 0, 33, 38, 43, 45, 45, 48, 48, 45))

VirginiaDF <- data.frame(year = c("1780", "1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890"),
                         percent = c(0, 41, 42, 43, 43, 43, 40, 38, 34, 32, 31, 28))

FloridaDF <- data.frame(year = c("1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890"),
                        percent = c(0, 0,  0, 0, 48, 49, 46, 45, 49, 48, 42))



#### Delaware ####

# X axis text
DExtext <- c(" ", "1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890") 

# Delaware Plot
DEplot <- ggplot(DelawareDF, aes(x = year, y = percent)) +
  geom_bar_pattern(stat = "identity", width = 1, color = "black", fill = "white", 
                   pattern = "stripe", pattern_density = .01, pattern_spacing = .022,
                   pattern_angle = 70) +
  scale_x_discrete(label = DExtext, expand = c(0,0), position = "top") +
  scale_y_continuous(limits = c(0,120), expand = c(0,0), breaks = seq(10, 100, by = 10)) +
  geom_segment(x = 1.5:12.5, xend = 1.5:12.5, y = 0, yend = 100) +
  geom_segment(x = 1.5, xend = 12.5, y = 10, yend = 10) +
  geom_segment(x = 1.5, xend = 12.5, y = 20, yend = 20) +
  geom_segment(x = 1.5, xend = 12.5, y = 30, yend = 30) +
  geom_segment(x = 1.5, xend = 12.5, y = 40, yend = 40) +
  geom_segment(x = 1.5, xend = 12.5, y = 50, yend = 50) +
  geom_segment(x = 1.5, xend = 12.5, y = 60, yend = 60) +
  geom_segment(x = 1.5, xend = 12.5, y = 70, yend = 70) +
  geom_segment(x = 1.5, xend = 12.5, y = 80, yend = 80) +
  geom_segment(x = 1.5, xend = 12.5, y = 90, yend = 90) +
  geom_segment(x = 1.5, xend = 12.5, y = 100, yend = 100) +
  labs(y = NULL, x = NULL) +
  annotate("text", x = 6.5, y = 65, family = "Puritan", color = "black", label = "WHITE", size = 25) + 
  annotate("text", x = 6.5, y = 15, family = "Puritan", color = "black", label = "NEGRO", size = 25) +
  annotate("text", x = 6.5, y = 115, family = "Puritan", color = "black", label = "DELAWARE", size = 25) +
  theme(axis.text.x.top = element_text(margin = margin(b = -60, t = 20),
                                       colour = "gray21",
                                       face = "bold", family = "Puritan", angle = 90, size = 25),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05, size = 25,
                                   margin = margin(l = -20, r = -20), colour = "gray21", 
                                   face = "bold", family = "Puritan")) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(2,1,1,1.4, "cm"))

ggsave(here::here("race-by-year-state", "DE_full_unmasked.png"), DEplot)



#### Kentucky ####
# X axis text
KYxtext <- c(" ", "1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890")

# Kentucky Plot
KYplot <- ggplot(KentuckyDF, aes(x = year, y = percent)) +
  geom_bar_pattern(stat = "identity", width = 1, color = "black", fill = "white", 
                   pattern = "stripe", pattern_density = .01, pattern_spacing = .022,
                   pattern_angle = 70) +
  scale_x_discrete(label = KYxtext, expand = c(0,0), position = "top") +
  scale_y_continuous(limits = c(0,120), expand = c(0,0), breaks = seq(10, 100, by = 10)) +
  geom_segment(x = 1.5:12.5, xend = 1.5:12.5, y = 0, yend = 100) +
  geom_segment(x = 1.5, xend = 12.5, y = 10, yend = 10) +
  geom_segment(x = 1.5, xend = 12.5, y = 20, yend = 20) +
  geom_segment(x = 1.5, xend = 12.5, y = 30, yend = 30) +
  geom_segment(x = 1.5, xend = 12.5, y = 40, yend = 40) +
  geom_segment(x = 1.5, xend = 12.5, y = 50, yend = 50) +
  geom_segment(x = 1.5, xend = 12.5, y = 60, yend = 60) +
  geom_segment(x = 1.5, xend = 12.5, y = 70, yend = 70) +
  geom_segment(x = 1.5, xend = 12.5, y = 80, yend = 80) +
  geom_segment(x = 1.5, xend = 12.5, y = 90, yend = 90) +
  geom_segment(x = 1.5, xend = 12.5, y = 100, yend = 100) +
  labs(y = NULL, x = NULL) +
  annotate("text", x = 6.5, y = 65, family = "Puritan", color = "black", label = "WHITE", size = 25) + 
  annotate("text", x = 6.5, y = 15, family = "Puritan", color = "black", label = "NEGRO", size = 25) +
  annotate("text", x = 6.5, y = 115, family = "Puritan", color = "black", label = "KENTUCKY", size = 25) +
  theme(axis.text.x.top = element_text(margin = margin(b = -60, t = 20),
                                       colour = "gray21", 
                                       face = "bold", family = "Puritan", angle = 90, size = 25),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05, size = 25,
                                   margin = margin(l = -20, r = -20), colour = "gray21", 
                                   face = "bold", family = "Puritan")) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(2,1,1,1.4, "cm"))

ggsave(here::here("race-by-year-state", "KY_full_unmasked.png"), KYplot)

#### North Carolina ####
# X axis text
NCxtext <- c(" ", "1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890")

#North Carolina plot
NCplot <- ggplot(NorthCarolinaDF, aes(x = year, y = percent)) +
  geom_bar_pattern(stat = "identity", width = 1, color = "black", fill = "white", 
                   pattern = "stripe", pattern_density = .01, pattern_spacing = .022,
                   pattern_angle = 70) +
  scale_x_discrete(label = NCxtext, expand = c(0,0), position = "top") +
  scale_y_continuous(limits = c(0,120), expand = c(0,0), breaks = seq(10, 100, by = 10)) +
  geom_segment(x = 1.5:12.5, xend = 1.5:12.5, y = 0, yend = 100) +
  geom_segment(x = 1.5, xend = 12.5, y = 10, yend = 10) +
  geom_segment(x = 1.5, xend = 12.5, y = 20, yend = 20) +
  geom_segment(x = 1.5, xend = 12.5, y = 30, yend = 30) +
  geom_segment(x = 1.5, xend = 12.5, y = 40, yend = 40) +
  geom_segment(x = 1.5, xend = 12.5, y = 50, yend = 50) +
  geom_segment(x = 1.5, xend = 12.5, y = 60, yend = 60) +
  geom_segment(x = 1.5, xend = 12.5, y = 70, yend = 70) +
  geom_segment(x = 1.5, xend = 12.5, y = 80, yend = 80) +
  geom_segment(x = 1.5, xend = 12.5, y = 90, yend = 90) +
  geom_segment(x = 1.5, xend = 12.5, y = 100, yend = 100) +
  labs(y = NULL, x = NULL) +
  annotate("text", x = 6.5, y = 65, family = "Puritan", color = "black", label = "WHITE", size = 25) + 
  annotate("text", x = 6.5, y = 15, family = "Puritan", color = "black", label = "NEGRO", size = 25) +
  annotate("text", x = 6.5, y = 115, family = "Puritan", color = "black", label = "NORTH CAROLINA", size = 25) +
  theme(axis.text.x.top = element_text(margin = margin(b = -60, t = 20),
                                       colour = "gray21", 
                                       face = "bold", family = "Puritan", angle = 90, size = 25),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05, size = 25,
                                   margin = margin(l = -20, r = -20), colour = "gray21", 
                                   face = "bold", family = "Puritan")) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(2,1,1,1.4, "cm"))

ggsave(here::here("race-by-year-state", "NC_full_unmasked.png"), NCplot)


#### Arkansas ####

# X axis text
ARxtext <- c(" ", " ", " ", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890") 

# Arkansas plot
ARplot <- ggplot(ArkansasDF, aes(x = year, y = percent)) +
  geom_bar_pattern(stat = "identity", width = 1, color = "black", fill = "white", 
                   pattern = "stripe", pattern_density = .01, pattern_spacing = .022,
                   pattern_angle = 70) +
  scale_x_discrete(label = ARxtext, expand = c(0,0), position = "top") +
  scale_y_continuous(limits = c(0,120), expand = c(0,0), breaks = seq(10, 100, by = 10)) +
  geom_segment(x = 1.5:11.5, xend = 1.5:11.5, y = 0, yend = 100) +
  geom_segment(x = 1.5, xend = 12.5, y = 10, yend = 10) +
  geom_segment(x = 1.5, xend = 12.5, y = 20, yend = 20) +
  geom_segment(x = 1.5, xend = 12.5, y = 30, yend = 30) +
  geom_segment(x = 1.5, xend = 12.5, y = 40, yend = 40) +
  geom_segment(x = 1.5, xend = 12.5, y = 50, yend = 50) +
  geom_segment(x = 1.5, xend = 12.5, y = 60, yend = 60) +
  geom_segment(x = 1.5, xend = 12.5, y = 70, yend = 70) +
  geom_segment(x = 1.5, xend = 12.5, y = 80, yend = 80) +
  geom_segment(x = 1.5, xend = 12.5, y = 90, yend = 90) +
  geom_segment(x = 1.5, xend = 12.5, y = 100, yend = 100) +
  labs(y = NULL, x = NULL) +
  annotate("text", x = 6.5, y = 65, family = "Puritan", color = "black", label = "WHITE", size = 25) + 
  annotate("text", x = 8.5, y = 15, family = "Puritan", color = "black", label = "NEGRO", size = 25) +
  annotate("text", x = 6.5, y = 115, family = "Puritan", color = "black", label = "ARKANSAS", size = 25) +
  theme(axis.text.x.top = element_text(margin = margin(b = -60, t = 20),
                                       colour = "gray21", 
                                       face = "bold", family = "Puritan", angle = 90, size = 25),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05, size = 25,
                                   margin = margin(l = -20, r = -20), colour = "gray21", 
                                   face = "bold", family = "Puritan")) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(2,1,1,1.4, "cm"))

ggsave(here::here("race-by-year-state", "AR_full_unmasked.png"), ARplot)


#### Maryland ####

# X axis text
MDxtext <- c(" ", "1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890") 

# Maryland Plot
MDplot <- ggplot(MarylandDF, aes(x = year, y = percent)) +
  geom_bar_pattern(stat = "identity", width = 1, color = "black", fill = "white", 
                   pattern = "stripe", pattern_density = .01, pattern_spacing = .022,
                   pattern_angle = 70) +
  scale_x_discrete(label = MDxtext, expand = c(0,0), position = "top") +
  scale_y_continuous(limits = c(0,120), expand = c(0,0), breaks = seq(10, 100, by = 10)) +
  geom_segment(x = 1.5:12.5, xend = 1.5:12.5, y = 0, yend = 100) +
  geom_segment(x = 1.5, xend = 12.5, y = 10, yend = 10) +
  geom_segment(x = 1.5, xend = 12.5, y = 20, yend = 20) +
  geom_segment(x = 1.5, xend = 12.5, y = 30, yend = 30) +
  geom_segment(x = 1.5, xend = 12.5, y = 40, yend = 40) +
  geom_segment(x = 1.5, xend = 12.5, y = 50, yend = 50) +
  geom_segment(x = 1.5, xend = 12.5, y = 60, yend = 60) +
  geom_segment(x = 1.5, xend = 12.5, y = 70, yend = 70) +
  geom_segment(x = 1.5, xend = 12.5, y = 80, yend = 80) +
  geom_segment(x = 1.5, xend = 12.5, y = 90, yend = 90) +
  geom_segment(x = 1.5, xend = 12.5, y = 100, yend = 100) +
  labs(y = NULL, x = NULL) +
  annotate("text", x = 6.5, y = 65, family = "Puritan", color = "black", label = "WHITE", size = 25) + 
  annotate("text", x = 6.5, y = 15, family = "Puritan", color = "black", label = "NEGRO", size = 25) +
  annotate("text", x = 6.5, y = 115, family = "Puritan", color = "black", label = "MARYLAND", size = 25) +
  theme(axis.text.x.top = element_text(margin = margin(b = -60, t = 20),
                                       colour = "gray21", 
                                       face = "bold", family = "Puritan", angle = 90, size = 25),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05, size = 25,
                                   margin = margin(l = -20, r = -20), colour = "gray21", 
                                   face = "bold", family = "Puritan")) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(2,1,1,1.4, "cm"))

ggsave(here::here("race-by-year-state", "MD_full_unmasked.png"), MDplot)


#### Missouri ####

# X axis text
MOxtext <- c(" ", " ", " ", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890") 

# Delaware Plot
MOplot <- ggplot(MissouriDF, aes(x = year, y = percent)) +
  geom_bar_pattern(stat = "identity", width = 1, color = "black", fill = "white", 
                   pattern = "stripe", pattern_density = .01, pattern_spacing = .022,
                   pattern_angle = 70) +
  scale_x_discrete(label = MOxtext, expand = c(0,0), position = "top") +
  scale_y_continuous(limits = c(0,120), expand = c(0,0), breaks = seq(10, 100, by = 10)) +
  geom_segment(x = 1.5:12.5, xend = 1.5:12.5, y = 0, yend = 100) +
  geom_segment(x = 1.5, xend = 12.5, y = 10, yend = 10) +
  geom_segment(x = 1.5, xend = 12.5, y = 20, yend = 20) +
  geom_segment(x = 1.5, xend = 12.5, y = 30, yend = 30) +
  geom_segment(x = 1.5, xend = 12.5, y = 40, yend = 40) +
  geom_segment(x = 1.5, xend = 12.5, y = 50, yend = 50) +
  geom_segment(x = 1.5, xend = 12.5, y = 60, yend = 60) +
  geom_segment(x = 1.5, xend = 12.5, y = 70, yend = 70) +
  geom_segment(x = 1.5, xend = 12.5, y = 80, yend = 80) +
  geom_segment(x = 1.5, xend = 12.5, y = 90, yend = 90) +
  geom_segment(x = 1.5, xend = 12.5, y = 100, yend = 100) +
  labs(y = NULL, x = NULL) +
  annotate("text", x = 6.5, y = 65, family = "Puritan", color = "black", label = "WHITE", size = 25) + 
  annotate("text", x = 6.5, y = 7, family = "Puritan", color = "black", label = "NEGRO", size = 25) +
  annotate("text", x = 6.5, y = 115, family = "Puritan", color = "black", label = "MISSOURI", size = 25) +
  theme(axis.text.x.top = element_text(margin = margin(b = -60, t = 20),
                                       colour = "gray21", 
                                       face = "bold", family = "Puritan", angle = 90, size = 25),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05, size = 25,
                                   margin = margin(l = -20, r = -20), colour = "gray21", 
                                   face = "bold", family = "Puritan")) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(2,1,1,1.4, "cm"))

ggsave(here::here("race-by-year-state", "MO_full_unmasked.png"), MOplot)


#### South Carolina ####

# X axis text
SCxtext <- c(" ", "1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890") 

# South Carolina Plot
SCplot <- ggplot(SouthCarolinaDF, aes(x = year, y = percent)) +
  geom_bar_pattern(stat = "identity", width = 1, color = "black", fill = "white", 
                   pattern = "stripe", pattern_density = .01, pattern_spacing = .022,
                   pattern_angle = 70) +
  scale_x_discrete(label = SCxtext, expand = c(0,0), position = "top") +
  scale_y_continuous(limits = c(0,120), expand = c(0,0), breaks = seq(10, 100, by = 10)) +
  geom_segment(x = 1.5:12.5, xend = 1.5:12.5, y = 0, yend = 100) +
  geom_segment(x = 1.5, xend = 12.5, y = 10, yend = 10) +
  geom_segment(x = 1.5, xend = 12.5, y = 20, yend = 20) +
  geom_segment(x = 1.5, xend = 12.5, y = 30, yend = 30) +
  geom_segment(x = 1.5, xend = 12.5, y = 40, yend = 40) +
  geom_segment(x = 1.5, xend = 12.5, y = 50, yend = 50) +
  geom_segment(x = 1.5, xend = 12.5, y = 60, yend = 60) +
  geom_segment(x = 1.5, xend = 12.5, y = 70, yend = 70) +
  geom_segment(x = 1.5, xend = 12.5, y = 80, yend = 80) +
  geom_segment(x = 1.5, xend = 12.5, y = 90, yend = 90) +
  geom_segment(x = 1.5, xend = 12.5, y = 100, yend = 100) +
  labs(y = NULL, x = NULL) +
  annotate("text", x = 6.5, y = 67, family = "Puritan", color = "black", label = "WHITE", size = 25) + 
  annotate("text", x = 6.5, y = 27, family = "Puritan", color = "black", label = "NEGRO", size = 25) +
  annotate("text", x = 6.5, y = 115, family = "Puritan", color = "black", label = "SOUTH CAROLINA", size = 25) +
  theme(axis.text.x.top = element_text(margin = margin(b = -60, t = 20),
                                       colour = "gray21", 
                                       face = "bold", family = "Puritan", angle = 90, size = 25),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05, size = 25,
                                   margin = margin(l = -20, r = -20), colour = "gray21", 
                                   face = "bold", family = "Puritan")) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(2,1,1,1.4, "cm"))

ggsave(here::here("race-by-year-state", "SC_full_unmasked.png"), SCplot)



#### Mississippi ####

# X axis text
MSxtext <- c(" ", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890") 

# Mississippi Plot
MSplot <- ggplot(MississippiDF, aes(x = year, y = percent)) +
  geom_bar_pattern(stat = "identity", width = 1, color = "black", fill = "white", 
                   pattern = "stripe", pattern_density = .01, pattern_spacing = .022,
                   pattern_angle = 70) +
  scale_x_discrete(label = MSxtext, expand = c(0,0), position = "top") +
  scale_y_continuous(limits = c(0,120), expand = c(0,0), breaks = seq(10, 100, by = 10)) +
  geom_segment(x = 1.5:11.5, xend = 1.5:11.5, y = 0, yend = 100) +
  geom_segment(x = 1.5, xend = 12.5, y = 10, yend = 10) +
  geom_segment(x = 1.5, xend = 12.5, y = 20, yend = 20) +
  geom_segment(x = 1.5, xend = 12.5, y = 30, yend = 30) +
  geom_segment(x = 1.5, xend = 12.5, y = 40, yend = 40) +
  geom_segment(x = 1.5, xend = 12.5, y = 50, yend = 50) +
  geom_segment(x = 1.5, xend = 12.5, y = 60, yend = 60) +
  geom_segment(x = 1.5, xend = 12.5, y = 70, yend = 70) +
  geom_segment(x = 1.5, xend = 12.5, y = 80, yend = 80) +
  geom_segment(x = 1.5, xend = 12.5, y = 90, yend = 90) +
  geom_segment(x = 1.5, xend = 12.5, y = 100, yend = 100) +
  labs(y = NULL, x = NULL) +
  annotate("text", x = 6.5, y = 67, family = "Puritan", color = "black", label = "WHITE", size = 25) + 
  annotate("text", x = 6.5, y = 27, family = "Puritan", color = "black", label = "NEGRO", size = 25) +
  annotate("text", x = 6.5, y = 115, family = "Puritan", color = "black", label = "MISSISSIPPI", size = 25) +
  theme(axis.text.x.top = element_text(margin = margin(b = -60, t = 20),
                                       colour = "gray21", 
                                       face = "bold", family = "Puritan", angle = 90, size = 25),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05, size = 25,
                                   margin = margin(l = -20, r = -20), colour = "gray21", 
                                   face = "bold", family = "Puritan")) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(2,1,1,1.4, "cm"))

ggsave(here::here("race-by-year-state", "MS_full_unmasked.png"), MSplot)


#### DC ####

# X axis text
DCxtext <- c(" ", " ", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890") 

# DC Plot
DCplot <- ggplot(DCdf, aes(x = year, y = percent)) +
  geom_bar_pattern(stat = "identity", width = 1, color = "black", fill = "white", 
                   pattern = "stripe", pattern_density = .01, pattern_spacing = .022,
                   pattern_angle = 70) +
  scale_x_discrete(label = DCxtext, expand = c(0,0), position = "top") +
  scale_y_continuous(limits = c(0,120), expand = c(0,0), breaks = seq(10, 100, by = 10)) +
  geom_segment(x = 1.5:12.5, xend = 1.5:12.5, y = 0, yend = 100) +
  geom_segment(x = 1.5, xend = 12.5, y = 10, yend = 10) +
  geom_segment(x = 1.5, xend = 12.5, y = 20, yend = 20) +
  geom_segment(x = 1.5, xend = 12.5, y = 30, yend = 30) +
  geom_segment(x = 1.5, xend = 12.5, y = 40, yend = 40) +
  geom_segment(x = 1.5, xend = 12.5, y = 50, yend = 50) +
  geom_segment(x = 1.5, xend = 12.5, y = 60, yend = 60) +
  geom_segment(x = 1.5, xend = 12.5, y = 70, yend = 70) +
  geom_segment(x = 1.5, xend = 12.5, y = 80, yend = 80) +
  geom_segment(x = 1.5, xend = 12.5, y = 90, yend = 90) +
  geom_segment(x = 1.5, xend = 12.5, y = 100, yend = 100) +
  labs(y = NULL, x = NULL) +
  annotate("text", x = 6.5, y = 67, family = "Puritan", color = "black", label = "WHITE", size = 25) + 
  annotate("text", x = 6.5, y = 17, family = "Puritan", color = "black", label = "NEGRO", size = 25) +
  annotate("text", x = 6.5, y = 115, family = "Puritan", color = "black", label = "DISTRICT of COLUMBIA", size = 25) +
  theme(axis.text.x.top = element_text(margin = margin(b = -60, t = 20),
                                       colour = "gray21", 
                                       face = "bold", family = "Puritan", angle = 90, size = 25),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05, size = 25,
                                   margin = margin(l = -20, r = -20), colour = "gray21", 
                                   face = "bold", family = "Puritan")) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(2,1,1,1.4, "cm"))

ggsave(here::here("race-by-year-state", "DC_full_unmasked.png"), DCplot)


#### Tennessee ####

# X axis text
TNxtext <- c(" ", "1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890") 

# TENNESSEE Plot
TNplot <- ggplot(TennesseeDF, aes(x = year, y = percent)) +
  geom_bar_pattern(stat = "identity", width = 1, color = "black", fill = "white", 
                   pattern = "stripe", pattern_density = .01, pattern_spacing = .022,
                   pattern_angle = 70) +
  scale_x_discrete(label = TNxtext, expand = c(0,0), position = "top") +
  scale_y_continuous(limits = c(0,120), expand = c(0,0), breaks = seq(10, 100, by = 10)) +
  geom_segment(x = 1.5:12.5, xend = 1.5:12.5, y = 0, yend = 100) +
  geom_segment(x = 1.5, xend = 12.5, y = 10, yend = 10) +
  geom_segment(x = 1.5, xend = 12.5, y = 20, yend = 20) +
  geom_segment(x = 1.5, xend = 12.5, y = 30, yend = 30) +
  geom_segment(x = 1.5, xend = 12.5, y = 40, yend = 40) +
  geom_segment(x = 1.5, xend = 12.5, y = 50, yend = 50) +
  geom_segment(x = 1.5, xend = 12.5, y = 60, yend = 60) +
  geom_segment(x = 1.5, xend = 12.5, y = 70, yend = 70) +
  geom_segment(x = 1.5, xend = 12.5, y = 80, yend = 80) +
  geom_segment(x = 1.5, xend = 12.5, y = 90, yend = 90) +
  geom_segment(x = 1.5, xend = 12.5, y = 100, yend = 100) +
  labs(y = NULL, x = NULL) +
  annotate("text", x = 6.5, y = 67, family = "Puritan", color = "black", label = "WHITE", size = 25) + 
  annotate("text", x = 7.5, y = 17, family = "Puritan", color = "black", label = "NEGRO", size = 25) +
  annotate("text", x = 6.5, y = 115, family = "Puritan", color = "black", label = "TENNESSEE", size = 25) +
  theme(axis.text.x.top = element_text(margin = margin(b = -60, t = 20),
                                       colour = "gray21", 
                                       face = "bold", family = "Puritan", angle = 90, size = 25),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05, size = 25,
                                   margin = margin(l = -20, r = -20), colour = "gray21", 
                                   face = "bold", family = "Puritan")) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(2,1,1,1.4, "cm"))

ggsave(here::here("race-by-year-state", "TN_full_unmasked.png"), TNplot)


#### Georgia ####

# X axis text
GAxtext <- c(" ", "1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890") 

# GEORGIA Plot
GAplot <- ggplot(GeorgiaDF, aes(x = year, y = percent)) +
  geom_bar_pattern(stat = "identity", width = 1, color = "black", fill = "white", 
                   pattern = "stripe", pattern_density = .01, pattern_spacing = .022,
                   pattern_angle = 70) +
  scale_x_discrete(label = GAxtext, expand = c(0,0), position = "top") +
  scale_y_continuous(limits = c(0,120), expand = c(0,0), breaks = seq(10, 100, by = 10)) +
  geom_segment(x = 1.5:12.5, xend = 1.5:12.5, y = 0, yend = 100) +
  geom_segment(x = 1.5, xend = 12.5, y = 10, yend = 10) +
  geom_segment(x = 1.5, xend = 12.5, y = 20, yend = 20) +
  geom_segment(x = 1.5, xend = 12.5, y = 30, yend = 30) +
  geom_segment(x = 1.5, xend = 12.5, y = 40, yend = 40) +
  geom_segment(x = 1.5, xend = 12.5, y = 50, yend = 50) +
  geom_segment(x = 1.5, xend = 12.5, y = 60, yend = 60) +
  geom_segment(x = 1.5, xend = 12.5, y = 70, yend = 70) +
  geom_segment(x = 1.5, xend = 12.5, y = 80, yend = 80) +
  geom_segment(x = 1.5, xend = 12.5, y = 90, yend = 90) +
  geom_segment(x = 1.5, xend = 12.5, y = 100, yend = 100) +
  labs(y = NULL, x = NULL) +
  annotate("text", x = 6.5, y = 67, family = "Puritan", color = "black", label = "WHITE", size = 25) + 
  annotate("text", x = 6.5, y = 27, family = "Puritan", color = "black", label = "NEGRO", size = 25) +
  annotate("text", x = 6.5, y = 115, family = "Puritan", color = "black", label = "GEORGIA", size = 25) +
  theme(axis.text.x.top = element_text(margin = margin(b = -60, t = 20),
                                       colour = "gray21", 
                                       face = "bold", family = "Puritan", angle = 90, size = 25),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05, size = 25,
                                   margin = margin(l = -20, r = -20), colour = "gray21", 
                                   face = "bold", family = "Puritan")) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(2,1,1,1.4, "cm"))

ggsave(here::here("race-by-year-state", "GA_full_unmasked.png"), GAplot)


#### Louisiana ####

# X axis text
LAxtext <- c(" ", " ", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890") 

# Louisiana Plot
LAplot <- ggplot(LouisianaDF, aes(x = year, y = percent)) +
  geom_bar_pattern(stat = "identity", width = 1, color = "black", fill = "white", 
                   pattern = "stripe", pattern_density = .01, pattern_spacing = .022,
                   pattern_angle = 70) +
  scale_x_discrete(label = LAxtext, expand = c(0,0), position = "top") +
  scale_y_continuous(limits = c(0,120), expand = c(0,0), breaks = seq(10, 100, by = 10)) +
  geom_segment(x = 1.5:11.5, xend = 1.5:11.5, y = 0, yend = 100) +
  geom_segment(x = 1.5, xend = 12.5, y = 10, yend = 10) +
  geom_segment(x = 1.5, xend = 12.5, y = 20, yend = 20) +
  geom_segment(x = 1.5, xend = 12.5, y = 30, yend = 30) +
  geom_segment(x = 1.5, xend = 12.5, y = 40, yend = 40) +
  geom_segment(x = 1.5, xend = 12.5, y = 50, yend = 50) +
  geom_segment(x = 1.5, xend = 12.5, y = 60, yend = 60) +
  geom_segment(x = 1.5, xend = 12.5, y = 70, yend = 70) +
  geom_segment(x = 1.5, xend = 12.5, y = 80, yend = 80) +
  geom_segment(x = 1.5, xend = 12.5, y = 90, yend = 90) +
  geom_segment(x = 1.5, xend = 12.5, y = 100, yend = 100) +
  labs(y = NULL, x = NULL) +
  annotate("text", x = 6.5, y = 67, family = "Puritan", color = "black", label = "WHITE", size = 25) + 
  annotate("text", x = 6.5, y = 34, family = "Puritan", color = "black", label = "NEGRO", size = 25) +
  annotate("text", x = 6.5, y = 115, family = "Puritan", color = "black", label = "LOUISIANA", size = 25) +
  theme(axis.text.x.top = element_text(margin = margin(b = -60, t = 20),
                                       colour = "gray21", 
                                       face = "bold", family = "Puritan", angle = 90, size = 25),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05, size = 25,
                                   margin = margin(l = -20, r = -20), colour = "gray21", 
                                   face = "bold", family = "Puritan")) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(2,1,1,1.4, "cm"))

ggsave(here::here("race-by-year-state", "LA_full_unmasked.png"), LAplot)



#### Virginia & West Virginia ####

# X axis text
VAxtext <- c(" ", "1790", "1800", "1810", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890") 

# Delaware Plot
VAplot <- ggplot(VirginiaDF, aes(x = year, y = percent)) +
  geom_bar_pattern(stat = "identity", width = 1, color = "black", fill = "white", 
                   pattern = "stripe", pattern_density = .01, pattern_spacing = .022,
                   pattern_angle = 70) +
  scale_x_discrete(label = VAxtext, expand = c(0,0), position = "top") +
  scale_y_continuous(limits = c(0,120), expand = c(0,0), breaks = seq(10, 100, by = 10)) +
  geom_segment(x = 1.5:12.5, xend = 1.5:12.5, y = 0, yend = 100) +
  geom_segment(x = 1.5, xend = 12.5, y = 10, yend = 10) +
  geom_segment(x = 1.5, xend = 12.5, y = 20, yend = 20) +
  geom_segment(x = 1.5, xend = 12.5, y = 30, yend = 30) +
  geom_segment(x = 1.5, xend = 12.5, y = 40, yend = 40) +
  geom_segment(x = 1.5, xend = 12.5, y = 50, yend = 50) +
  geom_segment(x = 1.5, xend = 12.5, y = 60, yend = 60) +
  geom_segment(x = 1.5, xend = 12.5, y = 70, yend = 70) +
  geom_segment(x = 1.5, xend = 12.5, y = 80, yend = 80) +
  geom_segment(x = 1.5, xend = 12.5, y = 90, yend = 90) +
  geom_segment(x = 1.5, xend = 12.5, y = 100, yend = 100) +
  labs(y = NULL, x = NULL) +
  annotate("text", x = 6.5, y = 65, family = "Puritan", color = "black", label = "WHITE", size = 25) + 
  annotate("text", x = 6.5, y = 15, family = "Puritan", color = "black", label = "NEGRO", size = 25) +
  annotate("text", x = 6.5, y = 115, family = "Puritan", color = "black", label = "VIRGINIA & WEST VIRGINIA", size = 25) +
  theme(axis.text.x.top = element_text(margin = margin(b = -60, t = 20),
                                       colour = "gray21", 
                                       face = "bold", family = "Puritan", angle = 90, size = 25),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05, size = 25,
                                   margin = margin(l = -20, r = -20), colour = "gray21", 
                                   face = "bold", family = "Puritan")) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(2,1,1,1.4, "cm"))

ggsave(here::here("race-by-year-state", "VA_full_unmasked.png"), VAplot)

#### Texas ####

# X axis text
TXxtext <- c(" ", " ", " ", " ", " ", " ", " ", "1850", "1860", "1870", "1880", "1890") 

# Texas Plot
TXplot <- ggplot(TexasDF, aes(x = year, y = percent)) +
  geom_bar_pattern(stat = "identity", width = 1, color = "black", fill = "white", 
                   pattern = "stripe", pattern_density = .01, pattern_spacing = .022,
                   pattern_angle = 70) +
  scale_x_discrete(label = TXxtext, expand = c(0,0), position = "top") +
  scale_y_continuous(limits = c(0,120), expand = c(0,0), breaks = seq(10, 100, by = 10)) +
  geom_segment(x = 1.5:12.5, xend = 1.5:12.5, y = 0, yend = 100) +
  geom_segment(x = 1.5, xend = 12.5, y = 10, yend = 10) +
  geom_segment(x = 1.5, xend = 12.5, y = 20, yend = 20) +
  geom_segment(x = 1.5, xend = 12.5, y = 30, yend = 30) +
  geom_segment(x = 1.5, xend = 12.5, y = 40, yend = 40) +
  geom_segment(x = 1.5, xend = 12.5, y = 50, yend = 50) +
  geom_segment(x = 1.5, xend = 12.5, y = 60, yend = 60) +
  geom_segment(x = 1.5, xend = 12.5, y = 70, yend = 70) +
  geom_segment(x = 1.5, xend = 12.5, y = 80, yend = 80) +
  geom_segment(x = 1.5, xend = 12.5, y = 90, yend = 90) +
  geom_segment(x = 1.5, xend = 12.5, y = 100, yend = 100) +
  labs(y = NULL, x = NULL) +
  annotate("text", x = 10, y = 65, family = "Puritan", color = "black", label = "WHITE", size = 25) + 
  annotate("text", x = 10, y = 15, family = "Puritan", color = "black", label = "NEGRO", size = 25) +
  annotate("text", x = 6.5, y = 115, family = "Puritan", color = "black", label = "TEXAS", size = 25) +
  theme(axis.text.x.top = element_text(margin = margin(b = -60, t = 20),
                                       colour = "gray21", 
                                       face = "bold", family = "Puritan", angle = 90, size = 25),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05, size = 25,
                                   margin = margin(l = -20, r = -20), colour = "gray21", 
                                   face = "bold", family = "Puritan")) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(2,1,1,1.4, "cm"))

ggsave(here::here("race-by-year-state", "TX_full_unmasked.png"), TXplot)


#### Alabama ####

# X axis text
ALxtext <- c(" ", " ", " ", " ", "1820", "1830", "1840", "1850", "1860", "1870", "1880", "1890") 

# Alabama Plot
ALplot <- ggplot(AlabamaDF, aes(x = year, y = percent)) +
  geom_bar_pattern(stat = "identity", width = 1, color = "black", fill = "white", 
                   pattern = "stripe", pattern_density = .01, pattern_spacing = .022,
                   pattern_angle = 70) +
  scale_x_discrete(label = ALxtext, expand = c(0,0), position = "top") +
  scale_y_continuous(limits = c(0,120), expand = c(0,0), breaks = seq(10, 100, by = 10)) +
  geom_segment(x = 1.5:12.5, xend = 1.5:12.5, y = 0, yend = 100) +
  geom_segment(x = 1.5, xend = 12.5, y = 10, yend = 10) +
  geom_segment(x = 1.5, xend = 12.5, y = 20, yend = 20) +
  geom_segment(x = 1.5, xend = 12.5, y = 30, yend = 30) +
  geom_segment(x = 1.5, xend = 12.5, y = 40, yend = 40) +
  geom_segment(x = 1.5, xend = 12.5, y = 50, yend = 50) +
  geom_segment(x = 1.5, xend = 12.5, y = 60, yend = 60) +
  geom_segment(x = 1.5, xend = 12.5, y = 70, yend = 70) +
  geom_segment(x = 1.5, xend = 12.5, y = 80, yend = 80) +
  geom_segment(x = 1.5, xend = 12.5, y = 90, yend = 90) +
  geom_segment(x = 1.5, xend = 12.5, y = 100, yend = 100) +
  labs(y = NULL, x = NULL) +
  annotate("text", x = 6.5, y = 65, family = "Puritan", color = "black", label = "WHITE", size = 25) + 
  annotate("text", x = 10, y = 25, family = "Puritan", color = "black", label = "NEGRO", size = 25) +
  annotate("text", x = 6.5, y = 115, family = "Puritan", color = "black", label = "ALABAMA", size = 25) +
  theme(axis.text.x.top = element_text(margin = margin(b = -60, t = 20),
                                       colour = "gray21", 
                                       face = "bold", family = "Puritan", angle = 90, size = 25),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05, size = 25,
                                   margin = margin(l = -20, r = -20), colour = "gray21", 
                                   face = "bold", family = "Puritan")) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(2,1,1,1.4, "cm"))

ggsave(here::here("race-by-year-state", "AL_full_unmasked.png"), ALplot)



#### Florida ####

# X axis text
FLxtext <- c(" ", " ", " ", " ", "1830", "1840", "1850", "1860", "1870", "1880", "1890") 

# Florida Plot
FLplot <- ggplot(FloridaDF, aes(x = year, y = percent)) +
  geom_bar_pattern(stat = "identity", width = 1, color = "black", fill = "white", 
                   pattern = "stripe", pattern_density = .01, pattern_spacing = .022,
                   pattern_angle = 70) +
  scale_x_discrete(label = FLxtext, expand = c(0,0), position = "top") +
  scale_y_continuous(limits = c(0,120), expand = c(0,0), breaks = seq(10, 100, by = 10)) +
  geom_segment(x = 1.5:11.5, xend = 1.5:11.5, y = 0, yend = 100) +
  geom_segment(x = 1.5, xend = 12.5, y = 10, yend = 10) +
  geom_segment(x = 1.5, xend = 12.5, y = 20, yend = 20) +
  geom_segment(x = 1.5, xend = 12.5, y = 30, yend = 30) +
  geom_segment(x = 1.5, xend = 12.5, y = 40, yend = 40) +
  geom_segment(x = 1.5, xend = 12.5, y = 50, yend = 50) +
  geom_segment(x = 1.5, xend = 12.5, y = 60, yend = 60) +
  geom_segment(x = 1.5, xend = 12.5, y = 70, yend = 70) +
  geom_segment(x = 1.5, xend = 12.5, y = 80, yend = 80) +
  geom_segment(x = 1.5, xend = 12.5, y = 90, yend = 90) +
  geom_segment(x = 1.5, xend = 12.5, y = 100, yend = 100) +
  labs(y = NULL, x = NULL) +
  annotate("text", x = 6.5, y = 65, family = "Puritan", color = "black", label = "WHITE", size = 25) + 
  annotate("text", x = 8.5, y = 25, family = "Puritan", color = "black", label = "NEGRO", size = 25) +
  annotate("text", x = 6.5, y = 115, family = "Puritan", color = "black", label = "FLORIDA", size = 25) +
  theme(axis.text.x.top = element_text(margin = margin(b = -60, t = 20),
                                       colour = "gray21", 
                                       face = "bold", family = "Puritan", angle = 90, size = 25),
        axis.text.y = element_text(vjust = -0.01,
                                   hjust = 0.05, size = 25,
                                   margin = margin(l = -20, r = -20), colour = "gray21", 
                                   face = "bold", family = "Puritan")) +
  theme(axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) + 
  theme(panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) +
  theme(plot.margin = margin(2,1,1,1.4, "cm"))

ggsave(here::here("race-by-year-state", "FL_full_unmasked.png"), FLplot)


# Combining plots using cowplot
# Still haven't figured out how to make the text sizes to readjust automatically to make the merged plot accurate
# plot_grid(
#   DEplot, KYplot, NCplot, ARplot, 
#   MDplot, MOplot, SCplot, MSplot,
#   DCplot, TNplot, GAplot, LAplot, 
#   VAplot, TXplot, ALplot, FLplot,
#   ncol = 4,
#   nrow = 4) 
