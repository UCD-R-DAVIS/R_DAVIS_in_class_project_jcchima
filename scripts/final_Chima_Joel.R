#1. Read in the file tyler_activity_laps_12-6.csv from the class github page. This file is at url https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv, so you can code that url value as a string object in R and call read_csv() on that object. The file is a .csv file where each row is a “lap” from an activity Tyler tracked with his watch.
library(tidyverse)
library(dplyr)

tal126 <- read.csv("https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv")

#2. Filter out any non-running activities.
talrun <- tal126 %>% 
  filter(sport == "running")

?filter

#3. We are interested in normal running. You can assume that any lap with a pace above 10 minutes_per_mile pace is walking, so remove those laps. You should also remove any abnormally fast laps (< 5 minute_per_mile pace) and abnormally short records where the total elapsed time is one minute or less.
talRN <- talrun %>% 
  filter(minutes_per_mile < 10, minutes_per_mile >5, total_elapsed_time_s >= 1)


#4. Group observations into three time periods corresponding to pre-2024 running, Tyler’s initial rehab efforts from January to June of this year, and activities from July to the present.
tal3p <- talRN %>% 
  mutate(period = case_when(year < 2024 ~ "Pre-2024",
                            year = 2024 | month >6 ~ "July_Present",
                            year = 2024 | month <7 ~ "January_June"
                            )
         )



str(tal3p)
?case_when
