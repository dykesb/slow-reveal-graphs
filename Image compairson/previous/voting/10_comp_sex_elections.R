# DESCRIPTION: Composition of American Voters by Sex: Presidential Elections, 1980–2016


#The following data visualizations are from the U.S. Census Bureau and 
# involved data concerning the characteristics of voters in the presidential election of 2016

#Original Source: https://www.census.gov/content/dam/Census/library/publications/2018/demo/P20-582.pdf

# SLOW REVEAL ORDER: No slow reveal, just completely recreated. 

# AUTHORS:
#   Lauryn Davis (Last edit: 3/27/23)
# Ian Curtis (2023, code to save plots)

library(tidyverse)
library(ggtext)
library(grid)
library(rlang)
library(lemon)



types= c("Too busy, conflicting work or school schedule", "Illness or disability (own or familys)", "Not interested, felt vote wouldn't make a difference", "Out of town or away from home", "Didn't like candidates or campaign issues")
year_levels <- c("2000", "2004", "2008", "2012", "2016")
pop_colors <- c('#D6A6A6',"#9c3a4b","#f97610", "#c58887", "#8b0433")


draw_key_smile <- function(data, params, size) {
  grobTree(
    pointsGrob(0.25, 0.75, size = unit(.25, "npc"), pch = 16),
    pointsGrob(0.75, 0.75, size = unit(.25, "npc"), pch = 16),
    linesGrob(c(0.9, 0.87, 0.78, 0.65, 0.5, 0.35, 0.22, 0.13, 0.1), 
              c(0.5, 0.35, 0.22, 0.13, 0.1, 0.13, 0.22, 0.35, 0.5)),
    gp = gpar(
      col = data$colour %||% "grey20",
      fill = alpha(data$fill %||% "white", data$alpha),
      lwd = (data$size %||% 0.5) * .pt,
      lty = data$linetype %||% 1
    )
  )
}


vote_data<- tibble(
  vote_type = rep(types, 5),
  pop_groups= rep(year_levels, c(5,5,5,5,5)),
  amount= c(22.15697,
            15.72408,
            12.95218,
            10.86018,
            8.14058,
            21.21557,
            16.40398,
            11.38318,
            9.55268,
            10.54638,
            18.44367,
            15.72408,
            14.10278,
            9.23888,
            13.52748,
            19.01897,
            14.10278,
            15.77638,
            8.66358,
            12.79528,
            14.41658,
            11.74928,
            15.51488,
            7.98368,
            24.98117), 
  fill= rep(pop_colors, 5)
)


vote_data<- vote_data%>%
  mutate(vote_type = factor(vote_type, levels= types),
         pop_groups= factor(pop_groups, levels=  year_levels),
         fill= factor(fill, levels= pop_colors))

area<- (ggplot(data= vote_data, aes(x= pop_groups, y= amount, group = vote_type, linetype=vote_type, color=vote_type))+ geom_line(linewidth =1.1)+ geom_point(aes(color= vote_type), size=2.3)+ scale_color_manual(values=pop_colors, guide_legend(label.vjust=5))+ scale_linetype_manual(breaks = types, values=c(5,1,5,1,5), labels= types)+
          labs(title = "<span style = 'font-size:11pt; color:#000000'><b>Figure 10.</span></p><p><span style = 'font-size:12pt; color:#a21e3c'><b>Alternative Method of Voting, by Race and Hispanic Origin: 1996 to 2016</span></p>",
               subtitle = "<span style = 'font-size:10pt; color:#000000'>(In Percent)</span>",
               y = "",
               x = "",
               caption = "Note: The estimates in this figure are for registered nonvoters.\nSource: U.S. Census Bureau, Current Population Survey, November 2000-2016."))



new<- (area + theme_classic()+
         theme(
           # Needed for using HTML syntax in plot title
           # plot.title = element_markdown(), 
           # Cleaned up some redundancies and combined your theme changes into one layer
           panel.grid = element_blank(),
           plot.background = element_rect(fill = "white", color = "black"),
           panel.grid.major = element_blank(),
           panel.grid.minor = element_blank(),
           plot.title = element_markdown(hjust= .05),
           plot.title.position = "plot",
           plot.caption.position = "plot",
           plot.subtitle = element_markdown(hjust=.01), 
           plot.caption = element_text(size = 8, color = "black", hjust = 0),
           axis.ticks = element_blank(),
           axis.line.y = element_line(linewidth=.2, color= "black"),
           axis.text.y= element_text(size=11, color="black"),
           axis.ticks.y= element_line(linewidth=.2),
           axis.line.x.bottom = element_line(linewidth=.2, color= "black", linetype="solid"),
           axis.text.x= element_text(color= "black", size=11),
           legend.key.height= unit(.2, 'cm'), legend.key.width= unit(2.85, 'cm'),
           legend.spacing.x = unit(.1, 'cm'),
           plot.margin = unit(c(.5,2.7,.5,.5), "cm"),
           legend.position=c(.5,1.4),
           legend.text=element_text(margin=margin(t= 3, b=2), size=11),
           legend.title= element_blank(),
           legend.direction='vertical',
           legend.spacing = unit(10, 'cm'),
           axis.ticks.length=unit(0.15,"inch"))
       + scale_x_discrete(expand=c(.05,.05))
       + scale_y_continuous(breaks = c(0,5,10,15,20,25), limits= c(0,25), expand= expansion(mult=c(0,.6))))
new1<- (new + coord_capped_cart(left='top')+
          annotation_custom(grob = grid::textGrob(label = "Percent", hjust=0, gp=gpar(col="black", cex=.78)),
                            xmin = 1, xmax = .5, ymin = 27.5, ymax = 27.5))

figure10<- new1+ guides(color= guide_legend(override.aes=list(linetype=c(5,1,5,1,5))))
ggsave(here::here("voting", "10_full_unmasked.png"))