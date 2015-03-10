#################################################################################
#### BML Simulation Study

#### Put in this file the code to run the BML simulation study for a set of input parameters.
#### Save some of the output data into an R object and use save() to save it to disk for reference
#### when you write up your results.
#### The output can e.g. be how many steps the system took until it hit gridlock or
#### how many steps you observered before concluding that it is in a free flowing state.

source("bml_functions.r")
# 100 * 100 p = 0.8
exp11 <-bml.sim(100,100,0.8)
m11 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)
exp12 <-bml.sim(100,100,0.8)
m12 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)
exp13 <-bml.sim(100,100,0.8)
m13 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)
exp14 <-bml.sim(100,100,0.8)
m14 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)
exp15 <-bml.sim(100,100,0.8)
m15 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)


# 100 * 100 p = 0.2
exp21 <-bml.sim(100,100,0.2)
m21 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)
exp22 <-bml.sim(100,100,0.2)
m12 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)
exp23 <-bml.sim(100,100,0.2)
m23 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)
exp24 <-bml.sim(100,100,0.2)
m24 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)
exp25 <-bml.sim(100,100,0.2)
m25 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)

#100 * 100 p = 0.38

exp31 <-bml.sim(100,100,0.38)
m31 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)
exp32 <-bml.sim(100,100,0.38)
m32 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)
exp33 <-bml.sim(100,100,0.38)
m33 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)
exp34 <-bml.sim(100,100,0.38)
m34 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)
exp35 <-bml.sim(100,100,0.38)
m35 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)

# 20 * 20  p = 0.2
exp41 <-bml.sim(20,20,0.45)
m41 <- matrix(unlist(exp1[3]), ncol = 1000, byrow = FALSE)
exp42 <-bml.sim(5,80,0.6)
m42 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)
exp43 <-bml.sim(10,10,0.42)
m43 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)

# 50 * 50 p = 0.5
exp44 <-bml.sim(100,100,0.42)
m44 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)
exp45 <-bml.sim(100,100,0.42)
m45 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)
exp46 <-bml.sim(100,100,0.42)
m46 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)

exp41 <-bml.sim(20,20,0.3)
m41 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)
exp42 <-bml.sim(20,20,0.5)
m42 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)
exp43 <-bml.sim(20,20,0.5)
m43 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)
# 10 * 40 p = 0.5
exp41 <-bml.sim(5,80,0.5)
m41 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)
exp42 <-bml.sim(10,40,0.5)
m42 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)
exp43 <-bml.sim(10,40,0.5)
m43 <- matrix(unlist(exp1[3]), ncol = 100, byrow = FALSE)


