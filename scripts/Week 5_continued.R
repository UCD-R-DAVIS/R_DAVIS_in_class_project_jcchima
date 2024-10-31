library(tidyverse)
tail <- read_csv('data/tail_length.csv')
surveys <- surveys <- read_csv("data/portal_data_joined.csv")

dim(tail)
dim(surveys)
head(tail)

surveys_inner <- inner_join(x = surveys, y = tail)
dim(surveys_inner)
head(surveys_inner)

tail <- tail[sample(1:nrow(tail),15e3),]
tail

#Join functions
surveys_inner <- inner_join(x = surveys, y = tail)
dim(surveys_inner)
surveys_left <- left_join(x = surveys, y = tail)
dim(surveys_left)
surveys_right <- right_join(x = surveys, y = tail)
dim(surveys_right)
surveys_full <- full_join(surveys, tail)
dim(surveys_full)

all(surveys$record_id %>% tail$record_id)
all(tail$record_id %>% surveys$record_id)


tail %>% select(-record_id)
full_join(surveys,tail %>% select(-record_id))
dim(surveys_full)

?cross_join
?left_join
left_join(surveys,tail %>% rename(record_id2 = record_id),
          by = c('record_id'='record_id2'))


surveys_mz <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(genus, plot_id) %>% 
  summarise(mean_weight = mean(weight))

surveys_mz %>% 
  pivot_wider(id_cols = 'genus',
              names_from = 'plot_id',
              values_from = 'mean_weight')


