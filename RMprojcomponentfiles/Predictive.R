Predictive:
```{r Prediction, eval=FALSE, warning=TRUE, include=FALSE}
library(dplyr);library(ggplot2);library(graphics)
data("mtcars")
fc1 <- lm(mpg ~ I(wt - mean(wt)), data = mtcars)
m = mean(wt)
m
[1] 3.21725
predict(fc1, newdata = data.frame(wt=m), interval = "confidence")
fp1 <- lm(mpg ~ I(wt - mean(wt)), data = mtcars)
m = mean(wt)
m
[1] 3.21725
predict(fp1, newdata = data.frame(wt=m), interval = "prediction")
#
fc2 <- lm(mpg ~ I(qsec - mean(qsec)), data = mtcars)
m = mean(qsec)
m
[1] 3.21725
predict(fc2, newdata = data.frame(qsec=m), interval = "confidence")
fp2 <- lm(mpg ~ I(qsec - mean(qsec)), data = mtcars)
m = mean(qsec)
m
[1] 3.21725
predict(fp2, newdata = data.frame(qsec=m), interval = "prediction")
```


