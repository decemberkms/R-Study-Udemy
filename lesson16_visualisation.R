install.packages("installr")
library(installr)
install.packages("stringr")

getwd()
df <- read.csv(file.choose())

head(df)
str(df)
nrow(df)
ncol(df)
summary(df)
tail(df)

library(ggplot2)

qplot(data=df, x=Audience.Ratings.., y=Budget.million..)
colnames(df) <- c("Film", "Genre", "CriticRating", "AudienceRating",
              "BudgetMillions", "Year")
head(df)
tail(df)

str(df)
# categorical variable
df$Year <- factor(df$Year)
df$Genre <- factor(df$Genre)
df$Film <- factor(df$Film)
levels(df$Genre)
levels(df$Film)

summary(df)

#---------------------- Aesthetics
ggplot(data=df, aes(x=CriticRating, y=AudienceRating))

#add Geometry
ggplot(data=df, aes(x=CriticRating, y=AudienceRating)) +
  geom_point()

#add color
ggplot(data=df, aes(x=CriticRating, y=AudienceRating, 
                    color=Genre, size=BudgetMillions)) +
  geom_point()  

#>> this #1 (we will improve it)

p <- ggplot(data=df, aes(x=CriticRating, y=AudienceRating, 
                    color=Genre, size=BudgetMillions))

# point
p + geom_point()

#line
p + geom_line()

# multiple
p + geom_point() + geom_line()
p + geom_line() + geom_point()
str(df)

#---------------- Overrding aesthetic
q <- ggplot(data=df, aes(x=CriticRating, y= AudienceRating,
                         color=Genre, size=BudgetMillions))

q + geom_point()

# overriting aes
q + geom_point(aes(size=CriticRating/2))
q + geom_point(aes(color=BudgetMillions)) 
q + geom_point()

# ex3
q + geom_point(aes(x=BudgetMillions)) +
  xlab("Budget")

q + geom_point() + geom_line(size=1)

#--------------------- Mapping vs setting
r <- ggplot(data=df, aes(x=CriticRating, y=AudienceRating))
r+ geom_point()

#add color
#1 mapping
r + geom_point(aes(color=Genre))
#2 setting
r + geom_point(color="DarkGreen")

#------------------
r + geom_point(aes(size=BudgetMillions)) # if you want to map something
r + geom_point(size=10) # if you want to set something
r + geom_point(aes(size=10))



#---------------- histogram
s <- ggplot(data=df, aes(x=BudgetMillions))
s + geom_histogram(binwidth=5, color="Blue")
# add color
s + geom_histogram(binwidth=5, fill = "Green", color="Blue")
s + geom_histogram(binwidth=5, aes(fill=Genre), color="Black")

#>> 3 ( we will improve it)


# sometimes you may need density charts
s + geom_density(aes(fill=Genre), position="stack")


#------------------------- layer tips
t <- ggplot(data=df, aes(x=AudienceRating))
t + geom_histogram(binwidth=10,
                   fill="White", color="blue")

t <- ggplot(data=df)

t + geom_histogram(binwidth = 10,
                   aes(x=CriticRating),
                   fill="White", color="Blue")

t <- ggplot()


#-------------------------- statistical transformation

?geom_smooth()

u <- ggplot(data=df, aes(x=CriticRating, y=AudienceRating,
                         color=Genre))
u +geom_point() + geom_smooth(fill =NA)


#----------- boxplot

u <- ggplot(data=df, aes(x=Genre, y=AudienceRating,
                color=Genre))
u+geom_boxplot()
u + geom_boxplot(size=1.2) 
u + geom_boxplot(size=1.2)  + geom_point()
# tip
u + geom_boxplot(size=1.2) + geom_jitter()

u + geom_jitter()+ geom_boxplot(size=1.2, alpha=0.7)



u <- ggplot(data=df, aes(x=Genre, y=CriticRating,
                         color=Genre))

u + geom_jitter()+ geom_boxplot(size=1.2, alpha=0.7)


#------------------------- Using Facets
v <- ggplot(data=df, aes(x=BudgetMillions))
v + geom_histogram(binwidth = 10,
                   aes(fill=Genre), color="Black")

# Facets
v + geom_histogram(binwidth = 10,
                   aes(fill=Genre), color="Black") +
  facet_grid(Genre~., scales="free")
 
#scatterplots:
w <- ggplot(data=df, aes(x=CriticRating, y=AudienceRating,
                         color=Genre))

w + geom_point(size=3) + facet_grid(Genre~.)

w + geom_point(size=3) + facet_grid(.~Year)

w + geom_point(size=3) + 
  geom_smooth() + facet_grid(Genre~Year)

w + geom_point(aes(size=BudgetMillions)) + 
  geom_smooth() + facet_grid(Genre~Year)


#------------------------- cordinates

m <- ggplot(data=df, aes(x=CriticRating, y=AudienceRating,
                         size=BudgetMillions, color=Genre))
m + geom_point()

m + geom_point() + xlim(50,100) + ylim(50,100)


# won't work well always
n <- ggplot(data=df, aes(x=BudgetMillions))
n + geom_histogram(binwidth=10, aes(fill=Genre), color="black") +
  ylim(0,50)


# instead zoom!
n + geom_histogram(binwidth=10, aes(fill=Genre), color="black") +
  coord_cartesian(ylim=c(0,50))
  

w + geom_point(aes(size=BudgetMillions)) + 
  geom_smooth() + facet_grid(Genre~Year) + coord_cartesian(ylim=c(0,100))


#---------------- theme
o <- ggplot(data=df, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth=10,
                   aes(fill=Genre), color="black")
# label
h + xlab("Hahah!") + ylab("kikiki")

# label format
h + xlab("Hahah!") + ylab("kikiki") +
  theme(axis.title.x = element_text(color="DarkGreen", size=30),
        axis.title.y = element_text(color="Red", size=30))
# tick
h + xlab("Hahah!") + ylab("kikiki") +
  theme(axis.title.x = element_text(color="DarkGreen", size=30),
        axis.title.y = element_text(color="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20))

?theme


# lengend formatting
h + xlab("Hahah!") + ylab("kikiki") + ggtitle("Movie!!") +
  theme(axis.title.x = element_text(color="DarkGreen", size=30),
        axis.title.y = element_text(color="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title= element_text(size=23, color="blue", family="Courier"))
 