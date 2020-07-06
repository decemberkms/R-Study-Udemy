rm(list=ls())

df <- read.csv(file.choose())


getwd()
setwd("C:\\Users\\Min\\books\\R")
fin <- read.csv("P3-Future-500-The-Dataset.csv")

str(fin)
head(fin,n=10)
tail(fin,n=10)
summary(fin)

#changing from non-factor to factor
fin$ID <- factor(fin$ID)
fin$Inception <- factor(fin$Inception)

# factor variable trap( FVT)
a <- c("12","13","14","12","12")
a
typeof(a)
b <- as.numeric(a)
typeof(b)
# converting into numeric for factors
z <-  factor(c("12","13","14","12","12"))
typeof(z)
levels(z)
y <- as.numeric(z)
typeof(y)
######## CORRECT WAY   when yo want to change factor(numbers) into numberic, first change it into charactors
as.numeric(as.character(z))


head(fin)
str(fin)
fin$Profit

# gsub() and sub()
?sub
fin$Expenses <- gsub(" Dollars", "", fin$Expenses)
fin$Expenses <- gsub(",", "", fin$Expenses)
head(fin)
str(fin)

fin$Revenue <- gsub("\\$", "", fin$Revenue) ### $ sign need \\
fin$Revenue <- gsub(",", "", fin$Revenue)
head(fin)
str(fin)

fin$Growth <- gsub("%", "", fin$Growth) ### $ sign need \\
fin$Growth <- gsub(",", "", fin$Growth)
head(fin)
str(fin)

fin$Revenue <- as.numeric(fin$Revenue)
fin$Expenses <- as.numeric(fin$Expenses)
fin$Growth <- as.numeric(fin$Growth)
head(fin)
str(fin)
summary(fin)


#---------------------- missing data
?NA
fin[!is.na(fin),]  ### ! is not!!

# locating missing data
complete.cases(fin) ########## check if there's na !!

fin[!complete.cases(fin),]
fin[complete.cases(fin),]

fin ################# na and just missing value is different!!!################
fin <- read.csv("P3-Future-500-The-Dataset.csv", na.strings=c("")) ### howto fill missing char with NA!


?complete.cases


########### which()
head(fin)
str(fin)
fin[fin$Revenue == 9746272,]
which(fin$Revenue == 9746272,)
fin[which(fin$Revenue == 9746272,),]  ### this is how to pick filtered data without grabbing NA values
?which                     
head(fin)
fin[which(fin$Employees ==45),]


# is.na()
head(fin,24)
fin[fin$Expenses == NA,] # you cannot compare NA with anything

a <- c(1,24,543,NA,76,45,NA)
a[is.na(a)]


# two line are the same. first one is to pick if there's na, second one is to pick if there isn't na(but ! is a opposite sign)
fin[is.na(fin$Expenses),]  

fin[!complete.cases(fin$Expenses),]


# how to remove a row with NA
fin_backup <- fin

fin[is.na(fin$Industry),]
fin <- fin[!is.na(fin$Industry),] # just reassign variables with the line above

# how to reset index
rownames(fin) <-1:nrow(fin) # jus assign index with rownames
rownames(fin) <- NULL # another way!!!!!

# how to replace missing data
fin[!complete.cases(fin),]
fin[is.na(fin$State) & fin$City == "New York", "State"] <- "NY"
fin[c(11,377),]

fin[is.na(fin$State) & fin$City == "San Francisco", "State"] <- "CA"
fin[c(82,265),]



