surveys <- read.csv("data/portal_data_joined.csv")
surveys
nrow(surveys)
ncol(surveys)
dim(surveys)
str(surveys)
head(surveys)
tail(surveys)
surveys[1:5000, ]
surveys[, 12]   
surveys[2]
surveys[, -1:-10] 
surveys[-c(7:34786), ]
surveys[-c(5001:34786), ]
surveys[c(1:5000), ]
surveys["species_id"]
surveys[, "species_id"]
surveys[["species_id"]] 
surveys$hindfoot_length
spec <- surveys$species_id[1:5000]
Wgt <- surveys$weight[1:5000]
pt <- surveys$plot_type[1:5000]
surveys$species_id[1:5000] surveys$weight[1:5000] surveys$plot_type[1:5000]

#Create a new data frame called surveys_base with only the species_id, the weight, and the plot_type columns. Have this data frame only be the first 5,000 rows.---
base <- surveys[c(6,9,13)] 
surveys_base <- base[c(1:5000), ]
surveys_base

#Convert both species_id and plot_type to factors. Remove all rows where there is an NA in the weight column.---
factor(c(6,13))
