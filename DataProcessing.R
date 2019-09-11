# Please look in the Python code for description of what I am doing
#Logic is same but the syntex is diffrent

#importing data
dataset = read.csv('D:/Nikhil_File/Machine Learning/Machine Learning A-Z Template Folder/Part 1 - Data Preprocessing/Data.csv')


#Taking care of missing data
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x,na.rm = TRUE)),
                     dataset$Age) 


dataset$Salary = ifelse(is.na(dataset$Salary),
                     ave(dataset$Salary, FUN = function(x) mean(x,na.rm = TRUE)),
                     dataset$Salary) 
# Unlike Python we don't have to reRun all the code to run our new Code 
#  But if Lost the data by rerunning the same code again again in that
# case you have to reRun the code from top to bottom then you will get 
# your desired answer


#Encoding Catagorcal Data
dataset$Country= factor(dataset$Country,
                        levels = c('France','Spain','Germany'),
                        labels = c(1,2,3))

dataset$Purchased =factor(dataset$Purchased,
                          levels = c('No','Yes'),
                          labels=c(0,1))  #if you don't give vector 'c' it will through random error


#Spliting the data into the Traning set and Test set

#Its the very Important part of Machine Learning 

#Now we have to install packages write the code run it and then comment it because we need to install
#onec

#install.packages("caTools")
#now that we installed it we need to activate the library for that there are 2 ways to do that 
#1st - click on the box of caTools from the System Library 
#2nd - write the following code to execute once 
library(caTools)

set.seed(123)#works similarly as random_state=0 argument of python train_test_split
#press f1 to see description of split
split = sample.split(dataset$Purchased,SplitRatio = 0.8)#In pyton we give testRatio here we give Training Ratio 'TRUE' for training and 'FALSE' for test
training_set=subset(dataset,split==TRUE)
test_set =subset(dataset,split==FALSE)

#Feature Scaling

# We will get Error in this line of code because the column in which we are appllying scalling 
#is the column which we did factor in Encoding Catagorical Section so previously it was on 
# String format we converted it into int that's why it gives this error
#Error in colMeans(x, na.rm = TRUE) : 'x' must be numeric

# training_set =scale(training_set)
# test_set =scale(test_set)

#for the time being we will use column 2,3

training_set[,2:3]=scale(training_set[,2:3])
test_set[,2:3]=scale(test_set[,2:3])