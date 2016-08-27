setwd("/Users/mac/Desktop/dev/DataScience/DanaAnalysisForLifeSciences/Statistics and R/week4")
getwd()

load("skew.RData")
dim(dat)
par(mfrow = c(3,3))


for (i in 1:9) {
  hist(dat[,i],i)
}

par(mfrow=c(1,1))

