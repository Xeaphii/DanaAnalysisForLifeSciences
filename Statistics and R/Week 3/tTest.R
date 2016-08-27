url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)

bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

library(rafalib)
mean(bwt.nonsmoke)-mean(bwt.smoke)
popsd(bwt.nonsmoke)
popsd(bwt.smoke)

set.seed(1)
control<- sample(bwt.nonsmoke,25)
test   <- sample(bwt.smoke,25)

t.test(control,test)

sd_complete<- sqrt(var(control)/length(control)+var(test)/length(test))

qt(0.995,df=48)*sd_complete


set.seed(1)
control<- sample(bwt.nonsmoke,5)
test   <- sample(bwt.smoke,5)
t.test(control,test)
set.seed(1)
reject <- function(N, alpha=0.01){
  hf <- sample(bwt.smoke,N) 
  control <- sample(bwt.nonsmoke,N)
  pval <- t.test(hf,control)$p.value
  pval < alpha
}

B = 10000
N = 90

rejections <- replicate(B,reject(N))

mean(rejections)
