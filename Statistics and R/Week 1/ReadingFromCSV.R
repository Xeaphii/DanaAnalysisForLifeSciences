getwd()

setwd("E:/Learn/Data Analysis for LIfe Sciences/DanaAnalysisForLifeSciences/Statistics and R/Week 1")

getwd()

dat<-read.csv("femaleMiceWeights.csv")

colnames(dat)

dat[12,2]

dat$Bodyweight[11]

length(dat[,1])

hf_mouse <- dat[dat$Diet == 'hf',2]
mean(hf_mouse)

set.seed(1)

idx <- sample(13:24,1)

dat[idx,]
