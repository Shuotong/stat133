# Please load in the dataset SFHousing-1.rda 
# It will be required to perform the following tasks. The dataset includes data 
# for houses in the city of Alameda.
load("SFHousing-1.rda")


# calculate the mean and median price of houses in Alameda. Store these as the
# variables <mean.price> and <med.price> respectively.

# mean.price <- your code here
# med.price <- your code here
mean.price <- mean(housing$price)
med.price <- median(housing$price)


# For each house in the dataset, calculate the absolute difference between its
# price and the mean price of houses in Alameda. Store this as the variable
# <price.diffs>. Note that this should be a numeric vector with length equal to
# the number of observations in the dataset

# price.diffs <- your code here
price.diffs <- abs(housing$price - mean.price)

# The variable br indicates the number of bedrooms in each house. Please create
# two new data frames that are subsets of the original data frame, according to
# these criteria:
# 1) houses with more than 3 rooms <housing.large>
# 2) houses with up to and including 3 rooms  <housing.small>

# housing.large <- your code here
# housing.small <- your code here
housing.large <- housing[housing$br > "3",]
housing.small <- housing[housing$br <= 3, ]



# For each of your subsets, create a vector giving the price of each house. Name
# these variables <housing.large.price> and <housing.small.price>.

# housing.large.price <- your code here
# housing.small.price <- your code here
housing.large.price <- housing.large$price
housing.small.price <- housing.small$price



# Please implement the function sqftByPrice. Your function should take the
# following arguments:
#
# <price.cutoff>: a numeric constant indicating the price cutoff used for houses
# <prices>      : a numeric vector of housing prices
# <lsqft>       : a numeric vector giving lsqft for each of the observations in
#               <prices> (i.e. this vector will need to be the same length as prices)
#
# Your function should return the average of <lsqft> for all observations with <price>
# stricly greater than <price.cutoff>.
sqftByPrice <- function(price.cutoff, prices, lsqft) {
    summ = 0
    numm = 0
    for(i in 1:length(prices)){
      if(prices[i] > price.cutoff){
        if(!is.na(lsqft[i])){
          summ = summ + lsqft[i]
          numm = numm + 1
        }
      }
    }
    return(summ/numm)
    # your code here

}


# Please create a plot of house price (y-axis) against bsqft (x-axis). Your plot
# should include the following features:
# 1) a title "Housing price vs Building sqft"
# 2) a red line with intercept=169500 and slope=275
# 3) plotting character set to 20
plot(housing$bsqft, housing$price, pch = 20, main = "Housing price vs Building sqft")
abline(a = 169500, b = 275, col = "red")
