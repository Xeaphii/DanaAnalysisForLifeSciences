#You can make a design matrix X for a two group comparison either using model.matrix or simply with:

#X = cbind(rep(1,nx + ny),rep(c(0,1),c(nx, ny)))

#For a comparison of two groups, where the first group has nx=5 samples, and the second group has ny=7 samples, what is the element in the 1st row and 1st column of X^T X?

nx = 5
ny = 7

X = cbind(rep(1,nx + ny),rep(c(0,1),c(nx, ny)))
crossprod(X)[1,1]
