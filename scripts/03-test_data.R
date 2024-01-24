#### Preamble ####
# Purpose: Tests cleaned toronto marriage data
# Author: Diana Liu
# Date: 17 January 2024
# Contact: guanzhi.liu@mail.utoronto.ca
# Pre-requisites: downloaded and cleaned Toronto marriage data


#### Workspace setup ####
# install.packages("tidyverse")
# comment out the installation after tidyverse has been installed
library(tidyverse)

#### Test data ####
marriage_data <- read_csv("outputs/data/cleaned_data.csv")

marriage_data$Marriages |> min() >= 0
marriage_data$Marriages |> max() <= 2000
marriage_data$Marriages |> class() == 'numeric'

