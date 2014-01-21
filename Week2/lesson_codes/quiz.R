candlestickPlot <- function(x){
  
  library("ggplot2")
  
  # x is a data.frame with columns 'date','open','high','low','close'
  x$candleLower <- pmin(x$open, x$close)
  x$candleUpper <- pmax(x$open, x$close)
  x$candleMiddle <- NA
  x$fill <- "red"
  x$fill[x$open < x$close] = "green"
  
  # Draw the candlesticks
  g <- ggplot(x, aes(x=date, lower=candleLower, middle=candleMiddle, upper=candleUpper, ymin=low, ymax=high)) 
  g <- g + geom_boxplot(stat='identity', aes(group=date, fill=fill))
  g 
}

data<-data.frame(X=rep(letters[1:3], each=4),Y=sample(1:12,12))
dataA <- subset(data, data$X=="a")
min(dataA$Y, na.rm=TRUE)

library(data.table)
d <- data.table(data)
d[, min(Y, na.rm=TRUE), by=X]

library(plyr)
ddply(data, .(X), summarise, min(Y, na.rm=TRUE))
ddply(data, .(X), summarise, min=min(Y, na.rm=T))

count(data,X)
d <- count(data, vars="X")
class(d)

class(data$X)  
  
count(baseball[1:100,], vars = "id")
count(baseball[1:100,], vars = "id", wt_var = "g")
View(baseball)


sum(abs(numbers - x) < 1e-6)

length(which(data$X=="a"))
count(data, vars = "X", wt_var = "Y",na.rm=TRUE)

library("doBy")
sum(data$Y) ,which(data$X=="a"))
sum( data[ data[,1]=="a" ,-2 ] )



cube <- function(x, n) {
  x^3
}

cube(3)

pow() <- function(x = 4, n = 3) {
  x^n
}

x <- 1:10
if(x > 5) {
  x <- 0
}

library(datasets)
data(iris)

head(iris)

tapply(iris$Sepal.Length, iris$Species, FUN=mean , simplify=T)

apply(iris[, 1:4], 2, mean)
apply(iris, 2, mean)

library(datasets)
data(mtcars)

sapply(split(mtcars$mpg, mtcars$cyl), mean)
26.66364 - 15.1000

mean(mtcars$mpg, mtcars$cyl)
lapply(mtcars, mean)

f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}

z <- 10
f(3)

debug(f)
