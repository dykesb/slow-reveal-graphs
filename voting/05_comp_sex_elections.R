
# DESCRIPTION: Composition of American Voters by Sex: Presidential Elections, 1980–2016


#The following data visualizations are from the U.S. Census Bureau and 
# involved data concerning the characteristics of voters in the presidential election of 2016

#Original Source: https://www.census.gov/content/dam/Census/library/publications/2018/demo/P20-582.pdf

# SLOW REVEAL ORDER: No slow reveal, just completely recreated. 

# AUTHORS:
#   Lauryn Davis (Last edit: 3/27/23)
# Ian Curtis (2023, code to save plots)


year_levels <- c("1980","1984", "1988", "1992","1996","2000", "2004", "2008", "2012","2016")
type_levels= c("Male Voters", "Female Voters")

pop_colors <- c("#971c3c", "#e6cdcb")



vote_data<- tibble(
  vote_type = rep(type_levels, 10),
  pop_groups= rep(year_levels, c(2,2,2,2,2,2,2,2,2,2)),
  amount= c(47.0,55.0,46.5,55.5,46.7,55.3,46.8,55.4,46.6,55.4,46.5,55.5,46.5,55.5,46.3,55.7,46.3,55.7,46.4,55.6),
  amount_1= c('47.0','53.0','46.5','53.5','46.7','53.3','46.8','53.4','46.6','53.4','46.5','53.5','46.5', '53.5','46.3','53.7','46.3','53.7','46.4','53.6'),
  fill= rep(pop_colors, 10)
)

vote_labels <- tibble(
  vote_type= factor(type_levels, levels= type_levels),
)
vote_data<- vote_data%>%
  mutate(vote_type = factor(vote_type, levels= type_levels),
         pop_groups= factor(pop_groups, levels= year_levels),
         fill= factor(fill, levels= pop_colors))
area<- ((ggplot(vote_data, aes(x = pop_groups, 
                               y = amount, 
                               fill = fill, 
                               label = amount_1))+
           geom_col(color = "black", linewidth= .2, width=.7)+ geom_text(size = 4, 
                                                                    position = position_stack(vjust = 0.5), color=ifelse(vote_data$vote_type=="Female Voters", 'black', 'white'))) +
          labs(title =  "<p><span style = 'font-size:11pt; color:#000000'><b>Figure 5.</span></p><p><span style = 'font-size:12pt; color:#a21e3c'><b>Composition of American Voters by Age: Presidential Elections, 1980-2016</span></p>",
               subtitle = "<span style = 'font-size:10pt; color:#000000'>(In Percent).</span>",
               y = "",
               x = "",
               caption = "Source: U.S. Census Bureau, Current Population Survey, November 1980-2016.") + scale_fill_manual(labels= type_levels, values= pop_colors, name = "", guide= guide_legend(reverse=TRUE)))
new<- (area+ scale_y_continuous(limits= c(0,103),expand = c(0, 2))+ theme_classic()+
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
                legend.justification = c(0, 0),
                legend.margin = margin(c(-5, 0, 0, 50), "cm"),
                plot.margin = unit(c(-20,.8,.5,-20), "cm"),
                legend.text = element_text(margin = margin(r = 5, unit = "cm"))))





figure5<- new + coord_flip()+ scale_x_discrete(expand=c(.1,0))+ theme(plot.margin = unit(c(.5,.5,.5,.5), "cm"))
ggsave(here::here("voting", "05_full_unmasked.png"))