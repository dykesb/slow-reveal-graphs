#
# FILE:
#  detroit_pop.R
#
# DESCRIPTION:
#  Brief description of the plot, including original source/citation
#
# SLOW REVEAL ORDER:
#   1. List
#   2. Out
#   ...
#   n. Order
#
# AUTHORS:
#   Ellie (2021, main code)
#   Ian Curtis (2023, code to save plots)

library(tidyverse)
library(readxl)

voyages <- read_xls(here::here("slave-voyage","slave_voyage_data.xls")) %>% 
  rename("Embarked" = `Embarked Slaves`,
         "Disembarked" = `Disembarked Slaves`)

## FIGURE 1: FULLY MASKED

# Disembarked #008080
# Embarked #AFEEEE

fig01 <- ggplot(voyages) + 
  geom_col(aes(x = Year, y = Embarked, color = "Embarked", fill = "Embarked")) +
  #geom_col(aes(x = Year, y = Disembarked, color = "Disembarked", fill = "Disembarked")) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.1)), breaks = seq(0, 130000, 20000),
                     labels = scales::label_number_si()) +
  scale_x_continuous(expand = expansion(mult = c(0, 0.1)), 
                     breaks = seq(1500, 1875, 50), limits = c(1499, NA), position = "top") +
  labs(title = " ",
       y = "",
       x = "") + 
  scale_fill_manual("", values = c("Embarked" = "#AFEEEE", "Disembarked" = "#008080"), 
                    guide = guide_legend(reverse = TRUE)) +
  scale_color_manual("", values = c("Embarked" = "#AFEEEE", "Disembarked" = "#008080")) +
  guides(color = FALSE,
         fill = guide_legend(override.aes = list(fill = NA))) +
  theme_bw() +
  theme(panel.grid.minor = element_blank(),
        panel.grid = element_line(color = "grey"),
        panel.border = element_blank(),
        axis.line.y = element_blank(),
        axis.text = element_text(color = "white"),
        axis.ticks = element_line(color = "grey"),
        axis.line = element_line(color = "grey"),
        plot.margin=unit(c(1,1,1.5,1.2),"cm"),
        plot.title.position = "plot",
        plot.title = element_text(face = "bold", size = 10),
        legend.position = "bottom",
        legend.justification = "left",
        legend.key.width = unit(0.35, "cm"),
        legend.key.height = unit(0.25, "cm"),
        legend.text = element_text(color = "white"),
        legend.title = element_text(color = "white"),
        legend.key = element_rect(color = "white")
        )

ggsave(here::here("slave-voyage", "01_full_masked.png"), fig01)

## FIGURE 2: LAYER 2 ADDED

# Disembarked #008080
# Embarked #AFEEEE

fig02 <- ggplot(voyages) + 
  geom_col(aes(x = Year, y = Embarked, color = "Embarked", fill = "Embarked")) +
  geom_col(aes(x = Year, y = Disembarked, color = "Disembarked", fill = "Disembarked")) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.1)), breaks = seq(0, 130000, 20000),
                     labels = scales::label_number_si()) +
  scale_x_continuous(expand = expansion(mult = c(0, 0.1)), 
                     breaks = seq(1500, 1875, 50), limits = c(1499, NA), position = "top") +
  labs(title = " ",
       y = "",
       x = "") + 
  scale_fill_manual("", values = c("Embarked" = "#AFEEEE", "Disembarked" = "#008080"), 
                    guide = guide_legend(reverse = TRUE)) +
  scale_color_manual("", values = c("Embarked" = "#AFEEEE", "Disembarked" = "#008080")) +
  guides(color = FALSE,
         fill = guide_legend(override.aes = list(fill = NA))) +
  theme_bw() +
  theme(panel.grid.minor = element_blank(),
        panel.grid = element_line(color = "grey"),
        panel.border = element_blank(),
        axis.line.y = element_blank(),
        axis.text = element_text(color = "white"),
        axis.ticks = element_line(color = "grey"),
        axis.line = element_line(color = "grey"),
        plot.margin=unit(c(1,1,1.5,1.2),"cm"),
        plot.title.position = "plot",
        plot.title = element_text(face = "bold", size = 10),
        legend.position = "bottom",
        legend.justification = "left",
        legend.key.width = unit(0.35, "cm"),
        legend.key.height = unit(0.25, "cm"),
        legend.text = element_text(color = "white"),
        legend.title = element_text(color = "white"),
        legend.key = element_rect(color = "white")
        )

