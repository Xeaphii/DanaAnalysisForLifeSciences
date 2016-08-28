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
avgs<- replicate(1000,{
  pvals <- replicate(20,{
    cases = rnorm(10,30,2)
    controls = rnorm(10,30,2)
    t.test(cases,controls)$p.val
  })
  sum(pvals<=0.05)
})
mean(avgs>0)
