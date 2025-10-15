#
# FILE:
# 1890_total_pop_elements.R
#
# DESCRIPTION
# 34. The total population and its elements at each census: 1790 to 1890
# https://www.loc.gov/resource/g3701gm.gct00010/?sp=32&r=-0.224,0.078,0.91,0.429,0
#
#
# AUTHORS:
#   Alex Gichuki (main code)
# Ian Curtis (2023, code to save plots)


# setup
library(ggplot2)
library(tidyverse)
library(showtext)
library(cowplot)
library(ggpubr)
library(scales)

# Required fonts
font_add_google("Dynalight", "Dynalight")
font_add_google("Puritan", "Puritan")
showtext_auto()

# Setting global colors

## Color Set 2
color1 <- "#E5B97A"
color2 <- "#DB9B6B"
color3 <- "#8E8B62"
color4 <- "#A17F63"
color5 <- "#E5B890"

# Creating a filler plot for when the legends need to be masked
filler_plotDF <- data.frame(group = c("", ""),
                        xmin = c(1.7, 3.1),
                        xmax = c(2.1,3.5),
                        ymin = c(0.6,0.6),
                        ymax = c(0.65,0.65))


filler_plot <- ggplot(filler_plotDF, aes(x = NULL, y = NULL, xmin = xmin, xmax = xmax, 
                                 ymin = ymin, ymax = ymax, fill = group)) +
  geom_rect(color = "#EFD8AF") +
  xlim(-2, 6) +
  ylim(0.5,0.72) +
  scale_fill_manual(values = c("#EFD8AF", "#EFD8AF")) +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank()) +
  theme(legend.position = "none",
        plot.background = element_rect(fill = "#EFD8AF", color = "#EFD8AF"))

# creating the data for row 1
data1 <- data.frame(group = LETTERS[1:2],
                    value =c(20, 80),
                    labels = c("4", "5")
)

# Computing the position of labels
data1 <- data1 |>
  arrange(desc(group)) |>
  mutate(prop = value / sum(data1$value) *100) |>
  mutate(ypos = cumsum(prop)- 0.5*prop )


# creating the data for 1850
data1850 <- data.frame(group = LETTERS[1:3],
                    value =c(57.29, 267.81,  34.8),
                    labels = c("4", "5", "3")
)

# Computing the position of labels
data1850 <- data1850 |>
  arrange(desc(group)) |>
  mutate(prop = value / sum(data1$value) *100) |>
  mutate(ypos = cumsum(prop)- 0.5*prop )


# creating the data for 1860
data1860 <- data.frame(group = LETTERS[1:3],
                       value =c(50.62, 260.23, 49.15),
                       labels = c("4", "5", "3")
)

# Computing the position of labels
data1860 <- data1860 |>
  arrange(desc(group)) |>
  mutate(prop = value / sum(data1$value) *100) |>
  mutate(ypos = cumsum(prop)- 0.5*prop )


# creating the data for 1870
data1870 <- data.frame(group = LETTERS[1:4],
                       value =c(45.74, 260.23, 46.07, 51.45),
                       labels = c("4", "1", "2", "3")
)

# Computing the position of labels
data1870 <- data1870 |>
  arrange(desc(group)) |>
  mutate(prop = value / sum(data1$value) *100) |>
  mutate(ypos = cumsum(prop)- 0.5*prop )


# creating the data for 1880
data1880 <- data.frame(group = LETTERS[1:4],
                       value =c(48.64, 204.13, 58.26, 48.97),
                       labels = c("4", "1", "2", "3")
)

# Computing the position of labels
data1880 <- data1880 |>
  arrange(desc(group)) |>
  mutate(prop = value / sum(data1$value) *100) |>
  mutate(ypos = cumsum(prop)- 0.5*prop )


# creating the data for 1890
data1890 <- data.frame(group = LETTERS[1:4],
                       value =c(43.65, 198.32, 65.71, 52.32),
                       labels = c("4", "1", "2", "3")
)

# Computing the position of labels
data1890 <- data1890 |>
  arrange(desc(group)) |>
  mutate(prop = value / sum(data1$value) *100) |>
  mutate(ypos = cumsum(prop)- 0.5*prop )


