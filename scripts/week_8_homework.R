library(ggplot2)
library(tidyverse)

#1. To get the population difference between 2002 and 2007 for each country, it would probably be easiest to have a country in each row and a column for 2002 population and a column for 2007 population.
gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")

unique(gapminder$country)

gapminder %>% 
  pivot_wider(names_from = "year", values_from = "country")

popdif <- gapminder %>% 
  group_by(year, country) %>% 
  summarize(pop) %>% 
  filter(year >= 2002)

#your want to get year and population
test <- popdif %>% 
  pivot_wider(names_from = "year", values_from = "pop")

names(test)[2] <-"pop2002" 
names(test)[3] <- "pop2007"


gapminder %>% 
  group_by(year, country) %>% 
  summarize(pop) %>% 
  filter(year >= 2002) %>% 
  pivot_wider(names_from = "year", values_from = "pop") %>% 
  ggplot(mapping = aes(x = country, y =   , group = )) +
  geom_bar() +
  facet_wrap(~ country,)
