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
library(patchwork)

# Required fonts
font_add_google("Dynalight", "Dynalight")
font_add_google("Puritan", "Puritan")
showtext_auto()

# creating the data for row 1
data1 <- data.frame(group = LETTERS[1:2],
                    value =c(20, 80),
                    labels = c("4", "5")
)



# Computing the position of labels
data1 <- data1 %>%
  arrange(desc(group)) %>%
  mutate(prop = value / sum(data1$value) *100) %>%
  mutate(ypos = cumsum(prop)- 0.5*prop )


# 1790 Pie chart 
chart1790 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1790"), family = "Puritan", size = 4) +
  geom_text(aes(y = ypos, label = labels), color = "black", size = 4) +
  scale_fill_manual(values = c("#7a7876", "#DAAA8D")) 



# 1800 pie chart
chart1800 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1800"), family = "Puritan", size = 4) +
  geom_text(aes(y = ypos, label = labels), color = "black", size = 4) +
  scale_fill_manual(values = c("#7a7876", "#DAAA8D")) 




# 1810 pie chart
chart1810 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1810"), family = "Puritan", size = 4) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=4) +
  scale_fill_manual(values = c("#7a7876", "#DAAA8D")) 



# 1820 pie chart
chart1820 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1820"), family = "Puritan", size = 4) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=4) +
  scale_fill_manual(values = c("#7a7876", "#DAAA8D")) 


# 1830 pie chart
chart1830 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1830"), family = "Puritan", size = 4) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=4) +
  scale_fill_manual(values = c("#7a7876", "#DAAA8D")) 

# 1840 pie chart
chart1840 <- ggplot(data1, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.7, y = 0, label = "1840"), family = "Puritan", size = 4) +
  geom_text(aes(y = ypos, label = labels), color = "black", size = 4) +
  scale_fill_manual(values = c("#7a7876", "#DAAA8D"))



# creating the data for 1850 and 1860
data2 <- data.frame(group = LETTERS[1:3],
                    value =c(20, 65, 13),
                    labels = c("4", "5", "3")
)



# Computing the position of labels
data2 <- data2 %>%
  arrange(desc(group)) %>%
  mutate(prop = value / sum(data1$value) *100) %>%
  mutate(ypos = cumsum(prop)- 0.5*prop )


# 1850 Pie chart 
chart1850 <- ggplot(data2, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1850"), family = "Puritan", size = 6) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=6) +
  scale_fill_manual(values = c("#7a7876","#DAAA8D", "#3f623f")) +
  theme(plot.margin = margin(4, 4, 4, 4, "cm"))



# 1860 Pie chart 
chart1860 <- ggplot(data2, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1860"), family = "Puritan", size = 6) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=6) +
  scale_fill_manual(values = c("#7a7876","#DAAA8D", "#3f623f")) +
  theme(plot.margin = margin(4, 4, 4, 4, "cm"))


# creating the data for chart 1870 - 1890
data3 <- data.frame(group = LETTERS[1:4],
                    value =c(20, 65, 23, 15),
                    labels = c("4", "1", "2", "3")
)



# Computing the position of labels
data3 <- data3 %>%
  arrange(desc(group)) %>%
  mutate(prop = value / sum(data1$value) *100) %>%
  mutate(ypos = cumsum(prop)- 0.5*prop )


# 1870 Pie chart 
chart1870 <- ggplot(data3, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1870"), family = "Puritan", size = 6) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=6) +
  scale_fill_manual(values = c("#7a7876", "#F0e89f","#DAAA8D", "#3f623f")) +
  theme(plot.margin = margin(4, 4, 4, 4, "cm"))




# 1880 Pie chart 
chart1880 <- ggplot(data3, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1880"), family = "Puritan", size = 6) +
  theme(plot.subtitle = element_text(hjust = 0.5, family = "Puritan", size = 18)) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=6) +
  scale_fill_manual(values = c("#7a7876", "#F0e89f","#DAAA8D", "#3f623f")) +
  theme(plot.margin = margin(4, 4, 4, 4, "cm"))

# 1890 Pie chart 
chart1890 <- ggplot(data3, aes(x = " ", y = value, fill = group)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar("y", start = 0) +
  theme_void() + 
  theme(legend.position="none") +
  geom_text(aes(x = 1.6, y = 0, label = "1890"), family = "Puritan", size = 5) +
  geom_text(aes(y = ypos, label = labels), color = "black", size=5) +
  scale_fill_manual(values = c("#7a7876", "#F0e89f","#DAAA8D", "#3f623f")) 



# Combining the charts
# merging the plots from 1790 to 1840
plot_grid(
  chart1790, chart1800, chart1810, chart1820, chart1830, chart1840, nrow = 1, 
  rel_heights = c(2.6,3.3,3.9,4.7,5.4,6), rel_widths = c(2.6,3.3,3.9,4.7,5.4,6)
)



chart1790 + chart1800 + chart1810 + chart1820 + chart1830 + chart1840 +
  plot_layout(nrow = 1, widths = c(14, 19, 25, 30, 37, 45), guides = "collect")



# merging the plots from 1850 to 1870
chart1850 + chart1860 + chart1870 + 
  plot_layout(nrow = 1, widths = c(45, 60, 90), guides = "collect")



# merging the plots from 1880 to 1890
chart1880 + chart1890 +
  plot_layout(nrow = 1, widths = c(100, 120), guides = "collect")

### Code seems not complete
