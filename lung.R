library(survival)
library("Hmisc")
library(car)
library("dgof")
library(dplyr)
library("tableone")
df <- lung


## start by removing missing values
summary(df)
df <- na.omit(df)

outcome <- c("time", "status")
features <- setdiff(colnames(df), outcome)

## correlation matrix of features
m <- as.matrix(df)
rcorr(m, type = "pearson")
rcorr(m, type = "spearman")

## t-test continuous variables
plot(df[,features])

t.test(df$meal.cal, df$wt.loss)
## chisq test discrete variables
chisq.test(df$ph.ecog, df$pat.karno)

## create a table one
install.packages("tableone")
CreateTableOne(data = df, factorVars = c("sex", "ph.ecog", "ph.karno", "pat.karno"))

## simple linear regression
##  outcome (y) is time, pick any feature (x)
lm(time ~ age, df)
summary(lm(time ~ age, df))
## multiple linear regression
##   outcome (y) is time, use any features (x)
lm(time ~ age + sex, df)
summary(lm(time ~ age + sex, df))
summary(lm(time ~ ., df))
## scatter plot inst (x) vs time (y)
scatterplot(inst ~ time, df)
plot(df$inst, df$time, xlab = "inst", ylab = "time")
## histogram plot sex (x) vs time (y)
hist(df$time, xlab = "time", main = "Histogram of Time", freq = FALSE)
lines(density(df[df$sex == 1,"time"]), col = "blue")
lines(density(df[df$sex == 2,"time"]), col = "red")

## kolmogorov smirnov
##  1. subset continuous variables by discrete
df[df$sex == 1,"time"]

##  2. then perform test on subsets
ks.test(df[df$sex == 1,"time"], df[df$sex == 2,"time"])

## wilcox test continuous variables
##  1. subset continuous variables by discrete
df[df$sex == 1,"time"]
##  2. then perform test on subsets
wilcox.test(df[df$sex == 1,"time"], df[df$sex == 2,"time"])
t.test(df[df$sex == 1,"time"], df[df$sex == 2,"time"])
