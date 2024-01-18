#### Preamble ####
# Purpose: Cleans the raw marriage data
# Author: Diana Liu
# Date: 16 January 2024
# Contact: guanzhi.liu@mail.utoronto.ca
# Pre-Requisits: unedited data is downloaded

#### Workspace setup ####
# install.packages("tidyverse")
# install.packages("stringr")
# comment out installations after they are done
library(tidyverse)
library(stringr)

#### Clean data ####
raw_marriages_data <- read_csv("inputs/data/unedited_data.csv")

cleaned_marriages_data <-
  raw_marriages_data |>
  select(CIVIC_CENTRE, MARRIAGE_LICENSES, TIME_PERIOD) |> # we want to select 
  #only the relevant columns: civic_centre, marriage_licenses, and time_period
  filter(TIME_PERIOD >= 2023)
# Then we filter on the year because we are only interested in 2023

cleaned_marriages_data$TIME_PERIOD <- str_c(cleaned_marriages_data$TIME_PERIOD,
                                            "-01")
# We add -01 to the end of the dates so they are formatted correctly as 
# yyyy-mm-dd

cleaned_marriages_data <-
  cleaned_marriages_data |>
  mutate(TIME_PERIOD = format(as.Date(TIME_PERIOD), format="%B")) |>
  rename(Month = TIME_PERIOD, Marriages = MARRIAGE_LICENSES, Civic_Centre = CIVIC_CENTRE) |>
  select(Month, Marriages, Civic_Centre)
# Then we change the date format to only the month, rename the column so they
# are easier to understand, and get rid of the CIVIC_CENTRE column

head(cleaned_marriages_data)


#### Save data ####
write_csv(cleaned_marriages_data, "outputs/data/cleaned_data.csv")

