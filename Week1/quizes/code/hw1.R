setwd("E:/R_CLass/ComputingForDataAnalysis/Week1/quizes/")
data <- read.csv("data/hw1_data.csv",header=TRUE)
#the variables on the data
str(data)
#first two elements
head(data,n=2)
#number of rows in the data
nrows.data <- nrow(data)
#extract the last two
tail(data,n=2)
#count the missing data
ozone.47 <- data$Ozone[47]
bad <- is.na(data$Ozone)
table(bad)

#mean of Ozone
data2 <- data[!bad]
Ozone2 <- na.omit(data$Ozone)
mean(Ozone2)
mean(data$Ozone, na.rm=T)

#subseting
data[data$Ozone>31 & data$Temp>90] <- s 
subset2 <- subset(data, Ozone>31 & Temp>90)
mean(subset2$Solar.R)
subset3 <- subset(data, Month==5)
str(subset3$Ozone)
summary(subset3$Ozone)
mean(subset3$Temp)
