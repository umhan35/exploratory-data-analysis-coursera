# ggplot2 (part 2) - # https://www.coursera.org/learn/exploratory-data-analysis/lecture/qBzHS/ggplot2-part-2

library(ggplot2)
load("maacs.rda")
str(maacs)

## visualize 1D data

# histogram of eNo
qplot(log(eno), data=maacs)
# histogram by group
qplot(log(eno), data=maacs, fill=mopos)

# density smooth
qplot(log(eno), data=maacs, geom="density")
# # density smooth by group
qplot(log(eno), data=maacs, geom="density", color=mopos)

# scatterplots
qplot(log(pm25), log(eno), data=maacs)
# by shape
qplot(log(pm25), log(eno), data=maacs, shape=mopos)
# by color (easier)
qplot(log(pm25), log(eno), data=maacs, color=mopos)
# linear regression
qplot(log(pm25), log(eno), data=maacs, color=mopos) + geom_smooth(method="lm")
# split them out
qplot(log(pm25), log(eno), data=maacs, facets= . ~ mopos) + geom_smooth(method="lm")
# What about by both?

# difficult to customize qplot()