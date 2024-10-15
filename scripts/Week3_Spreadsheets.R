
?read.csv
surveys <- read.csv("data/portal_data_joined.csv")
nrow(surveys)
ncol(surveys)
dim(surveys)
?str
str(surveys)
head(surveys)
tail(surveys)
head(surveys)
summary.data.frame(surveys)
summary(object = surveys)
summary.data.frame(surveys)
?summary.data.frame

dim(surveys)
surveys[1,5]

#first 5 rows
surveys[1:5]

surveys[c(1, 5, 24, 3001),]

surveys[1,]
surveys[,1]

surveys[,1:5]
dim(surveys[,1:5])

surveys[1]

dim(surveys[1])
surveys['record_id']

colnames(surveys)

cols_to_grab = c('record_id','year','day')
cols_to_grab
surveys[cols_to_grab]
head(surveys)
tail(surveys)
dim(surveys)
head(surveys,n = 10)
head(surveys[1:10,])
surveys[c('record_id', 'year', 'day')]
dim(surveys[c('record_id','year','day')])
head(surveys,1)

head(surveys["genus"])
head(surveys[["genus"]])
surveys$genus
head(surveys['genus',])
head(surveys[,'genus'])

surveys$hindfoot_length
class(surveys$hindfoot_length)

surveys$plot_id

install.packages('tidyverse')
library(tidyverse)
t_surveys <- read_csv('data/portal_data_joined.csv')
class(t_surveys)
t_surveys
