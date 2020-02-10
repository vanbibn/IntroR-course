# ASSIGNMENT 4 ###############################################################

# Your first assignment: 
#   1. Create a side-by-side boxplot (boxplot(x, ...)) and 
#   2. and histogram ((hist(x, ...)). 
#   3. Discuss the outcome of your results regarding patients BPs & MD’s Ratings.
# Post your result in your blog and code on GitHub. 

## First I imported the data as a .csv file ===================================
library(tidyverse)

df <- read_csv("Data/Assignment4_data.csv") %>% 
  mutate(
    first = as.factor(first),
    second = as.factor(second),
    finaldecision = as.factor(finaldecision)
  ) %>% 
  print()

# created a new data frame to mutate variables
df2 <- df %>% 
  mutate(
    first = recode(first,
         "bad" = 1,
         "good" = 0),
    second = recode(second,
          "low" = 0,
          "high" = 1),
    finaldecision = recode(finaldecision,
      "low" = 0,
      "high" = 1)
  )

## Plots ======================================================================
plot(df2)

boxplot(df2)

hist(df$Freq)
boxplot(df$Freq)

hist(df$bloodp)
boxplot(df$bloodp)

hist(df2$first)

df2 %>% 
  select(first, second, finaldecision) %>% 
  boxplot()

# good first rating had slightly lower frequency
df %>% 
  select(Freq, first) %>% 
  boxplot(
    Freq ~ first,
    data = . 
  )

# df2 %>% 
#   select(Freq, bloodp) %>% 
#   plot()

# those with good first rating had higher blood pressure
df %>% 
  select(first, bloodp) %>% 
  plot()

# Patients with low second assesment had much narrower (ie. normal) range of BP
df %>% 
  select(second, bloodp) %>% 
  plot()

# Patients with the need of immediate care had higher BP
df %>% 
  select(finaldecision, bloodp) %>% 
  plot()

