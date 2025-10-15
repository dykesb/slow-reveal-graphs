#
# FILE:
# women_industry_ownership.R
#
# DESCRIPTION:
# This code is for the Population of Europe graph by Du Bois. The png shows the final recreated graph.  
# Source: https://bfi.uchicago.edu/wp-content/uploads/2024/06/BFI_WP_2024-73.pdf
#
# SLOW REVEAL ORDER:
#   
# 1-27: Changing States to Blue w/ Names
#
# AUTHORS:
#   Louis Cousino (main code)

library(tidyverse)
library(readxl)
library(showtext)

data <- read_xlsx(here::here("Slow Reveal Recreations", "women-industry-ownership_1","data","women_ind_data","data.xlsx"))

font_add_google(name = "Libre Baskerville", family = "Main")
showtext_auto()

#### FIGURE 01: FULLY UNMASKED ####

### Panel A ###

png(here::here("Slow Reveal Recreations", "women-industry-ownership_1", "recreated-imgs", "01_women_ind_A_full_unmasked.png"),width=900,height=900)
data |> 
  filter(panel == "A") |> 
  ggplot(aes(x = reorder(label, -proportion), y = proportion)) +
  geom_col() +
  scale_y_continuous(breaks = seq(0,0.1,0.02),
                     limits = c(0, 0.1)) +
  labs(title = "Figure 2. Female Ownership Shares Across the 10 Most-Common Industries",
       subtitle = "      Panel A. General Industries",
       y = "Female Share of Industry",
       caption = "Notes: These industries are restricted to those with at lease 10 female-owned establishments") +
  theme(axis.text.x = ggtext::element_markdown(family = "Main",
                                               size = 10,
                                               angle = 53,
                                               hjust = 1),
        axis.title.x = element_blank(),
        axis.text.y = element_text(family = "Main"),
        axis.title.y = element_text(family = "Main",
                                    size = 14),
        plot.caption = element_text(family = "Main",
                                    size = 10,
                                    hjust = 0),
        plot.caption.position = "plot",
        plot.title = element_text(family = "Main", 
                                  face = "bold",
                                  size = 16),
        plot.title.position = "plot",
        plot.subtitle = element_text(family = "Main",
                                     size = 14),
        panel.background = element_rect(fill = NA, color = "black"))

dev.off()

### Panel B ###

png(here::here("Slow Reveal Recreations", "women-industry-ownership_2", "recreated-imgs", "01_women_ind_B_full_unmasked.png"),width=900,height=900)
data |> 
  filter(panel == "B") |> 
  ggplot(aes(x = reorder(label, -proportion), y = proportion)) +
  geom_col() +
  scale_y_continuous(breaks = seq(0,0.5,0.1),
                     limits = c(0, 0.5)) +
  labs(title = "Figure 2. Female Ownership Shares Across the 10 Most-Common Industries",
       subtitle = "      Panel B. Detailed Industries",
       y = "Female Share of Industry",
       caption = "Notes: These industries are restricted to those with at lease 10 female-owned establishments") +
  theme(axis.text.x = ggtext::element_markdown(family = "Main",
                                               size = 10,
                                               angle = 53,
                                               hjust = 1),
        axis.title.x = element_blank(),
        axis.text.y = element_text(family = "Main"),
        axis.title.y = element_text(family = "Main",
                                    size = 14),
        plot.caption = element_text(family = "Main",
                                    size = 10,
                                    hjust = 0),
        plot.caption.position = "plot",
        plot.title = element_text(family = "Main", 
                                  face = "bold",
                                  size = 16),
        plot.title.position = "plot",
        plot.subtitle = element_text(family = "Main",
                                     size = 14),
        panel.background = element_rect(fill = NA, color = "black"))

dev.off()

### Uploading Charts ###

source(here::here("helper-functions", "google_push.R"))

data_literacy_upload(c("women-industry-ownership_1", "women-industry-ownership_2"))
