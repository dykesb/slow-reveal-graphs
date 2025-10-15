#
# FILE:
# palmer_bem_history.R
#
# DESCRIPTION
# Image 139 of Chronological history of the United States, arranged with plates on Bem's principle
# https://www.loc.gov/resource/gdcmassbookdig.chronologicalhis00peab/?sp=139&st=image&pdfPage=undefined&r=-0.384,-0.105,1.71,0.958,0
#
#
# AUTHORS:
#   Louis Cousino (main code)

# setup
library(ggplot2)
library(tidyverse)
library(showtext)
library(cowplot)
library(patchwork)

# Required fonts
font_add_google("Almendra SC", "Almendra SC")
font_add_google("Puritan", "Puritan")
showtext_auto()

global_font <- "Almendra SC"

# Since the visualization comes on a grid, geom_tile could be used to plot the squares
# and geom_polygon could be used to plot the triangles.

data <- tibble(
  
  x = c(rep(seq(1,13, by = 3), times = 5)),
  y = c(rep(13, times = 5), rep(10, times = 5), rep(7, times = 5), rep(4, times = 5), rep(1, times = 5)),
  height = c(rep(3, times = 25)),
  width = c(rep(3, times = 25)),
  color = c(rep("#D38321", times = 25)),
  fill = c(rep("#D3B592", times = 25))
  
)

green_squares <- tibble(
  
  x = c(1, 14, 7, 14, 14, 4),
  y = c(13, 6, 10, 14, 14, 6),
  height = rep(1, times = 6),
  width = rep(1, times = 6),
  fill = rep("#638672", times = 6),
  square_num = c(1, 1, 2, 3, 4, 4)
  
)

green_polygons <- tibble(
  
  x = c(
    c(7.5, 8.5, 8.5), c(8.5, 9, 9.5), c(11.5, 12.5, 12.5), # Square 1
    c(5.5, 6, 6.5), c(12.5, 13.5, 13.5), c(5.5, 5.5, 6.5, 7.5), c(7.5, 8.5, 8.5), # Square 2
    c(8.5, 9.5, 9.5), c(11.5, 11.5, 12.5), c(7.5, 8.5, 8.5), c(-0.5, -0.5, 1), # Square 3
    c(5.5, 6.5, 6.5), c(8.5, 9.5, 9.5), c(12.5, 13.5, 13.5), c(11, 11, 11.5, 11.5), c(4.5, 5.5, 5.5), c(7.5, 8.5, 8.5), c(13.5, 14.5, 14.5), c(5.5, 6.5, 6.5), c(13.5, 14.5, 14.5)
    ),
  y = c(
    c(9.5, 9.5, 10.5), c(14.5, 14, 14.5), c(4.5, 4.5, 5.5), # Square 1
    c(14.5, 14, 14.5), c(13.5, 13.5, 14.5), c(8.5, 7.5, 7.5, 8.5), c(0.5, 0.5, 1.5), # Square 2
    c(13.5, 13.5, 14.5), c(14.5, 13.5, 14.5), c(9.5, 9.5, 10.5), c(5.5, 2.5, 4), # Square 3
    c(13.5, 13.5, 14.5), c(13.5, 13.5, 14.5), c(13.5, 13.5, 14.5), c(12.5, 11.5, 11.5, 12.5), c(6.5, 6.5, 7.5), c(6.5, 6.5, 7.5), c(6.5, 6.5, 7.5), c(1.5, 1.5, 2.5), c(0.5, 0.5, 1.5)
    ),
  fill = rep("#638672", times = 62),
  square_num = c(rep(1, times = 9), rep(2, times = 13), rep(3, times = 12), rep(4, times = 28)),
  group = c(
    rep(1,times = 3), rep(2, times = 3), rep(3, times = 3), # Square 1
    rep(1, times = 3), rep(2, times = 3), rep(3, times = 4), rep(4, times = 3), # Square 2
    rep(1,times = 3), rep(2, times = 3), rep(3, times = 3), rep(4, times = 3), # Square 3
    rep(1, times = 3), rep(2, times = 3), rep(3, times = 3), rep(4, times = 4), rep(5, times = 3), rep(6, times = 3), rep(7, times = 3), rep(8, times = 3), rep(9, times = 3) # Square 4
    )
  
)


