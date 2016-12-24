#       Simple Linear Regression Plot:
Examine the relationship between mpg ratings and transmission type; automatic vs manual
```{r Fig.4_SimpleLR, echo=FALSE, eval=FALSE, fig.align='center',fig.height=4.0, fig.width=6.5, message=FALSE, warning=FALSE}
library(dplyr)
library(ggplot2)
ordmtcars$am <- factor(ordmtcars$am, labels = c("Auto", "Manual"))
f1 <- lm(mpg ~ am, data = ordmtcars)
coef(summary(f1))
par(mfrow = c(1,1), mar = c(2,2,2,2)) # set margin
g <- ggplot(ordmtcars, aes(x = factor(am), y = mpg),)
g <- g + xlab("Transmission Type")
g <- g + ylab("Miles per Gallon")
g <- g + geom_point(size = 4.0, col = "blue", alpha = .45)
g <- g + geom_abline(intercept = 9.91, slope = 7.24) # adjusted (-7.24) to fit grid
g
```


#       Bivariate Linear Model:
Examine the relationship between mpg & two variables: am & weight beacuse weight has an -86%
negative correlation with mpg (the highest single variable correlation with mpg)
```{r Fig.5_BivariateLM_1, echo=FALSE, eval=FALSE, fig.align='center', fig.height=6.0, fig.width=7.5, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
library(car)
f2 <- lm(mpg ~ as.numeric(am) + wt, data = ordmtcars)
hatvalues(f2);coef(summary(f2));vif(f2);sqrt(vif(f2))
par(mfrow = c(2,2), mar = c(4,4,3,2)) # set margin
plot(f2)
```

```{r Fig.5_BivariateLM_2, echo=FALSE, eval=FALSE, fig.align='center', fig.height=4, fig.width=7, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
library(car)
f2 <- lm(mpg ~ as.numeric(am) + wt, data = ordmtcars)
par(mfrow = c(1,1), mar = c(4,4,4,2))
g <- ggplot(mtcars, aes(x = as.numeric(am) + wt , y = mpg),)
g <- g + xlab("Transmission Type + Weight")
g <- g + ylab("Miles per Gallon")
g <- g + geom_smooth(aes(method = "lm", se = FALSE))
g <- g + geom_point(size = 3.5, col = "blue", alpha = .65)
g
```

#       Multivariate Linear Model:

The influence measures test indicates that the following vehicles exhibit
substatial influence on the model fit; "Merc 230","Merc 280", "Honda Civic",
"Camaro Z28","Porsche 914-2","ford Pantera L","ferrari Dino","Maserati Bora"
based on the cov.r (covariance ratio) at 2.809 or above


```{r Fig.6_MVLM(allvars), echo=FALSE, eval=c(1,2,4,7:19), fig.align='center', fig.height=7, fig.width=9, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
library(car);library(ggplot2)
data("mtcars")
as.numeric(unlist(mtcars))
f3 <- lm(mpg ~ ., data = mtcars)
coef(summary(f3))
vif(f3)
sqrt(vif(f3))
par(mfrow = c(1, 1), mar = c(3,3,3,2))
g <- ggplot(mtcars, aes(x = (cyl + disp + hp + drat + wt + qsec + vs + am + gear + carb), y = mpg),)
g <- g + xlab("All Design Components Inclusive")
g <- g + ylab("Miles per Gallon")
g <- g + geom_smooth(aes(method = "lm", se = FALSE))
g <- g + geom_point(aes(shape = factor(am), size = 4.0))
g <- g + geom_point(aes(colour = factor(cyl)))
g
```

#       Multivariate Linear Model (all vars) Adjusted:
```{r Fig.7a_MVLM(allvars,-1), echo=FALSE,  eval=c(1,2,5:12), fig.align='center', fig.height=7,fig.width=9, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
library(car);library(ggplot2)
f6 <- lm(mpg ~ . -1, data = ordmtcars)
coef(summary(f6))
confint(f6)
par(mfrow = c(1,1), mar = c(4,4,2,2)) # set margin
g <- ggplot(mtcars, aes(x = cyl, disp, hp, drat, wt, qsec, vs, am, gear, carb, am, -1, y = mpg),)
g <- g + xlab("Multivariate(allvars)- Adjusted to Intercept")
g <- g + ylab("Miles per Gallon")
g <- g + geom_smooth(aes(method = "lm", se = FALSE))
g <- g + geom_point(aes(shape = factor(am), size = 4.0))
g <- g + geom_point(aes(colour = factor(cyl)))
g
```



