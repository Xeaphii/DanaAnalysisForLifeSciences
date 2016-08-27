X <- matrix(c(1,1,1,1,0,0,1,1),nrow=4)
rownames(X) <- c("a","a","b","b")

beta <- c(5, 2)
beta_ <- matrix(beta,2,1)

crossprod(beta_,X)
X%*%beta_



X <- matrix(c(1,1,1,1,1,1,0,0,1,1,0,0,0,0,0,0,1,1),nrow=6)
rownames(X) <- c("a","a","b","b","c","c")
beta <- c(10,3,-3)
beta_ <- matrix(beta,3,1)

X%*%beta_