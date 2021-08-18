## 1. Create a list called 'x' with three elements:
##  * Name: 'a'; Value = 1
##  * Name: 'b'; Value = "a"
##  * Name: 'c'; Value = 2
x <-


## 2. Get the element called 'a' using '$' from your list 'x'


## 3. Get the element called 'b' using '[[' from your list 'x'


## 4. Can you work out the difference between using 'x[' and 'x[['
##  to get the element 'c' ?


## 5. Below is a vector called 'v'. Try using the functions `list`
## and `as.list` to turn it into a list containing elements with names
##  a-f and values 1-6. Can you see the difference?
v <- setNames(1:6, letters[1:6])


## 6. Create a function called `add` that has two arguments `x` and `y`.
##  Return from this function a list containing:
##   * Name: x; Value = x
##   * Name: y; Value = y
##   * Name: sum; Value = x + y
add <-


## 7. Convert the factor below to numbers, be careful!
f <- factor(c(2, 6, 1, 9))


## 8. Combine the variables below with `c`
x <- 1:2
y <- 3:4
z <- 5:6
combined <-

## 9. Combine the variables below with `list`
x <- 1:2
y <- 3:4
z <- 5:6
combined <-

## 10. Combine the variables below with `c`
x <- 1:2
y <- c("a", "b")
combined_c <-

## 11. Combine the variables below with `list`
x <- 1:2
y <- c("a", "b")
combined_list <-

## 12. Do you see the difference above?
combined_c
combined_list

## 13. Make a recursive function:
##  1. Make a function called log5 that takes an argument 'x' and
##   returns the log base 5 of this argument
##  2. Apply this function around itself and the variable `y`
log5 <-
y <- 100