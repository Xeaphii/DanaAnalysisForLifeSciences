population <- read.csv("femaleControlsPopulation.csv")
##use unlist to turn it into a numeric vector
population <- unlist(population) 

set.seed(1)
n <- 1000
null <- vector("numeric",n)
for (i in 1:n) {
  treatment <- sample(population,50)
  null[i] <- mean(treatment)
}

mean(null<25) - mean(null<23)

hist(mean(population)-null)


mean(abs((mean(population)-null)) > 1)
mean(abs(null) > 1)

pnorm(25, mean = 23.9 , sd = 0.43, lower.tail = TRUE, log.p = FALSE) -
  pnorm(23, mean = 23.9 , sd = 0.43, lower.tail = TRUE, log.p = FALSE)
