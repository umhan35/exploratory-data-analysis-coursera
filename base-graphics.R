library(datasets)

# histogram
hist(airquality$Ozone)

# scatterplot
with(airquality, plot(Wind, Ozone))

airquality$Month = factor(airquality$Month)
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")
# if use plot, no need to specify lables
plot(Ozone ~ Month, airquality)

### graphics parameters ###
# pch: the plotting symbol (default is open circle) ?points
# lty: the line type (default is solid line), can be dashed, dotted, etc.
# lwd: the line width, specified as an integer multiple
# col: the plotting color, specified as a number, string, or hex code; the colors() function gives you a vector of colors by name
# xlab: character string for the x-axis label
# ylab: character string for the y-axis label

### par() globle graphics parameters###
# las: the orientation of the axis labels on the plot
# bg: the background color
# mar: the margin size
# oma: the outer margin size (default is 0 for all sides)
# mfrow: number of plots per row, column (plots are filled row-wise)
# mfcol: number of plots per row, column (plots are filled column-wise)

### Base Plotting Functions ###
# plot: make a scatterplot, or other type of plot depending on the class of the object being plotted
# lines: add lines to a plot, given a vector x values and a corresponding vector of y values (or a 2-column matrix); this function just connects the dots
# points: add points to a plot
# text: add text labels to a plot using specified x, y coordinates
# title: add annotations to x, y axis labels, title, subtitle, outer margin
# mtext: add arbitrary text to the margins (inner or outer) of the plot
# axis: adding axis ticks/labels


# add title
with(airquality, plot(Wind, Ozone))
title(main = "Ozone and Wind in New York City")  ## Add a title

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City"))
# overwite existing points
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))

# don't overwite existing points
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", 
                      type = "n")) # type n not draw anything
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
# add ledgend
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other Months"))

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", 
                      pch = 20))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd=1)


# multiple base plots
par(mfrow=c(1,2))
with(airquality, {
  plot(Wind, Ozone, main = "Ozone and Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
})
par(mfrow=c(1,1))


# outer title
par(mfrow=c(1,3), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(airquality, {
  plot(Wind, Ozone, main = "Ozone and Wind")
  plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
  plot(Temp, Ozone, main = "Ozone and Temperature")
  mtext("Ozone and Weather in New York City", outer=TRUE)
})
par(mfrow=c(1,1))
