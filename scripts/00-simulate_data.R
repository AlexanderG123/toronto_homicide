#### Preamble ####
# Purpose: Simulates the cleaned homicide data from 2004-2020 that I will be working with
# Author: Alexander Guarasci
# Date: 24 January 2023 
# Contact: alexander.guarasci@mail.utoronto.ca
# License: MIT
# Pre-requisites: NA


#### Workspace setup ####
library("tidyverse")

# Create a sequence of dates from 2004-01-01 to 2020-12-31
dates <- seq(from = ymd("2004-01-01"), to = ymd("2020-12-31"), by = "day")

# Initialize an empty data frame
simulated_data <- data.frame(occurrence_date= dates)
# Simulate the event occurrence
set.seed(123) # Setting a seed for reproducibility
simulated_data <- simulated_data %>% 
  mutate(EventOccurs = runif(n()) < 0.2, # 20% chance of event
         neighbourhood = ifelse(EventOccurs, sample(1:158, size = n(), replace = TRUE), NA),
         homicide_type = ifelse(EventOccurs, sample(c("shooting", "stabbing", "other"), size = n(), replace = TRUE), NA),
         day_of_week = ifelse(EventOccurs, format(occurrence_date, "%a"), NA), # Add abbreviated day of the week using format()
         occurrence_year = ifelse(EventOccurs, year(occurrence_date), NA) # Add occurrence_year
  ) %>%
  filter(EventOccurs) # Keep only the rows where the event occurs

# View the data
simulated_data <- simulated_data|> select(occurrence_date, neighbourhood, homicide_type, day_of_week, occurrence_year)
write_csv(x = simulated_data, file = "outputs/data/simulated_data.csv")