ggsave(here::here("slave-voyage", "02_layer2_unmasked.png"), fig02)

## FIGURE 3: X AXIS UNMASKED

# Disembarked #008080
# Embarked #AFEEEE

fig03 <- ggplot(voyages) + 
  geom_col(aes(x = Year, y = Embarked, color = "Embarked", fill = "Embarked")) +
  geom_col(aes(x = Year, y = Disembarked, color = "Disembarked", fill = "Disembarked")) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.1)), breaks = seq(0, 130000, 20000),
                     labels = scales::label_number_si()) +
  scale_x_continuous(expand = expansion(mult = c(0, 0.1)), 
                     breaks = seq(1500, 1875, 50), limits = c(1499, NA), position = "top") +
  labs(title = " ",
       y = "",
       x = "") + 
  scale_fill_manual("", values = c("Embarked" = "#AFEEEE", "Disembarked" = "#008080"), guide = guide_legend(reverse = TRUE)) +
  scale_color_manual("", values = c("Embarked" = "#AFEEEE", "Disembarked" = "#008080")) +
  guides(color = FALSE,
         fill = guide_legend(override.aes = list(fill = NA))) +
  theme_bw() +
  theme(panel.grid.minor = element_blank(),
        panel.grid = element_line(color = "grey"),
        panel.border = element_blank(),
        axis.line.y = element_blank(),
        axis.text.y = element_text(color = "white"),
        axis.ticks = element_line(color = "grey"),
        axis.line = element_line(color = "grey"),
        plot.margin=unit(c(1,1,1.5,1.2),"cm"),
        plot.title.position = "plot",
        plot.title = element_text(face = "bold", size = 10),
        legend.position = "bottom",
        legend.justification = "left",
        legend.key.width = unit(0.35, "cm"),
        legend.key.height = unit(0.25, "cm"),
        legend.text = element_text(color = "white"),
        legend.title = element_text(color = "white"),
        legend.key = element_rect(color = "white")
        )

ggsave(here::here("slave-voyage", "03_xaxis_unmasked.png"), fig03)

## FIGURE 4: Y AXIS REVEALED

# Disembarked #008080
# Embarked #AFEEEE

fig04 <- ggplot(voyages) + 
  geom_col(aes(x = Year, y = Embarked, color = "Embarked", fill = "Embarked")) +
  geom_col(aes(x = Year, y = Disembarked, color = "Disembarked", fill = "Disembarked")) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.1)), breaks = seq(0, 130000, 20000),
                     labels = scales::label_number_si()) +
  scale_x_continuous(expand = expansion(mult = c(0, 0.1)), 
                     breaks = seq(1500, 1875, 50), limits = c(1499, NA), position = "top") +
  labs(title = " ",
       y = "",
       x = "") + 
  scale_fill_manual("", values = c("Embarked" = "#AFEEEE", "Disembarked" = "#008080"), guide = guide_legend(reverse = TRUE)) +
  scale_color_manual("", values = c("Embarked" = "#AFEEEE", "Disembarked" = "#008080")) +
  guides(color = FALSE,
         fill = guide_legend(override.aes = list(fill = NA))) +
  theme_bw() +
  theme(panel.grid.minor = element_blank(),
        panel.grid = element_line(color = "grey"),
        panel.border = element_blank(),
        axis.line.y = element_blank(),
        axis.ticks = element_line(color = "grey"),
        axis.line = element_line(color = "grey"),
        plot.margin=unit(c(1,1,1.5,1.2),"cm"),
        plot.title.position = "plot",
        plot.title = element_text(face = "bold", size = 10),
        legend.position = "bottom",
        legend.justification = "left",
        legend.key.width = unit(0.35, "cm"),
        legend.key.height = unit(0.25, "cm"),
        legend.text = element_text(color = "white"),
        legend.title = element_text(color = "white"),
        legend.key = element_rect(color = "white"))

