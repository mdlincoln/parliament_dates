library(dplyr)
library(stringr)
library(lubridate)

parliament_raw <- read.csv("parliament_dates_raw.csv", header = TRUE)

parliament <- parliament_raw %>%
  mutate(
    # Extract start and end date strings
    start_string = str_match(raw_date, "^(.*)-")[,2],
    end_string = str_match(raw_date, "-(.*)")[,2],
    # Parse date strings using the lubridate package
    start_date = dmy(start_string),
    end_date = dmy(end_string),
    # Pull out year
    start_year = year(start_date),
    end_year = year(end_date),
    # Pull out day of the year
    start_yday = yday(start_date),
    end_yday = yday(end_date))
