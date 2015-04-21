# CodeBook for "Getting and Cleaning Data" Course Project Coursera 2015

## Url of the original project wich explain the context:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Original data source for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## original data archive explains the dataexperiment in the README.txt 

## List of steps in the script ./run_analysis.R to produce result in file : tidy_projectfiles-UCI_HAR_Dataset.txt
1. load traning dataset  : data/UCI HAR Dataset/train/X_train.txt inside r_train (7352 rows)
1. load test dataset : data/UCI HAR DatasetDataset/test/X_test.txt inside r_test (2947 rows)
1. load the fields name from : data/UCI HAR Dataset/features.txt
1. add column names to the 2 data frames from the data/UCI HAR Dataset/features.txt
1. add the subject column to the train dataset (r_train)
1. add the subject column to the test dataset (r_test)
1. read the activity labels data from /UCI HAR Dataset/activity_labels.txt
1. add the activity column to the train dataset
1. add the activity column to the test dataset
1. rbind or append to the training dataset the test dataset to create data_full dataset
1. filter column names containing mean() or std() and keep only those with activity and subject
1. create data_filtered by taking only the columns filter from previous step (activity,subject and 66 other fields that have mean() or st() in their names)
1. create the tidy_data from the previous data_filtered with the average of each variable for each activity and each subject by using aggregate
1. fix the first column name back to activity
1. fix the second column name back to subject
1. write the tidy_data to file tidy_projectfiles-UCI_HAR_Dataset.txtw with write.table and option row.names = FALSE


##List of Fields in tidy dataset 
1. "activity"	Factor w/ 6 levels1. "WALKING","WALKING_UPSTAIRS",...
1. "subject" Factor w/ 30 levels "1","3","5","6",..: 1 1 1 1 1 1 2 2 2 2 ...
1. "tBodyAcc-mean()-X"
1. "tBodyAcc-mean()-Y"
1. "tBodyAcc-mean()-Z"
1. "tBodyAcc-std()-X"
1. "tBodyAcc-std()-Y"
1. "tBodyAcc-std()-Z"
1. "tGravityAcc-mean()-X"
1. "tGravityAcc-mean()-Y"
1. "tGravityAcc-mean()-Z"
1. "tGravityAcc-std()-X"
1. "tGravityAcc-std()-Y"
1. "tGravityAcc-std()-Z"
1. "tBodyAccJerk-mean()-X"
1. "tBodyAccJerk-mean()-Y"
1. "tBodyAccJerk-mean()-Z"
1. "tBodyAccJerk-std()-X"
1. "tBodyAccJerk-std()-Y"
1. "tBodyAccJerk-std()-Z"
1. "tBodyGyro-mean()-X"
1. "tBodyGyro-mean()-Y"
1. "tBodyGyro-mean()-Z"
1. "tBodyGyro-std()-X"
1. "tBodyGyro-std()-Y"
1. "tBodyGyro-std()-Z"
1. "tBodyGyroJerk-mean()-X"
1. "tBodyGyroJerk-mean()-Y"
1. "tBodyGyroJerk-mean()-Z"
1. "tBodyGyroJerk-std()-X"
1. "tBodyGyroJerk-std()-Y"
1. "tBodyGyroJerk-std()-Z"
1. "tBodyAccMag-mean()"
1. "tBodyAccMag-std()"
1. "tGravityAccMag-mean()"
1. "tGravityAccMag-std()"
1. "tBodyAccJerkMag-mean()"
1. "tBodyAccJerkMag-std()"
1. "tBodyGyroMag-mean()"
1. "tBodyGyroMag-std()"
1. "tBodyGyroJerkMag-mean()"
1. "tBodyGyroJerkMag-std()"
1. "fBodyAcc-mean()-X"
1. "fBodyAcc-mean()-Y"
1. "fBodyAcc-mean()-Z"
1. "fBodyAcc-std()-X"
1. "fBodyAcc-std()-Y"
1. "fBodyAcc-std()-Z"
1. "fBodyAccJerk-mean()-X"
1. "fBodyAccJerk-mean()-Y"
1. "fBodyAccJerk-mean()-Z"
1. "fBodyAccJerk-std()-X"
1. "fBodyAccJerk-std()-Y"
1. "fBodyAccJerk-std()-Z"
1. "fBodyGyro-mean()-X"
1. "fBodyGyro-mean()-Y"
1. "fBodyGyro-mean()-Z"
1. "fBodyGyro-std()-X"
1. "fBodyGyro-std()-Y"
1. "fBodyGyro-std()-Z"
1. "fBodyAccMag-mean()"
1. "fBodyAccMag-std()"
1. "fBodyBodyAccJerkMag-mean()"
1. "fBodyBodyAccJerkMag-std()"
1. "fBodyBodyGyroMag-mean()"
1. "fBodyBodyGyroMag-std()"
1. "fBodyBodyGyroJerkMag-mean()"
1. "fBodyBodyGyroJerkMag-std()"
