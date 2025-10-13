#
# FILE:
# gannett-nationalities.R
#
# DESCRIPTION:
# This code is for The total population and its elements at each census: 1790 to 1890 from Henry Gannett. The png's show the various stages of revealing the graphs. 
# Source: https://www.loc.gov/resource/g3701gm.gct00010/?sp=32
#
# SLOW REVEAL ORDER:
#   
# N: RECREATED GRAPHIC

#
# AUTHORS:
#   Louis Cousino (2025, main code)
#   Ian Curtis (2023, code to save plots)

# Loading libraries

library(tidyverse)
library(readxl)
library(cowplot)
library(showtext)

# Required fonts
font_add_google("Dynalight", "Dynalight")
font_add_google("Puritan", "Puritan")
showtext_auto()

# Loading in data

data <- read_xlsx(here::here("Slow Reveal Recreations", "gannett-nationalities", "Gannett - Total Population Measurements.xlsx"),
                  sheet = 1)

# Calculating percentages
data <- data |> 
  group_by(chart_num) |> 
  mutate(section = gsub("\\\\n", "\n", section), # Adding a line break for "Great Britain" in the first (1850) pie chart
         label_size = case_when(chart_num == 1 ~ 3,
                                chart_num == 2 ~ 4,
                                TRUE ~ 6),
         section_num = 1:n(),
         pct = angle/360,
         cumsum = cumsum(pct),
         label_y = ((pct/2) + lag(cumsum, n = 1, default = 0)) *-1 + 1) # Multiplying by negative 1 to flip the order (from "Ireland" to "Others") and adding 1 to shift the labels upwards.


data |> 
  filter(chart_num == 1) |> 
  ggplot(aes(x = "", y = pct, fill = fct_reorder(section_color, section_num))) + 
  geom_bar(stat = "identity", color = "black", linewidth = 0.1) + 
  coord_polar("y", start = 0) +
  geom_text(aes(x = 1, y = label_y, label = section, angle = label_angle, size = label_size)) +
  scale_fill_identity() +
  theme_void() + 
  theme(legend.position = "none")


# Creating pie charts

chart_creator <- function(filtered_frame) {
  
  
  chart <- filtered_frame |> 
    ggplot(aes(x = "", y = pct, fill = fct_reorder(section_color, section_num))) + 
    geom_bar(stat = "identity", linewidth = 0.1, color = "black") + 
    coord_polar("y", start = 0) +
    geom_text(aes(x = 1, y = label_y, label = section, angle = label_angle, size = label_size/.pt),
              family = "Puritan") +
    scale_fill_identity() +
    theme_void() + 
    theme(legend.position = "none",
          plot.title = element_text(vjust = 0, hjust = 0.5, family = "Puritan"))
  
  return(chart)
  
}

chart_list <- list()

for (i in 1:5) {
  
  chart_list[[i]] <- data |> 
    filter(chart_num == i) |> 
    chart_creator() +
    labs(title = as.character(1840 + i*10)) +
    theme(plot.title = element_text(size = 16),
          plot.margin = unit(c(0, 0, 0, 0), "cm"),
          plot.background = element_rect(fill = "#EFD8AF", color = "#EFD8AF"))
  
  
}

# Adjusting the label for "Great Britain" and "Scandinavia" in the first and second pie chart

chart_list[[1]] <- chart_list[[1]] +
  annotate("text", x = 1, y = 0.8, angle = -2.806, label = "GREAT", family = "Puritan") +
  annotate("text", x = 1, y = 0.75, angle = -2.806, label = "BRITAIN", family = "Puritan") +
  annotate("text", x = 1.1, y = 0.9256805, angle = -64.389, label = "SCANDINAVIA", size = 2.5, family = "Puritan")

chart_list[[2]] <- chart_list[[2]] +
  annotate("text", x = 1.1, y = 0.91000000, angle = -56.549, label = "SCANDINAVIA", size = 3.5, family = "Puritan")

# merging the plots from 1850 to 1870
top <- plot_grid(chart_list[[1]], chart_list[[2]], chart_list[[3]],
          nrow = 1,
          rel_widths = c(45, 60, 90)) +
  annotate("text", x = 0.5, y = 0.9, label = "39. NATIONALITIES OF THE FOREIGN BORN AT EACH CENSUS: 1850 TO 1890.",
           size = 8,
           family = "Puritan")

