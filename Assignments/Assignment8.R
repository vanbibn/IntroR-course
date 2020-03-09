# Step 1 =====================================================================
## Import data-set into R ----

# I expeimented with several different methods
Assignment8 <- read.table("Data/Assignment8_dataset.txt", header = TRUE, sep = ",")
Assignment8a <- read.table("./Data/Assignment8_dataset.txt", header = TRUE, sep = ",")
Assignment8c <- read.table(file.choose(), header = TRUE, sep = ",")

# # couldn't get the download directly from R to work
# fileurl <- url("https://usflearn.instructure.com/courses/1379740/files/90299738")
# download.file(fileurl, destfile = "./Data/Assingment8url.txt", method = "libcurl")
# close(fileurl)

library(plyr)
library(tidyverse)
library(data.table)

StudentAverage = ddply(Assignment8,"Sex",transform,Grade.Average=mean(Grade))

# Tried the same thing with the Tidyverse dplyr package
StudentAvg <- Assignment8 %>%
    group_by(Sex) %>%
    mutate(avgGrade = mean(Grade)) %>%
    arrange(Sex)

## Write the result into an output file
# Creates an output folder if it does not already exist then saves the data
if (!file.exists("Output")) {
    dir.create("Output")
}
write.table(StudentAverage, file = "./Output/Student_avgGrade_bySex.txt")
write.csv(StudentAverage, file = "./Output/Student_avgGrade_bySex.csv")


sex = Assignment8$Sex
mean(sex)  # doesn't work because sex is not numnerical variable

table(sex)
table(sex,Assignment8$Age)

# Step 2 ======================================================================
## Convert the dataset to a dataframe for names containing the letter "i".
## Then create a new data set with those names.
## Write those names to a file separated by comma’s (CSV)

i_students <- subset(Assignment8, grepl("i", Assignment8$Name, ignore.case=T))

write.csv(i_students, file = "./Output/iStudents")

i_stu <- Assignment8 %>%
    filter(grepl("i", Name, ignore.case = T))


# Step 3 =====================================================================
## Write out to csv file

write.csv(i_stu, file = "./Output/iStu")
