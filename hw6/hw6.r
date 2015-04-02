# Homework 6
# Stat 133, Lec 2, Spring 2015
# Due : Friday March 20th by 5 pm

# Review the slides on simulations for this assignment.

# Consider the following model on use of a new drug:
# We have a population of doctors, population size : <n.doctors>
# Every doctor has either adopted the use of a new drug, or not (0/1 status)
# Now write a function that runs a simulation for a period of :
# <n.days> where
# - every day exactly two _random_ doctors meet
# - if one has adopted but the other one has not then the
#   holdout adopts the use of the drug with probability p
# Return a matrix that shows for each day which doctors have adopted
# the use of the drug.

# Input varibles are
# <n.days> : the number of days the simulation should be run for
# <n.doctors> : total number of doctors 
# <initial.doctors> : a 0/1 vector of length <n.doctors>, 1 for adopters
# <p> : the probability that the non-adopter adopts the drug.

# Ouput variable
# <has_adopted> : matrix with <n.doctors> rows and <n.days> columns
#                 i.e. one row for each doctor
#                 the entries are 0 for days where the doctor is a
#                 non-adopter, else 1 (so once a row turns to 1 it stays as 1).

sim.doctors <- function(initial.doctors, n.doctors, n.days, p){

  # Set up the output variable, define it as a matrix then use initial.doctors
  # to set the first column (day)
  has_adpoted = matrix(nrow = n.doctors, ncol = n.days)
  has_adpoted[,1] = initial.doctors
  # Run a simulation for <n.days> (use a for loop).  In the loop:
  # 1) pick two random doctors
  # 2) check if one has adopted the other hasn't
  # 3) convert the non-adopter with probability p
  for( i in 2:n.days){
    has_adpoted[,i] = has_adpoted[,i-1]
    meet = sample(c(1:n.doctors), 2, replace = F)
    if(has_adpoted[meet[1],i-1] == 1 && has_adpoted[meet[2],i-1] == 0){
      adpoted = sample(c(TRUE, FALSE), 1, prob = c(p,1-p), replace = T)
      if(adpoted){
        has_adpoted[meet[2],i] = 1
      }
    }
    if(has_adpoted[meet[1],i-1] == 0 && has_adpoted[meet[2],i-1] == 1){
      adpoted = sample(c(TRUE, FALSE), 1, prob = c(p,1-p), replace = T)
      if(adpoted){
        has_adpoted[meet[1],i] = 1
      }
    }
  }
  # return the output
  return(has_adpoted)
}

# When you test your function you have to generate <initial.doctors> and
# pick values for the other input parameters.
doctors = c(1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0)
n.doctors = 20
n.days = 20
p = 0.8
test_result = sim.doctors(doctors, n.doctors,n.days, p)
set.seed(42)
# Generate a value for <initial.doctors> that has 10% 1s and 90% 0s.
# Run your function for at least 5 different values of <p> and plot
# on x-axis: days,
# on y-axis : the number of doctors that have already adopted the drug, on that day
# Put all 5 lines in one figure (e.g. use first plot() then lines() for the subsequent lines)
doctors = sample(c(1,0), 500, prob = c(0.1,0.9), replace = T)
num.adopted = sum(doctors)
n.doctors = 500
n.days = 100
prob = c(0.2,0.4,0.6,0.8,0.9)

sample.count <- function(sample, n.doctors, n.days){
  result = rep(0,n.days)
  for(i in 1:n.days){
    for(j in 1:n.doctors){
      if(sample[j,i] == 1){
        result[i] = result[i] + 1
      }
    }
  }
  return(result)
}
sample1 = sim.doctors(doctors,n.doctors,n.days,prob[1])
sample2 = sim.doctors(doctors,n.doctors,n.days,prob[2])
sample3 = sim.doctors(doctors,n.doctors,n.days,prob[3])
sample4 = sim.doctors(doctors,n.doctors,n.days,prob[4])
sample5 = sim.doctors(doctors,n.doctors,n.days,prob[5])

count1 = sample.count(sample1,n.doctors,n.days)
count2 = sample.count(sample2,n.doctors,n.days)
count3 = sample.count(sample3,n.doctors,n.days)
count4 = sample.count(sample4,n.doctors,n.days)
count5 = sample.count(sample5,n.doctors,n.days)

plot(x = c(1:n.days), y = count1, xlab = "day", ylab = "Number of Doctors Adpoted" ,main = "Number of Doctors Adpoted over days",type = "s", col = "green")
lines(x = c(1:n.days), y = count2, type = "s", col = "red")
lines(x = c(1:n.days), y = count3, type = "s", col = "blue")
lines(x = c(1:n.days), y = count4, type = "s", col = "gold")
lines(x = c(1:n.days), y =count5, type = "s", col = "purple")
legend(x = 70, num.adopted + 2,c("p=0.2","p=0.4","p=0.6","p=0.8","p=0.9"),lty=c(1,1),cex=0.8,col=c('green','red','blue','gold','purple'))

