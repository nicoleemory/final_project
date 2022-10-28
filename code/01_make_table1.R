here::i_am("code/01_make_table1.R")

data <- readRDS(file = here::here("output/data_clean.rds"))

library(kableExtra)
library(tidyverse)

# Creating a table 1 object
table_one <- data %>%
  kbl(col.names = c(" ", "N", "%", "N", "%"), caption = "**Table 1. Population of People with HIV in 36 U.S. Cities, 2018**", 
      align = 'c') %>%
  kable_classic("hover", full_width = F, html_font = "Cambria") %>%
  add_header_above(c(" " = 1, "**New HIV Diagnoses**" = 2, "**Percentage**" = 2)) %>%# the numbers are saying how many columns want to cover with the heading and the headings are just assigned in order from left to right based on columns
  pack_rows("Total", 1, 2) %>%
  pack_rows("Gender", 2, 3) %>%
  pack_rows("Race", 4, 6) %>%
  footnote(general = "Asian and Other race/ethnicity groups are not included in table because of data privacy issues due to low numbers.")

saveRDS(table_one, file = here::here("output/table_one.rds")) # storing table1 as an rds file
