library(ggplot2)
library(tidyverse)
library(lubridate)

#Let’s look at some real data from Mauna Loa to try to format and plot. These meteorological data from Mauna Loa were collected every minute for the year 2001. This dataset has 459,769 observations for 9 different metrics of wind, humidity, barometric pressure, air temperature, and precipitation. Download this dataset here. Save it to your data/ folder. Alternatively, you can read the CSV directly from the R-DAVIS Github: mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")
mloa <- read.csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")
mloa

#Use the README file associated with the Mauna Loa dataset to determine in what time zone the data are reported, and how missing values are reported in each column.
#The data's time zone is UTC
?strptime

#With the mloa data.frame, remove observations with missing values in rel_humid, temp_C_2m, and windSpeed_m_s. Generate a column called “datetime” using the year, month, day, hour24, and min columns.
#Next, create a column called “datetimeLocal” that converts the datetime column to Pacific/Honolulu time (HINT: look at the lubridate function called with_tz()).

#Answer
mloa_TD <- mloa %>% 
  filter(rel_humid > 0, temp_C_2m > 0, windSpeed_m_s > 0) %>% 
  mutate(datetime = paste0(year,"-", month,"-", day," ", hour24,":", min)) %>% 
  mutate(datetime = ymd_hm(datetime, tz = "UTC"), datetimeLocal = as_datetime(datetime, tz = "Pacific/Honolulu")) 

#to find names of timzones type into console OlsonNames()
?as_datetime
#Test Space  
mloa_testdf <- mloa[1:100, ]

mloa_testdf$datetime <- paste0(mloa_testdf$year,"-", mloa_testdf$month,"-", mloa_testdf$day," ", mloa_testdf$hour24,":", mloa_testdf$min)

mloa_testdf <- ymd_hm(mloa_testdf$datetime, tz = "UTC") 

str(mloa)
?ymd_hm

months <- month(mloa_TD$datetime, label = TRUE, abbr = TRUE)
table(months)
hours <- hour(mloa_TD$datetime)
table(hours)

#Then, use dplyr to calculate the mean hourly temperature each month using the temp_C_2m column and the datetimeLocal columns. (HINT: Look at the lubridate functions called month() and hour()). 
MHT <- mloa_TD %>% 
  mutate(monthLocal = month(datetimeLocal, label = TRUE, abbr = TRUE), hourLocal = hour(datetimeLocal)) %>% 
  group_by(monthLocal, hourLocal) %>% 
  summarise(mean = mean(temp_C_2m, na.rm = TRUE))

#Finally, make a ggplot scatterplot of the mean monthly temperature, with points colored by local hour.
ggplot(data = MHT, mapping = aes(x = monthLocal, y = mean, color =hourLocal)) +
  geom_point(alpha = 0.5) +
  xlab("Month") +
  ylab("Mean Hourly Temperature")
  
