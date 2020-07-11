getwd()
setwd("C:\\Users\\Min\\books\\R_Start")

util <- read.csv("P3-Machine-Utilization.csv")

head(util, 12)
str(util)
summary(util)
util$Machine <- factor(util$Machine)

##----------- column for utilisation
util$Utilisation <- 1 - util$Percent.Idle
head(util,10)
tail(util,10)

#----- data
?POSIXct  # just standards between computeres, not just time but everything
head(util,10)
util$PosixTime <- as.POSIXct(util$Timestamp,format = "%d/%m/%Y %H:%M")

head(util,10)
summary(util)


# tip how to rearrange columns in a df
util$Timestamp <- NULL
head(util,10)
util <- util[,c(4,1,2,3)] ########## rearrange column order!!!
head(util,10)


# what is a list??
# can contain anything any type of data
summary(util)
RL1 <- util[util$Machine == "RL1",]
summary(RL1)
RL1$Machine <- factor(RL1$Machine)

# construct list!

util_stats_rl1 <- c(min(RL1$Utilisation, na.rm=T),
                    mean(RL1$Utilisation, na.rm=T),
                    max(RL1$Utilisation, na.rm=T))
util_stats_rl1
length(which(RL1$Utilisation < 0.9)) > 0
as.logical(length(which(RL1$Utilisation < 0.9))) # the same as one above
# gives indeice of True values
util_under_90_flag <- length(which(RL1$Utilisation < 0.9)) > 0
util_under_90_flag
list_rl1 <- list("RL1", util_stats_rl1, util_under_90_flag)
list_rl1



# ----------------- name of list
names(list_rl1)
names(list_rl1) <- c("Machine", "Stats", "LowThreshold")
list_rl1
#------------ give names directly ( like dataframe)
list_rl1 <- list(Machine ="RL1", Stats=util_stats_rl1, LowThreshold=util_under_90_flag)
summary(list_rl1)


#---------------------- extracing components of a list
# three ways 
# [] - will always return a list
# [[]] will always return the actual object
# $ - same as [[]]

list_rl1[1] # still a list
list_rl1[[1]]  # now it is a vertor 
list_rl1$Machine # same as above

list_rl1[2]
typeof(list_rl1[2]) # list
list_rl1[[2]] 
typeof(list_rl1[[2]])  # double
list_rl1$Stats
typeof(list_rl1$Stats)  # double

# how would you access the 3rd element?  the point is to get to the vector not a list
list_rl1[[2]][3]
list_rl1$Stats[3]

list_rl1[[3]]



# adding and deleting list components
list_rl1
list_rl1[4] <- "New Information"
list_rl1
# another way to add
list_rl1$UnknownHours <- RL1[is.na(RL1$Utilisation),"PosixTime"]
# list_rl1[7] <- NULL
# list_rl1[6] <- NULL
list_rl1

# NOTICE :L numeration has shifted so if you delete something in the middle, the next one has shifted to the front not like data frame

# add anther component
list_rl1$Data <- RL1
list_rl1
summary(list_rl1)
str(list_rl1)

list_rl1[[5]][1]
list_rl1$UnknownHours[1]

# subsetting alist 
list_rl1[1:3]
list_rl1[c(1,5)]
sublist_rl1 <- list_rl1[c("Machine", "Stats")]
sublist_rl1[[2]][2]
######## double square brackets are NOT for subsetting ##########

