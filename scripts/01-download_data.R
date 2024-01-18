#### Preamble ####
# Purpose: Downloads and saves the data from opendatatoronto
# Author: Diana Liu
# Date:
# Contact: guanzhi.liu@mail.utoronto.ca


#### Workspace setup ####
# install.packages("opendatatoronto")
# install.packages("tidyverse")
# install.packages("dplyr")
# comment out installations after they are done
library(opendatatoronto)
library(tidyverse)
library(dplyr)


#### Download data ####
toronto_marriages <-
  # Each package is associated with a unique id  found in the "For 
  # Developers" tab of the relevant page from Open Data Toronto
  # https://open.toronto.ca/dataset/marriage-licence-statistics/
  list_package_resources("e28bc818-43d5-43f7-b5d9-bdfb4eda5feb") |>
  # we are only interested in the .csv data file
filter(name == "Marriage Licence Statistics Data.csv") |>
  # Having reduced the dataset to one row we can get the resource
  get_resource()


#### Save data ####
# After downloading the data, we can save it under a descriptive name
write_csv(
  x = toronto_marriages,
  file = "inputs/data/unedited_data.csv"
) 