dark_red_squares <- tibble(
  
  x = c(7, 14, 11, 14, 5, 2, 6, 14),
  y = c(4, 10, 7, 7, 10, 8, 6, 6),
  height = c(3, rep(1, times = 7)),
  width = c(3, rep(1, times = 7)),
  fill = rep("#711602", times = 8),
  square_num = c(rep(1, times = 1), rep(3, times = 3), rep(4, times = 4))
  
)

dark_red_polygons <- tibble(
  
  x = c(
    c(8.5, 9.5, 9.5), c(7.5, 7.5, 8.5), c(2.5, 2.5, 4, 4.5), c(11.5, 11.5, 12.5), # Square 1``
    c(5.5, 6.5, 6.5), c(12.5, 12.5, 13.5), c(7.5, 7.5, 8.5), #Square 2
    c(8.5, 8.5, 9.5), c(11.5, 12.5, 12.5), c(7.5, 7.5, 8.5), c(11.5, 13.5, 13.5), c(13.5, 14.5, 14.5), c(-0.5, 2.5, 2.5), c(5.5, 5.5, 7), c(5.5, 5.5, 7), c(7, 8.5, 8.5), c(7, 8.5, 8.5), c(7.5, 7.5, 8.5), # Square 3
    c(5.5, 5.5, 6.5), c(8.5, 8.5, 9.5), c(12.5, 12.5, 13.5), c(10.5, 10.5, 11, 11), c(10.5, 10.5, 11.5), c(13.5, 13.5, 14.5), c(2.5, 3.5, 3.5), c(3.5, 4.5, 4.5), c(4.5, 5.5, 5.5), c(6.5, 5.5, 6.5, 7.5), c(7.5, 7.5, 8.5), c(8.5, 8.5, 11.5), c(11.5, 12.5, 12.5), c(12.5, 13.5, 13.5), c(13.5, 14.5, 14.5)
    ),
  y = c(
    c(13.5, 13.5, 14.5), c(9.5, 10.5, 10.5), c(2.5, 2, 2, 2.5), c(4.5, 5.5, 5.5), # Square 1
    c(13.5, 13.5, 14.5), c(13.5, 14.5, 14.5), c(0.5, 1.5, 1.5), # Square 2
    c(14.5, 13.5, 14.5), c(13.5, 13.5, 14.5), c(10.5, 9.5, 10.5), c(5.5, 5.5, 7.5), c(7.5, 7.5, 8.5), c(2.5, 2.5, 5.5), c(5.5, 4, 5.5), c(4, 2.5, 2.5), c(5.5, 4, 5.5), c(2.5, 2.5, 4), c(1.5, 0.5, 1.5), # Square 3
    c(14.5, 13.5, 14.5), c(14.5, 13.5, 14.5), c(14.5, 13.5, 14.5), c(12.5, 11.5, 11.5, 12.5), c(10.5, 9.5, 10.5), c(11.5, 10.5, 11.5), c(5.5, 5.5, 6.5), c(6.5, 6.5, 7.5), c(7.5, 7.5, 8.5), c(8.5, 7.5, 7.5, 8.5), c(6.5, 5.5, 6.5), c(8.5, 5.5, 8.5), c(5.5, 5.5, 6.5), c(6.5, 6.5, 7.5), c(7.5, 7.5, 8.5)
        ),
  fill = rep("#711602", times = 102),
  square_num = c(rep(1, times = 13), rep(2, times = 9), rep(3, times = 33), rep(4, times = 47)),
  group = c(
    rep(1,times = 3), rep(2,times = 3), rep(3,times = 4), rep(4,times = 3), # Square 1
    rep(1, times = 3), rep(2, times = 3), rep(3, times = 3), # Square 2
    rep(1,times = 3), rep(2,times = 3), rep(3,times = 3), rep(4,times = 3), rep(5,times = 3), rep(6,times = 3), rep(7,times = 3), rep(8,times = 3), rep(9,times = 3), rep(10,times = 3), rep(11,times = 3), # Square 3
    rep(1, times = 3), rep(2, times = 3), rep(3, times = 3), rep(4, times = 4), rep(5, times = 3), rep(6, times = 3), rep(7, times = 3), rep(8, times = 3), rep(9, times = 3), rep(10, times = 4), rep(11, times = 3), rep(12, times = 3), rep(13, times = 3), rep(14, times = 3), rep(15, times = 3)
    )
  
)