# 1790 Pie chart 
chart1790 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1790"), family = "Puritan", size = 7) +
  geom_text(aes(y = ypos, label = labels), color = "black", size = 7) +
  scale_fill_manual(values = c(color4, color5)) 



# 1800 pie chart
chart1800 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1800"), family = "Puritan", size = 7) +
  geom_text(aes(y = ypos, label = labels), color = "black", size = 7) +
  scale_fill_manual(values = c(color4, color5)) 




# 1810 pie chart
chart1810 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1810"), family = "Puritan", size = 7) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color5)) 



# 1820 pie chart
chart1820 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1820"), family = "Puritan", size = 7) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color5)) 


# 1830 pie chart
chart1830 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1830"), family = "Puritan", size = 7) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color5)) 

# 1840 pie chart
chart1840 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1840"), family = "Puritan", size = 7) +
  geom_text(aes(y = ypos, label = labels), color = "black", size = 7) +
  scale_fill_manual(values = c(color4, color5))


# 1850 Pie chart 
chart1850 <- ggplot(data1850, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1850"), family = "Puritan", size = 7) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4,color5, color3)) 
  #theme(plot.margin = margin(4, 4, 4, 4, "cm"))

# 1860 Pie chart 
chart1860 <- ggplot(data1860, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1860"), family = "Puritan", size = 7) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4,color5, color3)) 
  #theme(plot.margin = margin(4, 4, 4, 4, "cm"))

# 1870 Pie chart 
chart1870 <- ggplot(data1870, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1870"), family = "Puritan", size = 7) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color1,color2, color3)) 



# 1880 Pie chart 
chart1880 <- ggplot(data1880, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1880"), family = "Puritan", size = 7) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color1,color2, color3)) 
 

# 1890 Pie chart 
chart1890 <- ggplot(data1890, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1890"), family = "Puritan", size = 7) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color1,color2, color3)) 


# Combining the charts and creating custom legends
# merging the plots from 1790 to 1840
row1 <- ggarrange(chart1790, chart1800, chart1810, chart1820, chart1830, chart1840,
          ncol = 6, nrow = 1,
          heights = c(2.6,3.3,3.9,4.7,5.4,6),
          widths = c(2.6,3.3,3.9,4.7,5.4,6))
row1

# Creating a custom legend for 1790 to 1840 pie charts
legend1DF <- data.frame(group = c("A", "B"),
                        xmin = c(1.7, 3.1),
                        xmax = c(2.1,3.5),
                        ymin = c(0.6,0.6),
                        ymax = c(0.65,0.65))


legend1 <- ggplot(legend1DF, aes(x = NULL, y = NULL, xmin = xmin, xmax = xmax, 
                      ymin = ymin, ymax = ymax, fill = group)) +
  geom_rect(color = "black") +
  xlim(-2, 6) +
  ylim(0.5,0.72) +
  scale_fill_manual(values = c(color5, color4)) +
  annotate("text", x = 0.9, y = 0.625, label = "1790 TO 1840 - WHITE", family = "Puritan", size = 8.5) +
  annotate("text", x = 2.7, y = 0.625, label = "COLORED", family = "Puritan", size = 8.5) + 
  annotate("text", x = 3.3, y = 0.625, label = "4", family = "Puritan", size = 6) +
  annotate("text", x = 1.9, y = 0.625, label = "5", family = "Puritan", size = 6) +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank()) +
  theme(legend.position = "none",
        plot.background = element_rect(fill = "#EFD8AF", color = "#EFD8AF"))


# merging the plots from 1850 to 1870
row3 <- ggarrange(chart1850, chart1860, chart1870,
          ncol = 3, nrow = 1,
          heights = c(6,7,8.5),
          widths = c(6,7,8.5))



# Creating a custom legend for 1870 to 1890 pie charts
legend2DF <- data.frame(group = c("A", "B", "C", "D", "E"),
                        xmin = c(1.575, 1.575, 1.575, 1.575, 1.575),
                        xmax = c(1.625, 1.625, 1.625, 1.625, 1.625),
                        ymin = c(0.6, 1.6, 2.6, 3.6, 4.6),
                        ymax = c(1.1, 2.1, 3.1, 4.1, 5.1))


legend2 <- ggplot(legend2DF, aes(x = NULL, y = NULL, xmin = xmin, xmax = xmax, 
                                 ymin = ymin, ymax = ymax, fill = group)) +
  geom_rect(color = "black") +
  xlim(0.5,2.4) +
  ylim(0,5.5) +
  scale_fill_manual(values = c(color5, color4,color3,color2, color1)) +
  annotate("text", x = 1.2, y = 4.85, label = "NATIVE OF NATIVE PARENTS", family = "Puritan", size =8.5) +
  annotate("text", x = 1.2, y = 3.85, label = "NATIVE OF FOREIGN PARENTS", family = "Puritan", size =8.5) + 
  annotate("text", x = 1.2, y = 2.85, label = "FOREIGN WHITE", family = "Puritan", size = 8.5) +
  annotate("text", x = 1.2, y = 1.85, label = "COLORED", family = "Puritan", size = 8.5) +
  annotate("text", x = 1.2, y = 0.85, label = "NATIVE WHITE", family = "Puritan", size = 8.5) +
  annotate("text", x = 1.6, y = 4.85, label = "1", family = "Puritan", size = 6) +
  annotate("text", x = 1.6, y = 3.85, label = "2", family = "Puritan", size = 6) +
  annotate("text", x = 1.6, y = 2.85, label = "3", family = "Puritan", size = 6) +
  annotate("text", x = 1.6, y = 1.85, label = "4", family = "Puritan", size = 6) +
  annotate("text", x = 1.6, y = 0.85, label = "5", family = "Puritan", size = 6) +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank()) +
  theme(legend.position = "none",
        plot.background = element_rect(fill = "#EFD8AF", color = "#EFD8AF"))


# merging the plots from 1880 to 1890
row5 <- ggarrange(chart1880, chart1890,
          ncol = 2, nrow = 1,
          heights = c(9.9, 11.3),
          widths = c(9.9, 11.3))

# Adding a title to the plot

title <- text_grob("34: THE TOTAL POPULATION AND ITS ELEMENTS AT EACH CENSUS:1790 TO 1890.",
                   family = "Puritan", face = "bold", size = 27)


# Combining all of them
CombinedPlot <- ggarrange(title, row1, legend1, row3, legend2, row5,
          ncol = 1, nrow = 6,
          widths = c(1, 1.5, 0.5, 1.9, 0.5, 1.9),
          heights = c(0.5, 1.5, 1, 1.9, 1, 1.9)) +
  theme(plot.background = element_rect(fill = "#EFD8AF", color = "#EFD8AF"))
 

# 01: Fully unmasked

# Saving the plot with custom dimensions

png(here::here("Slow Reveal Recreations", "1890-34-total-pop-elements", "recreated-imgs", "01_full_unmasked.png"),
    width = 1800,
    height = 2400)

CombinedPlot

dev.off()

# 02: Fully Masked

# 1790 Pie chart 
chart1790 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = ""), family = "Puritan", size = 7) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size = 7) +
  scale_fill_manual(values = c(color4, color5)) 



