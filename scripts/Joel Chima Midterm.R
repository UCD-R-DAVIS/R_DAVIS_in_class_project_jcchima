library(tidyverse)
#1.Read in the file tyler_activity_laps_10-24.csv from the class github page. This file is at url https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv, so you can code that url value as a string object in R and call read_csv() on that object. The file is a .csv file where each row is a “lap” from an activity Tyler tracked with his watch.---
tyler_activity_laps_10_24 <- read_csv("data/tyler_activity_laps_10-24.csv")

#2.Filter out any non-running activities.---
tyler_activity_laps_10_24 %>% 
  group_by(sport) %>% 
  tally()

filter(tyler_activity_laps_10_24, sport == "running")

tal1024_run <- tyler_activity_laps_10_24 %>% 
  filter(sport == "running")
tal1024_run

#3.Next, Tyler often has to take walk breaks between laps right now because trying to change how you’ve run for 25 years is hard. You can assume that any lap with a pace above 10 minute-per-mile pace is walking, so remove those laps. You should also remove any abnormally fast laps (< 5 minute-per-mile pace) and abnormally short records where the total elapsed time is one minute or less.---
tal1024_run_stable <- tal1024_run %>% 
  filter(minutes_per_mile < 10, 
         minutes_per_mile > 5, 
         total_elapsed_time_s > 1)

tal1024_run_stable

#4.Create a new categorical variable, pace, that categorizes laps by pace: “fast” (< 6 minutes-per-mile), “medium” (6:00 to 8:00), and “slow” ( > 8:00). Create a second categorical variable, form that distinguishes between laps run in the year 2024 (“new”, as Tyler started his rehab in January 2024) and all prior years (“old”).---

#5.Identify the average steps per minute for laps by form and pace, and generate a table showing these values with old and new as separate rows and pace categories as columns. Make sure that slow speed is the second column, medium speed is the third column, and fast speed is the fourth column (hint: think about what the select() function does).---

#6.Finally, Tyler thinks he’s been doing better since July after the doctors filmed him running again and provided new advice. Summarize the minimum, mean, median, and maximum steps per minute results for all laps (regardless of pace category) run between January - June 2024 and July - October 2024 for comparison.---