bright_red_polygons <- tibble(
  
  x = c(c(3.5, 4.5, 5.5, 5.5)),
  y = c(c(1.5, 2.5, 2.5, 1.5)),
  fill = rep("#DA3611", times = 4),
  square_num = c(rep(1, times = 4)),
  group = c(rep(1,times = 4))
  
)

yellow_squares <- tibble(
  
  x = c(14, 3, 13, 10, 7, 8, 10, 14, 0, 1, 4, 6, 14, 11, 13, 0, 0, 0, 1, 1, 1, 2, 2, 8, 13, 3, 4, 10, 12, 4, 10, 11),
  y = c(11, 3, 0, 12, 9, 7, 7, 6, 2, 2, 2, 2, 1, 9, 9, 8, 7, 6, 8, 7, 6, 7, 6, 8, 6, 5, 4, 4, 5, 1, 2, 0),
  height = c(rep(1, times = 27), 3, rep(1, times = 4)),
  width = c(rep(1, times = 27), 3, rep(1, times = 4)),
  fill = rep("#D38321", times = 32),
  square_num = c(rep(1, times = 2), 2, rep(3, times = 10), rep(4, times = 19))
  
)

yellow_polygons <- tibble(
  
  x = c(
    c(8.5, 8.5, 9), c(2.5, 2.5, 3.5, 4), # Square 1
    c(5.5, 5.5, 6), c(6.5, 7.5, 8.5, 8.5), # Square 2
    c(11.5, 11.5, 14.5), c(-0.5, 1, 2.5), c(7, 5.5, 7, 8.5), c(7.5, 8.5, 8.5), # Square 3
    c(10.5, 11.5, 11.5), c(13.5, 14.5, 14.5), c(2.5, 2.5, 5.5), c(4.5, 4.5, 5.5), c(5.5, 5.5, 6.5), c(7.5, 8.5, 8.5), c(7.5, 7.5, 8.5), c(11.5, 8.5, 11.5, 14.5), c(13.5, 13.5, 14.5), c(5.5, 5.5, 6.5), c(13, 12.5, 13, 13.5), c(13.5, 13.5, 14.5) # Square 4
    ),
  y = c(
    c(13.5, 14.5, 14), c(2, 1.5, 1.5, 2), # Square 1
    c(13.5, 14.5, 14), c(7.5, 8.5, 8.5, 7.5), # Square 2
    c(8.5, 5.5, 8.5), c(5.5, 4, 5.5), c(5.5, 4, 2.5, 4), c(0.5, 0.5, 1.5), # Square 3
    c(9.5, 9.5, 10.5), c(10.5, 10.5, 11.5), c(8.5, 5.5, 8.5), c(7.5, 6.5, 7.5), c(8.5, 7.5, 8.5), c(7.5, 7.5, 8.5), c(7.5, 6.5, 7.5), c(8.5, 5.5, 5.5, 8.5), c(7.5, 6.5, 7.5), c(2.5, 1.5, 2.5), c(1.5, 1, 0.5, 1), c(1.5, 0.5, 1.5) # Square 4
    ),
  fill = rep("#D38321", times = 65),
  square_num = c(rep(1, times = 7), rep(2, times = 7), rep(3, times = 13), rep(4, times = 38)),
  group = c(
    rep(1,times = 3), rep(2,times = 4), 
    rep(1, times = 3), rep(2, times = 4),
    rep(1, times = 3), rep(2, times = 3), rep(3, times = 4), rep(4, times = 3),
    rep(1, times = 3), rep(2, times = 3), rep(3, times = 3), rep(4, times = 3), rep(5, times = 3), rep(6, times = 3), rep(7, times = 3), rep(8, times = 4), rep(9, times = 3), rep(10, times = 3), rep(11, times = 4), rep(12, times = 3)
    )
  
)

