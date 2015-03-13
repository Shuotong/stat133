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
m11 <- matrix(unlist(exp11[3]), ncol = 100, byrow = FALSE)
image(t(apply(m11,2,rev)), axes = FALSE, col = c("white", "red", "blue"))
exp12 <-bml.sim(100,100,0.8)
m12 <- matrix(unlist(exp12[3]), ncol = 100, byrow = FALSE)
image(t(apply(m12,2,rev)), axes = FALSE, col = c("white", "red", "blue"))

exp13 <-bml.sim(100,100,0.8)
m13 <- matrix(unlist(exp11[3]), ncol = 100, byrow = FALSE)

exp14 <-bml.sim(100,100,0.8)
exp15 <-bml.sim(100,100,0.8)


# 100 * 100 p = 0.2
exp21 <-bml.sim(100,100,0.2)
exp22 <-bml.sim(100,100,0.2)
exp23 <-bml.sim(100,100,0.2)
exp24 <-bml.sim(100,100,0.2)
exp25 <-bml.sim(100,100,0.2)

#100 * 100 p = 0.38

exp31 <-bml.sim(100,100,0.38)
exp32 <-bml.sim(100,100,0.38)
exp33 <-bml.sim(100,100,0.38)
exp34 <-bml.sim(100,100,0.38)
exp35 <-bml.sim(100,100,0.38)

# 100 * 100  p = 0.42

exp43 <-bml.sim(100,100,0.42)
m43 <- matrix(unlist(exp11[3]), ncol = 100, byrow = FALSE)
exp44 <-bml.sim(100,100,0.42)
m44 <- matrix(unlist(exp11[3]), ncol = 100, byrow = FALSE)
exp45 <-bml.sim(100,100,0.42)
m45 <- matrix(unlist(exp11[3]), ncol = 100, byrow = FALSE)
exp46 <-bml.sim(100,100,0.42)
m46 <- matrix(unlist(exp11[3]), ncol = 100, byrow = FALSE)
exp47 <-bml.sim(100,100,0.42)
m47 <- matrix(unlist(exp11[3]), ncol = 100, byrow = FALSE)
exp48 <-bml.sim(100,100,0.42)
m48 <- matrix(unlist(exp11[3]), ncol = 100, byrow = FALSE)


exp51 <-bml.sim(100,100,0.41)
m51 <- matrix(unlist(exp51[3]), ncol = 100, byrow = FALSE)
exp52 <-bml.sim(100,100,0.41)
m52 <- matrix(unlist(exp52[3]), ncol = 100, byrow = FALSE)
image(t(apply(m52,2,rev)), axes = FALSE, col = c("white", "red", "blue"))

exp53 <-bml.sim(100,100,0.41)
m53 <- matrix(unlist(exp53[3]), ncol = 100, byrow = FALSE)
exp54 <-bml.sim(100,100,0.41)
m54 <- matrix(unlist(exp54[3]), ncol = 100, byrow = FALSE)
exp55 <-bml.sim(100,100,0.41)
m55 <- matrix(unlist(exp55[3]), ncol = 100, byrow = FALSE)
exp56 <-bml.sim(100,100,0.41)
m56 <- matrix(unlist(exp56[3]), ncol = 100, byrow = FALSE)
exp57 <-bml.sim(100,100,0.41)
m57 <- matrix(unlist(exp57[3]), ncol = 100, byrow = FALSE)
image(t(apply(m57,2,rev)), axes = FALSE, col = c("white", "red", "blue"))

exp58 <-bml.sim(100,100,0.41)
m58 <- matrix(unlist(exp11[3]), ncol = 100, byrow = FALSE)
exp59 <-bml.sim(100,100,0.41)
m59 <- matrix(unlist(exp11[3]), ncol = 100, byrow = FALSE)


exp61 <-bml.sim(100,100,0.40)
m61 <- matrix(unlist(exp11[3]), ncol = 100, byrow = FALSE)
exp62 <-bml.sim(100,100,0.40)
m61 <- matrix(unlist(exp11[3]), ncol = 100, byrow = FALSE)
exp63 <-bml.sim(100,100,0.40)
m63 <- matrix(unlist(exp11[3]), ncol = 100, byrow = FALSE)
exp64 <-bml.sim(100,100,0.40)
m64 <- matrix(unlist(exp11[3]), ncol = 100, byrow = FALSE)
exp65 <-bml.sim(100,100,0.40)
m65 <- matrix(unlist(exp11[3]), ncol = 100, byrow = FALSE)
exp66 <-bml.sim(100,100,0.40)
m66 <- matrix(unlist(exp11[3]), ncol = 100, byrow = FALSE)
exp67 <-bml.sim(100,100,0.40)
m67 <- matrix(unlist(exp11[3]), ncol = 100, byrow = FALSE)
exp68 <-bml.sim(100,100,0.40)
m68 <- matrix(unlist(exp11[3]), ncol = 100, byrow = FALSE)
exp69 <-bml.sim(100,100,0.40)
m69 <- matrix(unlist(exp11[3]), ncol = 100, byrow = FALSE)


save.image(,file="ttt.RData")

exp71 <-bml.sim(5,5,0.40)
exp72 <-bml.sim(5,5,0.40)
exp73 <-bml.sim(5,5,0.40)
exp74 <-bml.sim(5,5,0.40)
exp75 <-bml.sim(5,5,0.40)
exp76 <-bml.sim(5,5,0.40)
exp77 <-bml.sim(5,5,0.40)
exp78 <-bml.sim(5,5,0.40)



exp81 <-bml.sim(5,2000,0.40)
exp82 <-bml.sim(5,2000,0.40)
exp83 <-bml.sim(5,2000,0.40)
exp84 <-bml.sim(5,2000,0.40)
exp85 <-bml.sim(5,2000,0.40)
exp86 <-bml.sim(5,2000,0.40)
exp87 <-bml.sim(5,2000,0.40)
exp88 <-bml.sim(5,2000,0.40)
exp89 <-bml.sim(5,2000,0.40)


exp91 <-bml.sim(2,5000,0.40)
exp92 <-bml.sim(2,5000,0.40)
exp93 <-bml.sim(2,5000,0.40)
exp94 <-bml.sim(2,5000,0.40)
exp95 <-bml.sim(2,5000,0.40)
exp96 <-bml.sim(2,5000,0.40)
exp97 <-bml.sim(2,5000,0.40)
exp98 <-bml.sim(2,5000,0.40)
exp99 <-bml.sim(2,5000,0.40)

save.image(,file="final.RData")





