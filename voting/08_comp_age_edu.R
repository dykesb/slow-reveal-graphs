# DESCRIPTION: Composition of American Voters by Age and Educational Attainment: 2016


#The following data visualizations are from the U.S. Census Bureau and 
# involved data concerning the characteristics of voters in the presidential election of 2016

#Original Source: https://www.census.gov/content/dam/Census/library/publications/2018/demo/P20-582.pdf

# SLOW REVEAL ORDER: No slow reveal, just completely recreated. 

# AUTHORS:
#   Lauryn Davis (Last edit: 3/27/23)
# Ian Curtis (code to save plots)

library(tidyverse)
library(ggtext)
library(grid)
library(rlang)



age_groups= c("18-29 year olds", "30-44 year olds", "45-64 year olds", "65 years and older")
types= c("Less than high school", "High school diploma", "\nSome college or\nassociate's degree", "\nBachelor's degree\nor more")

pop_colors <- c("#e6cdcb", "#c58887", "#af5d62", "#971c3c")
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


vote_data<- tibble(
  vote_type = rep(types, 4),
  pop_groups= rep(age_groups, c(4,4,4,4)),
  amount= c(4.5, 22.5, 42.6, 30.4, 2.5, 18.7, 27.9, 50.9, 4.4, 25.4, 30.3, 39.9, 8.9,30.0,26.4, 34.6),
  amount1= c("   4.5", "22.5", "42.6", "30.4", "   2.5", "18.7", "27.9", "50.9  ", "   4.4", "25.4", "30.3", "39.9 ", "   8.9","30.0","26.4", "34.6 "),
  fill= rep(pop_colors, 4)
)
vote_labels <- tibble(
  vote_type= factor(types, levels= types),
)
vote_data<- vote_data%>%
  mutate(vote_type = factor(vote_type, levels= types),
         pop_groups= factor(pop_groups, levels= age_groups),
         fill= factor(fill, levels= pop_colors))
area<- (ggplot(vote_data, aes(x = pop_groups, 
                              y = amount, 
                              fill = fill, 
                              label = amount1)) +
          geom_col(color = "black", linewidth= .2, width= .8, position= position_dodge(width= .9), key_glyph= draw_square)+
          geom_text(size = 3, 
                    position = position_dodge(width=1), aes(y= amount), vjust =-.8, color= "black") 
        +
          labs(title =  "<span style = 'font-size:11pt; color:#000000'><b>Figure 8.</span><br><span style = 'font-size:12pt; color:#a21e3c'><b>Composition of American Voters by Age and Educational Detainment: 2016</span>",
               subtitle = "(In Percent)",
               y = "",
               x = "",
               caption = "Source: U.S. Census Bureau, Current Population Survey, November 1980-2016.") + scale_fill_manual(labels= types, values= pop_colors, name = ""))

figure8<- (area + theme_classic()+
             theme(
               # Needed for using HTML syntax in plot title
               # plot.title = element_markdown(), 
               # Cleaned up some redundancies and combined your theme changes into one layer
               panel.grid = element_blank(),
               plot.background = element_rect(fill = "white", color = "black"),
               panel.grid.major = element_blank(),
               panel.grid.minor = element_blank(),
               plot.title = element_markdown(),
               plot.title.position = "plot",
               plot.caption.position = "plot",
               plot.subtitle = element_text(size = 10, color = "black"), 
               plot.caption = element_text(size = 8, color = "black", hjust = 0),
               axis.ticks = element_blank(),
               axis.line.y = element_blank(),
               axis.text.y= element_blank(),
               legend.position= "top",
               axis.line.x = element_line(linewidth=.1),
               axis.text.x= element_text(color= "black"),
               plot.margin = unit(c(.5,.5,.5,.5), "cm"))
           
           + scale_x_discrete(expand=c(.2,0))
           + scale_y_continuous(expand = expansion(mult = c(0, 0.145))))

ggsave(here::here("voting", "08_full_unmasked.png"))