text <- tibble(
  
  x = c(13, 1, 1, 10, 13, 1, 1, 10, 10),
  y = c(13, 10, 1, 13, 10, 13, 7, 4, 3),
  text = c("1705", "1711", "1741", "1709", "1720", "1751", "1", "F U", "W"),
  size = c(rep(12, times = 6), 36, 18, 18),
  color = c(rep("black", times = 6), rep("white", times = 3)),
  square_num = c(rep(1, times = 3), rep(2, times = 2), rep(3, times = 1), rep(4, times = 3)),
  family = c(rep("Almendra SC", times = 7), rep("Puritan", times = 2))
  
)

# 01: Full unmasked
# 

quarter_list <- list()

for (i in 1:4) {
  
  quarter_list[[i]] <- ggplot() +
    geom_tile(aes(x = x, y = y, height = height, width = width, color = color, fill = fill), # Applying background squares
              linewidth = 0,
              data = data) +
    geom_tile(aes(x = x, y = y, height = height, width = width, fill = fill), # Applying green squares
              data = green_squares |>
                filter(square_num == i)) +
    geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying green polygons
                 data = green_polygons |>
                   filter(square_num == i)) +
    geom_tile(aes(x = x, y = y, height = height, width = width, fill = fill), # Applying dark red squares
              linewidth = 0,
              data = dark_red_squares |>
                filter(square_num == i)) +
    geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying dark red polygons
                 data = dark_red_polygons |>
                   filter(square_num == i)) +
    geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying bright red polygons
                 data = bright_red_polygons |>
                   filter(square_num == i)) +
    geom_tile(aes(x = x, y = y, height = height, width = width, fill = fill), # Applying yellow squares
              linewidth = 0,
              data = yellow_squares |>
                filter(square_num == i)) +
    geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying yellow polygons
                 data = yellow_polygons |>
                   filter(square_num == i)) +
    geom_text(aes(x = x, y = y, label = text, color = color, size = size, family = family), # Applying text
              data = text |> 
                filter(square_num == i)) +
    geom_tile(aes(x = x, y = y, height = height, width = width, color = color, fill = fill), # Applying border spaces
              linewidth = 2,
              alpha = 0,
              data = data) +
    xlim(c(-1, 15)) +
    ylim(c(-1, 15)) +
    scale_size_identity() +
    scale_fill_identity() +
    scale_color_identity() +
    theme_void() +
    theme(legend.position = "none",
          plot.margin = margin(0, 0, 0, 0))
  
}


# The NULL in the plot_grid are for spacer plots.

combined_plot <- plot_grid(quarter_list[[1]], NULL, quarter_list[[2]],
                           NULL, NULL, NULL,
                           quarter_list[[3]], NULL, quarter_list[[4]],
                           nrow = 3,
                           ncol = 3,
                           rel_widths = c(1, -0.10, 1),
                           rel_heights = c(1, -0.10, 1))

full_plot <- ggdraw() +
  draw_plot(combined_plot) +
  theme(plot.background = element_rect(fill = "#D38321",
                                       color = NA))

png(here::here("Slow Reveal Recreations", "palmer-bem-history", "recreated-imgs", "01_full_reveal.png"),
    height = 2100,
    width = 2100)

full_plot

dev.off()

# 02: Full masked

quarter_list <- list()

