Descriptive Statistics: structure, summary

```{r DescriptiveStats, echo=FALSE, message=FALSE, warning=FALSE, results='hide'}
library(datasets);library(dplyr);attach(mtcars)
head(mtcars,4);mean(mpg);sd(mpg)
t.test(mpg);round(t.test(mpg)$conf.int)
mtca0 <- mtcars[am==0,];mtca0
mtca1 <- mtcars[am==1,];mtca1
t.test(mtca0$mpg)
t.test(mtca1$mpg)
mtcars
c4 <- mtcars$mpg[mtcars$cyl==4];c4
c6 <- mtcars$mpg[mtcars$cyl==6];c6
c8 <- mtcars$mpg[mtcars$cyl==8];c8
t.test(c4,c6,var.equal = TRUE)
t.test(c6,c8,var.equal = TRUE)
```
