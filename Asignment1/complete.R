complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  id.len <- length(id)
  completedata <- rep(0, id.len)
  count = 1
  for(i in id) {
  id2 <- sprintf("%03d.csv", as.numeric(i) )
  path <-  paste(directory,id2, sep="/")
  df <- read.csv(path, header=T)
    nobs <- sum(complete.cases(df))
  #print(data.frame(a = i, b=nobs))
  #x<-print(cbind(i,nobs,deparse.level=1))
  completedata[count] <- nobs
 count <- count + 1
 
  }
 output <- data.frame(id = id, nobs = completedata)
 output
}


complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)



# 
# print(x)
# di
# good <- complete.cases(data)
# complete <- data[complete.cases(data),]
# length(complete)
# sapply(data, function(x) length(complete.cases(x)))
# id <-1
# id2 <- sprintf("%03d.csv", as.numeric(id) )
# 
# nobs <- sum(complete.cases(data))
# 
# data.frame(id=id,nobs=nobs)
# 
# nobs<-nrow(na.omit(df))
# table(complete.cases(df))
# complete <- sum(complete.cases(df))
# sapp

d <- data.frame()
for (i in 1:20) {d <- rbind(d,c(i+i, i*i, i/1))}