for (i in 1:4) {
  
  quarter_list[[i]] <- ggplot() +
    geom_tile(aes(x = x, y = y, height = height, width = width, color = color, fill = fill), # Applying background squares
              linewidth = 0,
              data = data) +
    # geom_tile(aes(x = x, y = y, height = height, width = width, fill = fill), # Applying green squares
    #           data = green_squares |>
    #             filter(square_num == i)) +
    # geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying green polygons
    #              data = green_polygons |>
    #                filter(square_num == i)) +
    # geom_tile(aes(x = x, y = y, height = height, width = width, fill = fill), # Applying dark red squares
    #           linewidth = 0,
    #           data = dark_red_squares |>
    #             filter(square_num == i)) +
    # geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying dark red polygons
    #              data = dark_red_polygons |>
    #                filter(square_num == i)) +
    # geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying bright red polygons
    #              data = bright_red_polygons |>
    #                filter(square_num == i)) +
    # geom_tile(aes(x = x, y = y, height = height, width = width, fill = fill), # Applying yellow squares
    #           linewidth = 0,
    #           data = yellow_squares |>
    #             filter(square_num == i)) +
    # geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying yellow polygons
    #              data = yellow_polygons |>
    #                filter(square_num == i)) +
    # geom_text(aes(x = x, y = y, label = text, color = color, size = size), # Applying text
    #           data = text |> 
    #             filter(square_num == i)) +
    geom_tile(aes(x = x, y = y, height = height, width = width, color = color, fill = fill), # Applying border spaces
              linewidth = 2,
              alpha = 0,
              data = data) +
    xlim(c(-1, 15)) +
    ylim(c(-1, 15)) +
    scale_size_identity() +
    scale_fill_identity() +
    scale_color_identity() +
    theme_void() +
    theme(legend.position = "none",
          plot.margin = margin(0, 0, 0, 0))
  
}


# The NULL in the plot_grid are for spacer plots.

combined_plot <- plot_grid(quarter_list[[1]], NULL, quarter_list[[2]],
                           NULL, NULL, NULL,
                           quarter_list[[3]], NULL, quarter_list[[4]],
                           nrow = 3,
                           ncol = 3,
                           rel_widths = c(1, -0.10, 1),
                           rel_heights = c(1, -0.10, 1))

full_plot <- ggdraw() +
  draw_plot(combined_plot) +
  theme(plot.background = element_rect(fill = "#D38321",
                                       color = NA))

png(here::here("Slow Reveal Recreations", "palmer-bem-history", "recreated-imgs", "02_step1_full_mask.png"),
    height = 2100,
    width = 2100)

full_plot

dev.off()

# 03: Adding Dark Red Spaces

quarter_list <- list()

for (i in 1:4) {
  
  quarter_list[[i]] <- ggplot() +
    geom_tile(aes(x = x, y = y, height = height, width = width, color = color, fill = fill), # Applying background squares
              linewidth = 0,
              data = data) +
    # geom_tile(aes(x = x, y = y, height = height, width = width, fill = fill), # Applying green squares
    #           data = green_squares |>
    #             filter(square_num == i)) +
    # geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying green polygons
    #              data = green_polygons |>
    #                filter(square_num == i)) +
    geom_tile(aes(x = x, y = y, height = height, width = width, fill = fill), # Applying dark red squares
              linewidth = 0,
              data = dark_red_squares |>
                filter(square_num == i)) +
    geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying dark red polygons
                 data = dark_red_polygons |>
                   filter(square_num == i)) +
    # geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying bright red polygons
    #              data = bright_red_polygons |>
    #                filter(square_num == i)) +
    # geom_tile(aes(x = x, y = y, height = height, width = width, fill = fill), # Applying yellow squares
    #           linewidth = 0,
    #           data = yellow_squares |>
    #             filter(square_num == i)) +
    # geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying yellow polygons
    #              data = yellow_polygons |>
    #                filter(square_num == i)) +
    # geom_text(aes(x = x, y = y, label = text, color = color, size = size), # Applying text
    #           data = text |> 
    #             filter(square_num == i)) +
    geom_tile(aes(x = x, y = y, height = height, width = width, color = color, fill = fill), # Applying border spaces
              linewidth = 2,
              alpha = 0,
              data = data) +
    xlim(c(-1, 15)) +
    ylim(c(-1, 15)) +
    scale_size_identity() +
    scale_fill_identity() +
    scale_color_identity() +
    theme_void() +
    theme(legend.position = "none",
          plot.margin = margin(0, 0, 0, 0))
  
}


