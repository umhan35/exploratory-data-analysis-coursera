# qqplot 2: the artist palette model, plots are built up
# in layers: plot data, overlay a summary, metadata and annotation

maacs = read.csv("bmi_pm25_no2_sim.csv")

library(ggplot2)

# tl;dr :
g <- ggplot(maacs, aes(logpm25, NocturnalSympt))
g + geom_point()



qplot(logpm25, NocturnalSympt, data=maacs,
      facets = . ~ bmicat, geom = c("point", "smooth"), method = "lm")
# got Warning: Ignoring unknown parameters: method
# method param is from an old version
qplot(logpm25, NocturnalSympt, data = maacs,
      facets = . ~ bmicat, geom = c("point", "smooth"))

head(maacs[, 1:3])
head(maacs)

g <- ggplot(maacs, aes(logpm25, NocturnalSympt))

summary(g)

print(g)

# explicitly save and print ggplot object
p = g + geom_point()
print(p)

# auto-print plot object without saving
g + geom_point()

