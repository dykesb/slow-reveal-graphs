library(tidyverse)
library(readxl)
library(scales)
library(grid)
library(ggrepel)

#reading data in
import <- read_xlsx(here::here("Everything","Imports_Exports","USImportsData.xlsx"))

df <- subset(import, Year == 2018)

################# Part 1 #################

#creating the imports graph

ggplot(import, aes(x = Year, y = Amount/1000000000, group = GoodType, color = GoodType)) + 
  geom_line(size = 1.5) + 
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
  theme(plot.margin = margin(10, 150, 10, 5)) +
  coord_cartesian(clip = 'off')

#creating the exports graph

export <- read_xlsx(here::here("Imports_Exports","ExportData.xlsx"))

df1 <- subset(export, Year == 2018)

ggplot(export, aes(x = Year, y = Amount/1000000000, group = GoodType, color = GoodType)) + 
  geom_line(size = 1.5) + 
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
  theme(plot.margin = margin(10, 150, 10, 5)) +
  coord_cartesian(clip = 'off')

################# Part 2 #################

#concealing everything on imports graph

ggplot(import, aes(x = Year, y = Amount/1000000000, group = GoodType, color = GoodType)) + 
  geom_line(size = 1.5) + 
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
  theme(plot.margin = margin(10, 150, 10, 5)) +
  theme(axis.text = element_blank()) + 
  coord_cartesian(clip = 'off')

#concealing everything on exports graph

ggplot(export, aes(x = Year, y = Amount/1000000000, group = GoodType, color = GoodType)) + 
  geom_line(size = 1.5) + 
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
  theme(plot.margin = margin(10, 150, 10, 5)) +
  coord_cartesian(clip = 'off')

################# Part 3 #################

#revealing y axis on imports graph

ggplot(import, aes(x = Year, y = Amount/1000000000, group = GoodType, color = GoodType)) + 
  geom_line(size = 1.5) + 
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
  theme(plot.margin = margin(10, 150, 10, 5)) +
  coord_cartesian(clip = 'off')

#revealing y axis on exports graph

export <- read_xlsx(here::here("Imports_Exports","ExportData.xlsx"))

df1 <- subset(export, Year == 2018)

ggplot(export, aes(x = Year, y = Amount/1000000000, group = GoodType, color = GoodType)) + 
  geom_line(size = 1.5) + 
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
  theme(plot.margin = margin(10, 150, 10, 5)) +
  coord_cartesian(clip = 'off')

################# Part 4 #################

#revealing x and y axis on imports graph

ggplot(import, aes(x = Year, y = Amount/1000000000, group = GoodType, color = GoodType)) + 
  geom_line(size = 1.5) + 
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
  theme(plot.margin = margin(10, 150, 10, 5)) +
  coord_cartesian(clip = 'off')

#revealing x and y axis on exports graph


ggplot(export, aes(x = Year, y = Amount/1000000000, group = GoodType, color = GoodType)) + 
  geom_line(size = 1.5) + 
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
  theme(plot.margin = margin(10, 150, 10, 5)) +
  coord_cartesian(clip = 'off')

################# Part 5 #################

#revealing line labels on import graph

ggplot(import, aes(x = Year, y = Amount/1000000000, group = GoodType, color = GoodType)) + 
  geom_line(size = 1.5) + 
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
  theme(plot.margin = margin(10, 150, 10, 5)) +
  coord_cartesian(clip = 'off')

#revealing line labels on export graph


ggplot(export, aes(x = Year, y = Amount/1000000000, group = GoodType, color = GoodType)) + 
  geom_line(size = 1.5) + 
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
  theme(plot.margin = margin(10, 150, 10, 5)) +
  coord_cartesian(clip = 'off')
