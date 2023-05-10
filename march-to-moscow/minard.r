library(tidyverse)
library(ggrepel)

troops <- read.table("~/Everything/March_to_Moscow_Graph/troops.txt", header=T)
cities <- read.table("~/Everything/March_to_Moscow_Graph/cities.txt", header=T)
temps <- read.table("~/Everything/March_to_Moscow_Graph/temps.txt", header=T)
temps$date <- as.Date(strptime(temps$date,"%d%b%Y"))

# library(maps)
# borders <- data.frame(map("world", xlim=c(10,50), ylim=c(40, 80), plot=F)[c("x","y")])

xlim <- scale_x_continuous(limits = c(24, 39))

ggplot(cities, aes(x = long, y = lat)) + 
  geom_path(aes(size = survivors, colour = direction, group = group), 
            data=troops, lineend = "round") + #lineend from https://www.andrewheiss.com/blog/2017/08/10/exploring-minards-1812-plot-with-ggplot2/
  geom_point() + 
  geom_text(aes(label = city), hjust=0, vjust=1, size=4) + 
  labs(title = "Figurative Map of successive losses in men of the French Army in the Russian Campaign 1812-1813",
       subtitle = "Drawn by M. Minard, Inspector General of Bridges and Roads (retired). Paris, November 20, 1869.\n
                   The numbers of men present are represented by the widths of the colored zones at a rate of one millimeter for every ten thousand men; they are further\n
                   written across the zones. The red designates the men who enter Russia, the black those who leave it. — The information which has served to draw up the\n
                   map has been extracted from the works of M. M. Thiers, de Ségur, de Fezensac, de Chambray and the unpublished diary of Jacob, the pharmacist of the\n
                   Army since October 28th.\n
                   In order to better judge with the eye the diminution of the army, I have assumed that the troops of Prince Jérôme and of Marshal Davout, who had been\n
                   detached at Minsk and Mogilev and have rejoined near Orsha and Vitebsk, had always marched with the army.",
       x = "GRAPHIC TABLE of the temperature in degrees of Reaumur thermometer") +
  scale_size(range = c(0.5, 15)) + 
  scale_colour_manual(values = c("#e8ccae","black")) +
  scale_fill_manual(values = c("#e8ccae","black")) +
  theme_bw() +
  theme(legend.position = "none", 
        panel.border = element_blank(),
        panel.grid = element_blank(), 
        axis.ticks = element_blank(),
        axis.text.y = element_blank(),
        axis.title.y = element_blank(),
        axis.text.x = element_blank(),
        axis.line.x.bottom = element_line(color = "black")) +
  xlim




ggsave(file = "march.pdf", width=16, height=4)

qplot(long, temp, data=temps, geom="line") + 
  geom_text(aes(label = paste(day, month)), vjust=1) +
  theme_bw()
  xlim

ggsave(file = "temps.pdf", width=16, height=4)