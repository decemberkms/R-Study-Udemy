


"Hello World!"

install.packages("ggplot2")



mydata <- read.csv(file.choose())

ggplot(data=mydata, aes(x=carat, y= price)) + 
  geom_point()
