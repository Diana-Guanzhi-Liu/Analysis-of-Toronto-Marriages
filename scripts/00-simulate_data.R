#### Preamble ####
# Purpose: Simulate Toronto Marriage Data over the period of a year
# Author: Diana Liu
# Email: guanzhi.liu@mail.utoronto.ca
# Date: 15 January 2024


#### Workspace setup ####
# install.packages("tidyverse")
# We can comment out the installation after tidyverse has been installed
library(tidyverse)


#### Simulate data ####
set.seed(12)

simulated_marriage_data <-
  tibble(
    Month = 
      format(
        seq(as.Date("2023/1/1"), by = "month", length.out = 12), format="%B"
        ),
    Marriage_licenses =
      round(runif(n = 12, min = 0, max = 2000))
  )
# simulate deviations from an uniform distribution of the number of marriage
# licenses obtained in Toronto over 12 months
simulated_marriage_data


#### Test Simulated Data ####
simulated_marriage_data$Marriage_licenses |> min() >= 0
simulated_marriage_data$Marriage_licenses |> max() <= 2000
simulated_marriage_data$Marriage_licenses |> class() == 'numeric'
simulated_marriage_data$Month |> class() == 'character'

