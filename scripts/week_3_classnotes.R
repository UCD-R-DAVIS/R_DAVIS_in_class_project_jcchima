set.seed(15) #
hw2 <- runif(50, 4, 50)#The 1st is the number of values we want the 2nd is the Min and the last is the Max---
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2 

#Take your hw2 vector and removed all the NAs then select all the numbers between 14 and 38 inclusive, call this vector prob1.---
hw2[2]# could be read as "return the second value in hw2"
hw2 [c(3,5)]# could be read as "return the third and fifth values in animals"
hw2[c(1, 2, 3, 2, 1, 4)]
hw2[c(FALSE, TRUE, FALSE, FALSE, TRUE)]
hw2 > 23
is.na(hw2)
no_na <- hw2 [!is.na(hw2)]
prob1 <- no_na[no_na >= 14 & no_na <= 38]
prob1

#Multiply each number in the prob1 vector by 3 to create a new vector called times3. Then add 10 to each number in your times3 vector to create a new vector called plus10.---
times3 <- prob1*3
plus10 <- times3+10

#Select every other number in your plus10 vector by selecting the first number, not the second, the third, not the fourth, etc. If you’ve worked through these three problems in order, you should now have a vector that is 12 numbers long that looks exactly like this one:
plus10[c(TRUE, FALSE)]

mean(hw2)
mean(hw2, na.rm = TRUE)

final <-plus10[c(TRUE, FALSE)]
final
final[c(TRUE, FALSE, FALSE)]

# Other data types
## Lists
c(4,6, "dog")
list(4,6, "dog") #It's like a garabage can which you can store in R
a <- list(4,6, "dog")
class(a)
str(a)


# Data.frames: is a picky form of a list
letters
data.frame(letters) # turns "letters" into a column of data
df <- data.frame(letters)
t(df)
as.data.frame(t(df)) # wide data frame

length(df)
dim(df) # rows, columns
nrow(df)
ncol(df)

# factors
animals <- factor(c("duck", "duck", "goose", "goose"))
animals <- factor(c("pigs", "duck", "duck", "goose", "goose"))
animals
class(animals)
levels(animals)
nlevels(animals)

animals <- factor(x = animals, levels = c("goose", "pigs", "duck"))
animals
year <- factor(c(1978, 1980, 1934, 1979))
as.numeric(year)
year
class(year)
as.numeric(year)
levels(year)

as.numeric(animals)
as.character(animals)
