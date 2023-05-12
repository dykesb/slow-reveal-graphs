library(tidyverse)
library(readxl)
library(scales)

#reading data in
labor <- read_xlsx(here::here("Everything","Labor Force Graph","Labor Force Data.xlsx"))

################# Part 1 #################

#creating original, full graph
# color of line = #0F05A5
ggplot(labor) + 
  
  #creates line and groups linetype by Projected Rate (values = rate & projected rate)
  geom_line(aes(x = Year, y = Percent/100, linetype = Proj), color = "#0F05A5") + 
  
  #removes color legend
  guides(color = FALSE) +
  
  #reverses legend order
  guides(linetype = guide_legend(reverse = TRUE)) +
  
  #manually specifies that rate = solid and proj = longdash
  scale_linetype_manual(values = c("longdash", "solid")) +
  
  #scales y axis so begins at 58, ends at 68, has intervals of 2, starts and ends at 58 & 68, and y = %
  scale_y_continuous(breaks = seq(0.58, 0.68, 0.02), limits = c(0.58, 0.68),
                     expand = c(0,0), labels = label_percent(accuracy = 1)) +
  
  #scales x axis so begins at 1970, ends at 2028, has intervals of 5, and starts and ends accurate
  scale_x_continuous(breaks = seq(1970, 2025, 5), limits = c(1970, 2028), expand = c(0.01,0.01)) + 
  
  #adds title and removes x and y labels and changes linetype legend to blank
  labs(title = "Overall labor force participation rate",
       y = "", x = "", linetype = " ") +
  
  #turns theme of graph to black and white (white bg, black border lines)
  theme_bw() + 
  
  theme(panel.border = element_blank()) + #removes border 
  theme(axis.line = element_line(color = "grey40")) + #turns axes gray
  theme(panel.grid.minor = element_blank()) + #removes minor grid lines       
  theme(panel.grid.major.x = element_blank()) + #removes major x grid lines
  theme(panel.grid.major.y = element_line(linetype = "dotted", color = "grey78")) + #turns major y grid lines to dotted and light gray
  theme(axis.ticks.x = element_blank()) + #removes x axis ticks
  theme(axis.text.x = element_text(size = 10)) + #adjusts size of x axis text
  theme(axis.text.y = element_text(size = 10)) + #adjusts size of y axis text
  theme(axis.ticks.length.y = unit(0.25, "cm")) + #sets length of y tick marks to .25cm
  theme(axis.ticks.y = element_line(color = "grey78")) + #changes color of y tick to gray
  theme(legend.position = "top",
        legend.justification = "center") + #puts legend at top center of graph 
  theme(legend.text = element_text(face = "bold")) + #makes legend text bold
  theme(plot.title = element_text(face = "bold")) + #makes title bold
  theme(plot.title.position = "plot") #positions the title to the left

################# Part 2 #################

#attempting to conceal title

ggplot(labor) + 
  
  #creates line and groups linetype by Projected Rate (values = rate & projected rate)
  geom_line(aes(x = Year, y = Percent/100, linetype = Proj), color = "#0F05A5") + 
  
  #removes color legend
  guides(color = FALSE) +
  
  #reverses legend order
  guides(linetype = guide_legend(reverse = TRUE)) +
  
  #manually specifies that rate = solid and proj = longdash
  scale_linetype_manual(values = c("longdash", "solid")) +
  
  #scales y axis so begins at 58, ends at 68, has intervals of 2, starts and ends at 58 & 68, and y = %
  scale_y_continuous(breaks = seq(0.58, 0.68, 0.02), limits = c(0.58, 0.68),
                     expand = c(0,0), labels = label_percent(accuracy = 1)) +
  
  #scales x axis so begins at 1970, ends at 2028, has intervals of 5, and starts and ends accurate
  scale_x_continuous(breaks = seq(1970, 2025, 5), limits = c(1970, 2028), expand = c(0.01,0.01)) + 
  
  #blank quotes conceal title while rest removes x and y labels and changes linetype legend to blank
  labs(title = " ",
       y = "", x = "", linetype = " ") +
  
  #turns theme of graph to black and white (white bg, black border lines)
  theme_bw() + 
  
  theme(panel.border = element_blank()) + #removes border 
  theme(axis.line = element_line(color = "grey40")) + #turns axes gray
  theme(panel.grid.minor = element_blank()) + #removes minor grid lines       
  theme(panel.grid.major.x = element_blank()) + #removes major x grid lines
  theme(panel.grid.major.y = element_line(linetype = "dotted", color = "grey78")) + #turns major y grid lines to dotted and light gray
  theme(axis.ticks.x = element_blank()) + #removes x axis ticks
  theme(axis.text.x = element_text(size = 10)) + #adjusts size of x axis text
  theme(axis.text.y = element_text(size = 10)) + #adjusts size of y axis text
  theme(axis.ticks.length.y = unit(0.25, "cm")) + #sets length of y tick marks to .25cm
  theme(axis.ticks.y = element_line(color = "grey78")) + #changes color of y tick to gray
  theme(legend.position = "top",
        legend.justification = "center") + #puts legend at top center of graph 
  theme(legend.text = element_text(face = "bold")) + #makes legend text bold
  theme(plot.title = element_text(face = "bold")) + #makes title bold
  theme(plot.title.position = "plot") #positions the title to the left

