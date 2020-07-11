rm(list=ls())

df <- read.csv(file.choose())


getwd()
setwd("C:\\Users\\Decemberkms.000\\books\\R\\R_Start")
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
fin <- read.csv("P3-Future-500-The-Dataset.csv", na.strings=c("")) ### how to fill missing char with NA!


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

fin[complete.cases(fin),]
fin[fin$Industry == 'Retail',]$Employees
?median()


# how to calculate mean or median excluding NA
med_emp_retail <- median(fin[fin$Industry == "Retail","Employees"], na.rm=T)

mean(fin[fin$Industry == "Retail","Employees"], na.rm=T)
mean(fin[,"Employees"], na.rm=T)


fin[is.na(fin$Employees) & fin$Industry == "Retail", "Employees"] <- med_emp_retail
fin[3,]

fin[!complete.cases(fin),]


fin[is.na(fin$Employees), "Employees"]

med_emp_fS <- median(fin[fin$Industry == "Financial Services", "Employees"], na.rm=T)
fin[is.na(fin$Employees) & fin$Industry == "Financial Services", "Employees"] <- med_emp_fS
mean(fin[fin$Industry == "Financial Services", "Employees"], na.rm=T)
fin[332,]

fin[!complete.cases(fin),]

fin[is.na(fin$Growth) & fin$Industry == "Construction",]

median(fin[, "Growth"], na.rm=T)
med_grw_cost <- median(fin[fin$Industry == "Construction", "Growth"], na.rm=T)

fin[is.na(fin$Growth), "Growth"] <- med_grw_cost
fin[8,]


fin[!complete.cases(fin),]

fin[is.na(fin$Revenue),]  
med_rev_construction <- median(fin[fin$Industry == "Construction", "Revenue"], na.rm=T)
fin[is.na(fin$Revenue), "Revenue"] <- med_rev_construction
fin[c(8,42),]


fin[!complete.cases(fin),]


med_exp_constr <- median(fin[fin$Industry == "Construction", 'Expenses'], na.rm=T)
med_exp_constr
fin[is.na(fin$Expenses) & fin$Industry == "Construction" & is.na(fin$Profit),'Expenses'] <- med_exp_constr

fin[!complete.cases(fin),]


fin[c(8,42),]

# revenue - expenses = profit

fin[is.na(fin$Profit),"Profit"] <- fin[is.na(fin$Profit), "Revenue"] - fin[is.na(fin$Profit), "Expenses"]




fin[c(8,42),]


fin[!complete.cases(fin$Expenses),"Expenses"] <- fin[is.na(fin$Expenses), "Revenue"] - fin[is.na(fin$Expenses), "Profit"]


fin[15,]


fin[!complete.cases(fin),]










#---------------- visualisation
install.packages("ggplot2")
library(ggplot2)

p <- ggplot(data=fin)

p + geom_point(aes(x=Revenue, y=Expenses,
                   color=Industry, size=Profit ))


# smooth
d <- ggplot(data=fin,aes(x=Revenue, y=Expenses, color=Industry))
d + geom_point()
d + geom_point() + geom_smooth(fill=NA, size=1.2)


#------------- boxplot
f <- ggplot(data=fin, aes(x=Industry, y=Growth,
                          color=Industry))
f + geom_boxplot(size=1)

f + geom_jitter() + geom_boxplot(size=1, alpha=0.8, outlier.color = NA)
























