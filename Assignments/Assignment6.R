# Part 1 ======================================================================
# Consider A=matrix(c(2,0,1,3), ncol=2) and B=matrix(c(5,2,4,-1), ncol=2).
#   a) Find A + B
#   b) Find A - B

A <- matrix(c(2,0,1,3), ncol = 2)
B <- matrix(c(5,2,4,-1), ncol = 2)

A
B

a <- A+B
a

b <- A-B
b

# Part 2 ======================================================================
# Using the diag() function to build a matrix of size 4 with the following 
#    values in the diagonal 4,1,2,3.

diag(c(4,1,2,3), nrow = 4)

# Part 3 ======================================================================
# 3. Generate the following matrix: (Hint: You can use `diag()` to build it.)

## [,1] [,2] [,3] [,4] [,5]
## [1,] 3 1 1 1 1
## [2,] 2 3 0 0 0
## [3,] 2 0 3 0 0
## [4,] 2 0 0 3 0
## [5,] 2 0 0 0 3

m <- matrix(0,4,4)
m

m <- rbind(rep(1,4), m)
m <- cbind(rep(2,5), m)
diag(m) <- 3
m
