x = rnorm(100)
hist(x)
y = rnorm(100)
plot(x, y)
z = rnorm(100)
plot(x, z)
old_mar = par("mar") # 5.1 4.1 4.1 2.1
par(mar=c(2,2,2,2))
plot(x, y, pch = 20)

title("Scatterplot")
text(-2, -2, "Label")
legend("topleft", legend = "Data", pch=20)
fit = lm(y ~ x)
abline(fit)
abline(fit, lwd=3)
abline(fit, lwd=3, col="blue")

plot(x, y, xlab="Weight", ylab = "height", main="main", pch=20)
legend("topright", legend = "Data", pch=20)
fit = lm(y ~ x)
abline(fit, lwd=3, col="red")

z = rpois(100, 2)
par(mfrow=c(2,1))
plot(x, y, pch=20)
plot(x, z, pch=19)

par(mar=c(2,2,1,1))
plot(x, y, pch=20)
plot(x, z, pch=19)

par(mfrow=c(1,2))
plot(x, y, pch=20)
plot(x, z, pch=19)

par(mar=c(4,4,2,2))
plot(x, y, pch=20)
plot(x, z, pch=19)

par(mfrow=c(2,2))
plot(x, y)
plot(x, z)
plot(z, x)
plot(y, x)

par(mfcol=c(2,2)) # col wise
plot(x, y)
plot(x, z)
plot(z, x)
plot(y, x)

par(mfrow=c(1,1))
x = rnorm(100)
y = x + rnorm(100)
g = gl(2, 50, labels=c("Male", "Female"))
str(g)
plot(x,y)


plot(x, y)
plot(x, y, type="n")
points(x[g=="Male"], y[g=="Male"], col="green")
points(x[g=="Female"], y[g=="Female"], col="blue")
