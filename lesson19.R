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
