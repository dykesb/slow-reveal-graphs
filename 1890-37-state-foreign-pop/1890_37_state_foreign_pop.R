#
# FILE:
# 1890 State Foreign Population.R
#
# DESCRIPTION:
# This code is for the 1890 State Foreign Population Graph from Henry Gannett. The png's show the various stages of revealing the graphs.
# Source: https://www.loc.gov/resource/g3701gm.gct00010/?sp=29&r=0.357,0.124,0.562,0.357,0
#
# SLOW REVEAL ORDER:
#   
# 7: RECREATED GRAPHIC
# 1: FULLY CONCEALED GRAPHIC
# 2: REVEAL STATE LABEL
# 3: REVEAL TITLE
# 4: REVEAL UNIT
# 5: REVEAL NEW YORK
# 6: REVEAL HIGH POPULATION
#
# AUTHORS:
#   Robert Bilyk (main code)
# Ian Curtis (code to save plots)


#To install the srtools package, you will need to install the package from github:
#
# library(devtools)
# install_github("RBY1100/srtools_package")

library(tidyverse)
library(showtext)
library(readxl)
library(grid)
library(magick)
library(srtools)



font_add_google(name = "Courier Prime", family = "Main")
showtext_auto()

data <- read_xlsx(here::here("1890-state-foreign-pop", "1890_state_foreign_pop_data.xlsx")) %>%
  arrange(desc(Foreign)) %>% 
  mutate(State = toupper(State),
         Foreign = Foreign / 1000)

#### FIGURE 7: RECREATED GRAPHIC ####


picture <- image_graph(width = 500, height = 800)

ggplot(data, aes(x = Foreign, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45 ) +
  labs(tag = "(In thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,1600), breaks=seq(100,1500,100)) +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", linewidth=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_text(family = "Main", color = "black", hjust = .5, vjust = 3, size = 7),
        plot.tag.position = "top",
        plot.margin = margin(20,10,10,10))

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.2, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.97, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.958, y1 = 0.958))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.012, y1 = 0.012))
grid.draw(textGrob("STATES.", x=.11,y=.9645, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("37. FOREIGN BORN POPULATION, BY STATES AND TERRITORIES:1890", x=.5, y=.99, gp=gpar(fontsize=7, fontfamily="Main")))

dev.off()

fig07 <- image_draw(picture)
dev.off()

image_write(fig07, path = here::here("1890-state-foreign-pop", "07_full_unmasked.png"), format = "png")



#### FIGURE 1: FULLY CONCEALED GRAPHIC ####

picture <- image_graph(width = 500, height = 800)

ggplot(data, aes(x = Foreign, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45 ) +
  labs(tag = "(In thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,1600), breaks=seq(100,1500,100)) +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", linewidth=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_text(family = "Main", color = "black", hjust = .5, vjust = 3, size = 7),
        plot.tag.position = "top",
        plot.margin = margin(20,10,10,10)) +
  hide(c("xtext", "ytext", "xtick","tag"), "#f1d9b5")

grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.012, y1 = 0.958))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.2, y0 = 0.012, y1 = 0.958))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.95, y0 = 0.958, y1 = 0.958))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.95, y0 = 0.012, y1 = 0.012))

dev.off()

fig01 <- image_draw(picture)
dev.off()

image_write(fig01, path = here::here("1890-state-foreign-pop", "01_full_masked.png"), format = "png")



#### FIGURE 2: REVEAL STATE LABEL ####

picture <- image_graph(width = 500, height = 800)

ggplot(data, aes(x = Foreign, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45 ) +
  labs(tag = "(In thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,1600), breaks=seq(100,1500,100)) +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", linewidth=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_text(family = "Main", color = "black", hjust = .5, vjust = 3, size = 7),
        plot.tag.position = "top",
        plot.margin = margin(20,10,10,10)) +
  hide(c("xtext", "ytext", "xtick","tag"), "#f1d9b5")


grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.2, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.97, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.958, y1 = 0.958))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.012, y1 = 0.012))
grid.draw(textGrob("STATES.", x=.11,y=.9645, gp=gpar(fontsize=8, fontfamily="Main")))

dev.off()

fig02 <- image_draw(picture)
dev.off()

image_write(fig02, path = here::here("1890-state-foreign-pop", "02_xlabel_unmasked.png"), format = "png")




#### FIGURE 3: REVEAL TITLE ####

picture <- image_graph(width = 500, height = 800)

