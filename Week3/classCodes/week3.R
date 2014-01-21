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

x <- rnorm(100)
hist(x)
dev.off()

x <- rnorm(100)
y <- x + rnorm(100)
par(las = 1)
plot(x, y)
#las sets the orientation of the x labels or orientation of the labels
par(las = 2)
plot(x, y)

x <- rnorm(100)
y <- x + rnorm(100)
plot(x, y)

x1 <- rnorm(10)
y1 <- rnorm(10)
points(x1, y1, col = "red")