#
# FILE:
#  imports_exports.R
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
library(scales)
library(grid)
library(ggrepel)

#reading data in
import <- read_xlsx(here::here("imports-exports","imports_data.xlsx"))

df <- subset(import, Year == 2018)

## FIGURE 5: RECREATED IMPORTS GRAPHIC

#creating the imports graph

fig05 <- ggplot(import, aes(x = Year, y = Amount/1000000000, group = GoodType, color = GoodType)) + 
  geom_line(linewidth = 1.5) + 
  scale_color_manual(values = c("#249fdc", "#00905b", "#082c51", "#e40981", "#015193", "#9b1860", "#66c6ac")) +
  scale_y_continuous(breaks = seq(0, 800, 200),
                     labels = dollar_format(prefix="$", suffix = "B")) +
  scale_x_continuous(limits = c(1999,2018), expand = c(0,0)) +
  labs(title = "Imports", subtitle = "Imported goods by type", 
       y = " ", x = " ") + 
  geom_label_repel(data = import %>% filter(Year == last(Year)), 
                   aes(label = str_wrap(GoodType, width = 23,  exdent = 0)), 
                   label.size = NA, hjust = 0, nudge_x = .5, nudge_y = 1.5, xlim = c(2018, 2030),
                   min.segment.length = Inf, fontface = "bold", box.padding = 0,
                   size = 3, force = 0.25) + 
  theme_bw() + 
  theme(panel.border = element_blank()) + 
  theme(panel.grid.minor = element_blank()) + 
  theme(panel.grid.major.x = element_blank()) + 
  theme(axis.ticks = element_blank()) + 
  theme(plot.title = element_text(hjust = -0.105, face = "bold"),
        plot.subtitle = element_text(hjust = -0.13, color = "#4c4c4c")) + 
  theme(legend.position = "none") +
  theme(plot.margin = margin(10, 150, 10, 30)) +
  coord_cartesian(clip = 'off')

ggsave(here::here("imports-exports", "05_imports_full_unmasked.png"))

## FIGURE 10: RECREATED EXPORTS GRAPHIC

#creating the exports graph

export <- read_xlsx(here::here("imports-exports","exports_data.xlsx"))

df1 <- subset(export, Year == 2018)

fig10 <- ggplot(export, aes(x = Year, y = Amount/1000000000, group = GoodType, color = GoodType)) + 
  geom_line(linewidth = 1.5) + 
  scale_color_manual(values = c("#249fdc", "#00905b", "#082c51", "#e40981", "#015193", "#9b1860", "#66c6ac")) +
  scale_y_continuous(limits = c(0, 600), breaks = c(0, 200, 400, 600), labels = dollar_format(prefix="$", suffix = "B")) +
  scale_x_continuous(limits = c(1999,2018), expand = c(0,0)) +
  labs(title = "Exports", subtitle = "Exported goods by type", 
       y = " ", x = " ") + 
  geom_label_repel(data = export %>% filter(Year == last(Year)), 
                   aes(label = str_wrap(GoodType, width = 23,  exdent = 0)), 
                   label.size = NA, hjust = 0, nudge_x = .5, nudge_y = -5, xlim = c(2018, 2030),
                   min.segment.length = Inf, fontface = "bold", box.padding = 0,
                   size = 3, force = 0.03, label.padding = 0.17) +
  theme_bw() +
  theme(panel.border = element_blank()) + 
  theme(panel.grid.minor = element_blank()) + 
  theme(panel.grid.major.x = element_blank()) + 
  theme(axis.ticks = element_blank()) + 
  theme(plot.title = element_text(hjust = -0.105, face = "bold"),
        plot.subtitle = element_text(hjust = -0.13, color = "#4c4c4c")) + 
  theme(legend.position = "none") + 
  theme(plot.margin = margin(10, 150, 10, 30)) +
  coord_cartesian(clip = 'off')

ggsave(here::here("imports-exports", "10_exports_full_unmasked.png"))

## FIGURE 1: MASKED IMPORTS

#concealing everything on imports graph

