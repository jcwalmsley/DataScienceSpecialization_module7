#       Process Data: factor columns 2 & 8:11 (cyl,vs,am,gear,carb)
Factor columns 2 & 8:11 (cyl,vs,am,gear,carb) and order the data on mpg from the lowest to highest mpg rating
```{r, ProcessData, echo=TRUE, eval=TRUE, cache=TRUE, message=FALSE, warning=FALSE, include=FALSE, results='hide'}
data("mtcars")
for(i in c(2,8:11))mtcars[,i] <- as.factor(mtcars[,i]);
str(mtcars)
```

