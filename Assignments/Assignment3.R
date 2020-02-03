# Fictional poll results for the 2016 election
Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Berine")
ABC_poll <- c(4, 62, 51, 21, 2, 14, 15)
CBS_poll <- c(12, 75, 43, 19, 1, 21, 19) 

# combine vectors into a data frame
poll_results <- data.frame(ABC_poll,CBS_poll, row.names = Name)

# calculate the average poll result for each candidate
poll_Cand_avg <- rowMeans(poll_results)
poll_Cand_avg

# two ways to calculate the mean poll result between all candidates
mean(poll_Cand_avg)
mean(as.matrix(poll_results))


