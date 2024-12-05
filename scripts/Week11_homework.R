library(tidyverse)
#1. Using a for loop, print to the console the longest species name of each taxon. Hint: the function nchar() gets you the number of characters in a string.-----
surveys <- read.csv("data/portal_data_joined.csv")

#Test space

nchar(surveys)
results <- rep(NA, nrow(surveys))
results
?rep
?nchar
?summarise
?join
#using species and taxa
nchar("species")
nchar(surveys$species)

surveys_LN <- surveys %>% 
  mutate(SNL = nchar(species))
surveys_LN
surveys4L

survey_all_species <- surveys_LN %>% 
  select(species, taxa, SNL) %>%
  group_by(taxa, species) %>% 
  summarise(Max_SNL=max(SNL))

surveysMSNL<- surveys_LN %>% 
  select(species, taxa, SNL) %>%
  group_by(taxa, species) %>% 
  summarise(Max_SNL=max(SNL)) %>% 
  filter(Max_SNL == max(Max_SNL))

species <- surveys_LN %>% 
  select(species, SNL) %>% 
  group_by(species) %>% 
  summarise(max(SNL))

surveysTSSNL <- right_join(species)

str(mtcars)
MCT<-mtcars %>%
  group_by(cyl) %>%
  summarise(mean = mean(disp), n = n())

#Next let’s load the Mauna Loa dataset from last week.
mloa <- read.csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")
mloa
str(mloa)
