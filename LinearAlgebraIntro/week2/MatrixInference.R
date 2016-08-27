g = 9.8 ## meters per second

h0 = 56.67

v0 = 0

n = 25

tt = seq(0,3.4,len=n) ##time in secs, t is a base function


set.seed(1)

mon<- function(size){
  y = h0 + v0 *tt - 0.5* g*tt^2 + rnorm(size,sd=1)
  
  X = cbind(1,tt,tt^2)
  A = solve(crossprod(X))%*%t(X)
  return(-2 * (A %*% y) [3])
}

est<- replicate(100000,mon(n))


library(UsingR)


X = father.son$fheight


Y = father.son$sheight
mean( (Y - mean(Y))*(X-mean(X) ) )

n = length(y)

set.seed(1)
N =  50
mon1<-function(size,n){
index = sample(n,size)
sampledat = father.son[index,]
x = sampledat$fheight
y = sampledat$sheight
return(lm(y~x)$coef[2])
}
n = length(father.son$sheight)
est<- replicate(10000,mon1(N,n))

sd(est)
