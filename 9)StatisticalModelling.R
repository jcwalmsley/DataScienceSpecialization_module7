#Statistical modeling, regression & model fit:
Assumptions:
        A correlation exists among one or more varaibles
        B
        C
---

Multivariate Linear Regression
        lm - simple
```{r SimpleLinearRegression, echo=FALSE}
fslrm <- lm(mpg ~ am, data = mtcars)
coef(summary(fslrm))
plot(fslrm)
```
---

        lm - multivariate
```{r MLR, echo=TRUE,}
mlr1 <- lm(mpg ~ ., data = mtcars)
coef(summary(mlr1))
plot(mlr1)
```
---
        lm - nested / lm - step 'function'
```{r Nested, echo=TRUE}
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
---
        lm - remove the intercept (-1)

        GLM
        Binary GLM
```{r Binary GLM, echo=FALSE, fig.height=6, fig.width=6}
beta0 = 0; beta1 = 1
p = 1 / (1 + exp(-1 * (beta0 + beta1 * x)))

plot(x, y, frame = FALSE, xlab = "x", ylab = "y") lines(lowess(x, y), type = "l", col = "blue", lwd = 3)
fit = glm(y ~ x, family = binomial)
lines(x, predict(fit, type = "response"), lwd = 3, col = "red")
```






Coefficients / Slope
Standard Error
T-Vales
pValues
Residuals
        Leverage
        Influence
Confidence Intervals
Residuals
R^2
Hatvalues
dfbetas
Influence Measures
*Anova
Chisq
Ancova
*GLMs
*Binary GLM