bottom <- plot_grid(chart_list[[4]], chart_list[[5]],
          nrow = 1,
          rel_widths = c(100, 120))



png(here::here("Slow Reveal Recreations", "gannett-nationalities", "recreated-imgs", "01_full_unmasked.png"),
    width=1229,height=1571, res = 300)

plot_grid(top, bottom,
          nrow = 2) +
  theme(plot.background = element_rect(fill = "#EFD8AF", color = "#EFD8AF"))

dev.off()



# 02: Fully Masked

# Creating pie charts

chart_creator <- function(filtered_frame) {
  
  
  chart <- filtered_frame |> 
    ggplot(aes(x = "", y = pct, fill = fct_reorder(section_color, section_num))) + 
    geom_bar(stat = "identity", linewidth = 0.1, color = "black") + 
    coord_polar("y", start = 0) +
    # geom_text(aes(x = 1, y = label_y, label = section, angle = label_angle, size = label_size),
    #           family = "Puritan") +
    scale_fill_identity() +
    theme_void() + 
    theme(legend.position = "none",
          plot.title = element_text(vjust = 0, hjust = 0.5, family = "Puritan"))
  
  return(chart)
  
}

chart_list <- list()

for (i in 1:5) {
  
  chart_list[[i]] <- data |> 
    filter(chart_num == i) |> 
    chart_creator() +
    labs(title = as.character(" ")) +
    theme(plot.title = element_text(vjust = -2, size = 16),
          plot.margin = unit(c(0, 0, 0, 0), "cm"),
          plot.background = element_rect(fill = "#EFD8AF", color = "#EFD8AF"))
  
  
}

# Adjusting the label for "Great Britain" and "Scandinavia" in the first and second pie chart

chart_list[[1]] <- chart_list[[1]] +
  annotate("text", x = 1, y = 0.8, angle = -2.806, label = "", family = "Puritan") +
  annotate("text", x = 1, y = 0.75, angle = -2.806, label = "", family = "Puritan") +
  annotate("text", x = 1.1, y = 0.9256805, angle = -64.389, label = "", size = 2.5, family = "Puritan")

chart_list[[2]] <- chart_list[[2]] +
  annotate("text", x = 1.1, y = 0.91000000, angle = -56.549, label = "", size = 3.5, family = "Puritan")

# merging the plots from 1850 to 1870
top <- plot_grid(chart_list[[1]], chart_list[[2]], chart_list[[3]],
                 nrow = 1,
                 rel_widths = c(45, 60, 90)) +
  annotate("text", x = 0.5, y = 0.9, label = "",
           size = 8)

bottom <- plot_grid(chart_list[[4]], chart_list[[5]],
                    nrow = 1,
                    rel_widths = c(100, 120))



png(here::here("Slow Reveal Recreations", "gannett-nationalities", "recreated-imgs", "02_full_masked.png"),
    width=1229,height=1571, res = 300)

plot_grid(top, bottom,
          nrow = 2) +
  theme(plot.background = element_rect(fill = "#EFD8AF", color = "#EFD8AF"))

dev.off()


# 03: Years Added

# Creating pie charts

chart_creator <- function(filtered_frame) {
  
  
  chart <- filtered_frame |> 
    ggplot(aes(x = "", y = pct, fill = fct_reorder(section_color, section_num))) + 
    geom_bar(stat = "identity", linewidth = 0.1, color = "black") + 
    coord_polar("y", start = 0) +
    # geom_text(aes(x = 1, y = label_y, label = section, angle = label_angle, size = label_size),
    #           family = "Puritan") +
    scale_fill_identity() +
    theme_void() + 
    theme(legend.position = "none",
          plot.title = element_text(vjust = 0, hjust = 0.5, family = "Puritan"))
  
  return(chart)
  
}

chart_list <- list()

for (i in 1:5) {
  
  chart_list[[i]] <- data |> 
    filter(chart_num == i) |> 
    chart_creator() +
    labs(title = as.character(1840 + i*10)) +
    theme(plot.title = element_text(vjust = -2, size = 16),
          plot.margin = unit(c(0, 0, 0, 0), "cm"),
          plot.background = element_rect(fill = "#EFD8AF", color = "#EFD8AF"))
  
  
}

