library(survival)

df <- lung

outcome <- c("time", "status")
features <- setdiff(colnames(df), outcome)

## start by removing missing values
df <-

## correlation matrix of features

## t-test continuous variables

## chisq test discrete variables

## create a table one

## simple linear regression
##  outcome (y) is time, pick any feature (x)

## multiple linear regression
##   outcome (y) is time, use any features (x)

## scatter plot inst (x) vs time (y)
## histogram plot sex (x) vs time (y)

## kolmogorov smirnov
##  1. subset continuous variables by discrete
##  2. then perform test on subsets

## wilcox test continuous variables
##  1. subset continuous variables by discrete
##  2. then perform test on subsets
