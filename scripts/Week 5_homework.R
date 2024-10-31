#Create a tibble named surveys from the portal_data_joined.csv file. Then manipulate surveys to create a new dataframe called surveys_wide with a column for genus and a column named after every plot type, with each of these columns containing the mean hindfoot length of animals in that plot type and genus. So every row has a genus and then a mean hindfoot length value for every plot type. The dataframe should be sorted by values in the Control plot type column. This question will involve quite a few of the functions you’ve used so far, and it may be useful to sketch out the steps to get to the final result.

library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")
str(surveys)

surveys_wide <- surveys %>% 
  mutate(Control = plot_type$control)

surveys %>% 
  group_by(plot_type) %>% 
  tally()

surveys %>% 
  filter(plot_type == Control)