# The NULL in the plot_grid are for spacer plots.

combined_plot <- plot_grid(quarter_list[[1]], NULL, quarter_list[[2]],
                           NULL, NULL, NULL,
                           quarter_list[[3]], NULL, quarter_list[[4]],
                           nrow = 3,
                           ncol = 3,
                           rel_widths = c(1, -0.10, 1),
                           rel_heights = c(1, -0.10, 1))

full_plot <- ggdraw() +
  draw_plot(combined_plot) +
  theme(plot.background = element_rect(fill = "#D38321",
                                       color = NA))

png(here::here("Slow Reveal Recreations", "palmer-bem-history", "recreated-imgs", "03_step2_reveal.png"),
    height = 2100,
    width = 2100)

full_plot

dev.off()


# 04: Adding Green and Bright Red Spaces

quarter_list <- list()

for (i in 1:4) {
  
  quarter_list[[i]] <- ggplot() +
    geom_tile(aes(x = x, y = y, height = height, width = width, color = color, fill = fill), # Applying background squares
              linewidth = 0,
              data = data) +
    geom_tile(aes(x = x, y = y, height = height, width = width, fill = fill), # Applying green squares
              data = green_squares |>
                filter(square_num == i)) +
    geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying green polygons
                 data = green_polygons |>
                   filter(square_num == i)) +
    geom_tile(aes(x = x, y = y, height = height, width = width, fill = fill), # Applying dark red squares
              linewidth = 0,
              data = dark_red_squares |>
                filter(square_num == i)) +
    geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying dark red polygons
                 data = dark_red_polygons |>
                   filter(square_num == i)) +
    geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying bright red polygons
                 data = bright_red_polygons |>
                   filter(square_num == i)) +
    # geom_tile(aes(x = x, y = y, height = height, width = width, fill = fill), # Applying yellow squares
    #           linewidth = 0,
    #           data = yellow_squares |>
    #             filter(square_num == i)) +
    # geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying yellow polygons
    #              data = yellow_polygons |>
    #                filter(square_num == i)) +
    # geom_text(aes(x = x, y = y, label = text, color = color, size = size), # Applying text
    #           data = text |> 
    #             filter(square_num == i)) +
    geom_tile(aes(x = x, y = y, height = height, width = width, color = color, fill = fill), # Applying border spaces
              linewidth = 2,
              alpha = 0,
              data = data) +
    xlim(c(-1, 15)) +
    ylim(c(-1, 15)) +
    scale_size_identity() +
    scale_fill_identity() +
    scale_color_identity() +
    theme_void() +
    theme(legend.position = "none",
          plot.margin = margin(0, 0, 0, 0))
  
}


# The NULL in the plot_grid are for spacer plots.

combined_plot <- plot_grid(quarter_list[[1]], NULL, quarter_list[[2]],
                           NULL, NULL, NULL,
                           quarter_list[[3]], NULL, quarter_list[[4]],
                           nrow = 3,
                           ncol = 3,
                           rel_widths = c(1, -0.10, 1),
                           rel_heights = c(1, -0.10, 1))

full_plot <- ggdraw() +
  draw_plot(combined_plot) +
  theme(plot.background = element_rect(fill = "#D38321",
                                       color = NA))

png(here::here("Slow Reveal Recreations", "palmer-bem-history", "recreated-imgs", "04_step3_reveal.png"),
    height = 2100,
    width = 2100)

full_plot

dev.off()


# 05: Adding Yellow Spaces

quarter_list <- list()

