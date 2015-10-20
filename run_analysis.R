#install "dpllyr" package
#install.packages("dplyr")
#Load "dpllyr" package
library(dplyr)

###########  Read the training files and create the data set

#Read x_train.txt into xtrain in a table format
xtrain<-read.table('./train/x_train.txt',header=FALSE)
#If you need to see the result un comment adn view the result
#View(xtrain)
#Read y_train.txt into ytrain in a table format
ytrain<-read.table('./train/y_train.txt',header=FALSE)
#If you need to see the result un comment adn view the result
#View(ytrain)
#Read features.txt into feature in a table format
features<-read.table('./features.txt',header=FALSE)
#If you need to see the result un comment adn view the result
#View(features)
#Select feature column of the feature table
f<-features[,2]
#If you need to see the result un comment adn view the result
#View(f)
#assign column names to the training data set
xctrain<-xtrain
colnames(xctrain)<-f
#If you need to see the result un comment adn view the result
#View(xctrain)
# Add the ytrain column to the Xtrain data set
yxtrain<-cbind(ytrain,xctrain)
#If you need to see the result un comment adn view the result
#View(yxtrain)
#assign column name to the y_train column
colnames(yxtrain)[1]<-"Activity"
#If you need to see the result un comment adn view the result
#View(yxtrain)
#Read subject_train.txt into sub in a table format
sub<-read.table('./train/subject_train.txt',header=FALSE)
#assign column name to the subject column
colnames(sub)<-"subject"
# Add the subjecg column to the yXtrain data set
syxtrain<-cbind(sub,yxtrain)
#If you need to see the result un comment adn view the result
#View(syxtrain)

###########  Read the test files and create the data set


#Read x_test.txt into xtest in a table format
xtest<-read.table('./test/X_test.txt',header=FALSE)
#If you need to see the result un comment adn view the result
#View(xtest)
#Read y_test.txt into ytest in a table format
ytest<-read.table('./test/y_test.txt',header=FALSE)
#If you need to see the result un comment adn view the result
#View(ytest)
#assign column names to the test data set
xctest<-xtest
colnames(xctest)<-f
#If you need to see the result un comment adn view the result
#View(xctest)
#assign column name to the y_train column
colnames(ytest)<-"Activity"
# Add the ytest column to the Xtrain data set
yxtest<-cbind(ytest,xctest)
#If you need to see the result un comment adn view the result
#View(yxtest)
#Read subject_test.txt into sub in a table format
subt<-read.table('./test/subject_test.txt',header=FALSE)
#assign column name to the subject column
colnames(subt)<-"subject"
# Add the subjecg column to the yXtest data set
syxtest<-cbind(subt,yxtest)
#If you need to see the result un comment adn view the result
#View(syxtest)


########Merges the training and the test sets to create one data set.
############ Combine Training and Test data set
train_test<-rbind(syxtrain,syxtest)
#If you need to see the result un comment adn view the result
#View(train_test)



######Extracts only the measurements on the mean and standard deviation for each measurement. 

## insall "gdata" to use matchcols function
#install.packages("gdata")
## load "gdata" to use matchcols function
library("gdata")
## Get the "mean" matching columns
train_test_mean_col<-matchcols(train_test, with=c("mean()"))
## Get the "std" matching columns
train_test_std_col<-matchcols(train_test, with=c("std()"))
## Combine the"mean" and  "std" matching columns
train_test_mean_std_col<-c("subject", "Activity",train_test_mean_col,train_test_std_col)
#If you need to see the result un comment adn view the result
#View(train_test_mean_std_col)

## Extracts only the measurements on the mean and standard deviation for each measurement. 

train_test_mean_std<-subset(train_test,select=train_test_mean_std_col)

#If you need to see the result un comment adn view the result
#View(train_test_mean_std)


#######Uses descriptive activity names to name the activities in the data set
train_test_mean_std$Activity[train_test_mean_std$Activity==1]<-"WALKING"
train_test_mean_std$Activity[train_test_mean_std$Activity==2]<-"WALKING_UPSTAIRS"
train_test_mean_std$Activity[train_test_mean_std$Activity==3]<-"WALKING_DOWNSTAIRS"
train_test_mean_std$Activity[train_test_mean_std$Activity==4]<-"SITTING"
train_test_mean_std$Activity[train_test_mean_std$Activity==5]<-"STANDING"
train_test_mean_std$Activity[train_test_mean_std$Activity==6]<-"LAYING"
#If you need to see the result un comment adn view the result
#View(train_test_mean_std)

###############Create a tidy data set 
#install.packages("tidyr")
library(tidyr)

ha<-gather(train_test_mean_std,HumanActivity_Statistics_Axis,acceleration,-subject,-Activity )

#View(ha)

has<-separate(ha,HumanActivity_Statistics_Axis, c("HumanActivity","Statistics","Axis"))
#View(has)
#columns <-names(has)[-6]
#aggdata<-aggregate(has$acceleration, 
#                   by=list(subject=has$subject,Activity=has$Activity,HumanActivity=has$HumanActivity,Statistics=has$Statistics,Axis=has$Axis),
#                   FUN=mean)

aggdata<-aggregate(has$acceleration, 
                   by=list(subject=has$subject,
                           Activity=has$Activity,
                           HumanActivity=has$HumanActivity,
                           Statistics=has$Statistics
                           ),
                   FUN=mean)

#View(aggdata)
colnames(aggdata)[5]<-"Average"
View(aggdata)
############ Write the data set in the table format to the text file
write.table(aggdata,"aggdata.txt",sep = ",",row.names=FALSE)