ggsave(here::here("slave-voyage", "04_yaxis_unmasked.png"), fig04)

## FIGURE 5: LEGEND UNMASKED

# Disembarked #008080
# Embarked #AFEEEE

fig05 <- ggplot(voyages) + 
  geom_col(aes(x = Year, y = Embarked, color = "Embarked", fill = "Embarked")) +
  geom_col(aes(x = Year, y = Disembarked, color = "Disembarked", fill = "Disembarked")) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.1)), breaks = seq(0, 130000, 20000),
                     labels = scales::label_number_si()) +
  scale_x_continuous(expand = expansion(mult = c(0, 0.1)), 
                     breaks = seq(1500, 1875, 50), limits = c(1499, NA), position = "top") +
  labs(title = " ",
       y = "",
       x = "") + 
  scale_fill_manual("", values = c("Embarked" = "#AFEEEE", "Disembarked" = "#008080"), guide = guide_legend(reverse = TRUE)) +
  scale_color_manual("", values = c("Embarked" = "#AFEEEE", "Disembarked" = "#008080")) +
  guides(color = FALSE) +
  theme_bw() +
  theme(panel.grid.minor = element_blank(),
        panel.grid = element_line(color = "grey"),
        panel.border = element_blank(),
        axis.line.y = element_blank(),
        axis.ticks = element_line(color = "grey"),
        axis.line = element_line(color = "grey"),
        plot.margin=unit(c(1,1,1.5,1.2),"cm"),
        plot.title.position = "plot",
        plot.title = element_text(face = "bold", size = 10),
        legend.position = "bottom",
        legend.justification = "left",
        legend.key.width = unit(0.35, "cm"),
        legend.key.height = unit(0.25, "cm"))

ggsave(here::here("slave-voyage", "05_legend_unmasked.png"), fig05)

## FIGURE 6: FULLY UNMASKED

# Disembarked #008080
# Embarked #AFEEEE

fig06 <- ggplot(voyages) + 
  geom_col(aes(x = Year, y = Embarked, color = "Embarked", fill = "Embarked")) +
  geom_col(aes(x = Year, y = Disembarked, color = "Disembarked", fill = "Disembarked")) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.1)), breaks = seq(0, 130000, 20000),
                     labels = scales::label_number_si()) +
  scale_x_continuous(expand = expansion(mult = c(0, 0.1)), 
                     breaks = seq(1500, 1875, 50), limits = c(1499, NA), position = "top") +
  labs(title = "Timeline: Number of Captives Embarked and Disembarked per Year",
       y = "",
       x = "") + 
  scale_fill_manual("", values = c("Embarked" = "#AFEEEE", "Disembarked" = "#008080"), guide = guide_legend(reverse = TRUE)) +
  scale_color_manual("", values = c("Embarked" = "#AFEEEE", "Disembarked" = "#008080")) +
  guides(color = FALSE) +
  theme_bw() +
  theme(panel.grid.minor = element_blank(),
        panel.grid = element_line(color = "grey"),
        panel.border = element_blank(),
        axis.line.y = element_blank(),
        axis.ticks = element_line(color = "grey"),
        axis.line = element_line(color = "grey"),
        plot.margin=unit(c(1,1,1.5,1.2),"cm"),
        plot.title.position = "plot",
        plot.title = element_text(face = "bold", size = 10),
        legend.position = "bottom",
        legend.justification = "left",
        legend.key.width = unit(0.35, "cm"),
        legend.key.height = unit(0.25, "cm"))

ggsave(here::here("slave-voyage", "06_full_unmasked.png"), fig06)

