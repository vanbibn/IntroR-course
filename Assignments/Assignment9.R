# Nathan W. Van Bibber
# 3/21/2020
# Assignment 9 

# the data can be downloaded from here:
# https://vincentarelbundock.github.io/Rdatasets/csv/boot/melanoma.csv

# documentation: 
# https://vincentarelbundock.github.io/Rdatasets/doc/boot/melanoma.html

# load packages
library(lattice)
library(tidyverse)

# read the data
melanoma <- read_csv("Data/melanoma.csv")
melanoma

# check if there are any missing values
anyNA(melanoma)

# turn status, sex, and ulcer into factor variables; crate var for time in years
melanoma2 <- melanoma %>% 
    mutate(status = factor(status), sex = factor(sex), ulcer = factor(ulcer), time_years = time/365)
melanoma2

# make some plots with the base plotting system
boxplot(time_years ~ ulcer, melanoma2,
        xlab = "Ulcer" ,
        ylab = "Survival time (years)",
        main  ="Patient survival time by tumor ulceration",
        col = "red")
legend("topright", legend = c("0 = absent", "1 = present"))

boxplot(time_years ~ sex, melanoma2,
        xlab = "Sex" ,
        ylab = "Survival time (years)",
        main  ="Patient survival time by sex",
        col = "skyblue")
legend("topright", legend = c("0 = female", "1 = male"))

hist(melanoma2$time_years, col = 'green', breaks = 10,
     main = "Distribution of Survival Time - Base",
     xlab = "Survival Time (years)",
     ylab = "Frequency")
rug(melanoma2$time_years)
abline(v = median(melanoma2$time_years), lwd = 4)

# make some plots with the lattice package
xyplot(thickness ~ age, melanoma2,
       main = "Tumor thickness by age",
       xlab = "Patient Age (years)",
       ylab = "Tumor thickness (mm)")

# note the ~ at the beginning of the function
histogram(~ time_years, data = melanoma2, nint = 10,
          main = "Distribution of Survival Time - Lattice",
          xlab = "Survival Time (years)",
          ylab = "Frequency")


# make some plots with ggplot2 package
qplot(age, thickness, data = melanoma2, color = sex) +
    geom_smooth(method = "lm") +
    labs(title = "Tumor thickness by age") +
    labs(x = "Patient Age (years)", y = "Tumor Thickness (mm)")

# qplot(time_years, data = melanoma2, binwidth = 2) +
#     labs(title = "Distribution of Survival Time - qplot") +
#     labs(x = "Survival Time (years)", y = "Frequency")


ggplot(melanoma2, aes(time_years)) +
    geom_histogram(binwidth = 2.2) +
    labs(title = "Distribution of Survival Time - ggplot") +
    labs(x = "Survival Time (years)", y = "Frequency")
