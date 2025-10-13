# DESCRIPTION: Composition of American Voters by Age and Race and Hispanic Origin: 2016


#The following data visualizations are from the U.S. Census Bureau and 
# involved data concerning the characteristics of voters in the presidential election of 2016

#Original Source: https://www.census.gov/content/dam/Census/library/publications/2018/demo/P20-582.pdf

# SLOW REVEAL ORDER: No slow reveal, just completely recreated. 

# AUTHORS:
#   Lauryn Davis (Last edit: 3/27/23)
# Ian Curtis (2023, code to make plots)

library(tidyverse)
library(ggtext)



age_groups= c("18-29 year olds", "30-44 year olds", "45-64 year olds", "65 years and older")
types= c("White non-Hispanic", "Black non-Hispanic", "Other race non-Hispanic", "Hispanic")

pop_colors <- c("#e6cdcb", "#c58887", "#af5d62", "#971c3c")


vote_data<- tibble(
  vote_type = rep(types, 4),
  pop_groups= rep(age_groups, c(4,4,4,4)),
  amount= c(63.3, 15.0, 6.8, 14.9, 68.9, 13.1, 6.8, 11.2, 74.8, 11.9, 5.2, 8.0, 81.7, 8.8, 4.0,5.5), 
  amount1= c("63.3", "15.0", "6.8", "14.9", "68.9", "13.1", "6.8", "11.2", "74.8", "11.9", "5.2", "8.0", "81.7", "8.8", "4.0","5.5"),
  fill= rep(pop_colors, 4)
)
vote_labels <- tibble(
  vote_type= factor(types, levels= types),
)
vote_data<- vote_data%>%
  mutate(vote_type = factor(vote_type, levels= types),
         pop_groups= factor(pop_groups, levels= age_groups),
         fill= factor(fill, levels= pop_colors))
vote_data
area<- (ggplot(vote_data, aes(x = pop_groups, 
                              y = amount, 
                              fill = fill, 
                              label = amount1)) +
          geom_text(size = 3, 
                    position = position_dodge(width=.8), aes(y= amount, hjust= .5), vjust =-.5, color= "black")+
          geom_col(color = "black", linewidth= .2,width= .7, position= position_dodge(width= .8)) +
          scale_fill_manual(values = pop_colors) 
        +
          labs(title = "<span style = 'font-size:11pt; color:#000000'><b>Figure 6.</span></p><p><span style = 'font-size:12pt; color:#a21e3c'><b>Composition of Voters by Age and Race and Hispanic Origin: 2016</span></p>",
               subtitle = "<span style = 'font-size:10pt; color:#000000'>(In Percent)</span>",
               y = "",
               x = "",
               caption = "Source: U.S. Census Bureau, Current Population Survey, November 1980-2016.") + scale_fill_manual(labels= types, values= pop_colors, name = ""))

figure6<- (area + theme_classic()+
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
               axis.line.y = element_blank(),
               axis.text.y= element_blank(),
               axis.line.x = element_line(linewidth=.1),
               axis.text.x= element_text(color= "black"),
               legend.key.height= unit(.2, 'cm'), legend.key.width= unit(.7, 'cm'),
               legend.spacing.x = unit(.1, 'cm'),
               plot.margin = unit(c(.5,.5,.5,.5), "cm"),
               legend.position="top",
               legend.text=element_text(margin=margin(r=.3,unit="inch")))
           + scale_x_discrete(expand=c(.2,0))
           + guides(fill = guide_legend(byrow = TRUE))
           + scale_y_continuous(expand = expansion(mult = c(0, .15))))
ggsave(here::here("voting", "06_full_unmasked.png")) #markdown margins: {r,fig.height= 5, fig.width= 8}

