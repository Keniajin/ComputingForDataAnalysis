#loops
x<-100
if(x > 1) {
  print("x is big")
} else if(x > 0) {
  print("x is positive")
} else {
  print("x is negative or zero")
  
  How does the above code differ from the code below?
  
  if(x > 1) {
    print("x is big")
  }
  if(x > 0) {
    print("x is positive")
  }
  print("x is negative or zero")
  
  #for loops
  for (k in c(1, 10)) {
    print(k)
  }
  for(i in 1:10) {
    print(i)
  }
  
  for(i in 10:1) {
    print(i)
  }
  
  for(i in seq_len(10)) {
    print(i)
  }
  
  #while loop
  z <- 5
  while(z >= 3 && z <= 10) {
    print(z)
    coin <- rbinom(1, 1, 0.5)
    if(coin == 1) { ## random walk
      z <- z + 1
    } else {
      z <- z - 1
    }
  }
  