# 1800 pie chart
chart1800 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = ""), family = "Puritan", size = 7) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size = 7) +
  scale_fill_manual(values = c(color4, color5)) 




# 1810 pie chart
chart1810 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = ""), family = "Puritan", size = 7) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color5)) 



# 1820 pie chart
chart1820 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = ""), family = "Puritan", size = 7) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color5)) 


# 1830 pie chart
chart1830 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = ""), family = "Puritan", size = 7) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color5)) 

# 1840 pie chart
chart1840 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = ""), family = "Puritan", size = 7) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size = 7) +
  scale_fill_manual(values = c(color4, color5))

# 1850 Pie chart 
chart1850 <- ggplot(data1850, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = ""), family = "Puritan", size = 7) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4,color5, color3)) 
#theme(plot.margin = margin(4, 4, 4, 4, "cm"))

# 1860 Pie chart 
chart1860 <- ggplot(data1860, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = ""), family = "Puritan", size = 7) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4,color5, color3)) 
#theme(plot.margin = margin(4, 4, 4, 4, "cm"))

# 1870 Pie chart 
chart1870 <- ggplot(data1870, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = ""), family = "Puritan", size = 7) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color1,color2, color3)) 

# 1880 Pie chart 
chart1880 <- ggplot(data1880, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = ""), family = "Puritan", size = 7) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color1,color2, color3)) 


