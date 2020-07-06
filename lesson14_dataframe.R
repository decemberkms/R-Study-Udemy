rm(stats)
?read.csv("")


#method 1
stats <- read.csv(file.choose())
stats


#method 2 
getwd()

setwd("C:\\Users\\Min\\books\\R")

stats <- read.csv("P2-Demographic-Data.csv")

#--------------------------------
stats
nrow(stats)
ncol(stats)
head(stats, n=10)
tail(stats)
str(stats)

a = rnorm(100)
b = runif(100)
summary(stats)

stats$Internet.users[2]
stats[,"Internet.users"]
levels(stats$Income.Group)
summary(stats)

?levels

#-------------------
stats[1:10,]
stats[3:9,]
stats[c(4,100),]

is.data.frame(stats[1,])
is.data.frame(stats[,1])
stats[,1,drop=F]


stats$Birth.rate * stats$Internet.users


stats$MyCalc <-stats$Birth.rate * stats$Internet.users
stats



stats$xyz <- 1:5
stats


stats$xyz <- NULL
stats
head(stats, n=3)


# ----------------------- filtering data frame
head(stats, n=3)
filter <- stats$Internet.users < 2
stats[filter,]
stats[stats$Internet.users < 1,]
stats[stats$Internet.users > 10 & stats$Birth.rate >30,]
stats[stats$Income.Group == "High income",]
stats[stats$Country.Name == "Malta",]
levels(stats$Income.Group)


#--------------------- qplot
#install.packages("ggplot2")
library(ggplot2)
?qplot
qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(2))
qplot(data=stats, x=Income.Group, y=Birth.rate, size=2)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(2),
      color=I("blue"))
qplot(data=stats, x=Income.Group, y=Birth.rate, geom="boxplot")


#--------------------- visualising what we need
qplot(data=stats, x= Internet.users, y = Birth.rate)
qplot(data=stats, x= Internet.users, y = Birth.rate,
      size=I(2), color=I("red"))
qplot(data=stats, x= Internet.users, y = Birth.rate,
      size=I(2), color=Income.Group)

#---------------------- creating dataframe
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, 
                   Regions_2012_Dataset)
head(mydf)
colnames(mydf) <- c("Country", "Code", "Region")
head(mydf)
rm(mydf)


mydf <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset, 
                   Region=Regions_2012_Dataset)
mydf
head(mydf)
