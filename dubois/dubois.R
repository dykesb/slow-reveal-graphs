install.packages("extrafont")
font_import()
loadfonts(device = "win")
library(tidyverse)
library(readxl)
library(scales)
library(showtext)
library(forcats)
library(extrafont)

dubois <- read_xlsx(here::here("Everything","DuBois_Graph","DuBoisData.xlsx"))

fac <- factor(dubois, levels = c("Virginia", "South Carolina", "Texas", "North Carolina", "Georgia", "Mississippi", "Tennessee", "Louisiana", "Arkansas"))

dubois$fac <- factor(dubois$fac, levels = debois$fac)

font_add_google(name = "Jura", family = "Jura")

font_add_google(name = "Merriweather", family = "Merriweather")

df <- filter(dubois, Category == "OWNERS")

showtext_auto()

################# Part 1 #################

#recreating whole graph
ggplot(dubois, aes(x = Percent, y = fct_rev(fct_inorder(States)), fill = Category)) + 
  geom_col(color = "#191713", width = 0.45) +  
  annotate("text", x = 95, y = 9, label = "27%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 8, label = "18%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 7, label = "22%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 6, label = "19%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 5, label = "12%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 4, label = "13%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 3, label = "20%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 2, label = "12%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 1, label = "21%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 90, y = 9.5, label = "OWNERS.", color = "#71614c", family = "Jura") +
  annotate("text", x = 50, y = 9.5, label = "TENANTS.", color = "#71614c", family = "Jura") +
  labs(title = "Negro landholders in various States of the United States.",
       subtitle = "Proprietaires fonciers Negres dans plusieurs Etats",
       tag = "Done by Atlanta University") +
  scale_x_reverse() +
  scale_fill_manual(values = c("#dbc7b4", "#191713")) +
  theme_bw() +
  theme(axis.text.x = element_blank(),
        axis.title.x = element_blank(), 
        axis.ticks.x = element_blank()) + 
  theme(axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(), 
        axis.text.y = element_text(family = "Merriweather", hjust = 0, size = 6, color = "#372811")) + 
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "#dbc7b4", color = "#dbc7b4"),
        plot.background = element_rect(fill = "#dbc7b4", color = "#dbc7b4"), 
        plot.title = element_text(family = "Merriweather", color = "#5e4b37", hjust = 0.5, vjust = 37, size = 12),
        plot.subtitle = element_text(family = "Merriweather", color = "#5e4b37", hjust = 0.5, vjust = 46, size = 8),
        plot.margin = margin(120,30,10,10),
        plot.tag = element_text(family = "Merriweather", color = "#5e4b37", hjust = -140, vjust = 19, size = 6),
        plot.tag.position = "top",
        legend.position = "none") + 
  coord_cartesian(clip = "off")

################# Part 2 #################

#concealing everything
ggplot(dubois, aes(x = Percent, y = fct_rev(fct_inorder(States)), fill = Category)) + 
  geom_col(color = "#191713", width = 0.45) +  
  #annotate("text", x = 95, y = 9, label = "27%", size = 3.5, family = "Jura", color = "#71614c") +
  #annotate("text", x = 95, y = 8, label = "18%", size = 3.5, family = "Jura", color = "#71614c") +
  #annotate("text", x = 95, y = 7, label = "22%", size = 3.5, family = "Jura", color = "#71614c") +
  #annotate("text", x = 95, y = 6, label = "19%", size = 3.5, family = "Jura", color = "#71614c") +
  #annotate("text", x = 95, y = 5, label = "12%", size = 3.5, family = "Jura", color = "#71614c") +
  #annotate("text", x = 95, y = 4, label = "13%", size = 3.5, family = "Jura", color = "#71614c") +
  #annotate("text", x = 95, y = 3, label = "20%", size = 3.5, family = "Jura", color = "#71614c") +
  #annotate("text", x = 95, y = 2, label = "12%", size = 3.5, family = "Jura", color = "#71614c") +
  #annotate("text", x = 95, y = 1, label = "21%", size = 3.5, family = "Jura", color = "#71614c") +
  #annotate("text", x = 90, y = 9.5, label = "OWNERS.", color = "#71614c", family = "Jura") +
  #annotate("text", x = 50, y = 9.5, label = "TENANTS.", color = "#71614c", family = "Jura") +
  labs(title = " ",
       subtitle = " ",
       tag = " ") +
  scale_x_reverse() +
  scale_fill_manual(values = c("#dbc7b4", "#191713")) +
  theme_bw() +
  theme(axis.text.x = element_blank(),
        axis.title.x = element_blank(), 
        axis.ticks.x = element_blank()) + 
  theme(axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(), 
        axis.text.y = element_text(family = "Merriweather", hjust = 0, size = 6, color = "#dbc7b4")) + 
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "#dbc7b4", color = "#dbc7b4"),
        plot.background = element_rect(fill = "#dbc7b4", color = "#dbc7b4"), 
        plot.title = element_text(family = "Merriweather", color = "#5e4b37", hjust = 0.5, vjust = 37, size = 12),
        plot.subtitle = element_text(family = "Merriweather", color = "#5e4b37", hjust = 0.5, vjust = 46, size = 8),
        plot.margin = margin(120,30,10,10),
        plot.tag = element_text(family = "Merriweather", color = "#5e4b37", hjust = -140, vjust = 19, size = 6),
        plot.tag.position = "top",
        legend.position = "none") + 
  coord_cartesian(clip = "off")

################# Part 3 #################