for (i in 1:4) {
  
  quarter_list[[i]] <- ggplot() +
    geom_tile(aes(x = x, y = y, height = height, width = width, color = color, fill = fill), # Applying background squares
              linewidth = 0,
              data = data) +
    geom_tile(aes(x = x, y = y, height = height, width = width, fill = fill), # Applying green squares
              data = green_squares |>
                filter(square_num == i)) +
    geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying green polygons
                 data = green_polygons |>
                   filter(square_num == i)) +
    geom_tile(aes(x = x, y = y, height = height, width = width, fill = fill), # Applying dark red squares
              linewidth = 0,
              data = dark_red_squares |>
                filter(square_num == i)) +
    geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying dark red polygons
                 data = dark_red_polygons |>
                   filter(square_num == i)) +
    geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying bright red polygons
                 data = bright_red_polygons |>
                   filter(square_num == i)) +
    geom_tile(aes(x = x, y = y, height = height, width = width, fill = fill), # Applying yellow squares
              linewidth = 0,
              data = yellow_squares |>
                filter(square_num == i)) +
    geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying yellow polygons
                 data = yellow_polygons |>
                   filter(square_num == i)) +
    # geom_text(aes(x = x, y = y, label = text, color = color, size = size), # Applying text
    #           data = text |> 
    #             filter(square_num == i)) +
    geom_tile(aes(x = x, y = y, height = height, width = width, color = color, fill = fill), # Applying border spaces
              linewidth = 2,
              alpha = 0,
              data = data) +
    xlim(c(-1, 15)) +
    ylim(c(-1, 15)) +
    scale_size_identity() +
    scale_fill_identity() +
    scale_color_identity() +
    theme_void() +
    theme(legend.position = "none",
          plot.margin = margin(0, 0, 0, 0))
  
}


# The NULL in the plot_grid are for spacer plots.

combined_plot <- plot_grid(quarter_list[[1]], NULL, quarter_list[[2]],
                           NULL, NULL, NULL,
                           quarter_list[[3]], NULL, quarter_list[[4]],
                           nrow = 3,
                           ncol = 3,
                           rel_widths = c(1, -0.10, 1),
                           rel_heights = c(1, -0.10, 1))

full_plot <- ggdraw() +
  draw_plot(combined_plot) +
  theme(plot.background = element_rect(fill = "#D38321",
                                       color = NA))

png(here::here("Slow Reveal Recreations", "palmer-bem-history", "recreated-imgs", "05_step4_reveal.png"),
    height = 2100,
    width = 2100)

full_plot

dev.off()

# 06: Adding F/U/W

quarter_list <- list()

for (i in 1:4) {
  
  quarter_list[[i]] <- ggplot() +
    geom_tile(aes(x = x, y = y, height = height, width = width, color = color, fill = fill), # Applying background squares
              linewidth = 0,
              data = data) +
    geom_tile(aes(x = x, y = y, height = height, width = width, fill = fill), # Applying green squares
              data = green_squares |>
                filter(square_num == i)) +
    geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying green polygons
                 data = green_polygons |>
                   filter(square_num == i)) +
    geom_tile(aes(x = x, y = y, height = height, width = width, fill = fill), # Applying dark red squares
              linewidth = 0,
              data = dark_red_squares |>
                filter(square_num == i)) +
    geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying dark red polygons
                 data = dark_red_polygons |>
                   filter(square_num == i)) +
    geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying bright red polygons
                 data = bright_red_polygons |>
                   filter(square_num == i)) +
    geom_tile(aes(x = x, y = y, height = height, width = width, fill = fill), # Applying yellow squares
              linewidth = 0,
              data = yellow_squares |>
                filter(square_num == i)) +
    geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying yellow polygons
                 data = yellow_polygons |>
                   filter(square_num == i)) +
    geom_text(aes(x = x, y = y, label = text, color = color, size = size, family = family), # Applying text
              data = text |>
                filter(square_num == i) |> 
                filter(text %in% c("F U", "W"))) +
    geom_tile(aes(x = x, y = y, height = height, width = width, color = color, fill = fill), # Applying border spaces
              linewidth = 2,
              alpha = 0,
              data = data) +
    xlim(c(-1, 15)) +
    ylim(c(-1, 15)) +
    scale_size_identity() +
    scale_fill_identity() +
    scale_color_identity() +
    theme_void() +
    theme(legend.position = "none",
          plot.margin = margin(0, 0, 0, 0))
  
}


