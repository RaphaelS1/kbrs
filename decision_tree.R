#---------------------------
# Stage 1 - Growing the tree
#---------------------------

## 1. Make a function to fit our decision tree to training data.
#  This functions needs two parameters:
#   data - For taking in the data
#   target - For naming the dependent/target variable
decision_tree <- function(...) {

  ## 2. Plant the tree: create the root
  #  Make a list called `tree` which has three elements:
  #   data - The data passed to the function
  #   y - The mean of the target variable
  #  terminal - An indicator to tell us if this is the terminal node, it isn't
  #   so set to FALSE.
  tree <- list(data = data, y = mean(data[, target]), terminal = FALSE)

  ## 3. Grow the tree
  # I've done this line for you
  grown_tree <- .grow_tree(tree, target)

  ## 4. Save the tree as a tree class
  # I've put in the first argument, look up what to do for the second
  structure(.Data, ...)
}

## 5. Make a function to grow the tree. this function needs to do one of two
# things:
#  1. Stop growing the tree if it has terminated (no more branches can be split)
#  2. Grow the tree if it has not terminated
# The function should have two arguments:
#  tree - Which will take the list we created above
#  target - Same as above
.grow_tree <- function(...) {
  ## 6. Assert that 'tree' is a list
  stopifnot(...)

  ## 7. Check if the tree has terminated as follows:

  # i) Create a variable called `old_tree` and assign it the value `tree`
  old_tree <- ...

  # ii) Create a variable called `new_tree` and try and split it
  #  (I've done this for you)
  new_tree <- .split_tree(old_tree, target)

  # iii) Create a `while` loop that should stop when `old_tree` and `new_tree`
  #  are no longer *identical*
  while (...) {
    # iv) Update `old_tree` to be the `new_tree`
    old_tree <-
    # v) Update `new_tree` by splitting it
    new_tree <-
  }

  # Return the terminated tree
  ...
}

## 8. Now create a recursive function for splitting branches in the tree
# This will take two arguments:
# itree - Which will be our tree
# target - As above
.split_tree <- function(itree, target) {
  ## 9. First we want to check if there is already a split in the tree
  # If there is then we want to split each branch of that split
  if (...) {
    ## 10. For each of the lt and gt branches we want to check if they have
    # terminated. If they haven't then we want to split them again.

    # i) Check if `lt` has terminated
    if (...) {
      # If it hasn't then split it
      itree$split$lt <-
    }
    # ii) Do the same for 'gt'
    ...
  ## 11. Now we look at the case if there isn't a further split, in which case
  # we want to split the current node into two branches if possible
  } else {
    ## 12. First let's get the data in the current node
    term <-
    ## 13. Now we check if our stopping rule has been reached. We only split
    # a node if there are more than two rows of data
    if (...) {
      ## Case 1: Split the node

      # i) Create a variable called y and assign it the value of the target
      # variable from `term`
      y <-
      # ii) Create a varaible called `x` and assign it the value of the
      # features from the data (all variables except target)
      x <-
      # ii) Create an empty list called `mse`, this will hold our candidates
      # for splitting.
      mse <-
      # iii) Now we want to do two loops. The first is going to be over all
      # columns in `x`
      for (column in ...) {
        # iv) Define a variable called `col` and set it as the value of column
        # `column` in `x`
        col <-
        # iv) Get potential places to cut `col` as all unique points in `col`
        # except the first and last (you'll need `sort`, `unique` and
        # subsetting)
        cuts <- ...
        cuts <- ...
        # v) Now loop over all potential cutpoints in the variable
        for (cut in ...) {
          # vi) Create two groups:
          # group_1 - All values less than or equal to `cut`
          # group_2 - All values greater than `cut`
          ...

          # vii) Create two prediction variables:
          # pred_1 - The mean of the target for group_1
          # pred_2 - The mean of the target for group_2
          ...

          # viii) Create a variable called `new_mse` as the sum of the mean
          #  squared error for each branch
          # The maths is:
          # mean((y_i - pred_1)^2) + mean((y_i - pred_1)^2)
          ,,,
          # ix) Name the MSE with the format: "_cut"
          names(new_mse) <- ...
          # x) Add the new MSE to the list under an element with the same
          # name as column `column`
          ...
        }
      }
      # xi) `unlist` the MSE and find the minimum
      which <- which.min(unlist(mse))
      # xii) Get the name of the variable and cut-point with the smallest MSE
      # I've done this for you but look-up 'regular expressions' to see how
      # this works
      var <- gsub("\\..*", "", names(which))
      where <- as.numeric(gsub(".*_", "", names(which)))

      # xiii) Create two variables:
      # lte - A logical vector corresponding to where our optimal variable is
      #  less than or equal to the optimal cut-point
      # gt - A logical vector corresponding to where our optimal variable is
      #  greater than the optimal cut-point
      ...

      # xiv) Add elements `var` and `where` to the tree with values `var` and
      #  `where`
      ...

      # xv) Add elements `split$lt` and `split$gt` to the tree where both are
      #  lists with elements:
      #   data - Data subsetted by lte/gt
      #   y - The mean of the target subsetted by lte/gt
      #   terminal - TRUE if there will be 2 or less rows in the resulting
      #     branch, otherwise FALSE
      ...
    ## Case 2: Don't split the node
    } else {
      ## Set the element 'terminal' of 'itree' to 'TRUE'
      ...
    }
  }

  ## Return 'itree'
  ...
}


#-----------------------------------------
# Stage 2 - Using the tree for predictions
#-----------------------------------------

## P1. Create a function called `.predict_obs` to make predictions for a
#  single observation, i.e.
#   one row of the new data. This should have two arguments:
#    x   - Which will be our observation
#   node - Which will be a node of our tree
# To make this function:
#  i) Create the function signature as usual (i.e. x <- function(y) {})
# ii) Create an if-else statement to test if the node of the tree is terminal.
# ii.a) If the node is terminal then return the prediction (`y`) from the node
# ii.b) If the node is not terminal then create another if-else statement
#  to test if the optimal variable from that node in the given data is less
#  than or equal to the optimal cutpoint from that node.
# ii.b.I) If it is then call `.predict_obs` on the `lt` split in the node
# ii.b.II) If it is not then call `.predict_obs` on the `gt` split in the node
...

## P2. Create a function called `.predict.tree` to make predictions for your
# new data with two arguments:
# tree - Which will be an object of class 'tree'
# new_data - Which will be a data.frame of new data
# In this function we just do one thing:
#  Use the function `apply` to call the function `.predict_obs` row-wise on
#  the new data, make sure to pass `tree` as an argument
...

#-----------------------------------------
# Stage 3 - Testing your tree
#-----------------------------------------

# Test your functions
# Split data into data for fitting our model
train <- mtcars[1:20, ]
# And data for testing our model
test <- mtcars[21:32, ]
# Fit the decision tree on training data
my_tree <- decision_tree(train, "mpg")
# Make predictions on new data
my_yhat <- predict(my_tree, test)
# Evaluate predictions
sqrt(mean((test$mpg - my_yhat)^2))

# Do the same with the tree from the {rpart} package
rpart_tree <- rpart::rpart(mpg ~ ., data = train)
rpart_yhat <- predict(rpart_tree, newdata = test)
sqrt(mean((test$mpg - rpart_yhat)^2))
