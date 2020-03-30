

install.packages("funModeling")
library(funModeling)

tukey_multiple <- function(x) {
    outliers <- array(TRUE,dim=dim(x))
    for (j in 1:ncol(x)) {
        outliers[,j] <- outliers[,j] && tukey_outlier(x[,j])
    }
    
    outlier.vec <- vector(length=nrow(x))
    for (i in 1:nrow(x)) {
        outlier.vec[i] <- all(outliers[i,])
    } 
    
    return(outlier.vec) 
}

tukey_multiple(matrix(1:10, nrow = 2, byrow = T))


# line 9 - need a comma after "i" in `outlier.vec[i]` --> `outlier.vec[i,]`

# Reformatted with correct indentation to see it more clearly, apparently I 
# unknownly fixed the error
# Return needs to be on last line by itself?

# tukey.outlier() function does not exist
# I found a tukey_outlier() function in the funModeling package.