fig01 <- ggplot(import, aes(x = Year, y = Amount/1000000000, group = GoodType, color = GoodType)) + 
  geom_line(linewidth = 1.5) + 
  scale_color_manual(values = c("#249fdc", "#00905b", "#082c51", "#e40981", "#015193", "#9b1860", "#66c6ac")) +
  scale_y_continuous(breaks = seq(0, 800, 200),
                     labels = dollar_format(prefix="$", suffix = "B")) +
  scale_x_continuous(limits = c(1999,2018), expand = c(0,0)) +
  labs(title = " ", subtitle = " ", 
       y = " ", x = " ") + 
  #geom_label_repel(data = import %>% filter(Year == last(Year)), 
                   #aes(label = str_wrap(GoodType, width = 23,  exdent = 0)), 
                   #label.size = NA, hjust = 0, nudge_x = .5, nudge_y = 1.5, xlim = c(2018, 2030),
                   #min.segment.length = Inf, fontface = "bold", box.padding = 0,
                   #size = 3, force = 0.25) + 
  theme_bw() + 
  theme(panel.border = element_blank()) + 
  theme(panel.grid.minor = element_blank()) + 
  theme(panel.grid.major.x = element_blank()) + 
  theme(axis.ticks = element_blank()) + 
  theme(plot.title = element_blank(),
        plot.subtitle = element_blank()) + 
  theme(legend.position = "none") + 
  theme(plot.margin = margin(10, 150, 10, 30)) +
  theme(axis.text = element_blank()) + 
  coord_cartesian(clip = 'off')

ggsave(here::here("imports-exports", "01_imports_full_masked.png"), fig01)

## FIGURE 6: FULLY MASKED EXPORTS GRAPH

#concealing everything on exports graph

fig06 <- ggplot(export, aes(x = Year, y = Amount/1000000000, group = GoodType, color = GoodType)) + 
  geom_line(linewidth = 1.5) + 
  scale_color_manual(values = c("#249fdc", "#00905b", "#082c51", "#e40981", "#015193", "#9b1860", "#66c6ac")) +
  scale_y_continuous(limits = c(0, 600), breaks = c(0, 200, 400, 600), labels = dollar_format(prefix="$", suffix = "B")) +
  scale_x_continuous(limits = c(1999,2018), expand = c(0,0)) +
  labs(title = " ", subtitle = " ", 
       y = " ", x = " ") + 
  #geom_label_repel(data = export %>% filter(Year == last(Year)), 
                   #aes(label = str_wrap(GoodType, width = 23,  exdent = 0)), 
                   #label.size = NA, hjust = 0, nudge_x = .5, nudge_y = -5, xlim = c(2018, 2030),
                   #min.segment.length = Inf, fontface = "bold", box.padding = 0,
                   #size = 3, force = 0.03, label.padding = 0.17) +
  theme_bw() +
  theme(panel.border = element_blank()) + 
  theme(panel.grid.minor = element_blank()) + 
  theme(panel.grid.major.x = element_blank()) + 
  theme(axis.ticks = element_blank()) + 
  theme(plot.title = element_blank(),
        plot.subtitle = element_blank()) + 
  theme(legend.position = "none") + 
  theme(axis.text = element_blank()) + 
  theme(plot.margin = margin(10, 150, 10, 30)) +
  coord_cartesian(clip = 'off')

ggsave(here::here("imports-exports", "06_exports_full_masked.png"), fig06)

## FIGURE 2: IMPORTS Y AXIS REVEALED

#revealing y axis on imports graph

fig02 <- ggplot(import, aes(x = Year, y = Amount/1000000000, group = GoodType, color = GoodType)) + 
  geom_line(linewidth = 1.5) + 
  scale_color_manual(values = c("#249fdc", "#00905b", "#082c51", "#e40981", "#015193", "#9b1860", "#66c6ac")) +
  scale_y_continuous(breaks = seq(0, 800, 200),
                     labels = dollar_format(prefix="$", suffix = "B")) +
  scale_x_continuous(limits = c(1999,2018), expand = c(0,0)) +
  labs(title = " ", subtitle = " ", 
       y = " ", x = " ") + 
  #geom_label_repel(data = import %>% filter(Year == last(Year)), 
                   #aes(label = str_wrap(GoodType, width = 23,  exdent = 0)), 
                   #label.size = NA, hjust = 0, nudge_x = .5, nudge_y = 1.5, xlim = c(2018, 2030),
                   #min.segment.length = Inf, fontface = "bold", box.padding = 0,
                   #size = 3, force = 0.25) + 
  theme_bw() + 
  theme(panel.border = element_blank()) + 
  theme(panel.grid.minor = element_blank()) + 
  theme(panel.grid.major.x = element_blank()) + 
  theme(axis.ticks = element_blank()) + 
  theme(plot.title = element_blank(),
        plot.subtitle = element_blank()) + 
  theme(legend.position = "none") + 
  theme(axis.text.x = element_blank()) + 
  theme(plot.margin = margin(10, 150, 10, 30)) +
  coord_cartesian(clip = 'off')

