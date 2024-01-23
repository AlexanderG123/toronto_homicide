#### Preamble ####
# Purpose: Downloads and saves the data from OpenDataToronto
# Author: Alexander Guarasci
# Date: 23 January 2023 
# Contact: alexander.guarasci@mail.utoronto.ca
# License: MIT
# Pre-requisites: NA


#### Workspace setup ####


library(opendatatoronto)
library(tidyverse)
library(janitor)

# get package

package <- show_package("7d72bbbe-8adc-4b36-8ad1-5359f1c7a9cc")
package

# get all resources for this package
resources <- list_package_resources("7d72bbbe-8adc-4b36-8ad1-5359f1c7a9cc")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
write_csv(x = data , file = "inputs/data/unedited_data.csv")





         
