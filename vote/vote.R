library(tidyverse)
library(readxl)
library(scales)

#reading data in
vote <- read_xlsx(here::here("Everything","Vote","VoteData1.xlsx"))

votew1 <- subset(vote, Gender != "Men") 

votem1 <- subset(vote, Gender != "Women")

################# Part 1 #################

#creating first, full graph
ggplot(vote, aes(x = Year, y = Percent, Group = Gender)) + 
  geom_line(aes(color = Gender)) + 
  geom_point(aes(color = Gender)) + 
  labs(title = "Figure 1. Proportion of Eligble Adult Population Who Reported Voting",
       x = " ") + 
  scale_color_manual(values = c("#789050","#5d4c7b")) +  
  scale_y_continuous(breaks = seq(52, 70, 2), limits = c(52, 70), 
                     labels = number_format(accuracy = 0.1), expand = c(0,0)) + 
  scale_x_continuous(breaks = seq(1980, 2016, 4), limits = c(1980, 2016), , expand = c(0.05,0.05)) + 
  geom_text(votew1, mapping = aes(label = Percent), position = position_dodge(width = 0.9), vjust = -1.5, size = 3) + 
  geom_text(votem1, mapping = aes(label = Percent), position = position_dodge(width = 0.9), vjust = 2.5, size = 3) +
  theme_bw() + 
  theme(panel.grid.minor = element_blank()) + 
  theme(panel.grid.major.x = element_blank()) + 
  theme(axis.ticks = element_blank()) +
  theme(legend.position = c(0.5, -0.3)) + 
  theme(legend.direction = "horizontal") +
  theme(legend.title = element_blank()) +
  theme(plot.title = element_text(hjust = 0.5, vjust = 4, face = "bold", size = 13)) +
  theme(axis.title.y = element_text(size = 9)) + 
  theme(legend.key.size = unit(2, "line")) +
  coord_fixed(ratio = 0.5) #changes the ratio of the x and y axis to create rectangular graph


################# Part 2 #################

vote2 <- read_xlsx(here::here("Vote", "VoteData2.xlsx"))

votew2 <- subset(vote2, Gender != "Men Who Reported Voting") 

votem2 <- subset(vote2, Gender != "Women Who Reported Voting")

#creating second, full graph
ggplot(vote2, aes(x = Year, y = Number, Group = Gender)) + 
  geom_line(aes(color = Gender)) + 
  geom_point(aes(color = Gender)) + 
  labs(title = "Figure 2. Number Who Reported Voting",
       x = " ", y = "Number (in millions)") + 
  scale_color_manual(values = c("#789050","#5d4c7b")) +  
  scale_y_continuous(breaks = seq(0, 90, 10), limits = c(0, 90), 
                     labels = number_format(accuracy = 1), expand = c(0,0)) + 
  scale_x_continuous(breaks = seq(1964, 2016, 4), limits = c(1964, 2016), , expand = c(0.05,0.05)) + 
  geom_text(votew2, mapping = aes(label = Number), position = position_dodge(width = 0.9), vjust = -1.5, size = 3) + 
  geom_text(votem2, mapping = aes(label = Number), position = position_dodge(width = 0.9), vjust = 2.5, size = 3) +
  theme_bw() + 
  theme(panel.grid.minor = element_blank()) + 
  theme(panel.grid.major.x = element_blank()) + 
  theme(axis.ticks = element_blank()) +
  theme(legend.position = c(0.5, -0.3)) + 
  theme(legend.direction = "horizontal") +
  theme(legend.title = element_blank()) +
  theme(plot.title = element_text(hjust = 0.5, vjust = 4, face = "bold", size = 13)) +
  theme(axis.title.y = element_text(size = 9)) + 
  theme(legend.key.size = unit(2, "line")) +
  theme(axis.title.y = element_text(face = "bold", size = 10)) +
  coord_fixed(ratio = 0.2) #changes the ratio of the x and y axis to create rectangular graph

