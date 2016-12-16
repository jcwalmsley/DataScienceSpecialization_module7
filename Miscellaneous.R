range(mtcars$mpg[mtcars$am==0]) # 0 = automatic
range(mtcars$mpg[mtcars$am==1]) # 1 = manual
sd(mtcars$mpg[mtcars$am==0])
sd(mtcars$mpg[mtcars$am==1])
var(mtcars$mpg[mtcars$am==0])
var(mtcars$mpg[mtcars$am==1])
mean(mtcars$mpg[mtcars$am==0])
mean(mtcars$mpg[mtcars$am==1])
---
# Notice the correlation of mpg to cyl = -0.852, disp = -0.848, wt = -0.868 & hp = -0.776
# Notice the covariance of mpg to disp = -633.10, & hp = -320.73
# these should be checked for collinearity and variance inflation VIF
---
tstat <- t.test(mpg ~ am, data = mtcars)
tstat
# Welch Two Sample t-test
#
# data:  mpg by am
# t = -3.7671, df = 18.332, p-value = 0.001374
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#         -11.280194  -3.209684
# sample estimates:
#         mean in group 0 mean in group 1
# 17.14737        24.39231
---
data(mtcars);head(mtcars)
for(i in c(2,8:11))mtcars[,i] <- as.factor(mtcars[,i])
str(mtcars)

mtcars$vs <- factor(mtcars$vs, labels = c("V-eng", "S-eng")); mtcars$am <- factor(mtcars$am, labels = c("Automatic", "Manual")); mtcars$gear <- factor(mtcars$gear); mtcars$carb <- factor(mtcars$carb)
head(mtcars,3)









---
?

---
# Regression
f1 <- (lm(mpg ~ factor(am), data = mtcars))
coef(f1)
plot(1/(coef(f1)))

(Intercept) factor(am)1
17.147368    7.244939
# mean mpg for automatic transmission is 17.15mpg
# mean mpg for manual transmission is 17.15mpg + 7.24mpg = 24.39mpg
---
##** How to center y & x
##yc <- y - mean(y)
##xc <- x - mean(x)
##b1 <- sum(yc * xc) / sum(xc ^2)
##c(b1, coef(lm(y ~ x))[2])
## OR
## lm(yc ~ xc -1)
## ##---
##** How to normalize y & x
##yn <- (y - mean(y)) / sd(y)
##xn <- (x - mean(x)) / sd(x)
##c(cor(y,x), cor(yn, xn), coef(lmyn ~ xn))[2])
##
## To add a regression line using ggplot2
## ```{r, fig.height=6,fig.width=6,echo=FALSE}
## g <- ggplot(filter(freqData, freq > 0), aes(x = parent, y = child))
## g <- g + scale_size(range = c(2,20), guide = "none)
## g <- geom_point(colour="grey50", aes(size = freq+20, show_guide = FALSE))
## g <- g + geom_point(aes(colour=freq, size=freq))
## g <- g + scale_colour_gradient(low = "lightblue", high = "white)
## g <- g + geom_smooth(method="lm", formula=y~x) ## this adds the regression line
## g
## ```
##```{r,}
## data(diamond)
## y <- diamond$orice; x <- diamond$carat; n <- lenght(y,x)
## fit <- lm(y ~ x)
## e <- resid(fit)
## yhat <- predict(fit)
## max(abd(e - (y - yhat)))
## max(abs(e - (y - coef(fit)[1] - coef(fit)[2] * x)))
## sum(e)
## sum(e * x)
---
## Residuals
## Using base plot graphics
## plot(diamond$carat, diamond$price,
##      xlab = "Mass (carats"),
##      ylab = "Price (SIN $),
##      bg = "lightblue,
##      col = black, cex = 1.1, pch = 21, frame = FALSE)
## abline(fit, lwd = 2)
## for(i in 1:n)
##      lines(c(x[i], x[i], c(y[i], yhat[i]), col = "red, lwd = 2)
## ## plot(diamond$carat, diamond$price,
##      xlab = "Mass (carats")",
##      ylab = "Residuals (SIN $)",
##      bg = "lightblue",
##      col = black, cex = 1.1, pch = 21, frame = FALSE)
## abline(fit, lwd = 2)
## for(i in 1:n)
##      lines(c(x[i], x[i], c(y[i], yhat[i]), col = "red", lwd = 2)
##
## Residuals continued!!
## g <- ggplot(data.frame(x = x, y = resid(lm(y ` x))),
##      aes(x = x, y = y))
## g <- g + geom_hline(yintercept = 0, size = 2);
## g <- g + geom_point(size = 7, colour = "black", alpha = 0.4)
## g <- g + geom_point(size = 5, colour = "red", alpha - 0.4)
## g <- g + xlab("X") + ylab("Residual")
## g
## More Residuals
## diamond$e <- resid(lm(price ~ carat, data = diamond))
## g <- ggplot(diamond, aes(x = carat, y = e))
## g <- g + xlab("Mass (carats)")
## g <- g + ylab)"Residual price (SIN $)")
## g <- g + geom_hline(yintercept = 0, size = 2)
## g <- g + geom_point(size = 7, colour = "black", alpha = 0.5)
## g <- g + geom_point(size = 5, colour = "blue", alpha = 0.2)
##
---

from the pairs plot
# #pairs(ordmtcars, panel = panel.smooth, main = "MTCARS data set", col = 3)
# pairs(mtcars, main = "mtcars data")
# coplot(mpg ~ hp + drat | as.factor(cyl), data = mtcars,
#        panel = panel.smooth, rows = 1)









