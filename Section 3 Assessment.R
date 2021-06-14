# install packages
library(dslabs)
# call dataset
data(heights)
# report 3 significant digits for all answers
options(digits = 3)
# explore the dataset
str(heights)
head(heights)
# Determine the average height in this dataset 
# and save it as an object called avg_height.
# please note that we used the function mean to calculate the average
avg_height<-mean(heights$height)
avg_height
# so the average heightis 68.3
# now let us define an index object called ind which subsets the detaset 
# only to include individuals who are above average height
ind<-heights$height>avg_height
heights$height[ind]
# .....Question 1 .........
# determine how many are above the average height
sum(ind)
# 532 are above average height
# .....Question 2 .........
# determine how many are above average height and are female
# define an object tall as those who are above average height
tall<-heights$height>avg_height
# define an object Female as those who are Female
Female<-heights$sex=="Female"
# create a combined object for those above average height and are Female
tall_Female<-tall & Female
# determine how many are are above average height and are female
sum(tall_Female)
# 31 are above average height and are female
# alternatively you can use the function nrow 
# if you have the dataframe filtered out
# to determine the number of rows/elements in the new object
tall_Female_df<-filter(heights,height>mean(height) & sex=="Female")
view(tall_Female_df)
nrow(tall_Female_df)
# we confirmed that 31 are above average height and are female
# .....Question 3 .........
#What proportion of individuals in the dataset are female?
Female_df<-filter(heights,sex=="Female")
nrow(Female_df)/nrow(heights)
# the proportion of those are female is 0.227 
# .....Question 4 .........
# .....Question 4a .........
#Determine the minimum height in the heights dataset.
min_height<-min(heights$height)
min_height
# the minimum height is 50
# .....Question 4b .........
# Use the match() function to determine the index of the first 
# individual with the minimum height.
match(min_height , heights$height)
?match
# the index of the first individual with the minimum height is 1032
# alternatively we can use
which.min(heights$height)
# we confirmed that the index of the first individual with the minimum height is 1032
ind <- match(min_height , heights$height)
ind
# .....Question 4c .........
#Subset the sex column of the dataset by the index in 4b to determine the individual's sex.
heights$sex[ind]
# sex of the the first individual with the minimum height is Male
# Alternatively we can use a function within a function to do this
heights$sex[which.min(heights$height)]

# .....Question 5 .........
# .....Question 5a .........
# Determine the maximum height.
max(heights$height)
# The maximum height is 82.7
# .....Question 5b .........
#Write code to create a vector x that includes the 
# integers between the minimum and maximum heights (as numbers).

x<-50:82
x
# To determine how many elements x has use the function length
length(x)
# .....Question 5c .........
#How many of the integers in x are NOT heights in the dataset?
# Use the sum() and %in% functions in addition to the ! operator.
# create an index object Not_in_height to subsets height 
# excluding values between 50 & 82
x%in% heights$height
not_in_height_ob<-!x%in% heights$height
# now subset x by the new index which is not_in_height
x[not_in_height_ob]
# we can use the function sum to determine the number of elements 
# in x which is subseted by the index not_in_height
sum(not_in_height_ob)
# 3 integers in x are NOT heights in the dataset

# .....Question 6 .........
# .....Question 6a .........

#What is the height in centimeters of the 18th individual (index 18)?
# we first need to call the library dplyr if it is already installed 
library(dplyr)
view(heights2)
heights2<-mutate(heights,ht_cm=2.54*height)
# you can view the new/updated heights2 dataset by using the function view
View(heights2)
# let us subset this datset by the 18th element
heights2$ht_cm[18]
# The height in centimeters of the 18th individual (index 18)is 163

# .....Question 6b .........

# What is the mean height in centimeters?
mean(heights2$ht_cm)
# The mean height in centimeters is 174
# .....Question 7a .........
#How many females are in the heights2 dataset?

Female2_df<-filter(heights2, heights$sex=="Female")
nrow(Female2_df)
# 238 females are in the heights2 dataset

# .....Question 7b .........

#What is the mean height of the females in centimeters?
mean(Female2_df$ht_cm)
# mean height of the females in centimeters is 165

# .....Question 8 .........

#The olive dataset in dslabs contains composition in percentage of eight
#fatty acids found in the lipid fraction of 572 Italian olive oils:

#Plot the percent palmitic acid versus palmitoleic acid in a scatterplot.
#What relationship do you see?

library(dslabs)
data(olive)
str(olive)
head(olive)
# it is a good idea to pull out the columns a objects before ploting
palmitic<-olive$palmitic
palmitoleic<-olive$palmitoleic
# If you want to get a quick summary of the objects 
# use the function summary
summary(palmitic)
summary(palmitoleic)
# Plot the percent palmitic acid versus palmitoleic acid in a scatterplot. 
plot(palmitic,palmitoleic)

# There is a positive linear relationship between 
# palmitic and palmitoleic.

# # .....Question 9 .........
# Create a histogram of the percentage of 
# eicosenoic acid in olive.
# First create an object eicosenoic from eicosenoic coloumn  
# of the olive dataset
eicosenoic<-olive$eicosenoic 
hist(eicosenoic)
# The most common value of eicosenoic acid is below 0.05%.
# we can get a quick summary of of the object using the function summary
summary(olive$eicosenoic)

# .....Question 10 .........

#Make a boxplot of palmitic acid percentage in olive 
# with separate distributions for each region.

# First let us create a boxplot of palmitic acid 
# percentage in olive for all regions combined
boxplot(olive$palmitic)
# Then let us see the difference when create a boxplot of palmitic acid 
# with separate distributions for each region.
boxplot(olive$palmitic~olive$region)
# Which region has the highest median palmitic acid percentage?
#Southern Italy
# Which region has the most variable palmitic acid percentage?
#Southern Italy

