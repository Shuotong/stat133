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
  errors = sample(err, size = length(fit), replace = FALSE)
  result = c()
  for(i in 1:length(fit)){
    result = c(result, fit[i] + errors[i])
  }
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
  flag = TRUE
  for(i in 1:B){
    if(flag){
      test1 = oneBoot(data,NULL,1)
      test2 = oneBoot(data,NULL,2)
      test3 = oneBoot(data,fit1,1)
      test4 = oneBoot(data,fit2,2)
      d1 = data.frame(test1)
      d2 = data.frame(test2)
      d3 = data.frame(test3)
      d4 = data.frame(test4)
      flag = FALSE
    }else{
      test1 = oneBoot(data,NULL,1)
      test2 = oneBoot(data,NULL,2)
      test3 = oneBoot(data,fit1,1)
      test4 = oneBoot(data,fit2,2)
      d1 = data.frame(d1,test1)
      d2 = data.frame(d2,test2)
      d3 = data.frame(d3,test3)
      d4 = data.frame(d4,test4)
    }
  }
  coeff = list(d1,d2,d3,d4)
  return(coeff)
} 

bootPlot = function(x, y, coeff, trueCoeff){
  ### x and y are the original data
  ### coeff is a matrix from repBoot
  ### trueCoeff contains the true coefficients 
  ### that generated the data
  
  ### Make a scatter plot of data
  plot(x, y)
  ### Add lines or curves for each row in coeff
  ### Use transparency
  ### You should use mapply to construct all 
  ### 1000 of the bootstrapped lines of best fit 
  ### Have a look at ?mapply for details.
  ### This can be done in ggplot2 or base graphics.
  for(i in 1:1000){
    abline(a = as.list(result[[1]][i])[[1]][1], b = as.list(result[[1]][i])[[1]][2],col=rgb(0,0,0,5,maxColorValue=255))
    abline(a = as.list(result[[3]][i])[[1]][1], b = as.list(result[[3]][i])[[1]][2],col=rgb(0,0,0,5,maxColorValue=255))
    q = as.list(result[[2]][i])[[1]][1]
    w = as.list(result[[2]][i])[[1]][2]
    e = as.list(result[[2]][i])[[1]][3]
    curve(q*x^2 + w*x + e, add = TRUE,col=rgb(0,0,255,5,maxColorValue=255))
    q = as.list(result[[4]][i])[[1]][1]
    w = as.list(result[[4]][i])[[1]][2]
    e = as.list(result[[4]][i])[[1]][3]
    curve(q*x^2 + w*x + e, add = TRUE,col=rgb(100,100,100,5,maxColorValue=255))
  }
  ### Use trueCoeff to add true line/curve - 
  ###  Make the true line/curve stand out
  curve(trueCoeff[1]*x^2 + trueCoeff[2]*x + trueCoeff[3], add = TRUE, col=rgb(255,0,0,maxColorValue=255))
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
