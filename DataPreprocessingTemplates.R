#Data Preprocessing Temlates

#importing data
dataset = read.csv('D:/Nikhil_File/Machine Learning/Machine Learning A-Z Template Folder/Part 1 - Data Preprocessing/Data.csv')

#Spliting the data into the Traning set and Test set
#install.packages("caTools")
library(caTools)

set.seed(123)
split = sample.split(dataset$Purchased,SplitRatio = 0.8)
training_set=subset(dataset,split==TRUE)
test_set =subset(dataset,split==FALSE)

#Feature Scaling
training_set[,2:3]=scale(training_set[,2:3])
test_set[,2:3]=scale(test_set[,2:3])