# DESCRIPTION: Composition of American Voters by Race and Hispanic Origin: Presidential Elections, 1980–2016 

#The following data visualizations are from the U.S. Census Bureau and 
# involved data concerning the characteristics of voters in the presidential election of 2016

#Original Source: https://www.census.gov/content/dam/Census/library/publications/2018/demo/P20-582.pdf

# SLOW REVEAL ORDER: No slow reveal, just completely recreated. 

# AUTHORS:
#   Lauryn Davis (Last edit: 3/27/23)
# Ian Curtis (2023, code to save plots)

library(tidyverse)
library(ggtext)


type_levels= c("White non-Hispanic", "Black non-Hispanic", "Other race non-Hispanic", "Hispanic")
year_levels <- c("1980","1984", "1988", "1992","1996","2000", "2004", "2008", "2012","2016")
pop_colors <- c("#971c3c", "#af5d62","#c58887", "#e6cdcb" )

vote_data <- tibble(
  vote_type = rep(type_levels, 10),
  # Need to rep the pop_group within each vote_type
  pop_group = rep(year_levels, c(4, 4, 4,4,4,4,4,4,4,4)),
  amount =   c(3,1,8.9,87,3,1.4,10,85.5,3.6,1.7,9.8,84.9,3.7,1.7,9.9,84.6,
               4.7,2.2,10.6,82.5,5.4,2.4,11.5,80.7,6.0,3.8,11,79.2,7.4,4.2,12.1,76.3,8.4,
               4.9,12.9,73.7,9.2,5.5,11.9,73.3),
  amount_1 =   c(2.6,"",8.9,87.6,"3.0","","10.0",85.5,3.6,"",9.8,84.9,3.7,"",9.9,84.6,
                 4.7,2.2,10.6,82.5,5.4,2.4,11.5,80.7,"6.0",3.8,"11.0",79.2,7.4,4.2,12.1,76.3,8.4,
                 4.9,12.9,73.7,9.2,5.5,11.9,73.3),
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
                                                                    position = position_stack(vjust = 0.5), color=ifelse(vote_data$vote_type=="Hispanic", 'black', 'white'))) +
          labs(title =  "<span style = 'font-size:11pt; color:#000000'><b>Figure 3.</span></p><span style = 'font-size:12pt; color:#a21e3c'><p><b>Composition of American Voters by Race and Hispanic Origin: Presidential Elections,</p><p><span style = 'font-size:12pt; color:#a21e3c'><b> 1980-2016</p></span>",
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
                legend.key.height = unit(.2, "cm"), legend.key.width= unit(.7, "cm"),
                plot.margin = unit(c(.5,.5,.5,.5), "cm")))


figure3<- new+ coord_flip()+ 
  annotate("text", x = 4, y = 103, label = "1.7", size = 4.5)+ 
  annotate("text", x = 3, y = 103, label = "1.7", size = 4.5)+
  annotate("text", x = 2, y = 103, label = "1.4", size = 4.5)+
  annotate("text", x = 1, y = 103, label = "1.0", size = 4.5)+
  geom_segment(aes(x = .7, xend = .5, y = 103, yend = 103), linewidth=.05)+
  geom_segment(aes(x = .5, xend = .5, y = 103, yend = 96.3), linewidth=.05)+
  geom_segment(aes(x = .5, xend = .7, y = 96.3, yend = 96.3), linewidth=.05)+
  #Second bar segemnt:
  geom_segment(aes(x = 1.65, xend = 1.5, y = 103, yend = 103), linewidth=.05)+
  geom_segment(aes(x = 1.5, xend = 1.5, y = 103, yend = 96), linewidth=.05)+
  geom_segment(aes(x = 1.5, xend = 1.65, y = 96, yend = 96), linewidth=.05)+
  # Third Bar Segment:
  geom_segment(aes(x = 2.6, xend = 2.45, y = 103, yend = 103), linewidth=.05)+
  geom_segment(aes(x = 2.45, xend = 2.45, y = 103, yend = 95), linewidth=.05)+
  geom_segment(aes(x = 2.45, xend = 2.6, y = 95, yend = 95), linewidth=.05)+
  #Fourth Bar Segment:
  geom_segment(aes(x = 3.65, xend = 3.45, y = 103, yend = 103), linewidth=.05)+
  geom_segment(aes(x = 3.45, xend = 3.45, y = 103, yend = 95), linewidth=.05)+
  geom_segment(aes(x = 3.45, xend = 3.65, y = 95, yend = 95), linewidth=.05)

ggsave(here::here("voting", "03_full_unmasked.png"))