#### Preamble ####
# Purpose: Cleans the raw homicide data recorded by the Toronto Police Services
# Author: Alexander Guarasci
# Date: 23 January 2023 
# Contact: alexander.guarasci@mail.utoronto.ca
# License: MIT
# Pre-requisites: run 01-download_data.R


#### Workspace setup ####
library(tidyverse)

#### Clean data ####
data <- read_csv("inputs/data/unedited_data.csv")
data <- data |> mutate(day_of_week = wday(Occurrence_Date, label = TRUE))
data <- data |> select(Occurrence_year, Homicide_Type, Occurrence_Date, Neighbourhood, day_of_week)
data <- clean_names(data)
data$occurrence_date <- as.Date(data$occurrence_date)
write_csv(x = data, file = "outputs/data/edited_data.csv")
