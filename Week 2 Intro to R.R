3+4

4+8*3^2

#this is a comment

2/1000000
4e3

exp(1)

exp(3)

log(100)
log(100, base = 10)
y<-1
log(y)

log(10, 100)
log(base = 10, x = 100)

x
y
log(x)
x

rm(x)
rm(y)

log(-40)

x<-1
x<-3

x=2

x == 5
x != 5

x>4
x<3

x>=2


x<=-1

x<-x+1
x
y<-x+2

x+y

numSamples<-50

num_samples<-50

numsamples<-40

rm(numsamples)
rm(numSamples)

num_samples
num_samples

#Week 2.2: Project Management

getwd()
"/Users/joelc/Documents/R-Projects/R_DAVIS_in_class_project_jcchima"

#relative file path
~/data
  
##Vector and data types ---
weight <- c(50, 3, 47, 2)
weight

## vector with text
animals <- c("mouse","horse", "rat")
animals


## additional function ---
class(weight)
class(animals)
length(weight)
length(animals)

str(weight)


## Change vector ----
weight <- c(weight,90) # adds to the end of the vector
weight
weight <- c(3, weight)
weight


# Subsetting
animals <- c("mouse", "rat", "dog", "cat")
animals[2]

animals[c(2,3)]


animals[c(2,3,2,3,2,3)]

## Logical vector subsetting
weight <- c(14, 76, 81, 25, 46)
weight[c(TRUE, TRUE, FALSE, FALSE, FALSE)]
weight[weight > 50]
weight > 50

#multiple tests
weight[weight>50 | weight < 20]
#AND --> &
# other symbols
weight[weight>= 46]

