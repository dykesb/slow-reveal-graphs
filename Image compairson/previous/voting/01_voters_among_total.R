
# DESCRIPTION:Voters Among the Total, Citizen, and Registered Voting-Age Populations: 2016
# The following data visualizations are from the U.S. Census Bureau and 
# involved data concerning the characteristics of voters in the presidential election of 2016

#Original Source: https://www.census.gov/content/dam/Census/library/publications/2018/demo/P20-582.pdf

# SLOW REVEAL ORDER: No slow reveal, just completly recreated. 

# AUTHORS:
#   Lauryn Davis (Last edit: 3/27/23)
# Ian Curtis (2023, code to save plots)

library(tidyverse)
library(ggtext)


# Create group levels
type_levels <- c("Noncitizens", 
                 "No response to\nvoting question", 
                 "Nonvoters", 
                 "Voters")
pop_levels <- c("Voting-age\npopulation\n245,502", "Citizen\npopulation\n224,059", "Registered\npopulation\n157,596")
pop_colors <- c("#af5d62", "#e6cdcb", "#c58887", "#971c3c")

# Create data for graph
vote_data <- tibble(
  vote_type = rep(type_levels, 3),
  # Need to rep the pop_group within each vote_type
  pop_group = rep(pop_levels, c(4, 4, 4)),
  amount = c(21433, 32662, 53860, 137537, 0, 32662, 53860, 137537, 0, 1127, 18933, 137537),
  fill = rep(pop_colors, 3),
  amount1 = c("21,433", "32,662", "53,860", "137,537\n\n (56.0%)", "", "32,662", "53,860", "137,537\n\n(61.4%)", "", "", "18,933", "137,537\n\n(87.3%)")
)

vote_data <- vote_data %>% 
  mutate(vote_type = factor(vote_type, levels = type_levels),
         pop_group = factor(pop_group, levels = c("", pop_levels)),
         fill = factor(fill, levels = pop_colors))

# Create text "dataset"
# Determine height of text based on midpoint of bar
heights <- c(137537 + 53860 + 32662 + (21443/2),
             137537 + 53860 + (32662/2),
             137537 + (53860/2),
             (137537*2/3),
             (137537/3),
             NA,
             137537 + 53860 + (32662/2),
             137537 + (53860/2),
             (137537*2/3),
             (137537/3),
             NA,
             NA,
             137537 + (18933/2),
             (137537*2/3),
             (137537/3))

vote_labels <- tibble(
  pop_group = rep(c(pop_levels), c(5, 5, 5)),
  amount = heights,
  label = c("21,433", "32,662", "53,860", "137,537", "(56.0%)", 
            NA, "32,662", "53,860", "137,537", "(61.4%)", 
            NA, NA, "18,933", "137,537", "(87.3%)"),
  color = c(rep(c("a", "b", "a", "a", "a"), 3))
) %>% 
  mutate(pop_group = factor(pop_group, levels = c("", pop_levels)))

area <- ggplot(vote_data, aes(x = pop_group, y = amount)) +
  geom_col(aes(fill = vote_type), color = "black", linewidth = .2, width=.9) +
  geom_segment(aes(x = 3.43, xend = 3.53, y = 157000, yend = 157000), linewidth=.1) +
  geom_segment(aes(x = 3.53, xend = 3.53, y = 157000, yend = 170000), linewidth= .05) +
  geom_segment(aes(x = 3.35, xend = 3.53, y = 170000, yend = 170000), linewidth=.1) +
  # geom_segment(aes(x = .5, xend = 7, y = 0, yend = 0)) +
  # Plot labels "dataset"
  geom_richtext(data = vote_labels, aes(x = pop_group, y = amount, label = label, color = color),
                fill = NA, label.color = NA, size = 3.5) +
  # This is similar to geom_bar except don't need to specify stat = "identity"
  # Add black border around bars
  scale_fill_manual(values = pop_colors, guide = "none") +
  scale_color_manual(values = c("white", "black"), guide = "none") +
  # Using ggtext + HTML syntax to color text
  # For some reason '\n' doesn't work here so I used <br> instead.
  labs(title = "<p><span style = 'font-size:11pt; color:#000000'><b>Figure 1.</span></p><p><span style = 'font-size:12pt; color:#a21e3c'><b>Voters Among the Total, Citizen, and Registered</p><p><span style = 'font-size:12pt; color:#a21e3c'><b>Voting-Age Population: 2016</span></p>",
       subtitle = "(Population 18 years and older, in thousands)",
       y = "",
       x = "",
       caption = "* Represents those who were registered with no response to initial voting question.\nSource: U.S. Census Bureau, Current Population Survey, November 2016")


new <- area +
  theme_classic() +
  scale_x_discrete(limits = c(pop_levels)) + 
  scale_y_continuous(breaks = c(137537 + 53860 + 32662 + (21443/2),
                                137537 + 53860 + (32662/2),
                                137537 + (53860/2),
                                (137537*2/3),
                                (137537/3)), 
                     labels = c(type_levels, "(Voting rate)"),
                     expand = expansion(mult = c(0, 0.15))) + 
  theme(
    # Needed for using HTML syntax in plot title
    # plot.title = element_markdown(), 
    # Cleaned up some redundancies and combined your theme changes into one layer
    panel.grid = element_blank(),
    plot.background = element_rect(fill = "white", color = "black"),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    plot.title = element_markdown(hjust=.2),
    plot.title.position = "plot",
    plot.caption.position = "plot",
    plot.subtitle = element_text(size = 10, color = "black", hjust=.1), 
    plot.caption = element_text(size = 8, color = "black", hjust = 0),
    axis.ticks = element_blank(),
    axis.line.y = element_blank(),
    axis.text.x= element_text(color="black"),
    axis.text.y = element_text(size = 11, color= "black"),
    plot.margin = unit(c(.5,.5,.5,.5), "cm")) +
  annotate("text", x = 3.15, y = 172000, label = "1,127*", size = 3.5) 

ggsave(here::here("voting", "01_full_unmasked.png"))