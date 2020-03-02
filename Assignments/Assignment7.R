# Part 1 ######################################################################
## Step 1: download any type of data ==========================================
# the data I will be using 
sleep  # data frame
lynx   # time series

## Step 2: determine if generic function can be assigned to your data set ===== 
#         If not, why? 

data("sleep")
data("lynx")

head(sleep)
head(lynx)

plot(sleep)
plot(lynx)

## Step 3: explore if S3 and S4 can be assigned to your data set. =============

library(pryr)

otype(sleep)   # S3
otype(lynx)    # S3
 
class(sleep)
class(lynx)

typeof(sleep)
typeof(lynx)


# Part 2 ######################################################################
## Create examples of S3  =====================================================

myS3_1 <- list(animal = "cat", color = "black", lives = 9, lucky = TRUE)
myS3_2 <- data.frame(animal = "dog", color = "golden", lives = 1, lucky = TRUE)

otype(myS3_1) 
otype(myS3_2)   
isS4(myS3_1)
isS4(myS3_2)


## Create examples of S4 ======================================================

setClass("Animal", representation(
    species = "character", 
    color = "character", 
    lives = "numeric", 
    lucky = "logical"
))

catS4 <- new("Animal",
             species = "cat", 
             color = "black", 
             lives = 9, 
             lucky = TRUE
)

dogS4 <- new("Animal",
             species = "dog", 
             color = "golden", 
             lives = 1, 
             lucky = TRUE
)

otype(catS4)
otype(dogS4)