ggplot(data, aes(x = Foreign, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45 ) +
  labs(tag = "(In thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,1600), breaks=seq(100,1500,100)) +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", linewidth=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_text(family = "Main", color = "black", hjust = .5, vjust = 3, size = 7),
        plot.tag.position = "top",
        plot.margin = margin(20,10,10,10)) +
  hide(c("xtext", "ytext", "xtick"), "#f1d9b5")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.2, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.97, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.958, y1 = 0.958))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.012, y1 = 0.012))
grid.draw(textGrob("STATES.", x=.11,y=.9645, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("37. FOREIGN BORN POPULATION, BY STATES AND TERRITORIES:1890", x=.5, y=.99, gp=gpar(fontsize=7, fontfamily="Main")))

dev.off()

fig03 <- image_draw(picture)
dev.off()

image_write(fig03, path = here::here("1890-state-foreign-pop", "03_title_unmasked.png"), format = "png")



#### 4: REVEAL UNITS (X-AXIS) ####

picture <- image_graph(width = 500, height = 800)

ggplot(data, aes(x = Foreign, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45 ) +
  labs(tag = "(In thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,1600), breaks=seq(100,1500,100)) +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", linewidth=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_text(family = "Main", color = "black", hjust = .5, vjust = 3, size = 7),
        plot.tag.position = "top",
        plot.margin = margin(20,10,10,10)) +
  hide(c("ytext"), "#f1d9b5")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.2, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.97, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.958, y1 = 0.958))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.012, y1 = 0.012))
grid.draw(textGrob("STATES.", x=.11,y=.9645, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("37. FOREIGN BORN POPULATION, BY STATES AND TERRITORIES:1890", x=.5, y=.99, gp=gpar(fontsize=7, fontfamily="Main")))

dev.off()

fig04 <- image_draw(picture)
dev.off()

image_write(fig04, path = here::here("1890-state-foreign-pop", "04_xaxis_unmasked.png"), format = "png")


#### FIGURE 5: REVEAL NEW YORK ####

picture <- image_graph(width = 500, height = 800)

ggplot(data, aes(x = Foreign, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45 ) +
  labs(tag = "(In thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,1600), breaks=seq(100,1500,100)) +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", linewidth=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_text(family = "Main", color = "black", hjust = .5, vjust = 3, size = 7),
        plot.tag.position = "top",
        plot.margin = margin(20,10,10,10)) 

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.2, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.97, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.958, y1 = 0.958))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.012, y1 = 0.012))
grid.draw(textGrob("STATES.", x=.11,y=.9645, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("37. FOREIGN BORN POPULATION, BY STATES AND TERRITORIES:1890", x=.5, y=.99, gp=gpar(fontsize=7, fontfamily="Main")))

dev.off()

fig05 <- image_draw(picture)
polygon(c(10, 90, 90, 10), c(55, 55, 788, 788), border = "#f1d9b5", col = "#f1d9b5")

dev.off()

image_write(fig05, path = here::here("1890-state-foreign-pop", "05_ny_unmasked.png"), format = "png")


#### 6: REVEAL HIGH POPULATION ####

picture <- image_graph(width = 500, height = 800)

ggplot(data, aes(x = Foreign, y = fct_rev(fct_inorder(State))), fill = NA) +
  geom_col(color = "black", fill = "black", width = 0.45 ) +
  labs(tag = "(In thousands.)") +
  scale_x_continuous(position = "top", limits = c(0,1600), breaks=seq(100,1500,100)) +
  theme(axis.text.x = element_text(family = "Main", size = 6, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", linewidth=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 8, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_text(family = "Main", color = "black", hjust = .5, vjust = 3, size = 7),
        plot.tag.position = "top",
        plot.margin = margin(20,10,10,10)) 

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.2, x1 = 0.2, y0 = 0.012, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.97, y1 = 0.97))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.958, y1 = 0.958))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.012, y1 = 0.012))
grid.draw(textGrob("STATES.", x=.11,y=.9645, gp=gpar(fontsize=8, fontfamily="Main")))
grid.draw(textGrob("37. FOREIGN BORN POPULATION, BY STATES AND TERRITORIES:1890", x=.5, y=.99, gp=gpar(fontsize=7, fontfamily="Main")))

dev.off()

fig06 <- image_draw(picture)
polygon(c(10, 90, 90, 10), c(205, 205, 788, 788), border = "#f1d9b5", col = "#f1d9b5")

dev.off()

image_write(fig06, path = here::here("1890-state-foreign-pop", "06_high_pop_unmasked.png"), format = "png")