# Adjusting the label for "Great Britain" and "Scandinavia" in the first and second pie chart

chart_list[[1]] <- chart_list[[1]] +
  annotate("text", x = 1, y = 0.8, angle = -2.806, label = "", family = "Puritan") +
  annotate("text", x = 1, y = 0.75, angle = -2.806, label = "", family = "Puritan") +
  annotate("text", x = 1.1, y = 0.9256805, angle = -64.389, label = "", size = 2.5, family = "Puritan")

chart_list[[2]] <- chart_list[[2]] +
  annotate("text", x = 1.1, y = 0.91000000, angle = -56.549, label = "", size = 3.5, family = "Puritan")

# merging the plots from 1850 to 1870
top <- plot_grid(chart_list[[1]], chart_list[[2]], chart_list[[3]],
                 nrow = 1,
                 rel_widths = c(45, 60, 90)) +
  annotate("text", x = 0.5, y = 0.9, label = "",
           size = 8)

bottom <- plot_grid(chart_list[[4]], chart_list[[5]],
                    nrow = 1,
                    rel_widths = c(100, 120))



png(here::here("Slow Reveal Recreations", "gannett-nationalities", "recreated-imgs", "03_years_added.png"),
    width=1229,height=1571, res = 300)

plot_grid(top, bottom,
          nrow = 2) +
  theme(plot.background = element_rect(fill = "#EFD8AF", color = "#EFD8AF"))

dev.off()


# 04: IRE and GER Added

# Creating pie charts

chart_creator <- function(filtered_frame) {
  
  
  chart <- filtered_frame |> 
    ggplot(aes(x = "", y = pct, fill = fct_reorder(section_color, section_num))) + 
    geom_bar(stat = "identity", linewidth = 0.1, color = "black") + 
    coord_polar("y", start = 0) +
    geom_text(aes(x = 1, y = label_y, label = section, angle = label_angle, size = label_size),
              family = "Puritan",
              data = filtered_frame |> 
                filter(section %in% c("GERMANY", "IRELAND"))) +
    scale_fill_identity() +
    theme_void() + 
    theme(legend.position = "none",
          plot.title = element_text(vjust = 0, hjust = 0.5, family = "Puritan"))
  
  return(chart)
  
}

chart_list <- list()

for (i in 1:5) {
  
  chart_list[[i]] <- data |> 
    filter(chart_num == i) |> 
    chart_creator() +
    labs(title = as.character(1840 + i*10)) +
    theme(plot.title = element_text(vjust = -2, size = 16),
          plot.margin = unit(c(0, 0, 0, 0), "cm"),
          plot.background = element_rect(fill = "#EFD8AF", color = "#EFD8AF"))
  
  
}

# Adjusting the label for "Great Britain" and "Scandinavia" in the first and second pie chart

chart_list[[1]] <- chart_list[[1]] +
  annotate("text", x = 1, y = 0.8, angle = -2.806, label = "", family = "Puritan") +
  annotate("text", x = 1, y = 0.75, angle = -2.806, label = "", family = "Puritan") +
  annotate("text", x = 1.1, y = 0.9256805, angle = -64.389, label = "", size = 2.5, family = "Puritan")

chart_list[[2]] <- chart_list[[2]] +
  annotate("text", x = 1.1, y = 0.91000000, angle = -56.549, label = "", size = 3.5, family = "Puritan")

# merging the plots from 1850 to 1870
top <- plot_grid(chart_list[[1]], chart_list[[2]], chart_list[[3]],
                 nrow = 1,
                 rel_widths = c(45, 60, 90)) +
  annotate("text", x = 0.5, y = 0.9, label = "39. NATIONALITIES OF THE FOREIGN BORN AT EACH CENSUS: 1850 TO 1890.",
           size = 8,
           family = "Puritan")

bottom <- plot_grid(chart_list[[4]], chart_list[[5]],
                    nrow = 1,
                    rel_widths = c(100, 120))



png(here::here("Slow Reveal Recreations", "gannett-nationalities", "recreated-imgs", "04_ire_ger_added.png"),
    width=1229,height=1571, res = 300)

plot_grid(top, bottom,
          nrow = 2) +
  theme(plot.background = element_rect(fill = "#EFD8AF", color = "#EFD8AF"))

dev.off()
