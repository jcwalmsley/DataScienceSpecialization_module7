#Inference:
#
#       Inference:
Hypothesis:
        A H0 = The difference between Automatic and Manual transmission MPG = 0

        B Ha = The difference between Automatic and Manual transmission MPG != 0

        C Desired confidence interval = .95 (one sided) ??


```{r Inference_1, echo=TRUE, eval=TRUE, include=FALSE, results='hide'}
library(kernlab)
set.seed(8932)
trainIndicator = rbinom(32, size = 1, prob = 0.5)
table(trainIndicator)
```












Assumptions:
        A Variables other than transmission type may influence MPG ratings
B
C
State H0 & Ha hypothesis
Set Seed,
One or Two Sided Test
Power / Alpha
Beta = (1 - Alpha)
Confidence Intervals (.95 one sided, .975 two sided)
Standard Error
Variance
students T-score
Z-score
p-Values
Residual Plots with diagnostics see Appendix
