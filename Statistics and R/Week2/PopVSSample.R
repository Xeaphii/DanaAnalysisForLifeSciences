library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- read.csv(filename) 

head(dat)
str(dat)
dat <- na.omit( dat )
x <- filter(dat,Sex =='F' & Diet == 'chow')
x<- x$Bodyweight
set.seed(1)
x_s <- sample(x,25)

male_chow<- filter(dat,Sex =='M' & Diet == 'chow')
mean(male_chow$Bodyweight,na.rm = TRUE)

library(rafalib)

popsd(male_chow$Bodyweight)

set.seed(1)
mean(sample(male_chow$Bodyweight,25))

y <- filter(dat,Sex =='F' & Diet == 'hf')
y<- y$Bodyweight
set.seed(1)
y_s <- sample(y,25)
mean(y)

popsd(y)
popsd(x)

set.seed(1)
mean(sample(y,25))
set.seed(1)
abs((mean(y) - mean(x)) -(mean(y_s) -mean(x_s)))
