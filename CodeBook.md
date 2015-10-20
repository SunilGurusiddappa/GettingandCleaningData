Introduction

The script run_analysis.R performs the 5 steps described in the course project's definition.

    First, all the similar data are merged using the rbind and cbind R function. By similar, we address those files having the same number of columns and referring to the same entities.
    Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.
    As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
    On the whole dataset, those columns with vague column names are corrected.
    Finally, we generate a new dataset with all the average measures for each subject and activity type 
    The output file is called aggdata.txt, and uploaded to this repository.

Variables

    x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
    x_data, y_data and subject_data merge the previous datasets to further analysis.
    features contains the correct names for the x_data dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data.
    A similar approach is taken with activity names through the activities variable.
    Finally aggdata is created following 5 steps in the run_analysis.R

DATA Dictionary

subject			 Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
Activity      		 Lists the the activity name performed by subjects
HumanActivity		 Shows information about the variables used on the features
Statistics		 Shows is it a mean or standard deviation
Average			 Average of each variable for each activity and each subject 	 




