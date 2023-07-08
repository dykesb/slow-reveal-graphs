# https://storymaps.arcgis.com/stories/0f58d49c566b486482b3e64e9e5f7ac9?fbclid=IwAR1mHkKvDnZ9IKVgFFa3YQgn5KHzLHz02yhpDYzt2gMpIVI_R53w6BFsrgI

library(tidyverse)
library(gt)
library(gtExtras)
# This would be flexible and I have a license for it: https://github.com/CaRdiffR/nounprojectR
library(fontawesome)

# Exploring shapes
library(showtext)
library(magick)
library(ggimage)
library(cowplot)

font_add_google(name = "Quicksand", family = "Quicksand")
showtext_auto()

# users -> https://thenounproject.com/icon/users-305946/
# home-value -> https://thenounproject.com/icon/house-2073531/
# circle-dollar -> https://thenounproject.com/icon/dollar-coin-175492/
# home -> https://thenounproject.com/icon/home-1145426/
# grad-cap -> https://thenounproject.com/icon/graduation-3006064/

users <- "https://thenounproject.com/api/private/icons/305946/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0"
home_value <- "https://thenounproject.com/api/private/icons/2073531/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0"
circle_dollar <- "https://thenounproject.com/api/private/icons/175492/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0"
house <- "https://thenounproject.com/api/private/icons/1145426/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0"
grad_cap <- "https://thenounproject.com/api/private/icons/3006064/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0"

# https://stackoverflow.com/questions/62006992/how-to-add-image-to-a-ggplot

pents <- function(url, text_line_1, text_line_2, fig_name){
  
  icon <- image_read(url)
  
  white_icon <- icon %>% 
    image_colorize(100, "#ffffff") %>% 
    image_scale("x100")

  main_verts <- tibble(
    x = c(0, 4, 4.5, 4, 0),
    y = c(1, 1, 0.5, 0, 0)
  )
  border_verts <- tibble(
    x = c(-0.02, 4.02, 4.52, 4.02, -0.02),
    y = c(1.015, 1.015, 0.5, -0.015, -0.015)
  )
  shadow_verts <- tibble(
    x = c(0, 4.05, 4.55, 4.05, 0),
    y = c(1, 1, 0.48, -0.03, -0.03)
  )
  
  pent <- ggplot() + 
    geom_polygon(data = shadow_verts, 
                 mapping = aes(x = x, y = y), 
                 fill = "#ADADAD") + 
    geom_polygon(data = border_verts, 
                 mapping = aes(x = x, y = y), 
                 fill = "#ffffff") + 
    geom_polygon(data = main_verts, 
                 mapping = aes(x = x, y = y), 
                 fill = "#404040") + 
    coord_fixed() +
    annotate("text", x = 1.05, y = 0.65, label = paste0("bold('",text_line_1,"')"),
              colour = "#ffffff", family = "Quicksand", size = 6, hjust = 0, parse = TRUE) +
    annotate("text", x = 1.05, y = 0.35, label = paste0("bold('",text_line_2,"')"),
              colour = "#ffffff", family = "Quicksand", size = 6, hjust = 0, parse = TRUE) +
    theme_void() +
    theme(plot.margin=grid::unit(c(0,0,0,0), "mm"))
  
  icon_pent <- ggdraw(pent) +
    draw_image(white_icon, x = -0.35, y = 0, scale = 0.35)
  
  save_plot(plot = icon_pent, 
            filename = here::here("St Louis Red Lining Table",paste0(fig_name,"_pent.png")),
            base_height = 1)
  
  #upload, trim, and save again
  tmp <- image_read(here::here("St Louis Red Lining Table",paste0(fig_name,"_pent.png")))
  
  trim_pent <- tmp %>% 
    image_trim()
  
  image_write(trim_pent, path = here::here("St Louis Red Lining Table",paste0(fig_name,"_pent.png")))
}

output_info <- tibble(
  urls = c(users, home_value, circle_dollar, house, grad_cap),
  line_1 = c("Total", "Median", "Median Household", "Owner Occupied", "Bachelors Degree or"),
  line_2 = c("Population", "Home Value", "Income", "Housing Units", "Higher"),
  file_name = c("tot_population","med_home_value", "med_hshld_inc", "owner_occ_housing", "bach_or_higher")
)

pmap(list(output_info$urls,
          output_info$line_1,
          output_info$line_2,
          output_info$file_name), 
     pents)

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
measures <- output_info$file_name

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
    names_to = "measures",
    values_to = "values"
  ) %>% 
  pivot_wider(
    id_cols = measures,
    names_from = grade,
    values_from = values
  ) %>% 
  mutate(
    measures = here::here("St Louis Red Lining Table",paste0(measures,"_pent.png")),
    A_diff_A = NA_integer_,
    B_diff_A = B - A,
    C_diff_A = C - A,
    D_diff_A = D - A,
    type = row_types)
  
stl_table_format <- stl_table_rotated %>% 
  # https://stackoverflow.com/questions/29873293/dplyr-order-columns-alphabetically-in-r
  select(measures, order(colnames(.)), type) %>% 
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
table <- stl_table_format %>% 
  gt() %>% #rowname_col = "measures"
  # tab_stubhead(label = md("<span style='font-size:200%'>St Louis</span><br>
  #                         <span style='font-size:100%'>Missouri</span>")) %>%
  cols_width(measures ~ px(230), everything() ~ px(175)) %>%
  text_transform(
      locations = cells_body(columns = measures),
      fn = function(x) {
        local_image(
          filename = x,
          height = 50
        )
      }
    ) %>%
  gt_highlight_cols(A, fill =c("#81A26B")) %>%
  gt_highlight_cols(B, fill = c("#86AEBA")) %>%
  gt_highlight_cols(C, fill = c("#CBC361")) %>%
  gt_highlight_cols(D, fill = c("#D77085")) %>%
  tab_footnote(footnote = md("<div style='width:25%; float:left; text-align:right; vertical-align:top;'>&nbsp;</div>
                              <div style='width:50%; float:left;'>This infographics provides a set of Esri demographic indicators based on a snapshot for July 1, 2020.<br>
                                Adjustments have been made to current year models to reflect the impact of the COVID-19 pandemic.<br></div>
                              <div style='width:25%; float:right; text-align:right; vertical-align:top;'>&copy; 2020 Esri<br></div>")) %>%
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
    measures = md("<p style='font-size:250%; text-indent: 5px'>St Louis</p>
                    <p style='font-size:125%; text-indent: 5px'>Missouri</p>"),
    A = md("<div style='text-align:center; font-size:250%;'>A</div>"),
    B = md("<div style='text-align:center; font-size:250%;'>B</div>"),
    C = md("<div style='text-align:center; font-size:250%;'>C</div>"),
    D = md("<div style='text-align:center; font-size:250%;'>D</div>")
  ) %>% 
  tab_options(
    table.background.color = "#F4F6F6",
    table.border.top.style = "hidden",
    table.border.bottom.style = "hidden",
    table_body.border.bottom.style = "hidden",
    table_body.hlines.style = "hidden",
    column_labels.font.weight = "bold",
    footnotes.font.size = "55%",
    footnotes.border.bottom.style = "hidden",
    column_labels.border.bottom.color = "#F4F6F6",
    data_row.padding = px(15)
  ) %>% 
  opt_table_font(
    font = list(
      google_font(name = "Quicksand"),
      "Sans Serif"
    )
  )

table

gtsave(table, here::here("St Louis Red Lining Table","table.png"))
gtsave_extra(table, here::here("St Louis Red Lining Table","table.png"))
