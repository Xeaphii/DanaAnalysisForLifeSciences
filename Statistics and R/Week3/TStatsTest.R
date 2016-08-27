set.seed(1)
N <- 1000
B <- 10000
tstats <- replicate(B,{
  X <- rnorm(N)
  mean(X)
})
sd(tstats)
#The population data is not normal thus the theory does not apply.
#We check with a Monte Carlo simulation. The qqplot shows a large tail. 
#Note that there is a small but positive chance that all the X are the same.
##In this case the denominator is 0 and the t-statistics is not defined