# First, I practiced with the example given in the handout ... ################
# to make sure I was getting the same answeres
z <- matrix(c(1,3,-1,-2,1,2,0,5,3), ncol = 3)
z
det(z) #21
t(z)
solve(z)

# Begin working on assignment #################################################

A <- matrix(1:100, nrow = 10)
B <- matrix(1:1000, nrow = 10)

solve(A)  
# Error in solve.default(A) : 
# Lapack routine dgesv: system is exactly singular: U[6,6] = 0

det(A) # Det of A = 0 (A is singular); therefore the inverse of A cannot be found.


## B is not a square matrix so the det and inverse cannot be found.
det(B)
# Error in determinant.matrix(x, logarithm = TRUE, ...) : 
# 'x' must be a square matrix

solve(B)
# Error in solve.default(B) : 'a' (10 x 100) must be square


# Tried finding a matrix that works... #######################################
Bb <- matrix(2:10001, nrow = 100)
det(Bb) # 0 still

## this one works! though it doesn't really mean anything. ===================
aa <- matrix(rnorm(100,50,10), nrow = 10)
det(aa)
solve(aa)


