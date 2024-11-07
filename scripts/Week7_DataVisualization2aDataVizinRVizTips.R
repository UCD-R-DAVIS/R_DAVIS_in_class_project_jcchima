library(tidyverse)
library(ggplot2)

#Section 1: Plot Best Practices and GGPlot Review####
#ggplot has four parts (think of this as a metaphorical house):
#data / materials ggplot(data=yourdata)
#plot type / design geom_...(ex. geom_line, geom_boxplot)
#aesthetics / decor aes() (this area determines what the plot looks like)
#stats / writing stat_... (it's like the house's custom wiring)

#Let's see what this looks like:

#Here we practice creating a dot plot of price on carat
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point()


#Remember from Part 1 how we iterate?
#I've added transparency and color

#all-over color
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point(color = "blue")
#color by variable
ggplot(diamonds, aes(x = carat, y = price, color = clarity)) + #if you want to use a variable in order to determine what the plot looks like, it has to go under the aesthetics command (aes()) and not separately.
  geom_point(alpha = 0.2) #alpha increases the transparency so we can see how many dots are layered on top of each other 

#plot best practices:
#remove backgrounds, redundant labels, borders, 
#reduce colors and special effects
#remove bolding, lighten labels, remove lines, direct label

#Now I've removed the background to clean up the plot
#As we learned last week, there are other themes besides classic
ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +
  geom_point(alpha = 0.2) + theme_classic()

#Keep your visualization simple with a clear message
#label axes
#start axes at zero

#Now I've added a title and edited the y label to be more specific
ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +
  geom_point(alpha = 0.2) + theme_classic() +
  ggtitle("Price by Diamond Quality") + ylab("price in $")

#Now I've added linear regression trendlines for each color
ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +
  geom_point(alpha = 0.2) + theme_classic() +
  ggtitle("Price by Diamond Quality") + ylab("price in $") + 
  stat_smooth(method = "lm") #"lm" is linear model

#Now I've instead added LOESS trendcurves for each color
ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +
  geom_point(alpha = 0.2) + theme_classic() +
  ggtitle("Price by Diamond Quality") + ylab("price in $") + 
  stat_smooth(method = "loess")

#Go to the Tutorials > Data Visualizaiton Part 1 for a refresher
#colors in geom_line (a time series)

#Section 2 COlor Palette Choices and Color-Blind Friendly Visualization

#always work to use colorblind-friendly or black-and-white friendly

#Be sure to read this uperb article!
#https://www.nature.com/articles/s41467-020-19160-7?utm_sources