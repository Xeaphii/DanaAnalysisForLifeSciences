library(UsingR)

x = father.son$fheight

y = father.son$sheight

n = length(y)

N = 50

set.seed(1)

index = sample(n,N)

sampledat = father.son[index,]

x = sampledat$fheight

y = sampledat$sheight

betahat = lm(y~x)
SSR<-sum((betahat$fitted.values - y)^2)
sigma2 = SSR / 48

X = cbind(rep(1,N), x)

sqrt(diag(solve(crossprod(X))) * sigma2)
