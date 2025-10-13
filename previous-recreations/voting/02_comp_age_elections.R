# DESCRIPTION:Composition of American Voters by Age: Presidential Elections, 1980–2016
# The following data visualizations are from the U.S. Census Bureau and 
# involved data concerning the characteristics of voters in the presidential election of 2016

#Original Source: https://www.census.gov/content/dam/Census/library/publications/2018/demo/P20-582.pdf

# SLOW REVEAL ORDER: No slow reveal, just completely recreated. 

# AUTHORS:
#   Lauryn Davis (Last edit: 3/27/23)
# Ian Curtis (2023, code to save plots)

library(tidyverse)
library(ggtext)


type_levels= c("65 years and older", "45-64 year olds", "30-44 year olds", "18-29 year olds")

year_levels <- c("1980","1984", "1988", "1992","1996","2000", "2004", "2008", "2012","2016")
pop_colors <- c("#971c3c", "#af5d62","#c58887", "#e6cdcb" )

vote_data <- tibble(
  vote_type = rep(type_levels, 10),
  # Need to rep the pop_group within each vote_type
  pop_group = rep(year_levels, c(4, 4, 4,4,4,4,4,4,4,4)),
  amount =   c(16.8,32.5,28.4,22.3,17.7,30.4,30.2,21.7,19.3,30.5,32.0,18.1,19,30.2,33.1,17.7,20.3,33.0,31.8,14.9,23.0,35.5,27.3,14.3,19.3,37.6,27.3,16.0,19.5,38.7,24.8,17.1,22.3,39.1,23.1,15.4,24.2,37.6,22.5,15.7),
  amount_1 =   c(16.8,32.5,28.4,22.3,17.7,30.4,30.2,21.7,19.4,30.5,"32.0",18.1,"19.0",30.2,33.1,17.7,20.3,"33.0",31.8,14.9,"20.0",35.5,27.3,14.3,"19.0",37.6,27.3,"16.0",19.5,38.7,24.8,17.1,22.3,39.1,23.1,15.4,24.2,37.6,22.5,15.7),
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
           geom_col(color = "black", linewidth= .2, width=.7)+ geom_text(size = 4, 
                                                                    position = position_stack(vjust = 0.5), color=ifelse(vote_data$vote_type=="18-29 year olds", 'black', 'white')))+
          labs(title =  "<p><span style = 'font-size:11pt; color:#000000'><b>Figure 2.</span></p><p><span style = 'font-size:12pt; color:#a21e3c'><b>Composition of American Voters by Age: Presidential Elections, 1980-2016</span></p>",
               subtitle = "<span style = 'font-size:10pt; color:#000000'>(In Percent).</span>",
               y = "",
               x = "",
               caption = "Source: U.S. Census Bureau, Current Population Survey, November 1980-2016.") + scale_fill_manual(labels= type_levels, values= pop_colors, name = "", guide= guide_legend(reverse=TRUE)))
new<- (area+ scale_y_continuous(limits= c(0,103),expand = c(0, 3))+ theme_classic()+
         theme( panel.grid = element_blank(),
                plot.background = element_rect(fill = "white", color = "black"),
                panel.grid.major = element_blank(),
                panel.grid.minor = element_blank(),
                plot.title = element_markdown(hjust=.02),
                plot.title.position = "plot",
                plot.caption.position = "plot",
                plot.subtitle = element_markdown(hjust= .01), 
                plot.caption = element_text(size = 8, color = "black", hjust = 0),
                axis.ticks = element_blank(),
                axis.line.y = element_blank(),
                legend.position= "top",
                axis.line.x = element_blank(),
                axis.text.x= element_blank(),
                axis.text.y= element_text(margin = margin(r = -5), color= "black", size=12),
                legend.key.height = unit(.2, "cm"), legend.key.width= unit(.9, "cm"),
                plot.margin = unit(c(.5,.5,.5,.5), "cm")))




figure2<- new + coord_flip()
ggsave(here::here("voting", "02_full_unmasked.png"))