################# Part 3 #################

#attempting to conceal linetype legend

ggplot(labor) + 
  
  #creates line and groups linetype by Projected Rate (values = rate & projected rate)
  geom_line(aes(x = Year, y = Percent/100, linetype = Proj), color = "#0F05A5") + 
  
  #removes color legend
  guides(color = FALSE) + 
  
  #reverses legend order
  guides(linetype = guide_legend(reverse = TRUE)) +
  
  #manually specifies that rate = solid and proj = longdash
  scale_linetype_manual(values = c("longdash", "solid")) +
  
  #scales y axis so begins at 58, ends at 68, has intervals of 2, starts and ends at 58 & 68, and y = %
  scale_y_continuous(breaks = seq(0.58, 0.68, 0.02), limits = c(0.58, 0.68),
                     expand = c(0,0), labels = label_percent(accuracy = 1)) +
  
  #scales x axis so begins at 1970, ends at 2028, has intervals of 5, and starts and ends accurate
  scale_x_continuous(breaks = seq(1970, 2025, 5), limits = c(1970, 2028), expand = c(0.01,0.01)) + 
  
  #blank quotes conceal title while rest removes x and y labels and changes linetype legend to blank
  labs(title = " ",
       y = "", x = "", linetype = " ") +
  
  #turns theme of graph to black and white (white bg, black border lines)
  theme_bw() + 
  
  theme(panel.border = element_blank()) + #removes border 
  theme(axis.line = element_line(color = "grey40")) + #turns axes gray
  theme(panel.grid.minor = element_blank()) + #removes minor grid lines       
  theme(panel.grid.major.x = element_blank()) + #removes major x grid lines
  theme(panel.grid.major.y = element_line(linetype = "dotted", color = "grey78")) + #turns major y grid lines to dotted and light gray
  theme(axis.ticks.x = element_blank()) + #removes x axis ticks
  theme(axis.text.x = element_text(size = 10)) + #adjusts size of x axis text
  theme(axis.text.y = element_text(size = 10)) + #adjusts size of y axis text
  theme(axis.ticks.length.y = unit(0.25, "cm")) + #sets length of y tick marks to .25cm
  theme(axis.ticks.y = element_line(color = "grey78")) + #changes color of y tick to gray
  theme(legend.position = "top",
        legend.justification = "center") + #puts legend at top center of graph 
  theme(legend.text = element_text(face = "bold")) + #makes legend text bold
  theme(plot.title = element_text(face = "bold")) + #makes title bold
  theme(plot.title.position = "plot") + #positions the title to the left
  theme(legend.position = 'none') #conceals linetype legend

################# Part 4 #################

#attempting to conceal y-axis values

