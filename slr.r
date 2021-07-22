## --------------------------------------------------------------------
## Fitting function for estimating model coefficients
## --------------------------------------------------------------------
## Parameters:
##  * y - Target/outcome data. dependent variable on y-axis to predict
##  * x - Feature/covariate data. independent variable to predict y with
##
## In this function we estimate the coefficients 'alpha' and 'beta' with
##  the following formulae:
##
## x_i is feature data
## y_i is target data
## x_bar = 1/n sum(x_i) = mean of x
## y_bar = 1/n sum(y_i) = mean of y
## beta = sum((x_i - x_bar)(y_i - y_bar)) / sum((x_i - x_bar) ^ 2)
## alpha = y_bar - (beta * x_bar)
fit_slr <- function(y, x) {
    ## first find the mean of y and x
    meany <-
    meanx <-

    ## calculate beta with formula above
    beta <-

    ## calculate alpha with formula above
    alpha <-

    ## return alpha and beta
    list(alpha = alpha, beta = beta)
}

## --------------------------------------------------------------------
## Prediction function for new data
## --------------------------------------------------------------------
## Parameters:
##  * model - Fitted model, outcome of fit_slr
##  * x - New feature/covariate data. independent variable to predict y with
##
## In this function we make predictions of `y` for new data `x` with the
##  following formula:
##
## y = alpha + (beta * x)
predict_slr <- function(model, x) {
    ## calculate y with formula above
    y <-

    ## return y
}

## --------------------------------------------------------------------
## Now test if the functions above work
## --------------------------------------------------------------------

## Training data
train <- 1:16
## Testing data
test <- 17:32

## Get 'true' result from lm function
lm_fit <- lm(mpg ~ disp, data = mtcars, subset = train)
lm_predict <- unname(predict(fit, mtcars[test, "disp", drop = FALSE]))

## Get result from your function
my_fit <- fit_slr(mtcars$mpg[train], mtcars$disp[train])
my_predict <- predict_slr(my_fit, mtcars$disp[test])

## If this is TRUE, you are finished!
identical(round(lm_predict, 5), round(my_predict, 5))
