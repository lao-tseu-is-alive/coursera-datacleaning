#!/usr/bin/Rscript
# Coursera Getting and Cleaning Data Course Project
# github_url : https://github.com/lao-tseu-is-alive/coursera-datacleaning
# script_name : run_analysis.R
# requirements : this code is supposed to be run on a Linux Platform with recent R installed
#                it did run succesfully on GNU/Linux : Ubuntu 14.04.2 LTS Trusty
#                 with R version 3.2.0 (2015-04-16) Platform: x86_64-pc-linux-gnu (64-bit)
# context : 
#     One of the most exciting areas in all of data science right now is wearable computing .
#     Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms
#     to attract new users. The data linked to from the course website represent data collected 
#     from the accelerometers from the Samsung Galaxy S smartphone. 
#     A full description is available at the site where the data was obtained: 
#     http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# what this script does :
#     0. Download the data for the project from : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#     1. Merges the training and the test sets to create one data set.
#     2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#     3. Uses descriptive activity names to name the activities in the data set
#     4. Appropriately labels the data set with descriptive variable names. 
#     5. From the data set in step 4, creates a second, independent tidy data set 
#        with the average of each variable for each activity and each subject.

# constant for this project that may be changed/adapted to your needs
data_filename <- "projectfiles-UCI_HAR_Dataset.zip"    # local filename
data_dir <- "data"      # local directory where the archive will be extracted
tidy_data_filename <-"tidy_projectfiles-UCI_HAR_Dataset.txt"

# the next variables are essentially path to various part of dataset
# you should normaly not change those
#dataset source url given for this project 
data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
training_set_filename <- paste(data_dir,"/UCI HAR Dataset/train/X_train.txt",sep = "")
test_set_filename <- paste(data_dir,"/UCI HAR Dataset/test/X_test.txt",sep = "")
features_filename <- paste(data_dir,"/UCI HAR Dataset/features.txt",sep = "")
train_subject_filename <- paste(data_dir,"/UCI HAR Dataset/train/subject_train.txt",sep = "")
test_subject_filename  <- paste(data_dir,"/UCI HAR Dataset/test/subject_test.txt",sep = "")
activity_labels_filename <- paste(data_dir,"/UCI HAR Dataset/activity_labels.txt",sep = "")
activity_train_filename <- paste(data_dir,"/UCI HAR Dataset/train/y_train.txt",sep = "")
activity_test_filename <- paste(data_dir,"/UCI HAR Dataset/test/y_test.txt",sep = "")
library(data.table)
#verify some basic requirements like platform is correct
switch(Sys.info()[['sysname']],
       Windows= {print("This a Windows PC. This script was not written for it ! \n It may not work correctly  ")},
       Linux  = {print("This is  Gnu/Linux Os it should work like a charm. be sure wget is installed")},
       Darwin = {print("Welcome to you Happy Mac user. This script was written under Linux but maybe it works with  a Mac")})

#     0. Download the data for the project
#load archive if it's not already there
if (!file.exists(data_filename)){ 
      print(paste(" I will try to download data archive file from : ", data_url))
      op_result <- download.file(data_url, destfile = data_filename, method = "wget")
      if (op_result != 0) {
            print(paste("### ERROR downloading with wget the data archive file from : ", data_url))
            print("### may be you should check if wget is installed and if you have access to internet" )
            stop(paste("### ERROR status CODE was : ",op_result))            
      }
} else {
      print(paste(" I found the archive of data here : ", getwd(), data_filename, sep = ""))
}
# test if archive already extracted by testing directory and presence of one of dataset
if (!file.exists(data_dir) && (!file.exists(training_set_filename))){
      unzip(data_filename,exdir = data_dir)
} else {
      print(paste("+ I found one ot the dataset here : ", getwd(), training_set_filename, sep = ""))
      print(paste("+ I think the archive was already extracted ..."))
      print(paste("+ so I decide to pass the extract the archive again ..."))
}
#now will read the datasets
print(paste("+ I will load traning dataset  :", training_set_filename, "inside r_train"))
r_train=read.fwf(training_set_filename, widths = rep(c(16),561) )

print(paste("+ I will load test dataset :", training_set_filename, "inside r_test"))
r_test=read.fwf(test_set_filename, widths = rep(c(16),561))


print(paste("loading fields name from :",features_filename))
cols_temp=read.csv(features_filename, sep = " ", header = FALSE)
column_names<-unlist(cols_temp[2])
print("+ I will add column names to the 2 data frames")
colnames(r_train)<-column_names
colnames(r_test)<-column_names

print("+ I will add the subject column to the train dataset")
r_subject_train<-read.csv(train_subject_filename, sep = " ", header = FALSE)
subject <-factor(unlist(r_subject_train))
r_train<-cbind(subject,r_train)

print("+ I will add the subject column to the test dataset")
r_subject_test<-read.csv(test_subject_filename, sep = " ", header = FALSE)
subject <-factor(unlist(r_subject_test))
r_test<-cbind(subject,r_test)

print("+ I will read the activity labels data")
activity_labels<-read.csv(activity_labels_filename, sep = " ", header = FALSE)
activity_labels<-unlist(activity_labels[2])

print("+ I will add the activity column to the train dataset")
r_activity_train<-read.csv(activity_train_filename, sep = " ", header = FALSE)
activity <-factor(unlist(r_activity_train), labels = activity_labels)
r_train<-cbind(activity,r_train)
print("+ I will add the activity column to the test dataset")
r_activity_test<-read.csv(activity_test_filename, sep = " ", header = FALSE)
activity <-factor(unlist(r_activity_test), labels = activity_labels)
r_test<-cbind(activity,r_test)

print("+ I will rbind append to the training dataset the test dataset to create data_full dataset")
data_full<-rbind(r_train,r_test)

print("+ I will retrieve the column names containing mean()")
column_names <-colnames(data_full)
c_mean<-grep("mean()",column_names,fixed = TRUE)
print("+ I will retrieve the column names containing std()")
c_std<-grep("std()",column_names,fixed = TRUE)
print("+ I will merge them to get the column filter adding columns 1 ,2 for  activity and subject")
c_result<-c(1,2,c_mean,c_std)

print("+ I create data_filtered by taking only the columns filter activity,subject and 66 other fields that have mean() or st() in their names")
data_filtered <- data_full[,sort(c_result)]

print("+ I create the tidy dataset from the previous data_filterd (without the 2 first factors columns) with the average of each variable for each activity and each subject by using aggregate")
tidy_data<-aggregate(data_filtered[,3:68],by = list(data_filtered$activity,data_filtered$subject),mean)

print("+ I fix the first column name back to activity")
colnames(tidy_data)[1]<-"activity"
print("+ I fix the second column name back to subject")
colnames(tidy_data)[2]<-"subject"

print(paste("+ I write the final tidy_data to a file on disk :", tidy_data_filename))
write.table(tidy_data,file = tidy_data_filename,row.names = FALSE )
