# https://storymaps.arcgis.com/stories/0f58d49c566b486482b3e64e9e5f7ac9?fbclid=IwAR1mHkKvDnZ9IKVgFFa3YQgn5KHzLHz02yhpDYzt2gMpIVI_R53w6BFsrgI

library(tidyverse)
library(gt)
library(gtExtras)
# This would be flexible and I have a license for it: https://github.com/CaRdiffR/nounprojectR
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
measures <- c("Total<br>Population", "Median<br>Home Value", "Median Household<br>Income", "Owner Occupied<br>Housing Units", "Bachelors Degree or<br>Higher")

row_types <- c('num', 'dollar', 'dollar', 'pct', 'pct')


# Ian's "add arrow to diffs" function
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
    A_diff_A = NA_integer_,
    B_diff_A = B - A,
    C_diff_A = C - A,
    D_diff_A = D - A,
    type = row_types)
  
stl_table_format <- stl_table_rotated %>% 
  # https://stackoverflow.com/questions/29873293/dplyr-order-columns-alphabetically-in-r
  select(measure, order(colnames(.)), type) %>% 
  mutate(across(A:D_diff_A, 
                ~case_when(
                  type == "num" ~ scales::comma(., accuracy = 1), 
                  type == "dollar"~ scales::dollar(., accuracy = 1),
                  type == "pct" ~ scales::percent(., accuracy = 1)
                  )
                ),
         across(contains("diff"), gluing)) %>% 
  select(-type)

colors <- c("#81A26B", "#86AEBA", "#CBC361", "#D77085")


# Create a gt table based on preprocessed
stl_table_format %>% 
  gt(rowname_col = "measure") %>%
  tab_stubhead(label = md("<span style='font-size:200%'>St Louis</span><br>
                          <span style='font-size:100%'>Missouri</span>")) %>%
  cols_align(align = "left", columns = 1) %>% 
  # cols_align(align = "center", columns = 2:8) %>% 
  cols_width(measure ~ px(200), everything() ~ px(175)) %>%
  gt_highlight_cols(A, 
                    fill =c("#81A26B")) %>%
  gt_highlight_cols(B, 
                    fill = c("#86AEBA")) %>%
  gt_highlight_cols(C, 
                    fill = c("#CBC361")) %>%
  gt_highlight_cols(D, 
                    fill = c("#D77085")) %>% 
    tab_footnote(footnote = md("<div style='width:200px; float:left; text-align:right; vertical-align:top;'>&nbsp;</div>
    <div style='width:50%; float:left;'>This infographics provides a set of Esri demographic indicators based on a snapshot for July 1, 2020.<br>
  Adjustments have been made to current year models to reflect the impact of the COVID-19 pandemic.<br></div>
                                <div style='width:15%; float:right; text-align:right; vertical-align:top;'>&copy; 2020 Esri<br></div>")) %>%
  tab_style(
    style = list(
      cell_borders(sides = c("left", "right"),
                   color = "#F4F6F6",
                   weight = px(4)),
      cell_text(size = "large")
    ),
    locations = cells_body()
  ) %>%
  cols_merge(
    columns = starts_with("A"),
    pattern = "<div style='text-align:center; color:#ffffff; font-size:150%'>{1}</div>
                <div style='color:#81A26B; font-size:75%; width: 100%; margin: 0 auto; text-indent: 50%;'>{2}</div>"
  ) %>% 
  cols_merge(
    columns = starts_with("B"),
    pattern = "<div style='text-align:center; color:#ffffff; font-size:150%'>{1}</div>
                 <div style='width:50%; float:left;'></div><div style='width:50%; float:right; color:#000000; font-size:75%; text-align:left;'>{2}</div>"
  ) %>% 
  cols_merge(
    columns = starts_with("C"),
    pattern = "<div style='text-align:center; color:#ffffff; font-size:150%'>{1}</div>
                 <div style='width:50%; float:left;'></div><div style='width:50%; float:right; color:#000000; font-size:75%; text-align:left;'>{2}</div>"
  ) %>% 
  cols_merge(
    columns = starts_with("D"),
    pattern = "<div style='text-align:center; color:#ffffff; font-size:150%'>{1}</div>
                 <div style='width:50%; float:left;'></div><div style='width:50%; float:right; color:#000000; font-size:75%; text-align:left;'>{2}</div>"
  ) %>%
  cols_label(
    A = md("<div style='text-align:center; font-size:200%;'>A</div>"),
    B = md("<div style='text-align:center; font-size:200%;'>B</div>"),
    C = md("<div style='text-align:center; font-size:200%;'>C</div>"),
    D = md("<div style='text-align:center; font-size:200%;'>D</div>")
  
  tab_options(
    table.background.color = "#F4F6F6",
    table.border.top.style = "hidden",
    table.border.bottom.style = "hidden",
    table_body.border.bottom.style = "hidden",
    table_body.hlines.style = "hidden",
    column_labels.font.weight = "bold",
    footnotes.font.size = "55%",
    footnotes.border.bottom.style = "hidden",
    # footnotes.padding.horizontal = px(205), # Find more efficient way to handle - px(#) isn't what I want either
    column_labels.border.bottom.color = "#F4F6F6",
    row_group.padding = px(0),
    row_group.as_column = TRUE,
    #   table.width = px(1000)
  )


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
    footnotes.font.size = 10,
    footnotes.border.bottom.style = "hidden",
    footnotes.padding.horizontal = 163, # Find more efficient way to handle - px(#) isn't what I want either
    column_labels.border.bottom.color = "#F4F6F6",
    row_group.padding = px(0),
    row_group.as_column = TRUE,
  #   table.width = px(1000)
  )

table

gtsave_extra(table, "St Louis Red Lining Table/table.png")
