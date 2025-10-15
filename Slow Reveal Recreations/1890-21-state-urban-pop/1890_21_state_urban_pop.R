#
# FILE:
# 1890_state_urban_pop.R
#
# DESCRIPTION:
# This code is for the 1890 State Urban/Rural Population Graph from Henry Gannett. The png's show the various stages of revealing the graphs.  
# Source: https://www.loc.gov/resource/g3701gm.gct00010/?sp=20&r=-0.05,0.712,0.811,0.515,0
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC
# 1: FULLY CONCEALED GRAPHIC
# 2: REVEAL DENSITY
# 3: REVEAL STATE LABELS
# 4: REVEAL YEAR
# 5: REVEAL NEW YORK
# 6: REVEAL NCA
# 7: REVEAL TITLE
# 8: REVEAL CAPTION
# 9: REVEAL PI
# 10: REVEAL LOW POPULATION
#
# AUTHORS:
#   Robert Bilyk (main code)
# Ian Curtis (code to save plots)



library(tidyverse)
library(showtext)
library(readxl)
library(grid)
library(magick)
library(srtools)


#To install the srtools package, you will need to install the package from github:
#
#library(devtools)
#install_github("RBY1100/srtools_package")


font_add_google(name = "Courier Prime", family = "Main")
showtext_auto()

data <- read_xlsx(here::here("1890-state-urban-pop", "1890_state_urban_pop_data.xlsx")) %>%
  arrange(desc(`Total Population`)) %>%
  select(`State`, `Urban Population`, `Rural Population`) %>% 
  mutate(State = toupper(State),
         `Urban Population` = `Urban Population` / 1000000,
         `Rural Population` = `Rural Population` / 1000000) %>% 
  pivot_longer(cols = c(`Urban Population`, `Rural Population`),
               names_to = "Location",
               values_to = "Population")




#### FIGURE 11: RECREATED GRAPHIC ####

fig11 <- image_graph(width = 600, height = 700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 9, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", linewidth=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 11, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.045, y1 = 0.045))
grid.draw(textGrob("STATES.", x=.11,y=.955, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("21. TOTAL AND URBAN POPULATION, BY STATES AND TERRITORIES: 1890", x=.5, y=.99, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.961, gp=gpar(fontsize=10, fontfamily="Main")))
grid.draw(textGrob("The total length of each bar represents the aggregate population of the State or Territory," , x=.5, y=.035, gp=gpar(fontsize=9, fontfamily="Main")))
grid.draw(textGrob("while the black portion of the bar indicates the urban element; that is,", x=.5, y=.023, gp=gpar(fontsize=9, fontfamily="Main")))
grid.draw(textGrob("the population contained in cities having 8,000 inhabitants or more", x=.5, y=.011, gp=gpar(fontsize=9, fontfamily="Main")))

dev.off()

image_write(fig11, path = here::here("1890-state-urban-pop", "11_full_unmasked.png"), format = "png")





#### 1: FULLY CONCEALED GRAPHIC ####

fig01 <- image_graph(width = 600, height = 700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 9, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", linewidth=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 11, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none") +
  hide(hidden = c("xtext", "ytext", "xtick"), colour = "#f1d9b5")

grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.043, y1 = 0.942))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.043, y1 = 0.942))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.043, y1 = 0.942))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.95, y0 = 0.942, y1 = 0.942))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.95, y0 = 0.043, y1 = 0.043))

dev.off()

image_write(fig01, path = here::here("1890-state-urban-pop", "01_full_masked.png"), format = "png")


 
#### FIGURE 2: REVEAL POPULATION ####

fig02 <- image_graph(width = 600, height = 700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 9, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", linewidth=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 11, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none") +
  hide(hidden = c("ytext"), colour = "#f1d9b5")

grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.043, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.043, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.043, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.95, y0 = 0.043, y1 = 0.043))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.961, gp=gpar(fontsize=10, fontfamily="Main")))


dev.off()

image_write(fig02, path = here::here("1890-state-urban-pop", "02_xaxis_unmasked.png"), format = "png")



## 3: REVEAL STATE LABEL

fig03 <- image_graph(width = 600, height = 700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 9, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", linewidth=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 11, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none") +
  hide(hidden = c("ytext"), colour = "#f1d9b5")


grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.045, y1 = 0.045))
grid.draw(textGrob("STATES.", x=.11,y=.955, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.961, gp=gpar(fontsize=10, fontfamily="Main")))

dev.off()

image_write(fig03, path = here::here("1890-state-urban-pop", "03_ylabel_unmasked.png"), format = "png")



#### FIGURE 4: REVEAL YEAR ####

