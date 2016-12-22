

#       DIAGNOSTICS A
Resid fit plot produces a random distribution in three distinct groups indicating
the number of cylinders that were included in this particular model fit as factors
```{r Fig.10_ResidFit, eval=FALSE, fig.height=4.5, fig.width=4.5, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
ordmtcars$am <- factor(ordmtcars$am, labels = c("Auto", "Manual"))
y <- mtcars$mpg
x <- (mtc$wt + mtc$qsec + mtc$am)
n <- length(y)
fw <- lm(y ~ x, data = mtcars)
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


The hatvalues plot does not exhibit any obvious patterns or trends
```{r hatvalues, eval=FALSE, fig.height=4.5, fig.width=4.5, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
mtc$am <- factor(mtc$am, labels = c("Auto", "Manual"))
y <- mtcars$mpg
x <- (mtc$wt + mtc$qsec + as.numeric(mtc$am))
n <- length(y)
hv1 <- hatvalues(lm(mpg ~ x, data = mtc));hv1;plot(hv1)
```


The dffits test shows evenly distributed random results above and
below the center at zero with a single outlier at 6 with a 31 mmpg rating
```{r Fig.11_dft2, eval=FALSE, fig.height=4.5, fig.width=4.5, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
mtc$am <- factor(mtc$am, labels = c("Auto", "Manual"))
y <- mtcars$mpg
x <- (mtc$wt + mtc$qsec + as.numeric(mtc$am))
n <- length(y)
f2 <- lm(mpg ~ x, data = mtc)
dft2 <- dffits(f2)
plot(dft2)
```



##############------------------###############-----------------##################





```{r Fig.11_cooksDist, eval=FALSE, fig.height=4.5, fig.width=4.5, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
ordmtcars$am <- factor(ordmtcars$am, labels = c("Auto", "Manual"))
y <- mtcars$mpg
x <- (mtcars$cyl + mtcars$wt + as.numeric(mtcars$am))
n <- length(y)
cd1 <- cooks.distance(lm(mpg ~ x, data = ordmtcars))
plot(cd1)
```



```{r Fig.12_resid(fit)/(1-hatvalues(fit)), eval=FALSE, fig.height=4.5, fig.width=4.5, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
ordmtcars$am <- factor(ordmtcars$am, labels = c("Auto", "Manual"))
y <- mtcars$mpg
x <- (mtcars$cyl + mtcars$wt + as.numeric(mtcars$am))
n <- length(y)
f2 <- lm(mpg ~ x, data = ordmtcars)
pressResid1 <- resid(f2)/(1-hatvalues(f2));pressResid1;plot(pressResid1)
```


#       DIAGNOSTICS B
```{r Fig.13_dfbetaPlots, eval=FALSE, fig.height=3.5, fig.width=3.5, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
ordmtcars$am <- factor(ordmtcars$am, labels = c("Auto", "Manual"))
y <- mtcars$mpg
x <- (mtcars$cyl + mtcars$wt + as.numeric(mtcars$am))
n <- length(y)
plot(dfbeta(lm(mpg ~ x, data = ordmtcars, family = binomial)))
# par(mfrow = c(4, 4), mar = c(4.0, 3.0, 3.0, 3.0))
```


```{r ConfInt, eval=FALSE, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
ordmtcars$am <- factor(ordmtcars$am, labels = c("Auto", "Manual"))
y <- mtcars$mpg
x <- (mtcars$cyl + mtcars$wt + as.numeric(mtcars$am))
n <- length(y)
fbf3 <- lm(mpg ~ x, data = mtcars)
coef(summary(fbf3))
confint(fbf3)
```

Auxillary copy...


==================
        #       DIAGNOSTICS A
        Resid fit plot produces a random distribution in three distinct groups indicating
the number of cylinders that were included in this particular model fit as factors
```{r Fig.10_ResidFit, eval=FALSE, fig.height=4.5, fig.width=4.5, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
ordmtcars$am <- factor(ordmtcars$am, labels = c("Auto", "Manual"))
y <- mtcars$mpg
x <- (mtc$wt + mtc$qsec + mtc$am)
n <- length(y)
fw <- lm(y ~ x, data = mtcars)
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


The hatvalues plot does not exhibit any obvious patterns or trends
```{r hatvalues, eval=FALSE, fig.height=4.5, fig.width=4.5, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
mtc$am <- factor(mtc$am, labels = c("Auto", "Manual"))
y <- mtcars$mpg
x <- (mtc$wt + mtc$qsec + as.numeric(mtc$am))
n <- length(y)
hv1 <- hatvalues(lm(mpg ~ x, data = mtc));hv1;plot(hv1)
```


The dffits test shows evenly distributed random results above and
below the center at zero with a single outlier at 6 with a 31 mmpg rating
```{r Fig.11_dft2, eval=FALSE, fig.height=4.5, fig.width=4.5, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
mtc$am <- factor(mtc$am, labels = c("Auto", "Manual"))
y <- mtcars$mpg
x <- (mtc$wt + mtc$qsec + as.numeric(mtc$am))
n <- length(y)
f2 <- lm(mpg ~ x, data = mtc)
dft2 <- dffits(f2)
plot(dft2)
```




##############------------------###############-----------------##################





```{r cooksDist, eval=FALSE, fig.height=4.5, fig.width=4.5, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
cd1 <- cooks.distance(lm(mpg ~ ., data = mtcars));cd1;plot(cd1)
```

```{r resid(fit)/(1-hatvalues(fit)), eval=FALSE, fig.height=4.5, fig.width=4.5, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
f2 <- lm(mpg ~ ., data = mtcars)
pressResid1 <- resid(f2)/(1-hatvalues(f2));pressResid1;plot(pressResid1)
```


#       DIAGNOSTICS B
```{r Fig.10_dfbetaPlots, eval=FALSE, fig.height=3.5, fig.width=3.5, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
plot(dfbeta(lm(mpg ~ carb + drat + cyl + am, data = mtcars, family = binomial)))
# par(mfrow = c(4, 4), mar = c(4.0, 3.0, 3.0, 3.0))
```


# however the confint for drat, hp and wt each include zero
```{r ConfInt, eval=FALSE, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
fbf3 <- lm(mpg ~ hp + drat + factor(am) , data = mtcars)
coef(summary(fbf3))
confint(fbf3)
```


