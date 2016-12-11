#Processing data:
Transformations;
        1 factor variables 8:11;
        2 change variable labels in columns 8 & 9;
                a Note; for column header 8 = vs; variable names = V-block, & S-block;
                b Note; for column header 9 = am; variable names = A-type = A, & M-type;
---
```{r Process data, echo=TRUE, results = 'hide'}
data(mtcars)
mtcars$vs <- factor(mtcars$vs, labels = c("V-block", "S-block")); mtcars$am <- factor(mtcars$am, labels = c("A-type", "M-type")); mtcars$gear <- factor(mtcars$gear); mtcars$carb <- factor(mtcars$carb); head(mtcars)
```
---
