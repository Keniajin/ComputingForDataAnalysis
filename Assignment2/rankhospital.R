rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  outcome.care <- read.csv("data/outcome-of-care-measures.csv",colClasses="character")
  states<-table(outcome.care$State)
  names.states <- names(states) #n
  outcome.heartAttack <- as.numeric(outcome.care[,11]) 
  outcome.heartFailure <-as.numeric(outcome.care[,17]) 
  outcome.Pneumonia <- as.numeric(outcome.care[,23]) 
  if (outcome=="heart attack" && is.na(match(state, names.states))==FALSE) {
    check.state<-outcome.care$State==state
    value<-tapply(outcome.heartAttack,check.state, sort,simplify=FALSE)
    if ( num == "best") num <- 1
    if ( num == "worst" ) num <- length(value[[2]])
    sortValue<-sort(value[[2]])[num]
    result<-sort(as.character(subset(outcome.care[,2], outcome.heartAttack ==  sortValue & check.state)),decreasing=TRUE)
    print(result[1])
  }
  else if (outcome=="heart failure" && is.na(match(state, names.states))==FALSE) {
    check.state<-outcome.care$State==state
    value<-tapply(outcome.heartFailure,check.state, sort,simplify=FALSE)
    if ( num == "best") num <- 1
    if ( num == "worst" ) num <- length(value[[2]])
    sortValue<-sort(value[[2]])[num]
    result<-sort(as.character(subset(outcome.care[,2], outcome.heartFailure ==  sortValue & check.state)),decreasing=TRUE)
    print(result[1])
  }
  
  else if (outcome=="pneumonia" && is.na(match(state, names.states))==FALSE) {
    check.state<-outcome.care$State==state
    value<-tapply(outcome.Pneumonia,check.state, sort,simplify=FALSE)
    if ( num == "best") num <- 1
    if ( num == "worst" ) num <- length(value[[2]])
    sortValue<-sort(value[[2]])[num]
    result<-sort(as.character(subset(outcome.care[,2], outcome.Pneumonia ==  sortValue & check.state)),decreasing=TRUE)
    print(result[1])
  }
  else if(is.na(match(state, names.states))==TRUE ){
    stop("invalid state")
  }
  else if (outcome !="heart failure" | outcome !="pneumonia" |outcome !="heart attack" && is.na(match(state, names.states))==FALSE ) {
    stop("Invalid outcome")
  }
}