# The NULL in the plot_grid are for spacer plots.

combined_plot <- plot_grid(quarter_list[[1]], NULL, quarter_list[[2]],
                           NULL, NULL, NULL,
                           quarter_list[[3]], NULL, quarter_list[[4]],
                           nrow = 3,
                           ncol = 3,
                           rel_widths = c(1, -0.10, 1),
                           rel_heights = c(1, -0.10, 1))

full_plot <- ggdraw() +
  draw_plot(combined_plot) +
  theme(plot.background = element_rect(fill = "#D38321",
                                       color = NA))

png(here::here("Slow Reveal Recreations", "palmer-bem-history", "recreated-imgs", "06_step5_reveal.png"),
    height = 2100,
    width = 2100)

full_plot

dev.off()

# 07: Adding Years 1705 and 1751

quarter_list <- list()

for (i in 1:4) {
  
  quarter_list[[i]] <- ggplot() +
    geom_tile(aes(x = x, y = y, height = height, width = width, color = color, fill = fill), # Applying background squares
              linewidth = 0,
              data = data) +
    geom_tile(aes(x = x, y = y, height = height, width = width, fill = fill), # Applying green squares
              data = green_squares |>
                filter(square_num == i)) +
    geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying green polygons
                 data = green_polygons |>
                   filter(square_num == i)) +
    geom_tile(aes(x = x, y = y, height = height, width = width, fill = fill), # Applying dark red squares
              linewidth = 0,
              data = dark_red_squares |>
                filter(square_num == i)) +
    geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying dark red polygons
                 data = dark_red_polygons |>
                   filter(square_num == i)) +
    geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying bright red polygons
                 data = bright_red_polygons |>
                   filter(square_num == i)) +
    geom_tile(aes(x = x, y = y, height = height, width = width, fill = fill), # Applying yellow squares
              linewidth = 0,
              data = yellow_squares |>
                filter(square_num == i)) +
    geom_polygon(aes(x = x, y = y, group = group, fill = fill), # Applying yellow polygons
                 data = yellow_polygons |>
                   filter(square_num == i)) +
    geom_text(aes(x = x, y = y, label = text, color = color, size = size, family = family), # Applying text
              data = text |>
                filter(square_num == i) |> 
                filter(text %in% c("F U", "W", "1705", "1751"))) +
    geom_tile(aes(x = x, y = y, height = height, width = width, color = color, fill = fill), # Applying border spaces
              linewidth = 2,
              alpha = 0,
              data = data) +
    xlim(c(-1, 15)) +
    ylim(c(-1, 15)) +
    scale_size_identity() +
    scale_fill_identity() +
    scale_color_identity() +
    theme_void() +
    theme(legend.position = "none",
          plot.margin = margin(0, 0, 0, 0))
  
}


# The NULL in the plot_grid are for spacer plots.

combined_plot <- plot_grid(quarter_list[[1]], NULL, quarter_list[[2]],
                           NULL, NULL, NULL,
                           quarter_list[[3]], NULL, quarter_list[[4]],
                           nrow = 3,
                           ncol = 3,
                           rel_widths = c(1, -0.10, 1),
                           rel_heights = c(1, -0.10, 1))

full_plot <- ggdraw() +
  draw_plot(combined_plot) +
  theme(plot.background = element_rect(fill = "#D38321",
                                       color = NA))

png(here::here("Slow Reveal Recreations", "palmer-bem-history", "recreated-imgs", "07_step6_reveal.png"),
    height = 2100,
    width = 2100)

full_plot

dev.off()