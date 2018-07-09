library(lattice)
library(datasets)

View(airquality)


# simple scatter plot
xyplot(Ozone ~ Wind, airquality)


# covert month to factor variable
airquality = transform(airquality, Month=factor(Month))
is.factor(airquality$Month)
xyplot(Ozone ~ Wind | Month, airquality, layout=c(5,1))


# lattice behavior
p = xyplot(Ozone ~ Wind, airquality)
print(p)


# Lattice Panel Functions
set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f * x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
xyplot(y ~ x | f, layout = c(2, 1))  ## Plot with 2 panels
# layout optional


# custom panel functions
xyplot(y ~ x | f, panel = function(x, y, ...) {
  panel.xyplot(x, y, ...)
  panel.abline(h = median(y), lty = 2)
})

xyplot(y ~ x | f, panel = function(x, y, ...) {
  panel.xyplot(x, y, ...)
  panel.lmline(x,y,col=2)
})






