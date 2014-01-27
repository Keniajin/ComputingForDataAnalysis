rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  outcome.care <- read.csv("data/outcome-of-care-measures.csv",colClasses="character")
  states<-table(outcome.care$State)
  names.states <- names(states) 
  outcome.care[,2]<-as.character(outcome.care[,2])
  outcome.heartAttack<-as.numeric(gsub("Not Available", NA, outcome.care[,11]))#as.numeric(outcome.care[,11])
  outcome.heartFailure<-as.numeric(gsub("Not Available", NA, outcome.care[,17]))#as.numeric(outcome.care[,17])
  outcome.Pneumonia<-as.numeric(gsub("Not Available", NA, outcome.care[,23]))#as.numeric(outcome.care[,23])
  
 # outcome.heartAttack <- as.numeric(outcome.care[,11]) 
 # outcome.heartFailure <-as.numeric(outcome.care[,17]) 
 # outcome.Pneumonia <- as.numeric(outcome.care[,23]) 
  if (outcome=="heart attack") {
    
    dataFrame<-NULL
    for(i in  names.states){
      check.state<-outcome.care$State==i
      x <-sort
      if ( num == "worst") x <- max
      if ( num == "best") x <- min
      value<-tapply(outcome.heartAttack,check.state, x, simplify=FALSE)
      if ( num == "worst") sortValue<-sort(value[[2]],)
     if ( num == "best" ) sortValue<-sort(value[[2]],)
     else sortValue<-sort(value[[2]],)[num]
    hospital<-sort(as.character(subset(outcome.care[,2], outcome.heartAttack == sortValue & check.state)))
    state<-as.character(subset(outcome.care[,7],  check.state))
      
      st<-state[1]
      rbind(dataFrame,data.frame(hospital=hospital[1],state=st,row.names=st))->dataFrame


  }
    return(dataFrame)
  }

else if (outcome=="heart failure") {
   
   dataFrame<-NULL
   for(i in  names.states){
     check.state<-outcome.care$State==i
     x <-sort
     if ( num == "worst") x <- max
     if ( num == "best") x <- min
     value<-tapply(outcome.heartFailure,check.state, x, simplify=FALSE)
     if ( num == "worst") sortValue<-sort(value[[2]],)
     if ( num == "best" ) sortValue<-sort(value[[2]],)
     else sortValue<-sort(value[[2]],)[num]
     
     # hospital<-sort(as.character(subset(outcome.care[,2], outcome.heartAttack == sortValue & check.state)))
     hospital<-sort(as.character(subset(outcome.care[,2], outcome.heartFailure == sortValue & check.state)))
     state<-as.character(subset(outcome.care[,7],  check.state))
     
     st<-state[1]
     rbind(dataFrame,data.frame(hospital=hospital[1],state=st,row.names=st))->dataFrame
     
     
   }
   return(dataFrame)
 }
   
else if (outcome=="pneumonia") {
  
  dataFrame<-NULL
  for(i in  names.states){
    check.state<-outcome.care$State==i
    x <-sort
    if ( num == "worst") x <- max
    if ( num == "best") x <- min
    value<-tapply(outcome.Pneumonia,check.state, x, simplify=FALSE)
    if ( num == "worst") sortValue<-sort(value[[2]],)
    if ( num == "best" ) sortValue<-sort(value[[2]],)
   #else sortValue<-sort(value[[2]],)[num]
    
   
    hospital<-sort(as.character(subset(outcome.care[,2],outcome.Pneumonia == sortValue & check.state)))
    state<-as.character(subset(outcome.care[,7],  check.state))
    
    st<-state[1]
    rbind(dataFrame,data.frame(hospital=hospital[1],state=st,row.names=st))->dataFrame
    
    
  }
  return(dataFrame)
}

  else if(is.na(match(state, names.states))==TRUE ){
    stop("invalid state")
  }
  else if (outcome !="heart failure" | outcome !="pneumonia" |outcome !="heart attack" && is.na(match(state, names.states))==FALSE ) {
    stop("Invalid outcome")
  }
}

head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "best"), 3)
tail(rankall("heart failure"), 10)
