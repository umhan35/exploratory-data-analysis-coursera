# Axis limits

testdat = data.frame(x = 1:100, y = rnorm(100))
testdat[50,2] = 100 # outlier!
plot(testdat$x, testdat$y, type="l", ylim = c(-3,3)) # ylim to se outliers
plot(testdat$x, testdat$y, type="l")

g <- ggplot(testdat, aes(x,y))
g + geom_line() + ylim(-3, 3) # WARNING ylim removes the outlier
g + geom_line() + coord_cartesian(ylim = c(-3, 3)) # outlier included


maacs = read.csv("bmi_pm25_no2_sim.csv")
## Calculate the tertiles of the data
cutpoints <- quantile(maacs$logno2_new, seq(0, 1, length = 4), na.rm = TRUE)

## Cut the data at the tertiles and create a new factor variable
maacs$no2tert <- cut(maacs$logno2_new, cutpoints)

## See the levels of the newly created factor variable
levels(maacs$no2tert)

g <- ggplot(maacs, aes(logpm25, NocturnalSympt))

## Add layers
g + geom_point(alpha = 1/3) + 
  facet_wrap(bmicat ~ no2tert, nrow = 2, ncol = 4) + 
  geom_smooth(method="lm", se=FALSE, col="steelblue") + 
  theme_bw(base_family = "Avenir", base_size = 10) + 
  labs(x = expression("log " * PM[2.5])) + 
  labs(y = "Nocturnal Symptoms") + 
  labs(title = "MAACS Cohort")
