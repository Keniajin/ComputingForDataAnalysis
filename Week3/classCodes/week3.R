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

#make histrogram
x <- rnorm(100)
hist(x)
y<- rnorm(100)
plot(x,y)
z<- rnorm(100)
plot(x,z)
#example(points)
plot(x,z, pch=20, title="scatter", text(-2,2,"label"), legend("topleft", legend="Data", pch=20))


read.csv
read.table

xtabs


#llatice package
library(lattice)
x <- rnorm(100)
y <- x + rnorm(100, sd = 0.5)
f <- gl(2, 50, labels = c("Group 1", "Group 2"))
xyplot(y ~ x | f)

#lattice plotting demo
library(help = lattice)
?environmental
head(environmental)
xyplot(ozone ~ radiation , data=environmental , main="Ozone vs Radiation")
summary(environmental$temp)

temp.cut <- equal.count(environmental$temperature,4)

xyplot(ozone ~ radiation | temp.cut, data=environmental , main="Ozone vs Radiation")
#changing the layout and changing the plotting icom
xyplot(ozone ~ radiation | temp.cut, data=environmental , main="Ozone vs Radiation", layout=c(1,4),pch=20, as.table=TRUE,
       panel=function(x,y,...){
         panel.xyplot(x,y,...)
         fit <- lm(y~x)
         panel.abline(fit)
       })

xyplot(ozone ~ radiation | temp.cut, data=environmental , main="Ozone vs Radiation", layout=c(1,4),pch=20, as.table=TRUE,
       panel=function(x,y,...){
         panel.xyplot(x,y,...)
                 panel.loess(x,y)
       }, xlab="Solar Radiation", ylab="Ozone (ppb)")

#splitting into four equal parts
wind.cut <- equal.count(environmental$wind,4)
xyplot(ozone ~ radiation | temp.cut * wind.cut, data=environmental , main="Ozone vs Radiation",pch=20, as.table=TRUE,
       panel=function(x,y,...){
         panel.xyplot(x,y,...)
         panel.loess(x,y)
       }, xlab="Solar Radiation", ylab="Ozone (ppb)")
#scatter
splom(~environmental)
#histogram
histogram(~temperature | wind.cut, data=environmental)
histogram(~ozone | wind.cut, data=environmental)
histogram(~ozone | wind.cut * temp.cut, data=environmental)

#ggplot using qplot - quick plot
library(ggplot2)
str(mpg)
qplot(displ,hwy,data=mpg,color=drv)
qplot(hwy,data=mpg,fill=drv)
#panels
qplot(displ,hwy,data=mpg,facets=.~drv)
qplot(hwy,data=mpg,facets=.~drv,binwidth=2)

#maacs data
maacs <- rea

#hist of eno
qplot(log(eno),   data      =        maacs)
str(maacs)

##ggplot a <- qplot(logpm25, NocturnalSympt, data = maacs, facets = . ~ bmicat, geom =c("point", "smooth"), method = "lm”)

g <- ggplot(maacs, aes(logpm25, NocturnalSympt))
g + geom_point()

#adding more lyers smooth line and facets
g + geom_point() + geom_smooth(method="lm") + facets_grid = (. ~ bmicat)
#add color
g + geom_point(aes(color=bmicat),size=4,alpha=1/2) + geom_smooth(method="lm") + facets_grid = (. ~ bmicat) + theme_bw()

#adding labels
g + geom_point(aes(color = bmicat)) + labs(title = "MAACS Cohort") + labs(x = expression("log "
                                                                                         * PM[2.5]), y = "Nocturnal Symptoms")

#adding lines
g + geom_point(aes(color = bmicat), size = 2, alpha = 1/2) +
  geom_smooth(size = 4, linetype = 3, method = "lm", se = FALSE)
point