# XIV. Appendix A, "Graphical Analysis""

## Pairs
```{r Pairs Figure 1, echo=TRUE, fig.height=5, fig.width=5}
pairs(mpg ~ ., data = mtcars[,c(1,6,9)])
```

## Histograms
```{r Hist Figure 1, echo=TRUE, fig.height=6.5, fig.width=6.5}
data("mtcars");par(mfrow = c(2,1), mar = c(4,4,2,1)) # set margin
mtcars$vs <- factor(mtcars$vs, labels = c("V-block", "S-block")); mtcars$am <- factor(mtcars$am, labels = c("Auto", "Manual")); mtcars$gear <- factor(mtcars$gear); mtcars$carb <- factor(mtcars$carb)
head(mtcars,3)
hist(mtcars$mpg[mtcars$am=="Auto"], breaks=10, xlab = "Miles-Per-gallon", ylab = "Count", main = "Automatic Transmission", col = "yellow", xlim = range(5:40))
abline(v=mean(mtcars$mpg[mtcars$am=="Auto"]), col="red", lwd = 4)
hist(mtcars$mpg[mtcars$am=="Manual"], breaks=10, xlab = "Miles-Per-gallon", ylab = "Count", main = "Manual Transmission", col="lightblue", xlim = range(5:40))
abline(v=mean(mtcars$mpg[mtcars$am=="Manual"]), col="blue", lwd = 4)
```

## Box Plots
```{r Box Plot Figure 1, echo=TRUE, fig.height=5.5, fig.width=5.5}
data("mtcars")
mtcars$vs <- factor(mtcars$vs, labels = c("V-block", "S-block")); mtcars$am <- factor(mtcars$am, labels = c("Auto", "Manual")); mtcars$gear <- factor(mtcars$gear); mtcars$carb <- factor(mtcars$carb)
head(mtcars,3)
boxplot(mpg ~ am, data = mtcars, col = (c("yellow","lightblue")), ylab = "Miles-Per-Gallon", xlab = "Transmission", main =  "Automatic vs Manual Transmission Miles Per Gallon")
```

## Simple Linear Regression Single Variable Plot
```{r SimpleLinearRegression, echo=TRUE, results='hide', fig.height=6, fig.width=6,}
par(mfrow = c(2, 2), mar = c(4, 5, 2, 1));fslrm <- lm(mpg ~ am, data = mtcars);
coef(summary(fslrm)); plot(fslrm)
```

## Bivariate Linear Model Regression plot
```{r Bivariate Linear Model Regression Plot, echo=TRUE, results='hide', fig.height=6, fig.width=6}
data("mtcars")
f2 <- lm(mpg ~ factor(am) + wt, data = mtcars);coef(summary(f2))
f3 <- lm(mpg ~ factor(am) * wt, data = mtcars);coef(summary(f3))
```

## Multivariate LM (all vars)-Residuals/Fitted/Residuals vs Fitted
```{r MultvariateLM(all vars), echo=TRUE, results='hide', fig.height=6.5, fig.width=6.5}
par(mfrow = c(2, 2), mar = c(4, 5, 2, 1))
mlr1 <- lm(mpg ~ ., data = mtcars);coef(summary(mlr1))
```

## Multivariate LM (all vars)-Residuals/Fitted/Residuals vs Fitted & Adjusted
```{r MultvariateLM(all vars)b, echo=TRUE, results='hide', fig.height=6.5, fig.width=6.5}
par(mfrow = c(2, 2), mar = c(4, 5, 2, 1))
mlr1 <- lm(mpg ~ . -1, data = mtcars);coef(summary(mlr1))
```

## Multivariate LM Nested Plot
```{r Nested, echo=FALSE, results='hide', fig.height=6, fig.width=6}
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

## Generalized Linear Models - na

## Binary Generalized Linear Models (Example from course text need to apply to thi project)
```{r Binary GLM, echo=FALSE, fig.height=6, fig.width=6}
# beta0 = 0; beta1 = 1
# p = 1 / (1 + exp(-1 * (beta0 + beta1 * x)))
#
# plot(x, y, frame = FALSE, xlab = "x", ylab = "y") lines(lowess(x, y), type = "l", col = "blue", lwd = 3)
# fit = glm(y ~ x, family = binomial)
# lines(x, predict(fit, type = "response"), lwd = 3, col = "red")
```
