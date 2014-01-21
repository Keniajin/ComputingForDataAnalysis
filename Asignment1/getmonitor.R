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

data <-  getmonitor(1, "specdata")
head(data)

data <- getmonitor(101, "specdata", TRUE)
head(data)
data <-  getmonitor("200", "specdata", TRUE)
icdd8 <- as.numeric(i)
icd92 <- sprintf("%05s", icd9)


icd9 <- c("33.27", "38.45", "9.25", "4.15", "38.45", "39.90", "84.1", "41.5", "50.3" ) 
formatC(as.numeric(icd9),width=5,format='f',digits=2,flag='0')

gsub(" ","0", paste(formatC(icd9, width=5,flag='0')))


