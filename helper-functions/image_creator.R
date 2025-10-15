



# Description: This file receives data from Google Apps Script and then is evaluated with webR.

# Author: Louis

# Receiving data from the GoLang API 

# args <- commandArgs(trailingOnly = TRUE)
# json_data <- args[1]

# Loading libraries

library(jsonlite)
suppressPackageStartupMessages(library(tidyverse))

# Transforming JSON data to an R list

data <- fromJSON(__jsonData__)

# Extracting data from list

toGraph <- data.frame(x = data$xAxis$value,
                      y = data$yAxis$value)

ChartType <- data$chartType

xAxisScale <- data$xAxis$scale

yAxisScale <- data$yAxis$scale

print(data)

# Setting limits

limits <- list(xAxisLimitLower = data$xAxis$limitLower,
               xAxisLimitUpper = data$xAxis$limitUpper,
               yAxisLimitLower = data$yAxis$limitLower,
               yAxisLimitUpper = data$yAxis$limitUpper)

# Setting blank limits to that they will be NULL if they are not provided

for (i in 1:length(limits)) {
  
  
  if (is.null(limits[[i]]) == TRUE) {
    
    NA
    
  } else if (str_length(limits[[i]]) == 0) {
    
    limits[i] <- list(NULL)
    
  } else {
    
    limits[[i]] <- as.numeric(limits[[i]])
    
  }
  
}

# Setting labels

labels <- list(title = data$title,
               subtitle = data$subtitle,
               caption = data$caption,
               x_label = data$xAxis$label,
               y_label = data$yAxis$label)


# Setting blank labels to NULL so the blank label doesn't take up room in the graph.

for (i in 1:length(labels)) {
  
  if (is.null(labels[[i]]) == TRUE) {
    
    NA
    
  } else if (str_length(labels[[i]]) == 0) {
    
    labels[i] <- list(NULL)
    
  } else {
    
    labels[[i]] <- labels[[i]]
    
  }  
  
}



# Setting limits and label variables to the global envrionment (They're free!)

list2env(labels, envir = .GlobalEnv)
list2env(limits, envir = .GlobalEnv)

if (is.null(title) == TRUE) {
  
  NA
  
} else {
  
  title <- str_c("<b>", title, "</b>")
  
}




# Setting Global theme

complete_theme <- data$theme

# Define a named list of theme functions
theme_map <- list(
  "theme_gray" = theme_gray(),
  "theme_bw" = theme_bw(),
  "theme_linedraw" = theme_linedraw(),
  "theme_light" = theme_light(),
  "theme_dark" = theme_dark(),
  "theme_minimal" = theme_minimal(),
  "theme_classic" = theme_classic(),
  "theme_void" = theme_void(),
  "theme_wsj" = ggthemes::theme_wsj(),
  "theme_tufte" = ggthemes::theme_tufte(),
  "theme_solarized" = ggthemes::theme_solarized(),
  "theme_gdocs" = ggthemes::theme_gdocs(),
  "theme_fivethirtyeight" = ggthemes::theme_fivethirtyeight(),
  "theme_economist" = ggthemes::theme_economist()
)

# Default to theme_gray if the input is not recognized
if (is.null(complete_theme) == TRUE) {
  
  chartTheme <- theme_grey()
  
} else {
  
  # Select the theme dynamically
  chartTheme <- theme_map[[complete_theme]]
  
}

if (ChartType == "linePlot") {
  
  chart <- toGraph |> 
    ggplot(aes(x = x, y = y)) + 
    geom_line() +
    labs(title = title,
         subtitle = subtitle,
         x = x_label,
         y = y_label,
         caption = caption) +
    chartTheme +
    theme(plot.title = ggtext::element_markdown(size = 20),
          plot.subtitle = element_text(size = 16),
          axis.text = element_text(size = 14),
          legend.text = element_text(size = 14))
  
} else if (ChartType == "barPlot") { # Note: For Monday 3/24/25, make the bar chart categorical, similar to pie chart.
  
  chart <- toGraph |> 
    ggplot(aes(x = x, y = y)) + 
    geom_col() +
    labs(title = title,
         subtitle = subtitle,
         x = x_label,
         y = y_label,
         caption = caption) +
    chartTheme +
    theme(plot.title = ggtext::element_markdown(size = 20),
          plot.subtitle = element_text(size = 16),
          axis.text = element_text(size = 14),
          legend.text = element_text(size = 14))
  
} else if (ChartType == "scatterPlot") {
  
  chart <- toGraph |> 
    ggplot(aes(x = x, y = y)) + 
    geom_point() +
    labs(title = title,
         subtitle = subtitle,
         x = x_label,
         y = y_label,
         caption = caption) +
    chartTheme +
    theme(plot.title = ggtext::element_markdown(size = 20),
          plot.subtitle = element_text(size = 16),
          axis.text = element_text(size = 14),
          legend.text = element_text(size = 14))
  
} else if (ChartType == "pieChart") {
  
  toGraph <- toGraph |> 
    arrange(desc(x)) |> 
    mutate(ypos = cumsum(y)-(y/2))
  
  chart_pie <- toGraph |> 
    ggplot(aes(x = "", y = y, fill = x)) + 
    geom_bar(stat = "identity") +
    geom_text(aes(y = ypos, label = x), color = "white") +
    coord_polar("y", start = 0) +
    labs(title = title,
         subtitle = subtitle,
         caption = caption) +
    theme_bw() +
    theme(legend.position = "none",
          axis.text = element_blank(),
          axis.ticks = element_blank(),
          axis.title = element_blank(),
          panel.grid = element_blank(),
          plot.title = ggtext::element_markdown(size = 20),
          plot.subtitle = element_text(size = 16),
          legend.text = element_text(size = 14))
  
}

# X-Axis Scale

if (xAxisScale == "linear" & exists("chart")) {
  
  chart <- chart +
    scale_x_continuous(limits = c(xAxisLimitLower, xAxisLimitUpper))
  
} else {
  
  NA
  
}

if (xAxisScale == "log" & exists("chart")) {
  
  chart <- chart +
    scale_x_log10(limits = c(xAxisLimitLower, xAxisLimitUpper))
  
} else {
  
  NA
  
}

# Y-Axis Scale

if (yAxisScale == "linear" & exists("chart")) {
  
  chart <- chart +
    scale_y_continuous(labels = scales::comma,
                       limits = c(yAxisLimitLower, yAxisLimitUpper))
  
} else {
  
  NA
  
}

if (yAxisScale == "log" & exists("chart")) {
  
  chart <- chart +
    scale_y_log10(labels = scales::comma,
                  limits = c(yAxisLimitLower, yAxisLimitUpper))
  
} else {
  
  NA
  
}

# Saving plot to be sent

ggsave("chart.svg",
       width = 3,
       height = 1.8,
       units = "in",
       dpi = 300)
