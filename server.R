#Loading libraries and data
library(dplyr)
library(ggplot2)

data_set <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")


# Which geographic area has produced the most amount of CO2 to date

geographic_most_CO2 <- data_set %>%
  group_by(country) %>%
  summarise(total_CO2 = sum(cumulative_co2)) %>%
  top_n(1) %>%
  pull(country)

# Which geographic area has produced the least amount of CO2 to date

geographic_least_CO2 <- data_set %>%
  group_by(country) %>%
  summarise(total_CO2 = sum(cumulative_co2)) %>%
  top_n(-1) %>%
  pull(country)
  

# Which year did the United State of America produce the least amount of CO2 in the 20th century

USA_least_CO2_year <- data_set %>%
  filter(country == "United States") %>%
  filter(year > 2000) %>% 
  top_n(-1) %>%
  pull(year)

# Which year did the United State of America produce the most amount of CO2 in the 20th century

USA_most_CO2_year <- data_set %>%
  filter(country == "United States") %>%
  filter(year > 2000) %>% 
  select(c("country", "year", "co2")) %>%
  top_n(1) %>%
  pull(year)

# Which geographic location has produced the least amount of CO2 emissions in the 20th century
  
least_CO2_country <- data_set %>%
  filter(year > 2000) %>% 
  select(c("country", "year", "co2")) %>%
  top_n(-1) %>%
  pull(country)