ggplot(labor) + 
  
  #creates line and groups linetype by Projected Rate (values = rate & projected rate)
  geom_line(aes(x = Year, y = Percent/100, linetype = Proj), color = "#0F05A5") + 
  
  #removes color legend
  guides(color = FALSE) + 
  
  #reverses legend order
  guides(linetype = guide_legend(reverse = TRUE)) +
  
  #manually specifies that rate = solid and proj = longdash
  scale_linetype_manual(values = c("longdash", "solid")) +
  
  #scales y axis so begins at 58, ends at 68, has intervals of 2, starts and ends at 58 & 68, and y = %
  scale_y_continuous(breaks = seq(0.58, 0.68, 0.02), limits = c(0.58, 0.68),
                     expand = c(0,0), labels = label_percent(accuracy = 1)) +
  
  #scales x axis so begins at 1970, ends at 2028, has intervals of 5, and starts and ends accurate
  scale_x_continuous(breaks = seq(1970, 2025, 5), limits = c(1970, 2028), expand = c(0.01,0.01)) + 
  
  #blank quotes conceal title while rest removes x and y labels and changes linetype legend to blank
  labs(title = " ",
       y = "", x = "", linetype = " ") +
  
  #turns theme of graph to black and white (white bg, black border lines)
  theme_bw() + 
  
  theme(panel.border = element_blank()) + #removes border 
  theme(axis.line = element_line(color = "grey40")) + #turns axes gray
  theme(panel.grid.minor = element_blank()) + #removes minor grid lines       
  theme(panel.grid.major.x = element_blank()) + #removes major x grid lines
  theme(panel.grid.major.y = element_blank()) + #conceals major y axis grids
  theme(axis.ticks.x = element_blank()) + #removes x axis ticks
  theme(axis.text.x = element_text(size = 10)) + #adjusts size of x axis
  theme(axis.text.y = element_blank()) + #conceals y-axis values
  theme(axis.ticks.length.y = unit(0.25, "cm")) + #sets length of y tick marks to .25cm
  theme(axis.ticks.y = element_line(color = "white")) + #conceals y axis tick marks
  theme(legend.position = "top",
        legend.justification = "center") + #puts legend at top center of graph 
  theme(legend.text = element_text(face = "bold")) + #makes legend text bold
  theme(plot.title = element_text(face = "bold")) + #makes title bold
  theme(plot.title.position = "plot") + #positions the title to the left
  theme(legend.position = 'none') #conceals linetype legend

################# Part 5 #################

#attempting to conceal x-axis values, intial graph with nothing but line

ggplot(labor) + 
  
  #creates line and groups linetype by Projected Rate (values = rate & projected rate)
  geom_line(aes(x = Year, y = Percent/100, linetype = Proj), color = "#0F05A5") + 
  
  #removes color legend
  guides(color = FALSE) + 
  
  #reverses legend order
  guides(linetype = guide_legend(reverse = TRUE)) +
  
  #manually specifies that rate = solid and proj = longdash
  scale_linetype_manual(values = c("longdash", "solid")) +
  
  #scales y axis so begins at 58, ends at 68, has intervals of 2, starts and ends at 58 & 68, and y = %
  scale_y_continuous(breaks = seq(0.58, 0.68, 0.02), limits = c(0.58, 0.68),
                     expand = c(0,0), labels = label_percent(accuracy = 1)) +
  
  #scales x axis so begins at 1970, ends at 2028, has intervals of 5, and starts and ends accurate
  scale_x_continuous(breaks = seq(1970, 2025, 5), limits = c(1970, 2028), expand = c(0.01,0.01)) + 
  
  #blank quotes conceal title while rest removes x and y labels and changes linetype legend to blank
  labs(title = " ",
       y = "", x = "", linetype = " ") +
  
  #turns theme of graph to black and white (white bg, black border lines)
  theme_bw() + 
  
  theme(panel.border = element_blank()) + #removes border 
  theme(axis.line = element_line(color = "grey40")) + #turns axes gray
  theme(panel.grid.minor = element_blank()) + #removes minor grid lines       
  theme(panel.grid.major.x = element_blank()) + #removes major x grid lines
  theme(panel.grid.major.y = element_blank()) + #conceals major y axis grids
  theme(axis.ticks.x = element_blank()) + #removes x axis ticks
  theme(axis.text.x = element_blank()) + #conceals x axis text
  theme(axis.text.y = element_blank()) + #conceals y-axis values
  theme(axis.ticks.length.y = unit(0.25, "cm")) + #sets length of y tick marks to .25cm
  theme(axis.ticks.y = element_line(color = "white")) + #conceals y axis tick marks
  theme(legend.position = "top",
        legend.justification = "center") + #puts legend at top center of graph 
  theme(legend.text = element_text(face = "bold")) + #makes legend text bold
  theme(plot.title = element_text(face = "bold")) + #makes title bold
  theme(plot.title.position = "plot") + #positions the title to the left
  theme(legend.position = 'none') #conceals linetype legend
  