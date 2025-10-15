#
# FILE:
#  gannett_theme.R
#
# DESCRIPTION:
#
# ggplot2 theme based on Henry Gannett's US Census plots
#

# AUTHORS:
#   Louis Cousino (main code)
#

gannett_theme <- theme(
  axis.line.x = element_line(color = "black"),
  axis.ticks = element_blank(),
  legend.position = "none",
  panel.background = element_rect(fill = "transparent", color = "transparent"),
  panel.grid.major.x = element_line(color = "black"),
  panel.grid.minor.x = element_blank(),
  panel.grid.major.y = element_blank(),
  panel.grid.minor.y = element_blank(),
  plot.background = element_rect(fill = "transparent", color = "transparent"),
  plot.title = element_text(hjust = 0.5),
  plot.subtitle = element_text(hjust = 0.5)
)
