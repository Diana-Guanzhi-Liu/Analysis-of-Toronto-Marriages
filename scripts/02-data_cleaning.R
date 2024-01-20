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
  filter(CIVIC_CENTRE == "TO")
# Then we filter on the civic centre so that we are only left with Toronto

cleaned_marriages_data$TIME_PERIOD <- str_c(cleaned_marriages_data$TIME_PERIOD,
                                            "-01")
# We add -01 to the end of the dates so they are formatted correctly as 
# yyyy-mm-dd

cleaned_marriages_data <-
  cleaned_marriages_data |>
  rename(Date = TIME_PERIOD, Marriages = MARRIAGE_LICENSES) |>
  select(Date, Marriages) |>
  filter(Date >= as.Date("2022-01-01"))
# We get rid of the CIVIC_CENTRE column and look at the last two years
head(cleaned_marriages_data)

cleaned_marriages_data_2022 <-
  cleaned_marriages_data |>
  filter(Date >= as.Date("2022-01-01"), Date <= as.Date("2022-12-31"))
head(cleaned_marriages_data_2022)

cleaned_marriages_data_2023 <-
  cleaned_marriages_data |>
  filter(Date >= as.Date("2023-01-01"), Date <= as.Date("2023-12-31"))
head(cleaned_marriages_data_2023)


#### Save data ####
write_csv(cleaned_marriages_data, "outputs/data/cleaned_data_all_years.csv")
write_csv(cleaned_marriages_data_2022, "outputs/data/cleaned_data_2022.csv")
write_csv(cleaned_marriages_data_2023, "outputs/data/cleaned_data_2023.csv")
