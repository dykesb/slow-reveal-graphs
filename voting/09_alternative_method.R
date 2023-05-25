# DESCRIPTION: Alternative Method of Voting, by Race and Hispanic Origin: 1996 to 2016


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


#This plot shows the plot before using custom line segments. The y axis line is too long. 
age_groups= c("18-29 year olds", "30-44 year olds", "45-64 year olds", "65 years and older")
types= c("White non-Hispanic", "Black non-Hispanic", "Hispanic")
year_levels <- c("*1996", "1998", "*2000", "2002", "*2004", "2006", "*2008", "2010", "*2012", "2014", "*2016")
percent<- c(5,10,15,20,25,30,35,40,45,50)
pop_colors <- c("#971c3c","#e6cdcb","#c58887")
vote_data<- tibble(
  vote_type = rep(types, 11),
  pop_groups= rep(year_levels, c(3,3,3,3,3,3,3,3,3,3,3)),
  amount= c(10.845599873377700,
            4.691308562836330,
            9.47797958214624,
            10.84559987337770,
            5.179744381133270,
            10.845599873377700,
            14.166963437796800,
            6.547364672364670,
            15.632270892687600,
            14.166963437796800,
            7.328861981639750,
            16.0230195473251,
            20.907377730294400,
            12.89703031022480,
            22.274998021525800,
            19.93050609370050,
            9.868728236783780,
            22.274998021525800,
            30.383032605254800,
            31.45759140550810,
            30.383032605254800,
            26.866294713516900,
            17.781388493194000,
            28.23391500474830,
            32.33677587844250,
            31.750652896486200,
            34.87664213358660,
            30.87146842355180,
            25.596361585944900,
            36.83038540677430,
            40.054061807534000,
            37.416508388730600,
            44.15692268122820),
  fill= rep(pop_colors, 11)
)
vote_data<- vote_data%>%
  mutate(vote_type = factor(vote_type, levels= types),
         pop_groups= factor(pop_groups, levels=  year_levels),
         fill= factor(fill, levels= pop_colors))
area<- (ggplot(data= vote_data, aes(x= pop_groups, y= amount, group = vote_type, color= vote_type))+ geom_line(aes(color=vote_type), linewidth =1.1)+ geom_point(aes(color=vote_type),size=2.3)+ scale_color_manual(values=pop_colors, guide_legend(label.vjust=2))+
          labs(title = "<span style = 'font-size:11pt; color:#000000'><b>Figure 9.</span></p><p><span style = 'font-size:12pt; color:#a21e3c'><b>Alternative Method of Voting, by Race and Hispanic Origin: 1996 to 2016</span></p>",
               subtitle = "<span style = 'font-size:10pt; color:#000000'>(In Percent)</span>",
               y = "",
               x = "",
               caption = "*Presidential election year\nNote: Alternative method includes those who voted early and/or by absentee ballot.\nThe estimates presented in this section are only for individuals with valid responses to both the method and timing questions.\nSource: U.S. Census Bureau, Current Population Survey, November 1996-2016."))
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
           legend.key.height= unit(.2, 'cm'), legend.key.width= unit(.9, 'cm'),
           legend.spacing.x = unit(.1, 'cm'),
           plot.margin = unit(c(.5,.5,.5,.5), "cm"),
           legend.position=c(.35,.95),
           legend.text=element_text(margin=margin(t= 3, b=2), size=11),
           legend.title= element_blank(),
           legend.direction='vertical',
           legend.spacing = unit(10, 'cm'),
           axis.ticks.length=unit(0.15,"inch"))
       + scale_x_discrete(expand=c(.05,.05))
       + scale_y_continuous(breaks = c(0,5,10,15,20,25,30,35,40,45,50), limits= c(0,50), expand= expansion(mult=c(0,.2))))
figure9<- (new + coord_capped_cart(left='top')+
             annotation_custom(grob = grid::textGrob(label = "Percent", hjust=0, gp=gpar(col="black", cex=.78)),
                               xmin = -.1, xmax = 1, ymin = 52.5, ymax = 52.5))
ggsave(here::here("voting", "09_full_unmasked.png"))