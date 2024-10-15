#Introduction to R: arithmetic

3+4


#incomplete command
2*5



#order of operations
4+(8*3)^2

#this is a comment

#scientific notation
2/100000
4e3

#mathematical functions
exp(1)

exp(3)

log(4)

sqrt(4)



#r help files
?log
log(2, 4)
log(4, 2)
log(x = 2, base = 4)

x <- 1
x
rm(x)



#nested functions
sqrt(exp(4))
log(exp(100))


#six comparison functions
mynumber <- 6
mynumber == 5

mynumber != 5
mynumber>4
mynumber<3
mynumber>=2
mynumber<=-1


#objects and assignments
mynumber <- 7

othernumber <- -3
mynumber*othernumber

#object name conventions
numSamples <- 50
num_samples <- 40
rm(num_samples)
ls() #list

#remove everything
rm(list = ls())

#errors and warnings
log_of_word <- log("a_word")
log_of_word #Remember that "Error: object 'log_of_word' not found" means object hasn't be loaded or con't be found

log_of_negative <- log(-2)
log_of_negative # Remember "NaN" means Not a Number

#challenge
elephant1_kg <- 3492
elephant2_lb <- 7757

elephant1_lb <- elephant1_kg * 2.2

elephant2_lb > elephant1_lb

myelephants <- c(elephant1_lb, elephant2_lb)

which(myelephants == max(myelephants))



#working directory and file paths ---
getwd()
"C:/Users/joelc/Documents/R-Projects/R_DAVIS_in_class_project_jcchima"
setwd()
setwd("C:/Users/joelc/Documents/R-Projects/R_DAVIS_in_class_project_jcchima")


d <- read.csv("./data/tail_length.csv") #the "." placed in the front of "./data/tail_length.csv" is just C:/Users/joelc/Documents/R-Projects/R_DAVIS_in_class_project_jcchima

#creates a new file
dir.create("./scripts")

#How R Thinks About Data ----

##Vectors ----
weight_g <- c(50,60,65,82)
weight_one_value <- c(50)

animals <- c("mouse 'name'", "rat", "dog")
animals


length(weight_g)
str(weight_g)

#change vectors ---
weight_g <- c(weight_g, 90)
weight_g


#challenge ---
num_char <- c(1, 2, 3, "a") # chooses lowest common denominator
#vectors have to be the SAME class of values
num_char
num_logical <- c(1,2,3, TRUE)
num_logical
char_logical <- c("a", "b", "c", TRUE)
char_logical
tricky <- c(1, 2, 3, "4")
tricky

class(num_char)
class(num_logical)
class(char_logical)
class(tricky)

num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
combined_logical <- c(num_logical, char_logical)

## Subsetting ---
animals <- c("mouse", "rat", "dog", "cat")
animals
animals[2]
animals[c(2,3)]
animals[c(2,2,2)]
# indexing take items from a vector and create a new combination of values

### Conditional subsetting ---
weight_g <- c(21, 34, 39, 54, 55)
weight_g > 50
weight_g[weight_g > 50]

## Symbols
#%in%
animals
#"mouse" "rat" "dog "cat"
# %in% within a bucket
# == pairwise matching -- ORDER MATTERS
animals %in% c("rat", "cat", "dog", "duck", "goat")
animals == c("rat", "cat", "dog", "duck", "goat")
