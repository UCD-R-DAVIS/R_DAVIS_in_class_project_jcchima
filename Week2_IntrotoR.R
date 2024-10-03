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
