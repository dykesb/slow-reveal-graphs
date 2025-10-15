# DESCRIPTION: Reasons for Not Registering: Presidential Elections, 2004–2016


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
year_levels <- c("2004", "2008", "2012", "2016")
pop_colors <- c('#BD6D6D',"#723417","#94011f", "#e8c6c0", "#7a021a")








vote_data<- tibble(
  vote_type = rep(types, 4),
  pop_groups= rep(year_levels, c(5,5,5,5)),
  amount= c(39.038712921065900,
            16.590246354952200,
            6.201860231271980,
            5.3660130718954200,
            4.052538964303670,
            39.15811965811970,
            14.560331825037700,
            8.2317747611865,
            5.6048265460029800,
            4.4107591754650300,
            41.06862745098040,
            14.321518350930100,
            7.515334338863720,
            5.366013071895410,
            4.888386123680210,
            42.02388134741070,
            12.649824032177000,
            7.873554550025120,
            5.72423328305679,
            5.246606334841600), 
  fill= rep(pop_colors, 4)
)


vote_data<- vote_data%>%
  mutate(vote_type = factor(vote_type, levels= types),
         pop_groups= factor(pop_groups, levels=  year_levels),
         fill= factor(fill, levels= pop_colors))

area<- (ggplot(data= vote_data, aes(x= pop_groups, y= amount, group = vote_type, linetype=vote_type, color=vote_type))+ geom_line(linewidth =1.1)+ geom_point(aes(color= vote_type), size=2.3)+ scale_color_manual(values=pop_colors, guide_legend(label.vjust=5))+ scale_linetype_manual(breaks = types, values=c(5,1,5,1,5), labels= types)+
          labs(title = "<span style = 'font-size:11pt; color:#000000'><b>Figure 11.</span></p><p><span style = 'font-size:12pt; color:#a21e3c'><b>Reasons for Not Registering: Presidential Elections, 2004-2016</span></p>",
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
       + scale_y_continuous(breaks = c(0,5,10,15,20,25,30,35,40,45,50), limits= c(0,50), expand= expansion(mult=c(0,.65))))
new1<- (new + coord_capped_cart(left='top')+
          annotation_custom(grob = grid::textGrob(label = "Percent", hjust=0, gp=gpar(col="black", cex=.78)),
                            xmin = 1.1, xmax = .5, ymin = 52.5, ymax = 52.5))

figure11<- new1+ guides(color= guide_legend(override.aes=list(linetype=c(5,1,5,1,5))))
ggsave(here::here("voting", "11_full_unmasked.png"))