getwd()
setwd("C:\\Users\\Decemberkms.000\\books\\R\\R_Start")

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

# how to do it in Data frame?
















