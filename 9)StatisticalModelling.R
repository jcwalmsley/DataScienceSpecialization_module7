#Statistical modeling, regression & model fit:
Assumptions:
        A Correlation with 'mpg' by variables other than transmission type may exist
        B Certain models may exert influence / leverage on the correlation between mpg & am
---

Multivariate Linear Regression
## Simple Linear Regression Single Variable Plot
```{r fslrm, echo=FALSE, fig.height=6, fig.width=6}
data("mtcars")
png(fslrm = "fslrm.png")
par(mfrow = c(1, 1), cex = 0.7)
fslrm <- lm(mpg ~ am, data = mtcars)
coef(summary(fslrm))
plot(fslrm)
dev.off()
```
---

## Bivariate Linear Model Regression plot
```{r fBivLM, echo=FALSE, fig.height=6, fig.width=6}
data("mtcars")
png(fBivLM = "fBivLM.png")
par(mfrow = c(1, 2), cex = 0.6)
f2 <- lm(mpg ~ factor(am) + wt, data = mtcars)
coef(summary(f2))
f3 <- lm(mpg ~ factor(am) * wt, data = mtcars)
coef(summary(f3))
plot(f2)
plot(f3)
dev.off()
```
---


## Multivariate Linear Model (all vars)-Residuals/Fitted/Residuals vs Fitted
```{r fMLM, echo=FALSE, fig.height=6, fig.width=6}
data("mtcars")
png(fMLM = "fMLM.png")
par(mfrow = c(1, 2), cex = 0.6)
fMLM <- lm(mpg ~ ., data = mtcars)
coef(summary(fMLM))
plot(fMLM)
dev.off()
```
---

## Multivariate Linear Model (all vars)b
## -Residuals/Fitted/Residuals vs Fitted & Adjusted, removing the intercept
```{r fMLMA, echo=FALSE, fig.height=6.5, fig.width=6.5
png(fMLMA = "fMLMA.png")
par(mfrow = c(2, 1), cex = 0.7)
fMLMA <- lm(mpg ~ . -1, data = mtcars)
coef(summary(fMLMA))
plot(fMLMA)
dev.off()
```
---

## Multivariate Linear Model(s) plot
```{r ANOVA_Nested_LM, echo=FALSE}
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

# GLM

## Binary GLM ## Need to revise this code!!!
```{r Binary GLM, echo=FALSE, fig.height=6, fig.width=6}
beta0 = 0; beta1 = 1
p = 1 / (1 + exp(-1 * (beta0 + beta1 * x)))

plot(x, y, frame = FALSE, xlab = "x", ylab = "y") lines(lowess(x, y), type = "l", col = "blue", lwd = 3)
fit = glm(y ~ x, family = binomial)
lines(x, predict(fit, type = "response"), lwd = 3, col = "red")
```






\


