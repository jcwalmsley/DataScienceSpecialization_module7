#Exploratory analysis:
---
#3 Pair plot
# Figures: Exploratory see Appendix A, Figure
```{r Pairs plot, echo=FALSE, fig.height=6, fig.width=6}
pairs(mpg ~ ., data = mtcars)
```
---
## Histogram
---
```{r Histogram Figure 1, echo=FALSE, fig.height=5, fig.width=5}
data(mtcarsProc)
par(mfrow = c(2,1), mar = c(4,4,2,1)) # set margin
hist(mtcarsProc$mpg[mtcarsProc$am=="Auto"], breaks=10, xlab = "Miles-Per-gallon", ylab = "Count", main = "Automatic Transmission", col = "yellow", xlim = range(5:40));
abline(v=mean(mtcarsProc$mpg[mtcarsProc$am=="Auto"]), col="red", lwd = 4)
hist(mtcarsProc$mpg[mtcarsProc$am=="Manual"], breaks=10, xlab = "Miles-Per-gallon", ylab = "Count", main = "Manual Transmission", col="lightblue", xlim = range(5:40));
abline(v=mean(mtcarsProc$mpg[mtcarsProc$am=="Manual"]), col="blue", lwd = 4)
```
---

---
## Boxplot
Figures: Exploratory see Appendix A -?
```{r Box plot, echo=FALSE, fig.height=5, fig.width=5}
boxplot(mpg ~ am, data = mtcars, col = (c("grey","grey")), ylab = "Miles-Per-Gallon", xlab = "Transmission", main =  "Transmission type ~ Miles per Gallon")
```
---
YES QQ plot
Figures: Exploratory see Appendix A -?
```{r QQ plot, echo=FALSE, fig.height=5, fig.width=5}
#qqPlot(fit?, main="Normal Q-Q plot")
```
---
YES Fitted
Figures: Exploratory see Appendix A -?







YES Residuals
Figures: Exploratory see Appendix A -?
data("mtcars")
fit <- lm(mpg ~ am, mtcars)
fit$residuals
summary(fit)
mean(fit$residuals)
cov(fit$residuals, mtcars$am)



YES Residuals vs Fitted
Figures: Exploratory see Appendix A -?





Barplots



YES Scatterplots
Figures: Exploratory see Appendix A -?
data("mtcars")
plot(mpg ~ am, mtcars)
plot(jitter(mpg,4) ~ am, mtcars)
regrline <- lm(mpg ~ am, mtcars)
abline(regrline, lwd=3, col='red')
summary(regrline)


Multiple plots

par(mfrow = c(1, 2), mar = c(5, 4, 2, 1)) = sets margins
with(subset(pollution, region == "west"), plot(latitude, pm25, main = "West")) =
        left scatterplot
with(subset(pollution, region == "east"), plot(latitude, pm25, main = "East")) =
        right scatterplot





Graphing - base, lattice, ggpplot2

ABlines (h/v)

Confidence intervals
Figures: Exploratory see Appendix A -?

Standard error

Variance

Fitted lines

Heatmap

K-Means

Dimension Reduction
        PCA
        SVD

Figures: Exploratory see Appendix A
