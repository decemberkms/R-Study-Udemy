a <- c(1,2,3,4)
is.numeric(a)
b <- c("a", 1)
is.numeric(b)
typeof(b[2])

is.integer(a)
is.double(a)

V2 <- c(3L,12L,242L)
is.numeric(V2)
is.integer(V2)
is.double(V2)

V3 <- c("a", "B23", "Hello")
V3
is.character(V3)
is.numeric(V3)

#cannot mix different types



seq() #sequence - like ':'
rep() #replicate

V4 <- seq(1,15)
1:15 # not sequence  but works same


seq(1,15,2) # start, end, step

z <- seq(1,15,4)

d <- rep(3, 100)


rep("a", 5)

x <- c(80,20)
y <- rep(x,10)
y[2]