ggsave(here::here("imports-exports", "02_imports_yaxis_unmasked.png"), fig02)

## FIGURE 7: EXPORTS Y AXIS REVEALED

#revealing y axis on exports graph

fig07 <- ggplot(export, aes(x = Year, y = Amount/1000000000, group = GoodType, color = GoodType)) + 
  geom_line(linewidth = 1.5) + 
  scale_color_manual(values = c("#249fdc", "#00905b", "#082c51", "#e40981", "#015193", "#9b1860", "#66c6ac")) +
  scale_y_continuous(limits = c(0, 600), breaks = c(0, 200, 400, 600), labels = dollar_format(prefix="$", suffix = "B")) +
  scale_x_continuous(limits = c(1999,2018), expand = c(0,0)) +
  labs(title = " ", subtitle = " ", 
       y = " ", x = " ") + 
  #geom_label_repel(data = export %>% filter(Year == last(Year)), 
                   #aes(label = str_wrap(GoodType, width = 23,  exdent = 0)), 
                   #label.size = NA, hjust = 0, nudge_x = .5, nudge_y = -5, xlim = c(2018, 2030),
                   #min.segment.length = Inf, fontface = "bold", box.padding = 0,
                   #size = 3, force = 0.03, label.padding = 0.17) +
  theme_bw() +
  theme(panel.border = element_blank()) + 
  theme(panel.grid.minor = element_blank()) + 
  theme(panel.grid.major.x = element_blank()) + 
  theme(axis.ticks = element_blank()) + 
  theme(plot.title = element_blank(),
        plot.subtitle = element_blank()) + 
  theme(legend.position = "none") + 
  theme(axis.text.x = element_blank()) + 
  theme(plot.margin = margin(10, 150, 10, 30)) +
  coord_cartesian(clip = 'off')

ggsave(here::here("imports-exports", "07_exports_yaxis_unmasked.png"), fig07)

## FIGURE 3: IMPORTS X AXIS REVEALED

#revealing x and y axis on imports graph


fig03 <- ggplot(import, aes(x = Year, y = Amount/1000000000, group = GoodType, color = GoodType)) + 
  geom_line(linewidth = 1.5) + 
  scale_color_manual(values = c("#249fdc", "#00905b", "#082c51", "#e40981", "#015193", "#9b1860", "#66c6ac")) +
  scale_y_continuous(breaks = seq(0, 800, 200),
                     labels = dollar_format(prefix="$", suffix = "B")) +
  scale_x_continuous(limits = c(1999,2018), expand = c(0,0)) +
  labs(title = " ", subtitle = " ", 
       y = " ", x = " ") + 
  #geom_label_repel(data = import %>% filter(Year == last(Year)), 
                   #aes(label = str_wrap(GoodType, width = 23,  exdent = 0)), 
                   #label.size = NA, hjust = 0, nudge_x = .5, nudge_y = 1.5, xlim = c(2018, 2030),
                   #min.segment.length = Inf, fontface = "bold", box.padding = 0,
                   #size = 3, force = 0.25) + 
  theme_bw() + 
  theme(panel.border = element_blank()) + 
  theme(panel.grid.minor = element_blank()) + 
  theme(panel.grid.major.x = element_blank()) + 
  theme(axis.ticks = element_blank()) + 
  theme(plot.title = element_blank(),
        plot.subtitle = element_blank()) + 
  theme(legend.position = "none") + 
  theme(plot.margin = margin(10, 150, 10, 30)) +
  coord_cartesian(clip = 'off')

ggsave(here::here("imports-exports", "03_imports_xaxis_unmasked.png"), fig03)

## FIGURE 8: EXPORTS Y AXIS REVEALED

#revealing x and y axis on exports graph