pic04 <- image_graph(width = 600, height = 700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 9, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", linewidth=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 11, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none") +
  hide(hidden = c("ytext"), colour = "#f1d9b5")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.045, y1 = 0.045))
grid.draw(textGrob("STATES.", x=.11,y=.955, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.961, gp=gpar(fontsize=10, fontfamily="Main")))
grid.draw(textGrob("21. TOTAL AND URBAN POPULATION, BY STATES AND TERRITORIES: 1890", x=.5, y=.99, gp=gpar(fontsize=11, fontfamily="Main")))

dev.off()

fig04 <- image_draw(pic04)
polygon(c(50, 469, 469, 50), c(2, 2, 13, 13), border = "#f1d9b5", col = "#f1d9b5")
dev.off()

image_write(fig04, path = here::here("1890-state-urban-pop", "04_year_unmasked.png"), format = "png")


#### FIGURE 5: REVEAL NEW YORK ####


pic05 <- image_graph(width = 600, height = 700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 9, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", linewidth=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 11, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.045, y1 = 0.045))
grid.draw(textGrob("STATES.", x=.11,y=.955, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.961, gp=gpar(fontsize=10, fontfamily="Main")))
grid.draw(textGrob("21. TOTAL AND URBAN POPULATION, BY STATES AND TERRITORIES: 1890", x=.5, y=.99, gp=gpar(fontsize=11, fontfamily="Main")))

dev.off()

fig05 <- image_draw(pic05)
polygon(c(50, 469, 469, 50), c(2, 2, 13, 13), border = "#f1d9b5", col = "#f1d9b5")
polygon(c(10, 120, 120, 10), c(55, 55, 667, 667), border = "#f1d9b5", col = "#f1d9b5")
dev.off()

image_write(fig05, path = here::here("1890-state-urban-pop", "05_ny_unmasked.png"), format = "png")



#### FIGURE 6: REVEAL NC/AL ####

pic06 <- image_graph(width = 600, height = 700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 9, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", linewidth=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 11, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.045, y1 = 0.045))
grid.draw(textGrob("STATES.", x=.11,y=.955, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.961, gp=gpar(fontsize=10, fontfamily="Main")))
grid.draw(textGrob("21. TOTAL AND URBAN POPULATION, BY STATES AND TERRITORIES: 1890", x=.5, y=.99, gp=gpar(fontsize=11, fontfamily="Main")))

dev.off()

fig06 <- image_draw(pic06)
polygon(c(50, 469, 469, 50), c(2, 2, 13, 13), border = "#f1d9b5", col = "#f1d9b5")
polygon(c(10, 120, 120, 10), c(55, 55, 235, 235), border = "#f1d9b5", col = "#f1d9b5")
polygon(c(10, 120, 120, 10), c(260, 260, 667, 667), border = "#f1d9b5", col = "#f1d9b5")

dev.off()

image_write(fig06, path = here::here("1890-state-urban-pop", "06_nc_al_unmasked.png"), format = "png")


#### FIGURE 7: REVEAL TITLE ####

pic07 <- image_graph(width = 600, height = 700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 9, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", linewidth=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 11, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.045, y1 = 0.045))
grid.draw(textGrob("STATES.", x=.11,y=.955, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.961, gp=gpar(fontsize=10, fontfamily="Main")))
grid.draw(textGrob("21. TOTAL AND URBAN POPULATION, BY STATES AND TERRITORIES: 1890", x=.5, y=.99, gp=gpar(fontsize=11, fontfamily="Main")))

dev.off()

fig07 <- image_draw(pic07)
polygon(c(10, 120, 120, 10), c(55, 55, 235, 235), border = "#f1d9b5", col = "#f1d9b5")
polygon(c(10, 120, 120, 10), c(260, 260, 667, 667), border = "#f1d9b5", col = "#f1d9b5")

dev.off()

image_write(fig07, path = here::here("1890-state-urban-pop", "07_title_revealed.png"), format = "png")


#### FIGURE 8: REVEAL CAPTION ####

pic08 <- image_graph(width = 600, height = 700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 9, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", linewidth=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 11, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.045, y1 = 0.045))
grid.draw(textGrob("STATES.", x=.11,y=.955, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.961, gp=gpar(fontsize=10, fontfamily="Main")))
grid.draw(textGrob("21. TOTAL AND URBAN POPULATION, BY STATES AND TERRITORIES: 1890", x=.5, y=.99, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("The total length of each bar represents the aggregate population of the State or Territory," , x=.5, y=.035, gp=gpar(fontsize=9, fontfamily="Main")))
grid.draw(textGrob("while the black portion of the bar indicates the urban element; that is,", x=.5, y=.023, gp=gpar(fontsize=9, fontfamily="Main")))
grid.draw(textGrob("the population contained in cities having 8,000 inhabitants or more", x=.5, y=.011, gp=gpar(fontsize=9, fontfamily="Main")))

dev.off()

fig08 <- image_draw(pic08)
polygon(c(10, 120, 120, 10), c(55, 55, 235, 235), border = "#f1d9b5", col = "#f1d9b5")
polygon(c(10, 120, 120, 10), c(260, 260, 667, 667), border = "#f1d9b5", col = "#f1d9b5")

dev.off()

image_write(fig08, path = here::here("1890-state-urban-pop", "08_caption_unmasked.png"), format = "png")


#### FIGURE 9: REVEAL PA/IL ####

pic09 <- image_graph(width = 600, height = 700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 9, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", linewidth=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 11, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.045, y1 = 0.045))
grid.draw(textGrob("STATES.", x=.11,y=.955, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.961, gp=gpar(fontsize=10, fontfamily="Main")))
grid.draw(textGrob("21. TOTAL AND URBAN POPULATION, BY STATES AND TERRITORIES: 1890", x=.5, y=.99, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("The total length of each bar represents the aggregate population of the State or Territory," , x=.5, y=.035, gp=gpar(fontsize=9, fontfamily="Main")))
grid.draw(textGrob("while the black portion of the bar indicates the urban element; that is,", x=.5, y=.023, gp=gpar(fontsize=9, fontfamily="Main")))
grid.draw(textGrob("the population contained in cities having 8,000 inhabitants or more", x=.5, y=.011, gp=gpar(fontsize=9, fontfamily="Main")))

dev.off()

fig09 <- image_draw(pic09)
polygon(c(10, 120, 120, 10), c(80, 80, 235, 235), border = "#f1d9b5", col = "#f1d9b5")
polygon(c(10, 120, 120, 10), c(260, 260, 667, 667), border = "#f1d9b5", col = "#f1d9b5")

dev.off()

image_write(fig09, path = here::here("1890-state-urban-pop", "09_pa_il_unmasked.png"), format = "png")

#### FIGURE 10: LOW POP STATES UNMASKED ####

pic10 <- image_graph(width = 600, height = 700)

ggplot(data) +
  geom_col(aes(x = Population, y = fct_rev(fct_inorder(State)), fill= Location), color= "black", width = 0.45) +
  scale_fill_manual(values = c("#f1d9b5", "black")) +
  scale_x_continuous(position = "top", limits = c(0,6), breaks=seq(1,5,1)) +
  theme(axis.text.x = element_text(family = "Main", size = 9, color= "black"),
        axis.title.x = element_blank(), 
        panel.grid.major.x = element_line(color="black", linewidth=.25),
        axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(),
        axis.text.y = element_text(family = "Main", hjust = 0, size = 11, color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        plot.background = element_rect(fill = "#f1d9b5"), 
        plot.title = element_blank(),
        plot.tag = element_blank(),
        plot.tag.position = "top",
        plot.margin = margin(30,10,30,10),
        legend.position = "none")

grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.01, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.95, x1 = 0.95, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.215, x1 = 0.215, y0 = 0.045, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.968, y1 = 0.968))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.944, y1 = 0.944))
grid.draw(segmentsGrob(x0 = 0.01, x1 = 0.95, y0 = 0.045, y1 = 0.045))
grid.draw(textGrob("STATES.", x=.11,y=.955, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("MILLIONS OF INHABITANTS", x=.5, y=.961, gp=gpar(fontsize=10, fontfamily="Main")))
grid.draw(textGrob("21. TOTAL AND URBAN POPULATION, BY STATES AND TERRITORIES: 1890", x=.5, y=.99, gp=gpar(fontsize=11, fontfamily="Main")))
grid.draw(textGrob("The total length of each bar represents the aggregate population of the State or Territory," , x=.5, y=.035, gp=gpar(fontsize=9, fontfamily="Main")))
grid.draw(textGrob("while the black portion of the bar indicates the urban element; that is,", x=.5, y=.023, gp=gpar(fontsize=9, fontfamily="Main")))
grid.draw(textGrob("the population contained in cities having 8,000 inhabitants or more", x=.5, y=.011, gp=gpar(fontsize=9, fontfamily="Main")))

dev.off()

fig10 <- image_draw(pic10)
polygon(c(10, 120, 120, 10), c(80, 80, 235, 235), border = "#f1d9b5", col = "#f1d9b5")
polygon(c(10, 120, 120, 10), c(260, 260, 630, 630), border = "#f1d9b5", col = "#f1d9b5")

dev.off()

image_write(fig10, path = here::here("1890-state-urban-pop", "10_low_pop_unmasked.png"), format = "png")













