# XIV. Appendix A, "Graphical Analysis""

Fig.1, Pairs
```{r Pairs Fig.1, echo=TRUE, fig.height=6, fig.width=6}
pairs(mtcars, main = "mtcars data")
coplot(mpg ~ disp | as.factor(cyl), data = mtcars,
       panel = panel.smooth, rows = 1)
```

Fig.2, Pairs
```{r Pairs Fig.2, echo=TRUE, fig.height=6, fig.width=6}
pairs(mtcars, main = "mtcars data")
coplot(mpg ~ hp | as.factor(cyl), data = mtcars,
       panel = panel.smooth, rows = 1)
```

Fig.2, Pairs
```{r Pairs Fig.2, echo=TRUE, fig.height=6, fig.width=6}
pairs(mtcars, main = "mtcars data")
coplot(mpg ~ hp | as.factor(cyl), data = mtcars,
       panel = panel.smooth, rows = 1)
```

Fig.2, Pairs
```{r Pairs Fig.2, echo=TRUE, fig.height=6, fig.width=6}
pairs(mtcars, main = "mtcars data")
coplot(mpg ~ wt | as.factor(cyl), data = mtcars,
       panel = panel.smooth, rows = 1)
```

----

Fig.1, Pairs
```{r Pairs Fig.1, echo=TRUE, fig.height=6, fig.width=6}
pairs(mtcars, main = "mtcars data")
coplot(mpg ~ disp | as.factor(am), data = mtcars,
       panel = panel.smooth, rows = 1)
```

Fig.2, Pairs
```{r Pairs Fig.2, echo=TRUE, fig.height=6, fig.width=6}
pairs(mtcars, main = "mtcars data")
coplot(mpg ~ hp | as.factor(am), data = mtcars,
       panel = panel.smooth, rows = 1)
```

Fig.2, Pairs
```{r Pairs Fig.2, echo=TRUE, fig.height=6, fig.width=6}
pairs(mtcars, main = "mtcars data")
coplot(mpg ~ hp | as.factor(am), data = mtcars,
       panel = panel.smooth, rows = 1)
```

Fig.2, Pairs
```{r Pairs Fig.2, echo=TRUE, fig.height=6, fig.width=6}
pairs(mtcars, main = "mtcars data")
coplot(mpg ~ wt | as.factor(am), data = mtcars,
       panel = panel.smooth, rows = 1)
```
---












Fig.2, Histograms
```{r Hist Fig.2, echo=TRUE, fig.height=6.5, fig.width=6.5}
data("mtcars");par(mfrow = c(2,1), mar = c(4,4,2,1)) # set margin
mtcars$vs <- factor(mtcars$vs, labels = c("V-block", "S-block")); mtcars$am <- factor(mtcars$am, labels = c("Auto", "Manual")); mtcars$gear <- factor(mtcars$gear); mtcars$carb <- factor(mtcars$carb)
head(mtcars,3)
hist(mtcars$mpg[mtcars$am=="Auto"], breaks=10, xlab = "Miles-Per-gallon", ylab = "Count", main = "Automatic Transmission", col = "yellow", xlim = range(5:40))
abline(v=mean(mtcars$mpg[mtcars$am=="Auto"]), col="red", lwd = 4)
hist(mtcars$mpg[mtcars$am=="Manual"], breaks=10, xlab = "Miles-Per-gallon", ylab = "Count", main = "Manual Transmission", col="lightblue", xlim = range(5:40))
abline(v=mean(mtcars$mpg[mtcars$am=="Manual"]), col="blue", lwd = 4)
```

Fig.3, Box Plots
```{r Box Plot Fig.3, echo=TRUE, fig.height=6, fig.width=6}
data("mtcars")
mtcars$vs <- factor(mtcars$vs, labels = c("V-block", "S-block")); mtcars$am <- factor(mtcars$am, labels = c("Auto", "Manual")); mtcars$gear <- factor(mtcars$gear); mtcars$carb <- factor(mtcars$carb)
head(mtcars,3)
boxplot(mpg ~ am, data = mtcars, col = (c("yellow","lightblue")), ylab = "Miles-Per-Gallon", xlab = "Transmission", main =  "Automatic vs Manual Transmission Miles Per Gallon")
```

