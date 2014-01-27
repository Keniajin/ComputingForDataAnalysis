best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  manual = TRUE
  outcome.care <- read.csv("data/outcome-of-care-measures.csv",colClasses="character")
  states<-table(outcome.care$State)
  names.states <- names(states) #n
  outcome.heartAttack <- as.numeric(outcome.care[,11]) #outcomea
  outcome.heartFailure <-as.numeric(outcome.care[,17]) #outcomeb
  outcome.Pneumonia <- as.numeric(outcome.care[,23]) #outcomec
  if (outcome=="heart attack" && is.na(match(state, names.states))==FALSE) {
    check.state<-outcome.care$State==state
    value<-tapply(outcome.heartAttack,check.state, min,na.rm=TRUE,simplify=FALSE)
    result<-sort(as.character(subset(outcome.care[,2], outcome.heartAttack == value[[2]] & check.state)))
    print(result)
    
  }
  else if (outcome=="heart failure" && is.na(match(state, names.states))==FALSE) {
    check.state<-outcome.care$State==state
    value<-tapply(outcome.heartFailure,check.state, min,na.rm=TRUE,simplify=FALSE)
    result<-sort(as.character(subset(outcome.care[,2], outcome.heartFailure ==value[[2]] &  check.state)))
    print(result)
    
  }
  
  else if (outcome=="pneumonia" && is.na(match(state, names.states))==FALSE) {
    check.state<-outcome.care$State==state
    value<-tapply(outcome.Pneumonia,check.state, min,na.rm=TRUE,simplify=FALSE)
    result<-sort(as.character(subset(outcome.care[,2], outcome.Pneumonia == value[[2]] & check.state)))
    print(result)
  }
  else if(is.na(match(state, names.states))==TRUE ){
    stop("invalid state")
  }
  else if (outcome !="heart failure" | outcome !="pneumonia" |outcome !="heart attack" && is.na(match(state, names.states))==FALSE ) {
    stop("invalid outcome")
  }
  
}
