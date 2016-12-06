
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

        ```{r cars}
summary(cars)
```

## Including Plots

You can also embed plots, for example:

        ```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.




Residuals
Leverage
Influence
Deviance
Anova
Inferential
Null Hypothesis
Alternative Hypothesis
Power or Alpha
Confidence Interval = .95, one or two sided?
pValue
R^2

myHist <- function(mu){
        mse <- mean((mtcarsProc$mpg - mu)^2)
        g <- ggplot(mtcarsProc, aes(x = mpg)) + geom_histogram(fill = "salmon", colour\ = "black", binwidth = 1)
        #        g <- g + geom_vline(xintercept = mu, size = 3)
        #        g <- g + ggtitle(paste("mu = ", mu, ", MSE = ", round(mse, 2), sep = ""))
        g <- g + geom_vline(xintercept = mean((mtcarsProc$mpg[,am=="Auto"]), size = 1)
                            #        g <- g + geom_vline(xintercept = mean(mtcarsProc$mpg[mtcarsProc$am=="manual"]), size = 3)
}
g
