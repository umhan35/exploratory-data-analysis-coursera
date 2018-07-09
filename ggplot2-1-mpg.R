# ggplot2 (part 1) - https://www.coursera.org/learn/exploratory-data-analysis/lecture/UlFGr/ggplot2-part-1
# implementation of grammer of graphics

library(ggplot2)
str(mpg)
View(mpg)
# hello world
qplot(displ, hwy, data=mpg)
# modifying aesthetics - auto ledgend placement - color aesthetic
qplot(displ, hwy, data=mpg, color=drv)
# adding a geom
qplot(displ, hwy, data=mpg, geom=c("point", "smooth"))
# histograms
qplot(hwy, data=mpg, fill=drv)
# facets
qplot(displ, hwy, data=mpg, facets= . ~ drv) # rows ~ cols
qplot(hwy, data=mpg, facets=drv ~ ., binwidth=2)