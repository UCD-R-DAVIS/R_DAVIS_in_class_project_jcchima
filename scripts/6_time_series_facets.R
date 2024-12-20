library(tidyverse)

surveys_complete <- read_csv('data/portal_data_joined.csv') %>%
  filter(complete.cases(.))

# these are two different ways of doing the same thing
head(surveys_complete %>% count(year,species_id))
head(surveys_complete %>% group_by(year,species_id) %>% tally())

yearly_counts <- surveys_complete %>% count(year,species_id)

head(yearly_counts)

ggplot(data = yearly_counts,mapping = aes(x = year, y = n)) +
  geom_point()

ggplot(data = yearly_counts,mapping = aes(x = year, y= n)) +
  geom_line()

ggplot(data = yearly_counts,mapping = aes(x = year, y= n,group = species_id)) +
  geom_line()

ggplot(data = yearly_counts,mapping = aes(x = year, y= n,group = species_id)) +
  geom_line() +
  geom_point() #with dots

ggplot(data = yearly_counts,mapping = aes(x = year, y= n, colour = species_id)) +
         geom_line()


ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) +
  geom_line() +
  facet_wrap(~ species_id)


ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) +
  geom_line() +
  facet_wrap(~ species_id,scales = 'free')

ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) +
  geom_line() +
  facet_wrap(~ species_id,scales = 'free_y')

ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) +
  geom_line() +
  facet_wrap(~ species_id,scales = 'free_y', ncol = 1)

ggplot(data = yearly_counts[yearly_counts$species_id%in%c('BA', 'DM', 'DM')], mapping = aes(x = year, y = n)) +
  geom_line() +
  facet_wrap(~ species_id) +
  scale_y_continuous(name = 'obs', breaks = seq(0,600,100))
