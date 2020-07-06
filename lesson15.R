mydf2 <-data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset,
                   Region=Regions_2012_Dataset)

head(mydf2)
summary(mydf2)
levels(mydf2$Region)

#------------------------ merging
?merge


merged <- merge(stats, mydf2, by.x = "Country.Code", by.y="Code")


head(merged)

merged$Country <- NULL
str(merged)
 

#------------------------ Visualising

library(ggplot2)
qplot(data=merged, x=Internet.users, y=Birth.rate)
qplot(data=merged, x=Internet.users, y=Birth.rate
      , color=Region)
#1. Shape
qplot(data=merged, x=Internet.users, y=Birth.rate
      , color=Region, size=I(5), shape=I(1))
#2. Transparnecy
qplot(data=merged, x=Internet.users, y=Birth.rate
      , color=Region, size=I(5), shape=I(1), alpha=I(0.5))
#2. Title
qplot(data=merged, x=Internet.users, y=Birth.rate
      , color=Region, size=I(5), shape=I(1), 
      alpha=I(0.5), main="Birth rate vs Internet users")

