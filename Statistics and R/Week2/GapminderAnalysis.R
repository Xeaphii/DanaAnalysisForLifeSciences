install.packages("gapminder")

library(gapminder)
data(gapminder)
head(gapminder)

unique(gapminder[gapminder$year == 1952,1])

mean(gapminder[gapminder$year == 1952,4] <= 60) - mean(gapminder[gapminder$year == 1952,4] <= 40)
gapminder[gapminder$year == 1952,]$year 

x <- gapminder[gapminder$year == 1952,]$lifeExp
props = sapply(x, function(q) mean(x <= q))
hist(props)
