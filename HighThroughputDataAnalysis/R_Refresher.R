library(devtools)
install_github("genomicsclass/GSE5859Subset")

library(GSE5859Subset)
data(GSE5859Subset) ##this loads the three tables
dim(geneExpression)
head(geneExpression)
colnames(geneExpression)

dim(sampleInfo)
head(sampleInfo)
sampleInfo$group

sum(sampleInfo$date == '2005-06-27')

dim(geneAnnotation)
head(geneAnnotation)
unique(geneAnnotation$CHR)
sum(geneAnnotation$CHR =='chrY',na.rm = TRUE)

geneAnnotation[geneAnnotation$SYMBOL == 'ARPC1A',]
#200950_at chr7 98923496 ARPC1A
dim(geneExpression)
sum(rownames(geneExpression) == '200950_at')
geneExpression[rownames(geneExpression) == '200950_at',]
sum(sampleInfo$date == '2005-06-10')
sampleInfo[sampleInfo$date == '2005-06-10',]
geneExpression[rownames(geneExpression) == '200950_at','GSM136727.CEL.gz']

apply(geneExpression,median)

median(unlist(apply(geneExpression, 2, median)))

testing<- function(e){
group <- factor(sampleInfo$group)
t.test( e[group==1], e[group==0])$p.value
}
testing(geneExpression[1,],g)
min(apply(geneExpression, 1, testing))

