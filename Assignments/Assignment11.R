tukey_multiple <- function(x) {
    outliers <- array(TRUE,dim=dim(x))
    for (j in 1:ncol(x)) {
        outliers[,j] <- outliers[,j] && tukey.outlier(x[,j])
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
# unknownly fixed the 