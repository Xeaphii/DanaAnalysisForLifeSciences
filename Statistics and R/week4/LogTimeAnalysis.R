head(InsectSprays)

boxplot(split(InsectSprays$count, InsectSprays$spray))



boxplot(values ~ factor)


library(dplyr)
data(nym.2002, package="UsingR")
boxplot(nym.2002$time~nym.2002$gender)

boxplot(nym.2002[nym.2002$gender == 'Female',]$time)

males_dat <- nym.2002[nym.2002$gender == 'Male',]
females_dat <- nym.2002[nym.2002$gender == 'Female',]

signif(cor(females_dat$age,females_dat$time),2)
plot(females_dat$time~females_dat$age,main=paste("correlation =",signif(cor(x,y),2)))

groups <- split(nym.2002$age,5) 
boxplot(groups)
print(mean(y[ round(x) == 72]))

plot(nym.2002$tim~nym.2002$age)

boxplot()


time = sort(nym.2002$time)
min(time)/median(time)
max(time)/median(time)

plot(time/median(time), ylim=c(1/4,4))
abline(h=c(1/2,1,2))
plot(log2(time/median(time)),ylim=c(-2,2))
abline(h=-1:1)


