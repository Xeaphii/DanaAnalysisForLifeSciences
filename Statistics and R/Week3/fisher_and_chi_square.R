setwd("/Users/mac/Desktop/dev/DataScience/DanaAnalysisForLifeSciences/Statistics and R/week3")
getwd()

d = read.csv("assoctest.csv")
tab <- table(d$allele,d$case)
chisq.test(tab)$p.value

(tab[2,2]/tab[2,1]) / (tab[1,2]/tab[1,1])


fisher.test(d$allele,d$case)
