data(ChickWeight)

head(ChickWeight)
plot( ChickWeight$Time, ChickWeight$weight, col=ChickWeight$Diet)
chick = reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time",
                direction="wide")
chick = na.omit(chick)

mean(c(chick$weight.4,3000))/mean(chick$weight.4)
median(c(chick$weight.4,3000))/median(chick$weight.4)
sd(c(chick$weight.4,3000))/sd(chick$weight.4)
mad(c(chick$weight.4,3000))/mad(chick$weight.4)

ana<-ChickWeight[ChickWeight$Time>3,]

cor(c(ana$Time,4,21),c(ana$weight,3000,3000))/cor(ana$Time,ana$weight)
cor(c(ana$Time,4,21),c(ana$weight,3000,3000),method="spearman")

plot(ana$Time,ana$weight)

cor(c(chick$weight.4,3000),c(chick$weight.21,3000))/cor(chick$weight.4,chick$weight.21)


x<- chick[chick$Diet == 1,]$weight.4
y<- chick[chick$Diet == 4,]$weight.4

wilcox.test(c(x,200),y)

library(rafalib)
mypar(1,3)
boxplot(x,y)
boxplot(x,y+10)
boxplot(x,y+100)

t.test(x,y+10)$statistic - t.test(x,y+100)$statistic

wilcox.test(c(1,2,3),c(400,500,600))
