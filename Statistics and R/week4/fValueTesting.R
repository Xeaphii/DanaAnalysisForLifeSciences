N <- 40
p <- 4
group <- factor(rep(1:p,each=N/p))
X <- model.matrix(~ group)

set.seed(1)
mon<-function(N,p){
Y <- rnorm(N,mean=42,7)
mu0 <- mean(Y)
initial.ss <- sum((Y - mu0)^2)

s <- split(Y, group)
after.group.ss <- sum(sapply(s, function(x) sum((x - mean(x))^2)))

(group.ss <- initial.ss - after.group.ss)
group.ms <- group.ss / (p - 1)
after.group.ms <- after.group.ss / (N - p)
f.value <- group.ms / after.group.ms
}

avg <- replicate(1000,mon(N,p))


