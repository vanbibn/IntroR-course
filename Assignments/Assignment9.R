# Nathan W. Van Bibber
# 3/21/2020
# Assignment 9 

# https://vincentarelbundock.github.io/Rdatasets/csv/boot/melanoma.csv
# documentation: 
#     https://vincentarelbundock.github.io/Rdatasets/doc/boot/melanoma.html

# load packages
library(lattice)
library(tidyverse)

# read the data
melanoma <- read_csv("Data/melanoma.csv")
melanoma

# check if there are any missing values
anyNA(melanoma)

# turn status, sex, and ulcer into factor variables
melanoma2 <- melanoma %>% 
    mutate(status = factor(status), sex = factor(sex), ulcer = factor(ulcer), time_years = time/365)
melanoma2

# make some plots with the base plotting system
boxplot(time ~ ulcer, melanoma2,
        xlab = "Ulcer" ,
        ylab = "Survival time (days)",
        main  ="Patient survival time by tumor ulceration",
        col = "red")
legend("topright", legend = c("0 = absent", "1 = present"))

boxplot(time ~ sex, melanoma2,
        xlab = "Sex" ,
        ylab = "Survival time (days)",
        main  ="Patient survival time by sex",
        col = "skyblue")
legend("topright", legend = c("0 = female", "1 = male"))


# make some plots with the lattice package
xyplot(thickness ~ age, melanoma2,
       main = "Tumor thickness by age",
       xlab = "Patient Age (years)",
       ylab = "Tumor thickness (mm)")

histogram(~ time_years, data = melanoma2, 
          main = "Distribution of Survival Time",
          xlab = "Survival Time (years)",
          ylab = "Frequency")


# make some plots with ggplot2 package
qplot(age, thickness, data = melanoma2, color = sex) +
    geom_smooth(method = "lm") +
    labs(title = "Tumor thickness by age") +
    labs(x = "Patient Age (years)", y = "Tumor Thickness (mm)")

