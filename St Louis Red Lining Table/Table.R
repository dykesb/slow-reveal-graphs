# https://storymaps.arcgis.com/stories/0f58d49c566b486482b3e64e9e5f7ac9?fbclid=IwAR1mHkKvDnZ9IKVgFFa3YQgn5KHzLHz02yhpDYzt2gMpIVI_R53w6BFsrgI

library(tidyverse)
library(gt)
library(gtExtras)
library(fontawesome)

# arrows

# up_arrow <- magick::image_read_svg(here::here('St Louis Red Lining Table', 'noun-arrow-1389952.svg')) %>%
#   image_scale("x15")


# tidy dataframe
stl_table <- tibble(
  grade = LETTERS[1:4],
  tot_population = c(68039, 194093, 133399, 61555),
  med_home_value = c(336060, 151215, 126725, 176597),
  med_hshld_inc = c(82347, 50409, 40748, 35654),
  owner_occ_housing = c(0.58, 0.52, 0.49, 0.32),
  bach_or_higher = c(0.66, 0.41, 0.28, 0.33)
) 

# descriptive names
measures <- c("Total\nPopulation", "Median\nHome Value", "Median Household\nIncome", "Owner Occupied\nHousing Units", "Bachelors Degree or\nHigher")

row_types <- c('num', 'dollar', 'dollar', 'pct', 'pct')

# rotated dataframe
stl_table_rotated <- stl_table %>% 
  pivot_longer(
    cols = tot_population:bach_or_higher,
    names_to = "measure",
    values_to = "values"
  ) %>% 
  pivot_wider(
    id_cols = measure,
    names_from = grade,
    values_from = values
  ) %>% 
  mutate(
    measure = measures,
    A_diff_B = B - A,
    A_diff_C = C - A,
    A_diff_D = D - A,
    type = row_types,
    across(where(is.factor), as.character))

stl_table_format <- stl_table_rotated %>% 
  pivot_longer(cols = A:A_diff_D, names_to = "var", values_to = "values") %>% 
  pivot_wider(names_from = type, values_from = values) %>% 
  mutate(num = scales::comma(num, accuracy = 1),
         dollar = scales::dollar(dollar, accuracy = 1),
         pct = scales::percent(pct, accuracy = 1)) %>% 
  pivot_longer(cols = num:pct, names_to = "type", values_to = "values") %>% 
  select(-type) %>% 
  na.omit() %>% 
  pivot_wider(names_from = var, values_from = values) #%>% 
  # mutate(
  #   A_diff_B = if_else(str_starts(A_diff_B, "-"),
  #                      gluing(A_diff_B, NULL,  "down"),
  #                      gluing(A_diff_B, NULL, "up")),
  # 
  #   A_diff_C = if_else(str_starts(A_diff_C, "-"),
  #                      gluing(A_diff_C, NULL, "down"),
  #                      gluing(A_diff_C, NULL, "up")),
  # 
  #   A_diff_D = if_else(str_starts(A_diff_D, "-"),
  #                      gluing(A_diff_D, NULL, "down"),
  #                      gluing(A_diff_D, NULL, "up")),
    # B = gluing(B, A_diff_B, "together"),
    # C = gluing(C, A_diff_C, "together"),
    # D = gluing(D, A_diff_D, "together"),
    #)


stl_table_glued <- rbind(stl_table_format[1,], 
      c(measures[1], " ", unname(stl_table_format[1, 6]), unname(stl_table_format[1, 7]), unname(stl_table_format[1, 8]), " ", " ", " "), 
      stl_table_format[2,],
      c(measures[2], " ", unname(stl_table_format[2, 6]), unname(stl_table_format[2, 7]), unname(stl_table_format[2, 8]), " ", " ", " "),
      stl_table_format[3,],
      c(measures[3], " ", unname(stl_table_format[3, 6]), unname(stl_table_format[3, 7]), unname(stl_table_format[3, 8]), " ", " ", " "),
      stl_table_format[4,],
      c(measures[4], " ", unname(stl_table_format[4, 6]), unname(stl_table_format[4, 7]), unname(stl_table_format[4, 8]), " ", " ", " "),
      stl_table_format[5,],
      c(measures[5], " ", unname(stl_table_format[5, 6]), unname(stl_table_format[5, 7]), unname(stl_table_format[5, 8]), " ", " ", " ")) %>% 
  select(measure:D) %>% 
  add_column(names = c(rep("", 10)), .before = "A")



colors <- c("#81A26B", "#86AEBA", "#CBC361", "#D77085")

gluing <- function(x) {
  lapply(x, function(x) {
    if (grepl("^-", x)) {
      x <- str_remove(x, "-")
      html(
        paste(fa("down-long"), "<span>", x, "</span>")
      )
    }
    else if (grepl("^ ", x)){
      x
    }
    else {
      html(
        paste(fa("up-long"), "<span>", x, "</span>")
      )
    }
  }
    )
}

# Looks pretty good. I still want to move the black text (with arrows) higher up closer to the 
# corresponding row above

# Create a gt table based on preprocessed
table <- stl_table_glued %>%
  gt(rowname_col = "names", groupname_col = "measure") %>%
  tab_stubhead(label = md("<span style='font-size:100%'>St Louis</span><br><span style='font-size:50%'>Missouri</span>")) %>%
  cols_align(align = "left", columns = 1) %>% 
  cols_align(align = "center", columns = 2:6) %>% 
  gt_highlight_cols(A, 
                    fill =c("#81A26B"), 
                    font_color = "#ffffff", 
                    font_weight = "bold") %>%
  gt_highlight_cols(B, 
                    fill = c("#86AEBA"), 
                    font_color = "#ffffff", 
                    font_weight = "bold") %>%
  gt_highlight_cols(C, 
                    fill = c("#CBC361"), 
                    font_color = "#ffffff", 
                    font_weight = "bold") %>%
  gt_highlight_cols(D, 
                    fill = c("#D77085"), 
                    font_color = "#ffffff", 
                    font_weight = "bold") %>% 
  cols_width(names ~ px(150), A ~ px(1)) %>%
  tab_footnote(footnote = md("This infographics provides a set of Esri demographic indicators based on a snapshot for July 1, 2020.<br>
  Adjustments have been made to current year models to reflect the impact of the COVID-19 pandemic.")) %>%
  tab_style(
    style = list(
      cell_borders(sides = c("left", "right"),
                 color = "#F4F6F6",
                 weight = px(4)),
      cell_text(size = "large")
    ),
    locations = cells_body()
  ) %>%
  tab_style(
    style = list(
      cell_text(size = "small", color = "black", indent = pct(20)),
      "padding-top:-10"
    ),
    locations = cells_body(
      rows = c(2, 4, 6, 8, 10)
    )
  ) %>%
  tab_style(
    style = list(
      cell_borders(sides = c("left", "right"), color = "#F4F6F6", weight = NULL)
    ),
    locations = cells_row_groups()
  ) %>%
  text_transform(
    locations = cells_body(rows = c(2, 4, 6, 8, 10)),
    fn = gluing
  ) %>%
  tab_options(
    table.background.color = "#F4F6F6",
    table.border.top.style = "hidden",
    table.border.bottom.style = "hidden",
    table_body.border.bottom.style = "hidden",
    table_body.hlines.style = "hidden",
    column_labels.font.size = "200%",
    column_labels.font.weight = "bold",
    footnotes.border.bottom.style = "hidden",
    column_labels.border.bottom.color = "#F4F6F6",
    row_group.padding = px(0),
    row_group.as_column = TRUE,
  #   table.width = px(1000)
  )

gtsave_extra(table, "St Louis Red Lining Table/table.png")
