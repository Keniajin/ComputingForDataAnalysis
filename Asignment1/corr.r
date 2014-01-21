corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  completeoutput <- complete(directory)
  nobs <-  completeoutput $nobs
  ids <-  completeoutput $id[nobs > threshold]
  ids.len <- length(ids)
  cr <- rep(0, ids.len)
  count = 1
  for(i in ids){
    data <- getmonitor(i, directory)
    cr[count] <- cor(data=data, sulfate, nitrate, use="complete.obs")
    count =count + 1
  }
  cr 
 
}

complete <- function(directory,id=1:332) {
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

getmonitor <- function(id, directory, summarize = FALSE) {
  ## 'id' is a vector of length 1 indicating the monitor ID
  ## number. The user can specify 'id' as either an integer, a
  ## character, or a numeric.
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'summarize' is a logical indicating whether a summary of
  ## the data should be printed to the console; the default is
  ## FALSE
  
  ## Your code here
  id2 <- sprintf("%03d.csv", as.numeric(id) )
  path <-  paste(directory,id2, sep="/")
  df <- read.csv(path, header=T)
  if (summarize == TRUE) {
    print(summary(df))    
  }
  df
}

cr <-  corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
 head(cr)

summary(cr)

cr <-  corr("specdata", 5000)
summary(cr)
length(cr)

cr <- corr("specdata")
summary(cr)
length(cr)