# 1890 Pie chart 
chart1890 <- ggplot(data1890, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = ""), family = "Puritan", size = 7) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color1,color2, color3)) 


# Combining the charts and creating custom legends
# merging the plots from 1790 to 1840
row1 <- ggarrange(chart1790, chart1800, chart1810, chart1820, chart1830, chart1840,
                  ncol = 6, nrow = 1,
                  heights = c(2.6,3.3,3.9,4.7,5.4,6),
                  widths = c(2.6,3.3,3.9,4.7,5.4,6))
row1


# merging the plots from 1850 to 1870
row3 <- ggarrange(chart1850, chart1860, chart1870,
                  ncol = 3, nrow = 1,
                  heights = c(6,7,8.5),
                  widths = c(6,7,8.5))


# merging the plots from 1880 to 1890
row5 <- ggarrange(chart1880, chart1890,
                  ncol = 2, nrow = 1,
                  heights = c(9.9, 11.3),
                  widths = c(9.9, 11.3))

# Adding a title to the plot

title <- text_grob("",
                   family = "Puritan", face = "bold", size = 27)


# Combining all of them
CombinedPlot <- ggarrange(title, row1, filler_plot, row3, filler_plot, row5,
                          ncol = 1, nrow = 6,
                          widths = c(1, 1.5, 0.5, 1.9, 0.5, 1.9),
                          heights = c(0.5, 1.5, 1, 1.9, 1, 1.9)) +
  theme(plot.background = element_rect(fill = "#EFD8AF", color = "#EFD8AF"))


# Saving the plot with custom dimensions

png(here::here("Slow Reveal Recreations", "1890-34-total-pop-elements", "recreated-imgs", "02_full_masked.png"),
    width = 1800,
    height = 2400)

CombinedPlot

dev.off()

# 03: Years Added

# 1790 Pie chart 
chart1790 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1790"), family = "Puritan", size = 7) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size = 7) +
  scale_fill_manual(values = c(color4, color5)) 



# 1800 pie chart
chart1800 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1800"), family = "Puritan", size = 7) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size = 7) +
  scale_fill_manual(values = c(color4, color5)) 




# 1810 pie chart
chart1810 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1810"), family = "Puritan", size = 7) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color5)) 



# 1820 pie chart
chart1820 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1820"), family = "Puritan", size = 7) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color5)) 


# 1830 pie chart
chart1830 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1830"), family = "Puritan", size = 7) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color5)) 

# 1840 pie chart
chart1840 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1840"), family = "Puritan", size = 7) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size = 7) +
  scale_fill_manual(values = c(color4, color5))

