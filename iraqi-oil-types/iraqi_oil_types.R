#
# FILE:
#  iraqi_oil_types.R
#
# DESCRIPTION:Types of Iraqi Oil Part of a large inforgraphic
# Original Source: https://www.loc.gov/resource/g7611h.ct002114/?r=0.082,0.19,0.258,0.119,0

# SLOW REVEAL ORDER:No slow reveal, just completely recreated. 
#
# AUTHORS:
#   Lauryn Davis (last edit 3/27/23)
#   Ian Curtis (2023, code to save plots)


library(gridExtra)
library(tidyverse)
library(ggtext)
library(ggrepel)
library(grid)
library(showtext)
library(magick)




font_files() %>% tibble() %>% filter(str_detect(family,"Open"))
picture <- image_graph(width = 340, height = 490)
annotation_custom2 <- 
  function (grob, xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = 470, data) 
  {
    layer(data = data, stat = StatIdentity, position = PositionIdentity, 
          geom = ggplot2:::GeomCustomAnn, 
          inherit.aes = TRUE, params = list(grob = grob, 
                                            xmin = xmin, xmax = xmax, 
                                            ymin = ymin, ymax = ymax))
  }

font_add(family="Open", regular="OpenSans-Bold.ttf")
showtext_auto()
type_levels <- c("Very Heavy","Light", "Medium", "Regular", "Heavy")
pop_colors <- c("#010102" , "#1566ac","#ed1f02", "#e1eb00", "#8fa800" )
df<- tibble(
  type_levels = fct_rev(factor(type_levels, levels = type_levels)), # Convert to factor, then reverse the ordering with fct_rev.
  value = c(5,7,18,27,43), 
  pop_colors = c("#010102" , "#1566ac","#ed1f02", "#e1eb00", "#8fa800" )
)
df2 <- df %>%
  mutate(csum = rev(cumsum(rev(value))), 
         pos = value/2 + lead(csum, 1),
         pos = if_else(is.na(pos), value/2, pos)
  )
bp <- ggplot(df, aes(x = "", y = rev(value), fill = type_levels)) +
  geom_bar(width = 1, stat = "identity", color = "black")
pie<- bp +
  coord_polar("y", start = 0) +  # Using ggtext + HTML syntax to color text
  # For some reason '\n' doesn't work here so I used <br> instead.
  labs(title = "<p><span style = 'font-size:19pt; color:#FFFFFF'><i>T</span><span style = 'font-size:14pt; color:#FFFFFF'>YPES</span><span style = 'font-size:19pt; color:#FFFFFF'> O</span><span style = 'font-size:14pt; color:#FFFFFF'>F</span><span style = 'font-size:19pt; color:#FFFFFF'> I</span><span style = 'font-size:14pt; color:#FFFFFF'>RAQI</span><span style = 'font-size:19pt; color:#FFFFFF'> O</span><span style = 'font-size:14pt; color:#FFFFFF'>IL<sup>a</sup></span></p>",
       subtitle = " ",
       y = "",
       x = "",
       caption ="Iraq markets two crude blends: 60 percent\nof exports is Basrah Light (34.4 API) and\n40 percent is Kirkul(37 API).\n API gravity is a measure of crude oil density,\nwith higher numbers denoting lighter, more\nvaluable crude oil" ) +
  theme_classic() +
  theme(axis.line=element_blank(),
        plot.margin =  unit(c(0,0,2,0), "cm"),
        plot.title= element_textbox_simple(family= "Open",size = 10, lineheight = 0, 
                                           width = grid::unit(4.9, "in"), # fixed width
                                           hjust = .5, # alignment of box relative to plot
                                           linetype = 0, # turn on border
                                           box.color = "black", # border color
                                           fill = "#6D7166", # background fill color
                                           r = grid::unit(0, "pt"), # radius for rounded corners
                                           padding = margin(14, -1, 14, 24), # padding around text inside the box
                                           margin = margin(0, 0, 80, 0)),
        axis.text.x = element_blank(),
        axis.text.y= element_blank(),
        axis.title.x = element_blank(),
        axis.title.y= element_blank(),
        legend.position = "none",
        plot.subtitle = element_markdown(),
        plot.caption = element_text(hjust = -10))+ scale_fill_manual(values=pop_colors)
pie 
dev.off()

fig01 <- image_draw(picture)
text(147, 133, "Very heavy", family = "Text", cex = .9, col = "black")+
  text(133, 147, "(20°)", family = "Text", cex = .9, col = "#0c64a4")+
  text(149, 147, substitute(paste(italic(" , 5"))), family = "Text", cex = .9, col = "black")+
  text(248, 158, "Heavy", family = "Text", cex = .9, col = "black")+
  text(288, 158, "(20°-26°),", family = "Text", cex = .9, col = "#0c64a4")+
  text(238, 168, substitute(paste(italic("43"))), family = "Text", cex = .9, col = "black")+
  text(56, 164, "Light", family = "Text", cex = .9, col = "black")+
  text(89, 164, "(38° +),", family = "Text", cex = .9, col = "#0c64a4")+
  text(113, 164, substitute(paste(italic("7"))), family = "Text", cex = .9, col = "black")+
  text(49, 200, "Medium", family = "Text", cex = .9, col = "black")+
  text(54, 215, "(27° -33°),", family = "Text", cex = .9, col = "#0c64a4")+
  text(36, 228, substitute(paste(italic("18"))), family = "Text", cex = .9, col = "black")+
  text(35, 326, "Regular", family = "Text", cex = .9, col = "black")+
  text(83, 326, "(34° -37°),", family = "Text", cex = .9, col = "#0c64a4")+
  text(23, 338, substitute(paste(italic("27"))), family = "Text", cex = .9, col = "black")+
  text(-1, 105, "Numbers in parenthesis are American\nPetrolium Institute (API) degrees gravity.", family = "Text", cex = .9, col = "#0c64a4", pos = 4)+
  text(202, 105, "b", family = "Text", cex = .6, col = "#0c64a4")+
  text(25, 75, substitute(paste(italic("Percent"))), family = "Text", cex = .9, col = "black")+
  text(120, 385, "    Iraq markets two crude blends: 60 percent", family = "Text", cex = .9, col = "black")+
  text(117, 395, "of exports is Basrah Light (34.4 API) and", family = "Text", cex = .9, col = "black")+
  text(87, 405, "40 percent is Kirkul(37 API).", family = "Text", cex = .9, col = "black")+
  text(124, 415, "    API gravity is a measure of crude oil density", family = "Text", cex = .9, col = "black")+
  text(122, 425, "with higher numbers denoting lighter, more", family = "Text", cex = .9, col = "black")+
  text(62, 435, "valuable crude oil", family = "Text", cex = .9, col = "black")+
  text(21, 381, "a", family = "Text", cex = .8, col = "black")+
  text(21, 411, "b", family = "Text", cex = .8, col = "black")


segments(x0=8, x1=333, y0=65, y1=65, lwd = 1, lty = "solid")






dev.off()
image_write(fig01, path = here::here("iraqi-oil-types", "01_full_unmasked.png"), format = "png")
