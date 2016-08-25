install.packages('dplyr')

library(dplyr)

library(downloader)
url="https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- basename(url)
download(url,filename)

dat<- read.csv("msleep_ggplot2.csv")

str(dat)

class(dat)

head(dat)

primate<-filter(dat,order=='Primates')

nrow(primate)

class(primate)

head(primate)

mean((filter(dat,order=='Primates')%>% select(sleep_total))%>%unlist,na.rm=TRUE)

filter(dat,order=='Primates')%>% select(sleep_total)%>%summarize
