population <- read.csv("femaleControlsPopulation.csv")
##use unlist to turn it into a numeric vector
population <- unlist(population) 

set.seed(1)
n <- 10000
null <- vector("numeric",n)
for (i in 1:n) {
  treatment <- sample(population,5)
  null[i] <- mean(treatment)
}
hist(mean(population)-null)


mean(abs((mean(population)-null)) > 1)
mean(abs(null) > 1)
