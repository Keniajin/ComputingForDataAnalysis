outcome <- read.csv("Assignment2/data/outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
ncol(outcome)
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11] , xlab="30 Day Death Rate" , main="Heart Attack 30 day Death Rate")

#Plot the 30-day mortality rates for heart attack, heart failure,
#and pneumonia
str(outcome)
par(mfrow = c(3, 1))
hist(outcome[, 11] , xlab="30 Day Death Rate" , main="Heart Attack 30 day Death Rate")
outcome[, 17] <- as.numeric(outcome[, 17])
hist(outcome[, 17] , xlab="30 Day Death Rate" , main="Heart Failure 30 day Death Rate")
outcome[, 23] <- as.numeric(outcome[, 23])
hist(outcome[, 23] , xlab="30 Day Death Rate" , main="Pneumonia 30 day Death Rate")
par(mfrow = c(1, 1))

par(mfrow = c(2, 3))
x <- median(outcome[, 11] , na.rm=TRUE)
y <- median(outcome[, 17] , na.rm=TRUE)
z<- median(outcome[, 23] , na.rm=TRUE)

hist(outcome[, 11] , xlab="30 Day Death Rate" , main="Heart Attack 30 day Death Rate")
abline(v=x,col = "blue", lwd = 2)
hist(outcome[, 17] , xlab="30 Day Death Rate" , main="Heart Failure 30 day Death Rate")
abline(v=y,col = "blue", lwd = 2)
hist(outcome[, 23] , xlab="30 Day Death Rate" , main="Pneumonia 30 day Death Rate")
abline(v=z,col = "blue", lwd = 2)
par(mfrow = c(1, 1))

#Plot 30-day death rates by state
#outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
#outcome[, 11] <- as.numeric(outcome[, 11])
table(outcome$State)
library(plyr)
outcome2 <- subset(outcome, table(outcome$State)[outcome$State] > 20)
outcome2b <- outcome[ table(outcome$State)[ outcome$State ] > 20,]
death <- outcome2[, 11]
state <- outcome2$State
par(las=2)
boxplot(death ~ state , main="Heart Attack 30-day Death Rate by State" , ylab="30-day Death Rate")
med<-sort(by(death,outcome2$State, median,na.rm=TRUE))
n <- names(med)
df <- data.frame(death=death, state=factor(state, levels=n)) 
boxplot(df[,1]~df[,2],ylab="30-day Death Rate",main="Heart Attack 30-day DeathRate by state")

#4 Plot 30-day death rates and numbers of patient
hospital <- read.csv("Assignment2/data/hospital-data.csv", colClasses = "character")
outcome.hospital <- merge(outcome, hospital, by = "Provider.Number")
death <- as.numeric(outcome.hospital[, 11]) ## Heart attack outcome
npatient <- as.numeric(outcome.hospital[, 15])
 owner <- factor(outcome.hospital$Hospital.Ownership)
xyplot(death~npatient|owner,data=outcome.hospital, xlab="Number of Patients Seen",as.table=TRUE,
       panel=function(x,y,...){
         panel.xyplot(x,y,...)
         fit<-lm(death~npatient)
         panel.abline(fit, lmd=2)
       },ylab="30-day Death Rate",main="Heart Attack30-day Death Rate by Ownership")