#revealing percentages
ggplot(dubois, aes(x = Percent, y = fct_rev(fct_inorder(States)), fill = Category)) + 
  geom_col(color = "#191713", width = 0.45) +  
  annotate("text", x = 95, y = 9, label = "27%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 8, label = "18%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 7, label = "22%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 6, label = "19%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 5, label = "12%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 4, label = "13%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 3, label = "20%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 2, label = "12%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 1, label = "21%", size = 3.5, family = "Jura", color = "#71614c") +
  #annotate("text", x = 90, y = 9.5, label = "OWNERS.", color = "#71614c", family = "Jura") +
  #annotate("text", x = 50, y = 9.5, label = "TENANTS.", color = "#71614c", family = "Jura") +
labs(title = " ",
     subtitle = " ",
     tag = " ") +
  scale_x_reverse() +
  scale_fill_manual(values = c("#dbc7b4", "#191713")) +
  theme_bw() +
  theme(axis.text.x = element_blank(),
        axis.title.x = element_blank(), 
        axis.ticks.x = element_blank()) + 
  theme(axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(), 
        axis.text.y = element_text(family = "Merriweather", hjust = 0, size = 6, color = "#dbc7b4")) + 
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "#dbc7b4", color = "#dbc7b4"),
        plot.background = element_rect(fill = "#dbc7b4", color = "#dbc7b4"), 
        plot.title = element_text(family = "Merriweather", color = "#5e4b37", hjust = 0.5, vjust = 37, size = 12),
        plot.subtitle = element_text(family = "Merriweather", color = "#5e4b37", hjust = 0.5, vjust = 46, size = 8),
        plot.margin = margin(120,30,10,10),
        plot.tag = element_text(family = "Merriweather", color = "#5e4b37", hjust = -140, vjust = 19, size = 6),
        plot.tag.position = "top",
        legend.position = "none") + 
  coord_cartesian(clip = "off")

################# Part 4 #################

#revealing states
ggplot(dubois, aes(x = Percent, y = fct_rev(fct_inorder(States)), fill = Category)) + 
  geom_col(color = "#191713", width = 0.45) +  
  annotate("text", x = 95, y = 9, label = "27%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 8, label = "18%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 7, label = "22%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 6, label = "19%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 5, label = "12%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 4, label = "13%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 3, label = "20%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 2, label = "12%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 1, label = "21%", size = 3.5, family = "Jura", color = "#71614c") +
  #annotate("text", x = 90, y = 9.5, label = "OWNERS.", color = "#71614c", family = "Jura") +
  #annotate("text", x = 50, y = 9.5, label = "TENANTS.", color = "#71614c", family = "Jura") +
  labs(title = " ",
       subtitle = " ",
       tag = " ") +
  scale_x_reverse() +
  scale_fill_manual(values = c("#dbc7b4", "#191713")) +
  theme_bw() +
  theme(axis.text.x = element_blank(),
        axis.title.x = element_blank(), 
        axis.ticks.x = element_blank()) + 
  theme(axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(), 
        axis.text.y = element_text(family = "Merriweather", hjust = 0, size = 6, color = "#372811")) + 
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "#dbc7b4", color = "#dbc7b4"),
        plot.background = element_rect(fill = "#dbc7b4", color = "#dbc7b4"), 
        plot.title = element_text(family = "Merriweather", color = "#5e4b37", hjust = 0.5, vjust = 37, size = 12),
        plot.subtitle = element_text(family = "Merriweather", color = "#5e4b37", hjust = 0.5, vjust = 46, size = 8),
        plot.margin = margin(120,30,10,10),
        plot.tag = element_text(family = "Merriweather", color = "#5e4b37", hjust = -140, vjust = 19, size = 6),
        plot.tag.position = "top",
        legend.position = "none") + 
  coord_cartesian(clip = "off")

################# Part 5 #################

#revealing tenants and owners labels
ggplot(dubois, aes(x = Percent, y = fct_rev(fct_inorder(States)), fill = Category)) + 
  geom_col(color = "#191713", width = 0.45) +  
  annotate("text", x = 95, y = 9, label = "27%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 8, label = "18%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 7, label = "22%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 6, label = "19%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 5, label = "12%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 4, label = "13%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 3, label = "20%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 2, label = "12%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 95, y = 1, label = "21%", size = 3.5, family = "Jura", color = "#71614c") +
  annotate("text", x = 90, y = 9.5, label = "OWNERS.", color = "#71614c", family = "Jura") +
  annotate("text", x = 50, y = 9.5, label = "TENANTS.", color = "#71614c", family = "Jura") +
  labs(title = " ",
       subtitle = " ",
       tag = " ") +
  scale_x_reverse() +
  scale_fill_manual(values = c("#dbc7b4", "#191713")) +
  theme_bw() +
  theme(axis.text.x = element_blank(),
        axis.title.x = element_blank(), 
        axis.ticks.x = element_blank()) + 
  theme(axis.ticks.y = element_blank(), 
        axis.title.y = element_blank(), 
        axis.text.y = element_text(family = "Merriweather", hjust = 0, size = 6, color = "#372811")) + 
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "#dbc7b4", color = "#dbc7b4"),
        plot.background = element_rect(fill = "#dbc7b4", color = "#dbc7b4"), 
        plot.title = element_text(family = "Merriweather", color = "#5e4b37", hjust = 0.5, vjust = 37, size = 12),
        plot.subtitle = element_text(family = "Merriweather", color = "#5e4b37", hjust = 0.5, vjust = 46, size = 8),
        plot.margin = margin(120,30,10,10),
        plot.tag = element_text(family = "Merriweather", color = "#5e4b37", hjust = -140, vjust = 19, size = 6),
        plot.tag.position = "top",
        legend.position = "none") + 
  coord_cartesian(clip = "off")
