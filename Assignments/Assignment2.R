#Define the variable we wish to calculate the mean of
assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)

#Define the function myMean
myMean <- function(assignment) { return(sum(assignment)/length(assignment)) }

#call myMean on our variable
myMean(assignment2)

#compare to built-in mean function
mean(assignment2)