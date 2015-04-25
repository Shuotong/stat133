xUnique = 1:5
trueCoeff = c(0, 1, 1)

getData = function(coefs = c(0, 1, 1), xs = 1:5, dupl = 10,
                   sd = 5, seed=2222){
  ### This function creates the artificial data
  set.seed(seed)
  x = rep(xs, each = dupl)
  y = coefs[1] + coefs[2]*x + coefs[3] * x^2 + 
      rnorm(length(x), 0, sd)
  return(data.frame(x, y))
}

### 
genBootY = function(x, y, rep = TRUE){
  ### For each unique x value, take a sample of the
  ### corresponding y values, with replacement.
  ### Return a vector of random y values the same length as y
  ### You can assume that the xs are sorted
  ### Hint use tapply here!
  if(length(x) != length(y)){
    stop("length of x is not equal to length of y")
  }
  ys = tapply(y,x,function(t) t)
  result = c()
  for(i in 1:length(ys)){
    result = c(result, sample(ys[[i]], size = 10, replace = TRUE))
  }
  return(result)
}


genBootR = function(fit, err, rep = TRUE){
  ### Sample the errors 
  ### Add the errors to the fit to create a y vector
  ### Return a vector of y values the same length as fit
  ### HINT: It can be easier to sample the indices than the values
  indices = sample(1:length(err), length(err), replace=rep)
  result = fit+err[indices]
  return(result)
}

fitModel = function(x, y, degree = 1){
  ### use the lm function to fit a line of a quadratic 
  ### e.g. y ~ x or y ~ x + I(x^2)
  ### y and x are numeric vectors of the same length
  ### Return the coefficients as a vector 
  ### HINT: Take a look at the repBoot function to see how to use lm()
  if(degree == 1){
    coe = lm(y ~ x)
  }
  if(degree == 2){
    coe = lm(y ~ x + I(x^2))
  }
  coeff = as.numeric(coe$coefficients)
  return(coeff)
}

oneBoot = function(data, fit = NULL, degree = 1){
  ###  data are either your data (from call to getData)
  ###  OR fit and errors from fit of line to data
  ###  OR fit and errors from fit of quadratic to data  
  if(is.null(fit)){
    ynew = genBootY(data[[1]],data[[2]])
  }else{
    ynew = genBootR(fit[[1]],fit[[2]])
  }
  ### Use fitModel to fit a model to this bootstrap Y 
  return(fitModel(data$x, ynew, degree))
}

repBoot = function(data, B = 1000){
  
  ### Set up the inputs you need for oneBoot, i.e.,
  ### create errors and fits for line and quadratic
  
  ### replicate a call to oneBoot B times
  ### format the return value so that you have a list of
  ### length 4, one for each set of coefficients
  ### each element will contain a data frame with B rows
  ### and one or two columns, depending on whether the 
  ### fit is for a line or a quadratic
  ### Return this list
  
  ### Replicate a call to oneBoot B times for 
  ### each of the four conditions
  
  
  ### Format the return value so that you have a list of
  ### length 4, one for each set of coefficients
  ### each element will contain a matrix with B columns
  ### and two or three rows, depending on whether the 
  ### fit is for a line or a quadratic
  ### Return this list
  x = data[[1]]
  y = data[[2]]
  d1model = lm(y ~ x)
  fitted1 = as.numeric(d1model$fitted.values)
  err1 = as.numeric(d1model$residuals)
  fit1 = data.frame(fitted1,err1)
  d2model = lm(y ~ x + I(x^2))
  fitted2 = as.numeric(d2model$fitted.values)
  err2 = as.numeric(d2model$residuals)
  fit2 = data.frame(fitted2,err2)
  
  c1=c()
  c2=c()
  c3=c()
  c4=c()
  for (i in 1:B) {
    temp1= oneBoot(data, NULL, 1)
    temp2= oneBoot(data, NULL, 2)
    temp3= oneBoot(data, fit1, 1)
    temp4= oneBoot(data, fit2, 2)
    c1 = c(c1,temp1)
    c2 = c(c2,temp2)

  }
  m1=matrix(c1, 2, B)
  m2=matrix(c2, 3, B)
  
  c3=c()
  c4=c()
  for (i in 1:B) {
    temp3=oneBoot(data,fit1,1)
    c3=c(c3,temp3)
    temp4=oneBoot(data,fit2,2)
    c4=c(c4,temp4)
  }
  m3=matrix(c3,2,B)
  m4=matrix(c4,3,B)
  
  coeff=list(m1,m2, m3, m4)
  
  return(coeff)
} 

bootPlot = function(x, y, coeff, trueCoeff){
  ### x and y are the original data
  ### coeff is a matrix from repBoot
  ### trueCoeff contains the true coefficients 
  ### that generated the data
  
  ### Make a scatter plot of data
  plot(x,y)
  ### Add lines or curves for each row in coeff
  ### Use transparency
  ### You should use mapply to construct all 
  ### 1000 of the bootstrapped lines of best fit 
  ### Have a look at ?mapply for details.
  ### This can be done in ggplot2 or base graphics.
  
  ### Use trueCoeff to add true line/curve - 
  ###  Make the true line/curve stand out
  if (nrow(coeff)==2){
    sapply(1:ncol(coeff), function(x) abline(coef=coeff[,x],col=rgb(0,0,0,5,maxColorValue=255)))
  } else {
    sapply(1:ncol(coeff), function(y) curve(coeff[3,y]*x^2+coeff[2,y]*x+coeff[1,y],col=rgb(0,0,0,5,maxColorValue=255), add=TRUE))
  }
  curve(trueCoeff[1] + trueCoeff[2]*x + trueCoeff[3] * x^2, add=TRUE, col='red')
}

### Run your simulation by calling this function
### This function doesn't need any changing
runSim = function() {
  xUnique = 1:5
  trueCoeff = c(0, 1, 1)
  myData = getData(coefs = trueCoeff, xs = xUnique)
  expt = repBoot(data = myData)
  par(mfrow = c(2, 2))
  for (i in 1:4){
    bootPlot(myData$x, myData$y, 
             coeff = expt[[i]], trueCoeff) 
  }
  return(expt)
}
