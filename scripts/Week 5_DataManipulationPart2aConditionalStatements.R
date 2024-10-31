library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")
str(surveys)

summary(surveys$hindfoot_length)
# psuedocode
# ifelse(test or condition, what to do if the test is yes.true, what to do if it's false/no)

#boolean test
surveys$hindfoot_length < 29.29 #This is asking what values are greater than the mean (29.29). Value that are greater than (<) 29.29 are TRUE values that less than (>) 29.29 are FALSE

surveys$hindfoot_cat <- ifelse(surveys$hindfoot_length < 29.29, yes ="small", no = "big")
head(surveys$hindfoot_cat)
head(surveys$hindfoot_length)
surveys$hindfoot_length <- ifelse(surveys$hindfoot_length < mean(surveys$hindfoot_length, na.rm = TRUE), yes = "small", no = "big") # a more robust way to write line 12 (surveys$hindfoot_cat) is instead of writing the number we can write how we calculated it 
head(surveys$hindfoot_cat)
#ifelse works best when there are only 2 conditions, but when there are more problems arise---
# case_when() allows you to set as many tests as you need to do---
surveys %>% # First we specify the data frame (surveys) and then add the pipe function(%>%)
  mutate(hindfoot_cat = case_when(
    hindfoot_length > 29.29 ~ "big", #if hindfoot_length > 29.29 then label it "big"
    is.na(hindfoot_length) ~ NA_character_, # "NA_character" is R's way of knowing that this value is NA, and because this vector is a character vector this NA is also going to be a character. There are also other types: NA_interger_, etc.
    TRUE ~ "small" #This portion has Weird Syntax but mean "If not then label it "small"". This is because the argument (TRUE ~ "small") is a catchall for everything that hasn't been evaluated yet, which is essentially how it classify the "else" part of the "ifelse" statement.
  )) %>% #We then space down and then use mutate function to specify the new column and use the case_when to specify our test
  select(hindfoot_length, hindfoot_cat) %>% 
  head()

# more categories?
surveys %>% 
  mutate(hindfoot_cat = case_when(
    hindfoot_length > 31.5 ~ "big",
    hindfoot_length > 29 ~ "medium",
    is.na(hindfoot_length) ~ NA_character_, 
    TRUE ~ "small" 
  )) %>% 
  select(hindfoot_length, hindfoot_cat) %>% 
  group_by(hindfoot_cat) %>% 
  tally()
