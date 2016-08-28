set.seed(1)
library(downloader)
url = "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename = "femaleControlsPopulation.csv"
if (!file.exists(filename)) download(url,destfile=filename)
population = read.csv(filename)
pvals <- replicate(1000,{
  control = sample(population[,1],12)
  treatment = sample(population[,1],12)
  t.test(treatment,control)$p.val
})
head(pvals)
hist(pvals)
mean(pvals<=0.01)

set.seed(100)
avgs<- replicate(1000,{
cases = rnorm(10,30,2)
controls = rnorm(10,30,2)
t.test(cases,controls)$p.val
})
sum(avgs<=0.05)

set.seed(100)
pvals <- replicate(20,{
  cases = rnorm(10,30,2)
  controls = rnorm(10,30,2)
  t.test(cases,controls)$p.val
})
sum(pvals<=0.05)


set.seed(100)
avgs<- replicate(8793,{
  pvals <- replicate(20,{
    cases = rnorm(10,30,2)
    controls = rnorm(10,30,2)
    t.test(cases,controls)$p.val
  })
  return(sum(pvals<=0.05))
})
mean(avgs>0)

set.seed(100)
pvals <- replicate(8793,{
  cases = rnorm(10,30,2)
  controls = rnorm(10,30,2)
  t.test(cases,controls)$p.val
})
mean(pvals<=0.05)

B<-1000
minpval <- replicate(B, min(runif(8793,0,1))<0.000007)
mean(minpval>=1)

