rm(list = ls())
getwd()
setwd("C:\\Users\\Min\\books")
setwd(".\\R_start")

# read data
Chicago <- read.csv("Chicago-F.csv", row.names=1)
NewYork <- read.csv("NewYork-F.csv", row.names=1)
Houston <- read.csv("Houston-F.csv", row.names=1)
SanFrancisco <- read.csv("SanFrancisco-F.csv", row.names=1)

Chicago
NewYork
Houston
SanFrancisco
is.data.frame(SanFrancisco)

#let's convert to matrices
Chicago <- as.matrix(Chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)

is.matric(SanFrancisco)

# let's put all of these into a list
Weather <- list(Chicago=Chicago, NewYork=NewYork, Houston=Houston, SanFrancisco=SanFrancisco)
Weather
#let's try it out
Weather[3]
Weather[[3]]
Weather$Houston
apply(Weather$Houston,1,mean) # row
apply(Weather$Houston,1,max)
apply(Weather$Houston,2,max) # column
# The apply family
## apply - use on a matrix : either the rows or the columns
## tapply - use on a vector to extract subgroups and apply a function to them
## by - use on data frames. Same concepts as in group by in SQL
## eapply -use on a environment(E)
## lapply - apply a fuction to elemernts of a list(L)
## sapply - a version of lapply. Can simplify (S) the result so it's not presetned as a list
## vapply - has a pre-specified type of return value(V)
## replicate -run a fuction several times. Usually with generation of random value
## mapply -multivariate Versiob of sapply
## rapply - recursive version opf lapply



# what is apply ?
?apply()
Chicago
apply(Chicago, 1, mean)

#check
Chicago["DaysWithPrecip",]
mean(Chicago["DaysWithPrecip",])


#analyze one city
Chicago
apply(Chicago, 1, max)
apply(Chicago, 1, min)

#for practice:
apply(Chicago, 2, max)
apply(Chicago, 2, min)

#Compare
apply(Chicago, 1, mean)
apply(NewYork, 1, mean)
apply(Houston, 1, mean)
apply(SanFrancisco, 1, mean)
                                
#---------------- loop instead of apply
Chicago
# find the mean of every row
# 1. via loo
output <- NULL #preparing an empty vector
for (i in 1:5){
  output[i] <- mean(Chicago[i,])
}
output
names(output) <- rownames(Chicago)
output

# 2. via apply
apply(Chicago, 1, mean)


#------------------- lapply
Chicago
?lapply
#ex1
t(Chicago) #transpose
Weather
lapply(Weather,t) # apply lapply to a list
mynewlist <- lapply(Weather,t)

#ex2
lapply(Weather, rbind, NewRow=1:12) # how to add a new row to every element in a list

#ex3
?rowMeans
rowMeans(Chicago) # identical to :apply(Chicago, 1, mean) - predefined function in R
lapply(Weather, rowMeans) # better than 4 lines above
lapply(Weather, colMeans)
lapply(Weather, rowSums)
lapply(Weather, colSums)


