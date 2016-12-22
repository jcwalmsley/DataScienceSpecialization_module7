data("mtcars")
ordmtcars <<- mtcars[order(mtcars$mpg,decreasing = FALSE),]
str(ordmtcars);summary(ordmtcars);ordmtcars[27:32,]
