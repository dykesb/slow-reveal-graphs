

library(tidyverse)
library(gt)
library(gtExtras)

# arrows

up_arrow <- magick::image_read_svg(here::here('St Louis Red Lining Table', 'noun-arrow-1389952.svg')) %>%
  image_scale("x15")

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
    measure = factor(measure, labels = rev(measures)),
    A_diff_B = B - A,
    A_diff_C = C - A,
    A_diff_D = D - A,
    A_diff_B = if_else(A_diff_B > 0, 
                       glue::glue("\U1F845 {if_else(between(A_diff_B, 0, 1), scales::percent(A_diff_B, accuracy = 1), scales::comma(A_diff_B, accuracy = 1))}"), 
                       glue::glue("\U1F847 {if_else(between(A_diff_B, -1, 0), scales::percent(abs(A_diff_B), accuracy = 1), scales::comma(abs(A_diff_B), accuracy = 1))}")),
    
    A_diff_C = if_else(A_diff_C > 0, 
                       glue::glue("\U1F845 {if_else(between(A_diff_C, 0, 1), scales::percent(A_diff_C, accuracy = 1), scales::comma(A_diff_C, accuracy = 1))}"), 
                       glue::glue("\U1F847 {if_else(between(A_diff_C, -1, 0), scales::percent(abs(A_diff_C), accuracy = 1), scales::comma(abs(A_diff_C), accuracy = 1))}")),
    
    A_diff_D = if_else(A_diff_D > 0, 
                       glue::glue("\U1F845 {if_else(between(A_diff_D, 0, 1), scales::percent(A_diff_D, accuracy = 1), scales::comma(A_diff_D, accuracy = 1))}"), 
                       glue::glue("\U1F847 {if_else(between(A_diff_D, -1, 0), scales::percent(abs(A_diff_D), accuracy = 1), scales::comma(abs(A_diff_D), accuracy = 1))}")),
    A = glue::glue("{if_else(between(A, 0, 1), scales::percent(A, accuracy = 1), scales::comma(A, accuracy = 1))}"),
    B = glue::glue("{if_else(between(B, 0, 1), scales::percent(B, accuracy = 1), scales::comma(A_diff_D, accuracy = 1))} {A_diff_B}"),
    C = glue::glue("{C} {A_diff_C}"),
    D = glue::glue("{D} {A_diff_D}"),
    ) %>% 
  select(measure:D)

colors <- c("#81A26B", "#86AEBA", "#CBC361", "#D77085")


# Create a gt table based on preprocessed
stl_table_rotated %>%
  gt(rowname_col = "measure") %>%
  tab_stubhead(label = md("<span style='font-size:100%'>St Louis</span><span style='font-size:50%'>Missouri</span>")) %>% 
  cols_align(align = "left", columns = 1) %>% 
  cols_align(align = "center", columns = 2:5) %>% 
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
  tab_footnote(footnote = md("This infographics provides a set of Esri demographic indicators based on a snapshot for July 1, 2020<br>
                             Adjustments have been made to current year models to reflect the impact of the COVID-19 pandemic.")) %>% 
  tab_style(
    style = list(
      cell_borders(sides = c("left", "right"),
                 color = "#F4F6F6",
                 weight = px(4))
    ),
    locations = cells_body()
  ) %>%
  tab_options(
    table.background.color = "#F4F6F6",
    table.border.top.style = "hidden",
    table.border.bottom.style = "hidden",
    table_body.border.bottom.style = "hidden",
    table_body.hlines.style = "hidden",
    column_labels.font.size = "200%",
    column_labels.font.weight = "bold",
    footnotes.border.bottom.style = "hidden"
  )



