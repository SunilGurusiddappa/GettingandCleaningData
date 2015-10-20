Getting and Cleaning Data - Course Project

This repository hosts the R code and documentation files for the Data Science's track course "Getting and Cleaning data", available in coursera.

The dataset being used is: Human Activity Recognition Using Smartphones Files

CodeBook.md describes the variables, the data, and any transformations or work that was performed to clean up the data.

The process steps are

1. install "dpllyr" package if it is not present
2. Load "dpllyr" package if it is not loaded
3. Read the training files and create the data set
4. Read x_train.txt into xtrain in a table format
5. Read y_train.txt into ytrain in a table format
6. Read features.txt into feature in a table format
7. Select feature column of the feature table
8. assign column names to the training data set
9. Add the ytrain column to the Xtrain data set
10.assign column name to the y_train column
11.Read subject_train.txt into sub in a table format
12.assign column name to the subject column
13.Add the subjecg column to the yXtrain data set
14.Read the test files and create the data set
15.Read x_test.txt into xtest in a table format
16.Read y_test.txt into ytest in a table format
17.assign column names to the test data set
18.assign column name to the y_train column
19.Merges the training and the test sets to create one data set.
20.Extracts only the measurements on the mean and standard deviation for each measurement. 
21.Uses descriptive activity names to name the activities in the data set
22.Create a tidy data set 
23.Write the data set in the table format to the text file

run_analysis.R contains all the code to perform the analyses described in the 5 steps. They can be launched in RStudio by just importing the file.

The output of the 5th step is called aggdata.txt, and uploaded in the course project's form.