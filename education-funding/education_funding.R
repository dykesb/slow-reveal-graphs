library(tidyverse)
library(readxl)
library(scales)
library(grid)
library(ggrepel)

#reading data in
education <- read_xlsx(here::here("Everything","EducationFunding","EducationFundingData.xlsx"))

df <- subset(education, Year == 2014)
df1 <- subset(education, Country == "United Kingdom", Year = 2012)

################# Part 1 #################

#creating the whole graph

ggplot(education, aes(x = Year, y = Percent, group = Country, color = Country)) + 
  geom_line() + 
  scale_color_manual(values = c("#0f739c", "#287669", "#00823f", "#883039", "#b13407", "#cf0a66"))
