# DESCRIPTION:Composition of American Voters by Educational Attainment: Presidential Elections, 1980–2016
# The following data visualizations are from the U.S. Census Bureau and 
# involved data concerning the characteristics of voters in the presidential election of 2016

#Original Source: https://www.census.gov/content/dam/Census/library/publications/2018/demo/P20-582.pdf

# SLOW REVEAL ORDER: No slow reveal, just completely recreated. 

# AUTHORS:
#   Lauryn Davis (Last edit: 3/27/23)
# Ian Curtis (2023, code to save plots)

library(tidyverse)
library(ggtext)
library(grid)


type_levels= c("\nBachelor's degree\nor more", "\nSome college or\nassociate's degree", "High school diploma", "Less than high school")
year_levels <- c("1980","1984", "1988", "1992","1996","2000", "2004", "2008", "2012","2016")
pop_colors <- c("#971c3c", "#af5d62","#c58887", "#e6cdcb" )
draw_square <- function(data, params, size) {
  if (is.null(data$size)) {
    data$size <- 0.5
  }
  lwd <- min(data$size, min(size) /4)
  grid::rectGrob(
    width  = unit(1.2, "snpc") - unit(lwd, "mm"),
    height = unit(.5, "snpc") - unit(lwd, "mm"),
    gp = gpar(
      col = data$colour %||% NA,
      fill = alpha(data$fill %||% "grey20", data$alpha),
      lty = data$linetype %||% 1,
      lwd = lwd * .pt,
      linejoin = params$linejoin %||% "mitre",
      lineend = if (identical(params$linejoin, "round")) "round" else "square"
    )
  )
}


vote_data <- tibble(
  vote_type = rep(type_levels, 10),
  # Need to rep the pop_group within each vote_type
  pop_group = rep(year_levels, c(4, 4, 4,4,4,4,4,4,4,4)),
  amount =   c(30.6, 19.3, 38.7, 21.4, 32.2, 20.5, 39.0, 18.3, 35.5, 21.6, 37.5, 15.4, 36.6, 28.2, 32.9, 12.3, 39.4, 29.4, 30.5, 10.7, 41.2, 30.1, 29.5, 9.2, 42.4, 31.0,28.5, 8.1, 44.1, 31.6, 27.3, 6.9, 46.6, 31.3, 25.9, 6.2, 49.5, 30.8, 24.6, 5.1),
  amount_1 =   c('20.6', '19.3', '38.7', '21.4', '22.2', '20.5', '39.0', '18.3', '25.5', '21.6', '37.5', '15.4', '26.6', '28.2', '32.9', '12.3', '29.4', '29.4', '30.5', '10.7', '31.2', '30.1', '29.5', '9.2', '32.4', '31.0','28.5', '8.1', '34.1', '31.6', '27.3', '6.9', '36.6', '31.3', '25.9', '6.2', '39.6', '30.8', '24.6', '5.1'),
  fill = rep(pop_colors, 10))

vote_labels <- tibble(
  vote_type = factor(type_levels, levels = type_levels))
vote_data <- vote_data %>% 
  mutate(vote_type = factor(vote_type, levels = type_levels),
         pop_group = factor(pop_group, levels = year_levels),
         fill = factor(fill, levels = pop_colors))


area<- ((ggplot(vote_data, aes(x = pop_group, 
                               y = amount, 
                               fill = fill, 
                               label = amount_1))+
           geom_col(color = "black", linewidth= .2, width=.7, key_glyph= draw_square)+ geom_text(size = 4, 
                                                                                            position = position_stack(vjust = 0.5), color=ifelse(vote_data$vote_type=="Less than high school", 'black', 'white'))) + 
          labs(title =  "<span style = 'font-size:11pt; color:#000000'><b>Figure 4.</span></p><span style = 'font-size:12pt; color:#a21e3c'><p><b>Composition of Voters by Educational Attainment: Presidential Elections, 1980-2016</p></span>",
               subtitle = "<span style = 'font-size:10pt; color:#000000'>(In Percent).</span>",
               y = "",
               x = "",
               caption = "Source: U.S. Census Bureau, Current Population Survey, November 1980-2016.") + scale_fill_manual(labels= type_levels, values= pop_colors, name = "", guide= guide_legend(reverse=TRUE)))
new<- (area+ scale_y_continuous(limits= c(0,110),expand = c(0, 3))+ theme_classic()+
         theme( panel.grid = element_blank(),
                plot.background = element_rect(fill = "white", color = "black"),
                panel.grid.major = element_blank(),
                panel.grid.minor = element_blank(),
                plot.title = element_markdown(hjust=.02),
                plot.title.position = "plot",
                plot.caption.position = "plot",
                plot.subtitle = element_markdown(hjust= .009), 
                plot.caption = element_text(size = 8, color = "black", hjust = 0),
                axis.ticks = element_blank(),
                axis.line.y = element_blank(),
                legend.position= "top",
                axis.line.x = element_blank(),
                axis.text.x= element_blank(),
                axis.text.y= element_text(margin = margin(r = -5), color= "black", size=12),
                plot.margin = unit(c(.5,.5,.5,.5), "cm")))


figure4<- new + coord_flip()
ggsave(here::here("voting", "04_full_unmasked.png"))