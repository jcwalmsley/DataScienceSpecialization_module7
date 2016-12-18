#       Accessing Data & Raw Data Overview: Motor Trend 'mtcars' data set:
Clean the work space, import the data & heck for missing values
```{r Data_mtcars, include=FALSE, results='hide'}
rm(list=ls());library(car);library(dplyr);data("mtcars");any(is.na(mtcars))
```
A data frame with 32 observations on 11 variables.

[, 1]	mpg	Miles/(US) gallon
[, 2]	cyl	Number of cylinders (4,6,8)
[, 3]	disp	Displacement (cu.in.)
[, 4]	hp	Gross horsepower
[, 5]	drat	Rear axle ratio
[, 6]	wt	Weight (1000 lbs)
[, 7]	qsec	1/4 mile time
[, 8]	vs	V/S (0 = vee-block, 1 = straight-block)
[, 9]	am	Transmission (0 = automatic, 1 = manual)
[,10]	gear	Number of forward gears (3,4,5)
[,11]	carb	Number of carburetors (1,2,3,4,6,8)
