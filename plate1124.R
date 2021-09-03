library(tidyverse)
# library(ggrough)
library(ggtext)
library(showtext)

font_add_google(name = "Nixie One", "nixie_one")

illiteracy <- tibble(
  country = c("Roumanie", "Servie", "Russie", "Negroes, U. S. A.", "Hongrie", "Italie", "Autriche", "Ireland", "France", "Suéde"),
  proportion = c(714, 707, 705, 581, 574, 477, 409, 331, 234, 136) - 132,
  fill = c(rep("#588860", 3), "#A90834", rep("#588860", 6)) 
)

illiteracy <- illiteracy %>% 
  mutate(country = fct_reorder(country, proportion))

showtext_auto()

illiteracy %>% 
  ggplot(aes(y = country, x = proportion, fill = fill)) +
  geom_col(width = 0.5, colour = "black", size = 0.00001) +
  scale_fill_identity(breaks = fill) +
  scale_x_continuous(limits = c(0, 650)) +
  labs(title = "Illiteracy of the American Negroes compared with that of other nations.",
       subtitle = "Proportion d' illettrés parmi les Nègres Americains comparée à celle des autres nations.\n\nDone by Atlanta University.",
       y = "",
       x = "") +
  theme(plot.background = element_rect(fill = "#E4D7C8", color = NA),
        panel.background = element_blank(),
        panel.grid = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_text(hjust = 0, size = 6, face = "bold"),
        plot.title = element_text(hjust = 0.5,
                                  margin = unit(c(6, 0, 3, 0), "mm"),
                                  face = "plain", size = 8),
        plot.subtitle = element_text(hjust = 0.5,
                                     margin = unit(c(0, 0, 20, 0), "mm"),
                                     size = 6),
        text = element_text(family = "nixie_one")
        )
ggsave(here::here("plate_1124_04.png"), 
       last_plot(), 
       device = "png",
       width = 537, height = 591, units = "px",
       dpi = 100)

# no title
illiteracy %>% 
  ggplot(aes(y = country, x = proportion, fill = fill)) +
  geom_col(width = 0.5, colour = "black", size = 0.00001) +
  scale_fill_identity(breaks = fill) +
  scale_x_continuous(limits = c(0, 650)) +
  labs(title = "Illiteracy of the American Negroes compared with that of other nations.",
       subtitle = "Proportion d' illettrés parmi les Nègres Americains comparée à celle des autres nations.\n\nDone by Atlanta University.",
       y = "",
       x = "") +
  theme(plot.background = element_rect(fill = "#E4D7C8", color = NA),
        panel.background = element_blank(),
        panel.grid = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_text(hjust = 0, size = 6, face = "bold"),
        plot.title = element_text(hjust = 0.5,
                                  margin = unit(c(6, 0, 3, 0), "mm"),
                                  face = "plain", size = 8, colour = NA),
        plot.subtitle = element_text(hjust = 0.5,
                                     margin = unit(c(0, 0, 20, 0), "mm"),
                                     size = 6, colour = NA),
        text = element_text(family = "nixie_one")
  )
ggsave(here::here("plate_1124_03.png"), 
       last_plot(), 
       device = "png",
       width = 537, height = 591, units = "px",
       dpi = 100)


# no title
illiteracy %>% 
  ggplot(aes(y = country, x = proportion, fill = fill)) +
  geom_col(width = 0.5, colour = "black", size = 0.00001) +
  scale_fill_identity(breaks = fill) +
  scale_x_continuous(limits = c(0, 650)) +
  labs(title = "Illiteracy of the American Negroes compared with that of other nations.",
       subtitle = "Proportion d' illettrés parmi les Nègres Americains comparée à celle des autres nations.\n\nDone by Atlanta University.",
       y = "",
       x = "") +
  theme(plot.background = element_rect(fill = "#E4D7C8", color = NA),
        panel.background = element_blank(),
        panel.grid = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_text(hjust = 0, size = 6, face = "bold"),
        plot.title = element_text(hjust = 0.5,
                                  margin = unit(c(6, 0, 3, 0), "mm"),
                                  face = "plain", size = 8, colour = NA),
        plot.subtitle = element_text(hjust = 0.5,
                                     margin = unit(c(0, 0, 20, 0), "mm"),
                                     size = 6, colour = NA),
        text = element_text(family = "nixie_one")
  )
ggsave(here::here("plate_1124_02.png"), 
       last_plot(), 
       device = "png",
       width = 537, height = 591, units = "px",
       dpi = 100)

# only US
illiteracy %>% 
  ggplot(aes(y = country, x = proportion, fill = fill)) +
  geom_col(width = 0.5, colour = "black", size = 0.00001) +
  scale_fill_identity(breaks = fill) +
  scale_x_continuous(limits = c(0, 650)) +
  labs(title = "Illiteracy of the American Negroes compared with that of other nations.",
       subtitle = "Proportion d' illettrés parmi les Nègres Americains comparée à celle des autres nations.\n\nDone by Atlanta University.",
       y = "",
       x = "") +
  geom_text(data = illiteracy %>% filter(country == "Negroes, U. S. A."),
            aes(y = country, label = country), x = -98, size = 2, family = "nixie_one") +
  theme(plot.background = element_rect(fill = "#E4D7C8", color = NA),
        panel.background = element_blank(),
        panel.grid = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_text(hjust = 0, size = 6, face = "bold", colour = NA), # , colour = NA
        plot.title = element_text(hjust = 0.5,
                                  margin = unit(c(6, 0, 3, 0), "mm"),
                                  face = "plain", size = 8, colour = NA),
        plot.subtitle = element_text(hjust = 0.5,
                                     margin = unit(c(0, 0, 20, 0), "mm"),
                                     size = 6, colour = NA),
        text = element_text(family = "nixie_one")
  ) +
  coord_cartesian(clip = "off")
ggsave(here::here("plate_1124_01.png"), 
       last_plot(), 
       device = "png",
       width = 537, height = 591, units = "px",
       dpi = 100)


# no axis labels
illiteracy %>% 
  ggplot(aes(y = country, x = proportion, fill = fill)) +
  geom_col(width = 0.5, colour = "black", size = 0.00001) +
  scale_fill_identity(breaks = fill) +
  scale_x_continuous(limits = c(0, 650)) +
  labs(title = "Illiteracy of the American Negroes compared with that of other nations.",
       subtitle = "Proportion d' illettrés parmi les Nègres Americains comparée à celle des autres nations.\n\nDone by Atlanta University.",
       y = "",
       x = "") +
  theme(plot.background = element_rect(fill = "#E4D7C8", color = NA),
        panel.background = element_blank(),
        panel.grid = element_blank(),
        axis.ticks = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_text(hjust = 0, size = 6, face = "bold", colour = NA),
        plot.title = element_text(hjust = 0.5,
                                  margin = unit(c(6, 0, 3, 0), "mm"),
                                  face = "plain", size = 8, colour = NA),
        plot.subtitle = element_text(hjust = 0.5,
                                     margin = unit(c(0, 0, 20, 0), "mm"),
                                     size = 6, colour = NA),
        text = element_text(family = "nixie_one")
  )
ggsave(here::here("plate_1124_00.png"), 
       last_plot(), 
       device = "png",
       width = 537, height = 591, units = "px",
       dpi = 100)
