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


#combining lapply with the [] operator
Weather$Chicago[1,1] # the same
Weather[[1]][1,1] # the same

lapply(Weather,"[", 1, 1) # way of picking things from list using lapply
lapply(Weather,"[", 1, )
lapply(Weather,"[", , 3)


# ----------- adding your own function
lapply(Weather, rowMeans)
lapply(Weather, rowMeans)$Chicago
Weather
lapply(Weather, function(x) x[1,])
lapply(Weather, function(x) x[5,])
lapply(Weather, function(x) x[,12])
Weather
lapply(Weather, function(z) z[1,] - z[2,])
lapply(Weather, function(z) round((z[1,] - z[2,])/z[2,],2))


## using sapply
?sapply
Weather
# avg high for July
lapply(Weather, "[", 1, 7) # return a list
sapply(Weather, "[", 1, 7) # return a vector:it may return a vector or matrix depending on what process I use

#Avg for 4th quarter:
lapply(Weather, "[", 1, 10:12) # return a list
sapply(Weather, "[", 1, 10:12) # return matrix

#anther 
lapply(Weather, rowMeans)
round(sapply(Weather, rowMeans), 2)

# anther
lapply(Weather, function(z) round((z[1,] - z[2,])/z[2,],2))
sapply(Weather, function(z) round((z[1,] - z[2,])/z[2,],2))
sapply(Weather, function(z) round((z[1,] - z[2,])/z[2,],2), simplify=FALSE) # same as lapply

#-------------------------Nesting Apply functions
Weather
lapply(Weather, rowMeans)
Chicago
apply(Chicago, 1, max)

#apply across whole list
lapply(Weather, apply, 1, max) # the same
lapply(Weather, function(x) apply(x, 1, max)) # the same

#tidy up
sapply(Weather, apply, 1, max) 
sapply(Weather, apply, 1, min) 
