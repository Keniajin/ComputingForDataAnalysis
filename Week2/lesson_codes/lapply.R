
#What does 'sapply' return in the following code?

x <- list(rnorm(100), runif(100), rpois(100, 1))
sapply(x, quantile, probs = c(0.25, 0.75))


x <- matrix(rnorm(200), 50, 4)
apply(x, c(1, 2), mean)

apply(x, 1, sum)
apply(x, 2, min)

library(datasets)
head(airquality)
s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")],
                               na.rm = TRUE))

str(split(x, list(f1, f2) , drop=TRUE )) #returns levels with obs in them