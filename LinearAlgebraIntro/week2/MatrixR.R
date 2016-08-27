library(UsingR)
data("father.son",package="UsingR")

mean(father.son$sheight )

mean(father.son[round(father.son$fheight) == 71,]$sheight)

X = matrix(1:1000,100,10)

x=1:10
y <- cbind(x,2*x, 3*x, 4*x, 5*x)
sum(y[7,])

a <- c(3,4,-5,1,2,2,2,-1,1,-1,5,-5,5,0,0,1)
b<- matrix(a,4,4,byrow = TRUE)

c <- c(10,5,7,4)
d <- matrix(c,4,1)

solve(b)%*%d

a <- matrix(1:12, nrow=4)
b <- matrix(1:15, nrow=3)

(a%*%b)[3,2]
