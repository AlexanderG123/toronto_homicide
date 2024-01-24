
#### Preamble ####
# Purpose: Tests if the simulated data is within the required bounds
# Author: Alexander Guarasci
# Date: 24 January 2023 
# Contact: alexander.guarasci@mail.utoronto.ca
# License: MIT
# Pre-requisites: run 00-simulate_data.R

#### Workspace setup ####
library(tidyverse)
#tests
data = read_csv("outputs/data/simulated_data.csv")

# Test1, year is between the dates
all(data$occurrence_year >= 2004 & data$occurrence_year <= 2020)

#Test2, checks type is categorized as either shooting, stabbing or other
all(data$homicide_type %in% c("shooting", "other", "stabbing"))

#Test3, checks neighbourhoods are appropriately numbered (only works on simulated data)
all(data$neighbourhood >= 1 & data$neighbourhood <= 158)

