#
# FILE:
# 1890_scandinavian_natives.R
#
# DESCRIPTION:
# https://www.loc.gov/resource/g3701gm.gct00010/?sp=34&r=0.427,0.311,0.811,0.355,0

#
#
# AUTHORS:
#   Alex Gichuki (main code)
# Ian Curtis (2023, code to save plots)


# Setup
library(tidyverse)
library(showtext)

# Fonts
font_add_google("Dynalight", "Dynalight")
font_add_google("Puritan", "Puritan")
showtext_auto()

# Creating a data frame for # 38 
states <- c("NEW YORK", "PENNSYLVANIA", "ILLINOIS", "MASSACHUSETTS", "OHIO", 
            "WISCONSIN", "MICHIGAN", "MINNESOTA", "IOWA", "NEW JERSEY", "MISSOURI",
            "CALIFORNIA", "NEBRASKA", "INDIANA", "KANSAS", "CONNECTICUT", "TEXAS",
            "MARYLAND", "RHODE ISLAND", "SOUTH DAKOTA", "KENTUCKY", "COLORADO", 
            "WASHINGTON", "MAINE", "NORTH DAKOTA", "LOUSIANA", "UTAH", 'NEW HAMPSHIRE',
            "VERMONT", "OREGON", "MONTANA", "WEST VIRGINIA", "TENNESSEE", "Dist. OF COL.",
            "VIRGINIA", "ARKANSAS", 'ALABAMA', "IDAHO", "FLORIDA", "ARIZONA",
            "GEORGIA", "DELAWARE", "WYOMONG", "MISSISSIPPI", "NEVADA", "NEW MEXICO",
            "SOUTH CAROLINA", "NORTH CAROLINA", "OKLAHOMA")

number <- c(33.9, 19, 18.8, 12.4, 12.35, 12.30, 11.3, 9.8, 8.1, 6.9, 6.8, 6.1, 4.5,
            4.3, 3.8, 3.75, 3.45, 2.5, 2.01, 2.0, 1.85, 1.6, 1.5, 1.49, 1.4, 1.38,
            1.32, 1.1, 1.08, 0.96, 0.85, 0.75, 0.62, 0.60, 0.59, 0.5, 0.48, 0.47,
            0.42, 0.40, 0.35, 0.33, 0.30, 0.27, 0.23, 0.2, 0.16, 0.14, 0.10)

df <- data.frame(states, number)

# Plotting graph 38
plot38 <- ggplot(df, aes(x = number, y = reorder(states, -number))) +
  annotate("segment", x = 0, xend = 0, y = 0, yend = 52) +
  annotate("segment", x = seq(0, 36, 1), xend = seq(0, 36, 1), y = -1, yend = 50) +
  annotate("segment", x = 0, xend = 36, y =50, yend =50) +
  scale_x_continuous(breaks = seq(1, 35, 1), position = "top") +
  geom_bar(stat = "identity", width = 0.7, fill = "#2e2c26") +
  scale_y_discrete(limits = rev) +
  labs(title = "38. WHITE POPULATION OF FOREIGN PARENTAGE, INCLUDING FOREIGN BORN WHITES, BY STATES AND TERRITOTIES: 1890.") +
  coord_cartesian(xlim = c(-3,34), ylim = c(0.3,50.6)) +
  theme_linedraw(base_line_size = .6) +
  labs(y = NULL, x = "[Hundreds of thousands.]")  +
  theme(axis.title.x = element_text(family = "Puritan", size = 23),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        # Text sizes are adjusted to fit the saved png
        axis.text.x = element_text(colour = "gray21", face = "bold", family = "Puritan", size = 22),
        axis.text.y = element_text(vjust = -0.01,hjust = 0.05,margin = margin(l = 35, r = -55),
                                   colour = "gray21", face = "bold", family = "Puritan", size = 22),
        axis.text.x.top = element_text(margin = margin(t = 5, b = -11)),
        plot.title = element_text(hjust = 0.5, family = "Puritan", size =27),
        panel.border = element_rect(fill = NA),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", colour = "white"),
        plot.background = element_rect(fill = "white", colour = "white")) 


# Saving the plot with custom dimensions
ggsave(here::here("1890-white-foreign-parentage", "01_full_unmasked.png"),
       plot38, height = 8, width = 8)