# 1850 Pie chart 
chart1850 <- ggplot(data1850, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1850"), family = "Puritan", size = 7) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4,color5, color3)) 
#theme(plot.margin = margin(4, 4, 4, 4, "cm"))

# 1860 Pie chart 
chart1860 <- ggplot(data1860, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1860"), family = "Puritan", size = 7) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4,color5, color3)) 
#theme(plot.margin = margin(4, 4, 4, 4, "cm"))

# 1870 Pie chart 
chart1870 <- ggplot(data1870, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1870"), family = "Puritan", size = 7) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color1,color2, color3)) 

# 1880 Pie chart 
chart1880 <- ggplot(data1880, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1880"), family = "Puritan", size = 7) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color1,color2, color3)) 


# 1890 Pie chart 
chart1890 <- ggplot(data1890, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1890"), family = "Puritan", size = 7) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color1,color2, color3)) 


# Combining the charts and creating custom legends
# merging the plots from 1790 to 1840
row1 <- ggarrange(chart1790, chart1800, chart1810, chart1820, chart1830, chart1840,
                  ncol = 6, nrow = 1,
                  heights = c(2.6,3.3,3.9,4.7,5.4,6),
                  widths = c(2.6,3.3,3.9,4.7,5.4,6))
row1


# merging the plots from 1850 to 1870
row3 <- ggarrange(chart1850, chart1860, chart1870,
                  ncol = 3, nrow = 1,
                  heights = c(6,7,8.5),
                  widths = c(6,7,8.5))



# Creating a custom legend for 1870 to 1890 pie charts
legend2DF <- data.frame(group = c("A", "B", "C", "D", "E"),
                        xmin = c(1.575, 1.575, 1.575, 1.575, 1.575),
                        xmax = c(1.625, 1.625, 1.625, 1.625, 1.625),
                        ymin = c(0.6, 1.6, 2.6, 3.6, 4.6),
                        ymax = c(1.1, 2.1, 3.1, 4.1, 5.1))

# merging the plots from 1880 to 1890
row5 <- ggarrange(chart1880, chart1890,
                  ncol = 2, nrow = 1,
                  heights = c(9.9, 11.3),
                  widths = c(9.9, 11.3))

# Adding a title to the plot

title <- text_grob("",
                   family = "Puritan", face = "bold", size = 27)


# Combining all of them
CombinedPlot <- ggarrange(title, row1, filler_plot, row3, filler_plot, row5,
                          ncol = 1, nrow = 6,
                          widths = c(1, 1.5, 0.5, 1.9, 0.5, 1.9),
                          heights = c(0.5, 1.5, 1, 1.9, 1, 1.9)) +
  theme(plot.background = element_rect(fill = "#EFD8AF", color = "#EFD8AF"))


# Saving the plot with custom dimensions

png(here::here("Slow Reveal Recreations", "1890-34-total-pop-elements", "recreated-imgs", "03_years_added.png"),
    width = 1800,
    height = 2400)

CombinedPlot

dev.off()

# 04: First Row

# 1790 Pie chart 
chart1790 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1790"), family = "Puritan", size = 7) +
  geom_text(aes(y = ypos, label = labels), color = "black", size = 7) +
  scale_fill_manual(values = c(color4, color5)) 



# 1800 pie chart
chart1800 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1800"), family = "Puritan", size = 7) +
  geom_text(aes(y = ypos, label = labels), color = "black", size = 7) +
  scale_fill_manual(values = c(color4, color5)) 




# 1810 pie chart
chart1810 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1810"), family = "Puritan", size = 7) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color5)) 



# 1820 pie chart
chart1820 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1820"), family = "Puritan", size = 7) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color5)) 


# 1830 pie chart
chart1830 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1830"), family = "Puritan", size = 7) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color5)) 

# 1840 pie chart
chart1840 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1840"), family = "Puritan", size = 7) +
  geom_text(aes(y = ypos, label = labels), color = "black", size = 7) +
  scale_fill_manual(values = c(color4, color5))

# 1850 Pie chart 
chart1850 <- ggplot(data1850, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1850"), family = "Puritan", size = 7) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4,color5, color3)) 
#theme(plot.margin = margin(4, 4, 4, 4, "cm"))

# 1860 Pie chart 
chart1860 <- ggplot(data1860, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1860"), family = "Puritan", size = 7) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4,color5, color3)) 
#theme(plot.margin = margin(4, 4, 4, 4, "cm"))

# 1870 Pie chart 
chart1870 <- ggplot(data1870, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1870"), family = "Puritan", size = 7) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color1,color2, color3)) 

# 1880 Pie chart 
chart1880 <- ggplot(data1880, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1880"), family = "Puritan", size = 7) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color1,color2, color3)) 


# 1890 Pie chart 
chart1890 <- ggplot(data1890, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1890"), family = "Puritan", size = 7) +
  # geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color1,color2, color3)) 


# Combining the charts and creating custom legends
# merging the plots from 1790 to 1840
row1 <- ggarrange(chart1790, chart1800, chart1810, chart1820, chart1830, chart1840,
                  ncol = 6, nrow = 1,
                  heights = c(2.6,3.3,3.9,4.7,5.4,6),
                  widths = c(2.6,3.3,3.9,4.7,5.4,6))
row1


# merging the plots from 1850 to 1870
row3 <- ggarrange(chart1850, chart1860, chart1870,
                  ncol = 3, nrow = 1,
                  heights = c(6,7,8.5),
                  widths = c(6,7,8.5))


# merging the plots from 1880 to 1890
row5 <- ggarrange(chart1880, chart1890,
                  ncol = 2, nrow = 1,
                  heights = c(9.9, 11.3),
                  widths = c(9.9, 11.3))

# Adding a title to the plot

title <- text_grob("",
                   family = "Puritan", face = "bold", size = 27)


# Combining all of them
CombinedPlot <- ggarrange(title, row1, legend1, row3, filler_plot, row5,
                          ncol = 1, nrow = 6,
                          widths = c(1, 1.5, 0.5, 1.9, 0.5, 1.9),
                          heights = c(0.5, 1.5, 1, 1.9, 1, 1.9)) +
  theme(plot.background = element_rect(fill = "#EFD8AF", color = "#EFD8AF"))


# Saving the plot with custom dimensions

png(here::here("Slow Reveal Recreations", "1890-34-total-pop-elements", "recreated-imgs", "04_first_row.png"),
    width = 1800,
    height = 2400)

CombinedPlot

dev.off()

# 05: Remaining Rows

# 1790 Pie chart 
chart1790 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1790"), family = "Puritan", size = 7) +
  geom_text(aes(y = ypos, label = labels), color = "black", size = 7) +
  scale_fill_manual(values = c(color4, color5)) 



# 1800 pie chart
chart1800 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1800"), family = "Puritan", size = 7) +
  geom_text(aes(y = ypos, label = labels), color = "black", size = 7) +
  scale_fill_manual(values = c(color4, color5)) 




# 1810 pie chart
chart1810 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1810"), family = "Puritan", size = 7) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color5)) 



# 1820 pie chart
chart1820 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1820"), family = "Puritan", size = 7) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color5)) 


# 1830 pie chart
chart1830 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1830"), family = "Puritan", size = 7) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color5)) 

# 1840 pie chart
chart1840 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1840"), family = "Puritan", size = 7) +
  geom_text(aes(y = ypos, label = labels), color = "black", size = 7) +
  scale_fill_manual(values = c(color4, color5))

# 1850 Pie chart 
chart1850 <- ggplot(data1850, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1850"), family = "Puritan", size = 7) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4,color5, color3)) 
#theme(plot.margin = margin(4, 4, 4, 4, "cm"))

# 1860 Pie chart 
chart1860 <- ggplot(data1860, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1860"), family = "Puritan", size = 7) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4,color5, color3)) 
#theme(plot.margin = margin(4, 4, 4, 4, "cm"))

# 1870 Pie chart 
chart1870 <- ggplot(data1870, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1870"), family = "Puritan", size = 7) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color1,color2, color3)) 

# 1880 Pie chart 
chart1880 <- ggplot(data1880, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1880"), family = "Puritan", size = 7) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color1,color2, color3)) 


# 1890 Pie chart 
chart1890 <- ggplot(data1890, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1890"), family = "Puritan", size = 7) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=7) +
  scale_fill_manual(values = c(color4, color1,color2, color3)) 


# Combining the charts and creating custom legends
# merging the plots from 1790 to 1840
row1 <- ggarrange(chart1790, chart1800, chart1810, chart1820, chart1830, chart1840,
                  ncol = 6, nrow = 1,
                  heights = c(2.6,3.3,3.9,4.7,5.4,6),
                  widths = c(2.6,3.3,3.9,4.7,5.4,6))
row1


# merging the plots from 1850 to 1870
row3 <- ggarrange(chart1850, chart1860, chart1870,
                  ncol = 3, nrow = 1,
                  heights = c(6,7,8.5),
                  widths = c(6,7,8.5)) +
  theme(plot.background = element_rect(fill = "#EFD8AF", color = "#EFD8AF"))

# merging the plots from 1880 to 1890
row5 <- ggarrange(chart1880, chart1890,
                  ncol = 2, nrow = 1,
                  heights = c(9.9, 11.3),
                  widths = c(9.9, 11.3)) +
  theme(plot.background = element_rect(fill = "#EFD8AF", color = "#EFD8AF"))

# Adding a title to the plot

title <- text_grob("",
                   family = "Puritan", face = "bold", size = 27)


# Combining all of them
CombinedPlot <- ggarrange(title, row1, legend1, row3, legend2, row5,
                          ncol = 1, nrow = 6,
                          widths = c(1, 1.5, 0.5, 1.9, 0.5, 1.9),
                          heights = c(0.5, 1.5, 1, 1.9, 1, 1.9)) +
  theme(plot.background = element_rect(fill = "#EFD8AF", color = "#EFD8AF"))


# Saving the plot with custom dimensions

png(here::here("Slow Reveal Recreations", "1890-34-total-pop-elements", "recreated-imgs", "05_remaining_rows.png"),
    width = 1800,
    height = 2400)

CombinedPlot

dev.off()
