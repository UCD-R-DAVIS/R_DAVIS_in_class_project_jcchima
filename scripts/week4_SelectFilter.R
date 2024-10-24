#select columns
month_day_year <- select(surveys, month, day, year)

#filtering by equals
year_1981 <- filter(surveys, year == 1981)
sum(year_1981$year != 1981, na.rm = T)

identical(year_1981, year_1981_baser)

#filtering by range
the80s <- surveys[surveys$year %in% 1981:1983,]
the80stidy <- filter(surveys, year %in% 1981:1983,)

#review: why should you NEVER do:
the80srecycle <- filter(surveys, year == c(1981:1983))

#multi-step process
small_animals <- filter(surveys, weight <5)

#this is slightly dangerous because you have to remember
#to select from small_animals, not surveys in the next step
small_animals_ids <- select(small_animals, record_id, plot_id,)


#same process, using nested functions
small_animal_ids <- select(filter(surveys, weight <5),
                           record_id,
                           plot_id, species_id)
#same process, using a pipe
#Cmd Shift M
%>%
|>

#note our select function no longer explicitly calls the tibble
#as its first element
small_animals_ids <- surveys %>% filter(., weight <5) %>%
  select(., record_id, plot_id, species_id)

#applied to the tidyverse

mini <-surveys[190:209]
table(mini$species_id)
#how many rows have a species ID that's either DM or NL?
nrow(mini)

test <- mini %>% filter(species_id == c("DM", "NL"))
nrow(test)


#Adding a new column
#mutate: adds a new column
surveys <- surveys %>%
  mutate(., weight_kg = weight/1000)
head(surveys)
str(surveys)

#Add other columns
surveys <- surveys %>%
  mutate(., 
         weight_kg = weight/1000,
         weight_kg2 = weight_kg*2)
head(surveys)
str(surveys)
surveys$weight_kg2 = as.character(surveys$weight_kg2)
str(surveys)


#Filter out the NA's
ave_weight <- surveys %>%
  filter(!is.na(weight)) %>%
  mutate(mean_weight = mean(weight))
str(ave_weight)
nrow(ave_weight)
ave_weight$mean_weight

ave_weight <- surveys %>%
  filter (complete.cases(.))
nrow(ave_weight)

#Group_by and summarize ----
#A lot of data manipulation


#we can calulate mean by certain groups
df <- surveys %>%
  group_by(sex) %>%
  mutate(mean_weight = mean(weight, na.rm = TRUE))
table(df$mean_weight)

#multiple groups
df <-- surveys %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))

#sort/arrange order a crtain way
surveys%>%
  group_by(sex, species_id) %>%
  filter(sex !=)"%"


#Challenge What was the weight of the heaviest animal measured in each year?
surveys%>%
  group_by(year)%>%
  filter(weight == max(weight))

filter(surveys, weight < 5)

#Return a table with three columns: year, weight of the heaviest animal in 
#grams, and weight in kilograms, arranged (arrange()) in descending order, from 
#heaviest to lightest. (This table should have 26 rows, one for each year)
#Try out a new function, count(). Group the data by sex and pipe the grouped 
#data into the count() function. How could you get the same result using 
#group_by() and summarize()? Hint: see ?n
surveys %>%
  select(year, record_id, weight) %>%
  group_by(year) %>%
  filter(!is.na(weight)) %>%
  mutate(weight_kg = weight/1000) %>%
           group_by(year) %>%
           summarize(max_weight_g = max(weight),
                     max_weight_kg = max(weight)) %>%
           arrange()
nrow(d)