#       Multivariate Linear Model (all vars - am):

Remove the am variable from the multivariate linear regression to see what
effect it has on the fit

```{r Fig.7b_MVLM(allvars,-am), echo=TRUE, eval=TRUE, fig.height=4, fig.width=4, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
data("mtcars");as.numeric(unlist(mtcars))
f4 <- lm(mpg ~ . - am, data = mtcars)
coef(summary(f4));vif(f4);sqrt(vif(f4));# plot(f3)
par(mfrow = c(1, 1), mar = c(4,4,4,2))
g <- ggplot(mtcars, aes(x = (cyl + disp + hp + drat + wt + qsec + vs + gear + carb), y = mpg),)
g <- g + xlab("All Design Components - am")
g <- g + ylab("Miles per Gallon")
g <- g + geom_smooth(aes(method = "lm", se = FALSE))
g <- g + geom_point(size = 2.5, col = "black", alpha = .85)
g <- g + geom_point(aes(shape = factor(gear), size = 4.5, colour = "white"))
g <- g + geom_point(aes(colour = factor(cyl), size = 3.5))
g <- g + geom_point(aes(size = drat), alpha = .4)
g
# par(mfrow = c(2, 2), mar = c(4,4,4,2))
# plot(f4)
```


##      Multivariate LM Nested & ANOVA table
Using a nested model approach, followed by checking for variance inflation
using the command vif we can see that cyl, disp & hp

```{r Fig.8_MVLM_ANOVA_table.test, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
fn1 <- lm(mpg ~ factor(am), data = mtcars)
fnm2 <- update(fn1, mpg ~ cyl + disp)
fnm3 <- update(fn1, mpg ~ cyl + disp + hp + drat)
fnm4 <- update(fn1, mpg ~ cyl + disp + hp + drat + wt +  qsec)
fnm5 <- update(fn1, mpg ~ cyl + disp + hp + drat + wt +  qsec + vs + am)
fnm6 <- update(fn1, mpg ~ cyl + disp + hp + drat + wt +  qsec + vs + am + gear + carb)
anova(fn1, fnm2, fnm3, fnm4, fnm5, fnm6)
vif(fnm6)
vif(fnm4)
sqrt(vif(fnm4))
confint(fnm4)
par(mfrow = c(2,2), mar = c(4,4,4,2))
plot(fnm4)
```


#       Multivarite Linear Model Finding Best Fit with Step function:
```{r MVLM_Step_R^2, echo=TRUE, eval=TRUE, cache=TRUE, include=TRUE, results='asis'}
library(stats);library(MASS)
fstp <- lm(mpg ~ ., data = mtcars)
stp <- step(fstp, trace = FALSE)
coef(summary(stp))
summary(stp)$r.squared
```


Based on the nested modeling process followed by the anova table check then
followed by the vif and sqrt(vif) test and the step function we decide to go
with the following model labeled (fstp)
```{r Fig.9a_BestFitModeling, eval=FALSE, fig.height=5, fig.width=5, message=TRUE, warning=TRUE, include=FALSE, results='hide'}
data("mtcars");library(car);library(ggplot2);library(graphics)
stp
mtc <- mtcars
mtc$am <- c("0" = "automatic", "1" = "manual")[as.character(mtc$am)]
x <- (mtc$wt + mtc$qsec + mtc$am)
par(mfrow = c(1,1), mar = c(4,4,2,2)) # set margin
g <- ggplot(mtc, aes(x = x, y = mpg),)
g <- g + xlab("(wt + qsec + am)")
g <- g + ylab("Miles per Gallon")
g <- g + geom_smooth(method = "loess")
g <- g + geom_point(aes(shape = factor(am), size = wt, colour = qsec, alpha = .85))
g
```

##########-----------------#############---------------################



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





