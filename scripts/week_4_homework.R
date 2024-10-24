# 1.Create a tibble named surveys from the portal_data_joined.csv file. ---
library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")
str(surveys)

# 2.Subset surveys using Tidyverse methods to keep rows with weight between 30 and 60, and print out the first 6 rows.---
surveyswgt3060 <- surveys %>%
  filter(weight %in% c(30:60) )
surveys[1:6,]
surveyswgt30602 <- surveyswgt3060[1:6,]

# 3.Create a new tibble showing the maximum weight for each species + sex combination and name it biggest_critters. Sort the tibble to take a look at the biggest and smallest species + sex combinations. HINT: it’s easier to calculate max if there are no NAs in the dataframe…---
biggest_critters <- surveys %>% 
  filter(!is.na(weight), !is.na(sex)) %>% 
  group_by(species, sex) %>% 
  summarise(max_weight = max(weight)) %>% 
  arrange(-max_weight)
biggest_critters

# 4.Try to figure out where the NA weights are concentrated in the data- is there a particular species, taxa, plot, or whatever, where there are lots of NA values? There isn’t necessarily a right or wrong answer here, but manipulate surveys a few different ways to explore this. Maybe use tally and arrange here.
biggest_crittersna <- surveys %>% 
  filter(is.na(weight), is.na(sex)) %>% 
  group_by(species, sex) %>% 
  summarise(max_weight = max(weight))
biggest_crittersna

biggest_crittersnas <- surveys %>% 
  filter(is.na(weight)) %>% 
  group_by(species, weight, plot_id, year) %>% 
  tally() %>% 
  arrange(desc(n))
biggest_crittersnas
# 5.Take surveys, remove the rows where weight is NA and add a column that contains the average weight of each species+sex combination to the full surveys dataframe. Then get rid of all the columns except for species, sex, weight, and your new average weight column. Save this tibble as surveys_avg_weight.
surveys_avg_weight <- surveys %>% 
  filter(!is.na(weight), !is.na(sex)) %>% 
  group_by(species, sex) %>% 
  mutate(avg_weight = mean(weight)) %>%
  select(species, sex, weight, avg_weight) %>% 
  arrange(-avg_weight)
surveys_avg_weight

#Take surveys_avg_weight and add a new column called above_average that contains logical values stating whether or not a row’s weight is above average for its species+sex combination (recall the new column we made for this tibble).
surveys_avg_weight <- surveys %>% 
  filter(!is.na(weight), !is.na(sex)) %>% 
  group_by(species, sex) %>% 
  mutate(avg_weight = mean(weight), above_avaerage = weight>avg_weight) %>%
  select(species, sex, weight, avg_weight, above_avaerage) %>% 
  arrange(-avg_weight)
surveys_avg_weight






