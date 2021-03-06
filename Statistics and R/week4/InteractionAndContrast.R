species <- factor(c("A","A","B","B"))
condition <- factor(c("control","treated","control","treated"))
model.matrix(~ species + condition)

install.packages('contrast')

library(contrast) #Available from CRAN
L3vsL2 <- contrast(fitTL,list(leg="L3",type="pull"),list(leg="L2",type="pull"))

url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/spider_wolff_gorb_2013.csv"
filename <- "spider_wolff_gorb_2013.csv"
library(downloader)
if (!file.exists(filename)) download(url, filename)
spider <- read.csv(filename, skip=1)

table(spider$leg,spider$type)

fitTL <- lm(friction ~ type + leg, data=spider)
summary(fitTL)


spider$group <- factor(paste0(spider$leg,spider$type))
fitG <- lm(friction ~ 0+ group, data=spider)
summary(fitG)

L3vsL2 <- contrast(fitTL,list(leg="L4",type="push"),list(leg="L2",type="push"))
L3vsL2


X <- model.matrix(~ type + leg, data=spider)
(Sigma <- sum(fitTL$residuals^2)/(nrow(X) - ncol(X)) * solve(t(X) %*% X))
C <- matrix(c(0,0,-1,0,1),1,5)
Cov(beta-hat_L4, beta-hat_L2)


spider$log2friction <- log2(spider$friction)
boxplot(log2friction ~ type*leg, data=spider)


X <- model.matrix(~ type + leg + type:leg, data=spider)
fitX <- lm(log2friction ~ type + leg + type:leg, data=spider)
summary(fitX)


anova(fitX)
L3vsL2 <- contrast(fitX,list(leg="L2",type="push"),list(leg="L1",type="push"))
L3vsL2


fit <- lm(friction ~ type + leg, data=spider)
betahat <- coef(fit)
Y <- matrix(spider$friction, ncol=1)
X <- model.matrix(~ type + leg, data=spider)

QR <- qr(X)
Q <- qr.Q( QR )
R <- qr.R( QR )
(betahat <- backsolve(R, crossprod(Q,Y) ) )
