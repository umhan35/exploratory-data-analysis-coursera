
maacs = read.csv("bmi_pm25_no2_sim.csv")

library(ggplot2)

g <- ggplot(maacs, aes(logpm25, NocturnalSympt))

# smmoth line
g + geom_point() + geom_smooth()
g + geom_point() + geom_smooth(method="lm")

# add facets (bmicat is the factor variable)
g + geom_point() + facet_grid(. ~ bmicat) + geom_smooth(method="lm")
#+ theme(legend.position="none")
#+ theme_bw()

## anotations

# modifying aesthetics
g + geom_point()
g + geom_point(color="steelblue", size = 4, alpha=1/2)
g + geom_point(aes(shape=bmicat, color=bmicat), size = 4, alpha=1/2)

# modifying labels
g + geom_point(aes(shape=bmicat, color=bmicat))
  + labs(title = "MAACS Cohort")
  + labs(x = expression("log " * PM[2.5]), y = "Nocturnal Symptoms")

# customizing the smooth
g + geom_point(aes(color=bmicat))
  + geom_smooth(method="lm", size=4, linetype=3, se=FALSE)

# change theme w/ font
g + geom_point(aes(color = bmicat)) + theme_bw(base_family="Times")