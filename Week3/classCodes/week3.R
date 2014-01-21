x <- rnorm(10)
print(x)
x <- rnorm(10, 20, 2)
print(x)
summary(x)


#simulating from the following linear model
x <- 1:100
y = 1.5 - 3 x + e
e <- rnorm(100, 0, 1)
y <- 1.5 - 3 * x + e
plot(x,y)

