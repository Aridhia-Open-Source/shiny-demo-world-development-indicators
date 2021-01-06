
library(shiny)
library(shinydashboard)
library(dplyr)
library(tidyr)
library(stringr)
library(googleVis)



# Choose startign indicators
indicators_table <- read.csv("data/indicator_names.csv", stringsAsFactors = FALSE)
indicators_table <- indicators_table[!duplicated(indicators_table),] %>%
  arrange(Indicator.Name)

start_x <- indicators_table$Indicator.Name[28]
start_y <- indicators_table$Indicator.Name[45]

# Rename health_data_wide with descriptive names
health_data_wide <- read.csv("data/health_indicators.csv")
# life_expenctancy <- xap.read_table("life_expectancy") %>%
#   select(-id) %>%
#   gather(key = "year", value = "life_expectancy", yr_1960:yr_2012) %>%
#   mutate(year = as.integer(str_remove(year, "yr_")))

#health_data_wide <- health_data_wide %>% left_join(life_expenctancy, by = c("country_name" = "name", "year" = "year"))

l <- match(names(health_data_wide), indicators_table$Indicator.Code)
new_names <- indicators_table$Indicator.Name[l]
new_names[is.na(new_names)] <- names(health_data_wide[,is.na(l)])

new_names <- gsub("'", "\\'", fixed = TRUE, x = new_names)

names(health_data_wide) <- new_names