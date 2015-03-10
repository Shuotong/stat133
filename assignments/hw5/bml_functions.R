#################################################################################
#### Functions for BML Simulation Study


#### Initialization function.
## Input : size of grid [r and c] and density [p]
## Output : A matrix [m] with entries 0 (no cars) 1 (red cars) or 2 (blue cars)
## that stores the state of the system (i.e. location of red and blue cars)

bml.init <- function(r, c, p){
  m <- matrix(sample(x = c(0:2), size = r*c, replace = TRUE,prob = c(1-p, p/2, p/2)), nrow = r, ncol = c)
  return(m)
}

#### Function to move the system one step (east and north)
## Input : a matrix [m] of the same type as the output from bml.init()
## Output : TWO variables, the updated [m] and a logical variable
## [grid.new] which should be TRUE if the system changed, FALSE otherwise.

## NOTE : the function should move the red cars once and the blue cars once,
## you can write extra functions that do just a step north or just a step east.

blue.next <- function (r, c, m){
  if (r == 1) {
    return(c(nrow(m), c))
  } else {
    return(c(r-1, c))
  }
}
red.next <- function (r, c, m){
  if (c == ncol(m)) {
    return (c(r, 1))
  } else{
    return (c(r, c+1))
  }
}
bml.step <- function(m){
  original_m = m
  update_m = m
  #red moves on odd timestep
  for (i in 1:nrow(m)) {
    for (j in 1:ncol(m)) {
      nextStep = red.next(i, j, m)
      if ((original_m[i,j] == 1) && (original_m[nextStep[1], nextStep[2]] == 0)) {
        update_m[nextStep[1], nextStep[2]] = 1
        update_m[i,j] = 0
      }
    }
  }
  m = update_m
  #blue moves on even timestep
  for (i in 1:nrow(m)) {
    for (j in 1:ncol(m)) {
      nextStep = blue.next(i, j, m)
      if ((m[i,j] == 2) && m[nextStep[1], nextStep[2]] == 0) {
        update_m[nextStep[1], nextStep[2]] = 2
        update_m[i,j] = 0
      }
    }
  }
  m = update_m
  grid.new = any(original_m != m)
  return(list(m, grid.new))
}

#### Function to do a simulation for a given set of input parameters
## Input : size of grid [r and c] and density [p]
## Output : *up to you* (e.g. number of steps taken, did you hit gridlock, ...)

bml.sim <- function(r, c, p){
  m = bml.init(r, c, p)
  image(t(apply(m,2,rev)), axes = FALSE, col = c("white", "red", "blue"))
  for (i in 1:2000) {
    n = bml.step(m)
    if (n[[2]] == TRUE) {
      m = n[[1]]
      image(t(apply(m,2,rev)), axes = FALSE, col = c("white", "red", "blue"))
    } else {
      image(t(apply(m,2,rev)), axes = FALSE, col = c("white", "red", "blue"))
      return (list(i, TRUE))
    }
  }
  return (list(i, FALSE))
  #m = bml.init(r, c, p)
  #image(t(apply(m,2,rev)), axes = FALSE, col = c("white", "red", "blue"))
  #for (i in 1:2000) {
  #  n = bml.step(m)
  #  m = n[[1]]
  #  if (n[[2]] == TRUE) {
  #    image(t(apply(m,2,rev)), axes = FALSE, col = c("white", "red", "blue"))
  #  } else {
  #    image(t(apply(m,2,rev)), axes = FALSE, col = c("white", "red", "blue"))
  #    return (list(i, TRUE, m))
  #  }
  #}  
  #return (list(i, FALSE,m))
}