Fig.4, Simple Linear Regression - Single Variable Plot
```{r SimpleLinearRegression Fig.4, echo=TRUE, results='hide', fig.height=6, fig.width=6,}
par(mfrow = c(2, 2), mar = c(4, 5, 2, 2));fslrm1 <- lm(mpg ~ am, data = mtcars);
coef(summary(fslrm)); plot(fslrm);fslrm2 <- lm(mpg ~ am - 1, data = mtcars);
coef(summary(fslrm)); plot(fslrm); plot(fslrm2)
```

Fig.5, Bivariate Linear Model Regression plot
```{r Bivariate Linear Model Regression Plot, echo=TRUE, results='hide', fig.height=6, fig.width=6}
data("mtcars")
par(mfrow = c(2, 2), mar = c(4, 5, 2, 1));fslrm <- lm(mpg ~ am, data = mtcars);
f2 <- lm(mpg ~ factor(am) + wt, data = mtcars);coef(summary(f2))
f3 <- lm(mpg ~ factor(am) * wt, data = mtcars);coef(summary(f3))
f4 <- lm(mpg ~ factor(am) + qsec, data = mtcars);coef(summary(f4))
f5 <- lm(mpg ~ factor(am) * qsec, data = mtcars);coef(summary(f5))
f6 <- lm(mpg ~ factor(am) + wt + qsec, data = mtcars);coef(summary(f6))
f7 <- lm(mpg ~ factor(am) * wt * qsec, data = mtcars);coef(summary(f7))
plot(f2);plot(f3);plot(f4);plot(f5);plot(f6);plot(f7)
```

Fig.6, MultivariateLM(allvars)Fig.6 - Residuals/Fitted/Residuals vs Fitted
```{r MultvariateLM(allvars)Fig.6, echo=TRUE, results='hide', fig.height=6.5, fig.width=6.5}
par(mfrow = c(2, 2), mar = c(4, 5, 2, 1))
mlr1 <- lm(mpg ~ ., data = mtcars);coef(summary(mlr1))
plot(mlr1);plot(mlr2)
```

Fig.7, Multivariate LM (all vars)-Residuals/Fitted/Residuals vs Fitted & Adjusted
```{r MultvariateLM(all vars)Fig.7, echo=TRUE, results='hide', fig.height=6.5, fig.width=6.5}
par(mfrow = c(2, 2), mar = c(4, 5, 2, 1))
mlr2 <- lm(mpg ~ . - 1, data = mtcars);coef(summary(mlr2))
```

Fig.8, Multivariate LM Nested Plot
```{r Nested_Fig.8, echo=FALSE, results='hide', fig.height=6, fig.width=6}
data("mtcars")
names(mtcars)
fn1 <- lm(mpg ~ cyl + disp, data = mtcars)
fn2 <- update(fn1, mpg ~ cyl + disp + hp)
fn3 <- update(fn1, mpg ~ cyl + disp + hp + drat)
fn4 <- update(fn1, mpg ~ cyl + disp + hp + drat + wt)
fn5 <- update(fn1, mpg ~ cyl + disp + hp + drat + wt +  qsec)
fn6 <- update(fn1, mpg ~ cyl + disp + hp + drat + wt +  qsec + vs)
fn7 <- update(fn1, mpg ~ cyl + disp + hp + drat + wt +  qsec + vs +  am)
fn8 <- update(fn1, mpg ~ cyl + disp + hp + drat + wt +  qsec + vs +  am +  gear)
fn9 <- update(fn1, mpg ~ cyl + disp + hp + drat + wt +  qsec + vs +  am +  gear + carb)
anova(fn1, fn2, fn3, fn4, fn5, fn6, fn7, fn8, fn9)
```

--------------------------Reviewed up to this point------------------------------

## Generalized Linear Models - na

## Binary Generalized Linear Models - na
\
