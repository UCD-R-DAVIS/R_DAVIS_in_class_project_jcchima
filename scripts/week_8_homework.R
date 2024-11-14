library(ggplot2)
library(tidyverse)

#1. To get the population difference between 2002 and 2007 for each country, it would probably be easiest to have a country in each row and a column for 2002 population and a column for 2007 population.
gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")

unique(gapminder$country)

gapminder %>% 
  pivot_wider(names_from = "year", values_from = "country")

#Test Space
popdif <- gapminder %>% 
  group_by(year, country) %>% 
  summarize(pop) %>% 
  filter(year >= 2002)

#your want to get year and population
test <- popdif %>% 
  pivot_wider(names_from = "year", values_from = "pop") %>% 
  mutate(popdiff = `2007`-`2002`)

test
names(test)[2] <-"pop2002" 
names(test)[3] <- "pop2007"


popdif2 <- gapminder %>% 
  filter(year >= 2002) %>%
  select(country, continent, year, pop) %>% 
  pivot_wider(names_from = "year", values_from = "pop") %>% 
  mutate(popdiff = `2007`-`2002`)

#Testing
popdif3 <- gapminder %>% 
  filter(year >= 2002) %>%
  group_by(country, continent) %>% 
  pivot_wider(names_from = "year", values_from = "pop") %>% 
  summarize(popdiff = `2007`-`2002`)
str(gapminder)# didn't work because group_by doesn't remove any columns

#1. final
gapminder %>% 
  filter(year >= 2002, continent != "Oceania") %>%
  select(country, continent, year, pop) %>% 
  pivot_wider(names_from = "year", values_from = "pop") %>% 
  mutate(popdiff = `2007`-`2002`) %>% 
  ggplot(mapping = aes(x = reorder(country, popdiff), y =popdiff, group = continent)) +
  geom_col(aes(fill = continent,)) +
  facet_wrap(~continent, scales = "free") +
  theme(axis.text.x = element_text(size = rel(0.9), angle = 90, vjust = 1, hjust=1))

?element_text
