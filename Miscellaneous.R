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




REVISE THIS!!!!

        # From the output of the above code use those variables with low sqrt of variance inflation results = (cyl, drat, vs, am, gear & carb), to formulate the next multivariate model



        ```{r, eval=FALSE, fig.height=3, fig.width=3, message=FALSE, warning=FALSE, include=FALSE}
library(ggplot2);library(dplyr);data("mtcars")
f4 <- lm(mpg ~ am + drat +  cyl + vs + gear + carb, data = mtcars);vif(f4)
f5 <- lm(mpg ~ I(am + drat) + carb, data = mtcars);sqrt(vif(f5))
par(mfrow = c(2,1), mar = c(4,4,2,2)) # set margin
g <- ggplot(mtcars, aes(x = (drat, am, carb), y = mpg),)
g <- g + xlab("(am + drat + carb)")
g <- g + ylab("Miles per g1allon")
g <- g + geom_smooth(aes(method = "lm", se = FALSE))
g <- g + geom_point(size = 3.0, col = "black", alpha = .65)
g
```


Finding a better model fit; use the variables with low sqrt of variance
inflation =  cyl, drat, vs, am, gear & carb; The following multivariate model
includes these regressors

```{r, echo=TRUE, eval=, fig.height=3, fig.width=3, message=FALSE, warning=FALSE, include=FALSE}
library(ggplot2);library(dplyr);data("mtcars")
f4 <- lm(mpg ~ am + drat +  cyl + vs + gear + carb, data = mtcars)
sqrt(vif(f4))
# remove cyl for high level of variance inflation
f5 <- lm(mpg ~ I(am + drat) + carb, data = mtcars)
sqrt(vif(f5))
x <- mtcars[,c(5,9,11)]
y <- mtcars$mpg
n <- length(y)
par(mfrow = c(2,1), mar = c(4,4,2,2)) # set margin
g <- ggplot(mtcars, aes(x = drat, am, carb, y = y),)
g <- g + xlab("(am + drat) + carb")
g <- g + ylab("Miles per g1allon")
g <- g + geom_smooth(aes(method = "lm", se = FALSE))
g <- g + geom_point(size = 3.0, col = "black", alpha = .65)
g
```
library(car)
library(datasets)
library(dplyr)
library(ggplot2)
library(graphics)
library(grDevices)
library(GGally)
library(knitr)
library(kernlab)
library(MASS)
library(xtable)
custom_car <- ggpairs(mtcars[, c("mpg", "wt", "cyl")], upper = "blank", title = "Custom Example")
# ggplot example taken from example(geom_text)
plot <- ggplot2::ggplot(mtcars, ggplot2::aes(x=wt, y=mpg, label=rownames(mtcars)))
plot <- plot +
        ggplot2::geom_text(ggplot2::aes(colour=factor(cyl)), size = 3) +
        ggplot2::scale_colour_discrete(l=40)
custom_car[1, 2] <- plot
personal_plot <- ggally_text(
        "ggpairs allows you\nto put in your\nown plot.\nLike that one.\n <---"
)
# custom_car[1, 3] <- personal_plot
# # custom_car
#
# # remove plots after creating a plot matrix
# custom_car[2,1] <- NULL
# custom_car[3,1] <- "blank" # the same as storing null
# custom_car[3,2] <- NULL
# custom_car


Removing the regressor disp in this model based on the appearance of an sinusoidal shape in the previous residual plot above resulting in a more random residual plot in this model (eliminating overfitting)
```{r Fig.9_ResidFit2, eval=FALSE, fig.height=4.5, fig.width=4.5, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
y <- mtcars$mpg
x <- (as.numeric(mtcars$cyl) + mtcars$wt + as.numeric(mtcars$am))
n <- length(y)
fw <- lm(y ~ x, data = ordmtcars)
coef(summary(fw))
e <- resid(fw)# ;e;plot(e);sum(e)
plot(x,e,
     xlab = "cyl + disp + drat + hp wt + am",
     ylab = "Residuals (MPG)",
     bg = "lightblue",
     col = "black", cex = 2.5, pch = 21, frame = FALSE)
abline(h = 0, lwd = 2)
for(i in 1:n)
        lines(c(x[i], x[i]), c(e[i], 0), col = "red", lwd = 2)
```

Removing the regressor disp in this model based on the appearance of an sinusoidal shape in the previous residual plot above resulting in a more random residual plot in this model (eliminating overfitting)
```{r Fig.9_ResidFit2, eval=FALSE, fig.height=4.5, fig.width=4.5, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
y <- mtcars$mpg
x <- (as.numeric(mtcars$cyl) + mtcars$wt + as.numeric(mtcars$am))
n <- length(y)
fw <- lm(y ~ x, data = ordmtcars)
coef(summary(fw))
e <- resid(fw)# ;e;plot(e);sum(e)
plot(x,e,
     xlab = "cyl + disp + drat + hp wt + am",
     ylab = "Residuals (MPG)",
     bg = "lightblue",
     col = "black", cex = 2.5, pch = 21, frame = FALSE)
abline(h = 0, lwd = 2)
for(i in 1:n)
        lines(c(x[i], x[i]), c(e[i], 0), col = "red", lwd = 2)
```


