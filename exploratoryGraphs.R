library(ggplot2) # may have equivalent

pollution <- read.csv("avgpm25.csv", colClasses = c("numeric", "character", "factor", "numeric", "numeric"))


head(pollution)

summary(pollution$pm25)

boxplot(pollution$pm25, col = "blue")

hist(pollution$pm25, col = "green")
rug(pollution$pm25)

hist(pollution$pm25, col = "green", breaks = 100)
rug(pollution$pm25)

boxplot(pollution$pm25, col = "blue")
abline(h = 12)

hist(pollution$pm25, col = "green")
abline(v = 12, lwd = 2)
abline(v = median(pollution$pm25), col = "magenta", lwd = 4)

barplot(table(pollution$region), col = "wheat", main = "Number of Counties in Each Region")


# multiple boxplots
boxplot(pm25 ~ region, data=pollution, col="red")


# multiple histograms
par(mfrow=c(2,1), mar = c(4, 4, 2, 1))
## see also pollution[pollution$region=="east",] 
hist(subset(pollution, region=="east")$pm25, col="green")
hist(subset(pollution, region=="west")$pm25, col="green")
par(mfrow=c(1,1))

hist(pm25 ~ region)

### in ggplot2
qplot(pm25, data=pollution, facets= . ~ region)


# scatterplot
with(pollution, plot(latitude, pm25, col=region))
abline(h=12, lwd=2, lty=2)
# multiple scatterplots
par(mfrow = c(1, 2))
with(subset(pollution, region == "west"), plot(latitude, pm25, main = "West"))
with(subset(pollution, region == "east"), plot(latitude, pm25, main = "East"))
par(mfrow=c(1,1))

### in ggplot2
qplot(latitude, pm25, data=pollution, facets= . ~ region)
