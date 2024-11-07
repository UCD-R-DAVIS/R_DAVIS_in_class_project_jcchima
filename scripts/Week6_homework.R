#1 First calculates mean life expectancy on each continent.Then create a plot that shows how life expectancy has changed over time in each continent. Try to do this all in one step using pipes! (aka, try not to create intermediate dataframes)
library(tidyverse)

gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")
gapminder %>% 
  group_by(continent) %>% 
  tally()

gapminder %>% 
  group_by(continent, year) %>% 
  summarize(mean_lifeExp = mean(lifeExp)) %>% 
  ggplot(data = ., mapping = aes(x = year, y = mean_lifeExp, group = continent, color = continent)) +
  geom_smooth() +
  theme_linedraw() +
  ggtitle("Change in Life Expectancy by Continent") + ylab("Mean Life Expectancy") + xlab("Year") +
  theme(panel.grid = element_blank())

#2. Look at the following code and answer the following questions. What do you think the scale_x_log10() line of code is achieving? What about the geom_smooth() line of code?
#The geom_smooth() line of code is used to show the distribution of the raw life expectancy data through shading

#Challenge! Modify the above code to size the points in proportion to the population of the country. Hint: Are you translating data to a visual feature of the plot?
gapminder %>% 
  group_by(continent, year) %>% 
  summarize(mean_lifeExp = mean(lifeExp)) %>% 
  ggplot(data = ., mapping = aes(x = year, y = mean_lifeExp, group = continent, color = continent)) +
  geom_smooth() +
  theme_linedraw() +
  ggtitle("Change in Life Expectancy by Continent") + ylab("Mean Life Expectancy") + xlab("Year") +
  theme(panel.grid = element_blank())  
  