fig08 <- ggplot(export, aes(x = Year, y = Amount/1000000000, group = GoodType, color = GoodType)) + 
  geom_line(linewidth = 1.5) + 
  scale_color_manual(values = c("#249fdc", "#00905b", "#082c51", "#e40981", "#015193", "#9b1860", "#66c6ac")) +
  scale_y_continuous(limits = c(0, 600), breaks = c(0, 200, 400, 600), labels = dollar_format(prefix="$", suffix = "B")) +
  scale_x_continuous(limits = c(1999,2018), expand = c(0,0)) +
  labs(title = " ", subtitle = " ", 
       y = " ", x = " ") + 
  #geom_label_repel(data = export %>% filter(Year == last(Year)), 
                   #aes(label = str_wrap(GoodType, width = 23,  exdent = 0)), 
                   #label.size = NA, hjust = 0, nudge_x = .5, nudge_y = -5, xlim = c(2018, 2030),
                   #min.segment.length = Inf, fontface = "bold", box.padding = 0,
                   #size = 3, force = 0.03, label.padding = 0.17) +
  theme_bw() +
  theme(panel.border = element_blank()) + 
  theme(panel.grid.minor = element_blank()) + 
  theme(panel.grid.major.x = element_blank()) + 
  theme(axis.ticks = element_blank()) + 
  theme(plot.title = element_blank(),
        plot.subtitle = element_blank()) + 
  theme(legend.position = "none") + 
  theme(plot.margin = margin(10, 150, 10, 30)) +
  coord_cartesian(clip = 'off')

ggsave(here::here("imports-exports", "08_exports_xaxis_unmasked.png"), fig08)

## FIGURE 4: IMPORTS LABELS REVEALED

#revealing line labels on import graph

fig04 <- ggplot(import, aes(x = Year, y = Amount/1000000000, group = GoodType, color = GoodType)) + 
  geom_line(linewidth = 1.5) + 
  scale_color_manual(values = c("#249fdc", "#00905b", "#082c51", "#e40981", "#015193", "#9b1860", "#66c6ac")) +
  scale_y_continuous(breaks = seq(0, 800, 200),
                     labels = dollar_format(prefix="$", suffix = "B")) +
  scale_x_continuous(limits = c(1999,2018), expand = c(0,0)) +
  labs(title = "Imports", subtitle = "Imported goods by type", 
       y = " ", x = " ") + 
  geom_label_repel(data = import %>% filter(Year == last(Year)), 
                   aes(label = str_wrap(GoodType, width = 23,  exdent = 0)), 
                   label.size = NA, hjust = 0, nudge_x = .5, nudge_y = 1.5, xlim = c(2018, 2030),
                   min.segment.length = Inf, fontface = "bold", box.padding = 0,
                   size = 3, force = 0.25) + 
  theme_bw() + 
  theme(panel.border = element_blank()) + 
  theme(panel.grid.minor = element_blank()) + 
  theme(panel.grid.major.x = element_blank()) + 
  theme(axis.ticks = element_blank()) + 
  theme(plot.title = element_blank(),
        plot.subtitle = element_blank()) + 
  theme(legend.position = "none") + 
  theme(plot.margin = margin(10, 150, 10, 30)) +
  coord_cartesian(clip = 'off')

ggsave(here::here("imports-exports", "04_imports_labels_unmasked.png"), fig04)

## FIGURE 9: EXPORTS LABELS REVEALED

#revealing line labels on export graph


fig09 <- ggplot(export, aes(x = Year, y = Amount/1000000000, group = GoodType, color = GoodType)) + 
  geom_line(linewidth = 1.5) + 
  scale_color_manual(values = c("#249fdc", "#00905b", "#082c51", "#e40981", "#015193", "#9b1860", "#66c6ac")) +
  scale_y_continuous(limits = c(0, 600), breaks = c(0, 200, 400, 600), labels = dollar_format(prefix="$", suffix = "B")) +
  scale_x_continuous(limits = c(1999,2018), expand = c(0,0)) +
  labs(title = "Exports", subtitle = "Exported goods by type", 
       y = " ", x = " ") + 
  geom_label_repel(data = export %>% filter(Year == last(Year)), 
                   aes(label = str_wrap(GoodType, width = 23,  exdent = 0)), 
                   label.size = NA, hjust = 0, nudge_x = .5, nudge_y = -5, xlim = c(2018, 2030),
                   min.segment.length = Inf, fontface = "bold", box.padding = 0,
                   size = 3, force = 0.03, label.padding = 0.17) +
  theme_bw() +
  theme(panel.border = element_blank()) + 
  theme(panel.grid.minor = element_blank()) + 
  theme(panel.grid.major.x = element_blank()) + 
  theme(axis.ticks = element_blank()) + 
  theme(plot.title = element_blank(),
        plot.subtitle = element_blank()) + 
  theme(legend.position = "none") + 
  theme(plot.margin = margin(10, 150, 10, 30)) +
  coord_cartesian(clip = 'off')

ggsave(here::here("imports-exports", "09_exports_labels_unmasked.png"), fig09)
