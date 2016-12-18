#       Process Data: factor columns 2 & 8:11 (cyl,vs,am,gear,carb)
Factor columns 2 & 8:11 (cyl,vs,am,gear,carb) and order the data on mpg from the lowest to highest mpg rating
```{r ProcessData, echo=6, eval=6, cache=TRUE, message=FALSE, warning=FALSE, include=FALSE}
data("mtcars")
for(i in c(2,8:11))mtcars[,i] <- as.factor(mtcars[,i]);
str(mtcars)[-,];
ordmtcars <<- mtcars[order(mtcars$mpg,decreasing = FALSE),];
rbind(head(ordmtcars,3),tail(ordmtcars,3))[-,]
ordmtcars[1:3,]
ordmtcars[-,]
```
