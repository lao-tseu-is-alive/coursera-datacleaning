# coursera-datacleaning
## this is part of my work for "Getting and Cleaning Data" Course Project Coursera 2015
This file [README.md] explains how to use the script run_analysis.R.  
The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. 

## INSTRUCTIONS : *short version in 3 steps for Linux users* 
1. Clone this repository on your computer under your favorite command line shell with:<br>
   **git clone https://github.com/lao-tseu-is-alive/coursera-datacleaning.git**
2. Go inside the directory project:<br>
   **cd coursera-datacleaning**
3. Run the main script written in R:<br>
   **./run_analysis.R** 
maybe you will need to type  **Rscript ./run_analysis.R** depends if your OS support shebang and if the x(eXcution) flag is present on this file (a simple chmod a+x ./run_analysis.R can help)
this file create the tidy_projectfiles-UCI_HAR_Dataset.txt ready to be uploaded to coursera

## INSTRUCTIONS : *long version* 
### REQUIREMENTS
This script can run "as is" with a recent GNU/Linux distribution where a recent version of R and wget are installed.

It was tested and runs succesfully on GNU/Linux : Ubuntu 14.04.2 LTS Trusty
with R version 3.2.0 (2015-04-16) Platform: x86_64-pc-linux-gnu (64-bit)

It should work with minor adjustments on other platforms like (Windows or Mac).
basically you need at least 

1. a recent version of R for your platform, you can find install instructions at : http://cran.r-project.org/

2. you will also need the wget package for the automatic download of the data. With ubuntu or debian variant of linux you can install it with this command line :
**sudo apt-get install wget***
on other platforms you can check on the main website of the project : https://www.gnu.org/software/wget/
for windows users ther is a port available here : http://gnuwin32.sourceforge.net/packages/wget.htm
but i don't know if it will work with r on windows 
3. On MS Windows some changes may be needed to the path variables because Windows use a backslash as directory separator and nix OS uses a simple slash, feel free to edit the variables ending with "*_filename" on lines 33-40 if you want to test on windows.

### CONTEXT
The goal of this project is to prepare tidy data that can be used for later analysis. 
Graded will be done by peers on a series of yes/no questions related to the project. 
This project contains : 
1. a tidy data set as described below, 
2. a Github repository with the script performing the analysis [run_analysis.R] and all files except original data, 3. a code book that describes the variables, the data, and any transformations or work performed to clean up the data called CodeBook.md. 
   
### SUBJECT
One of the most exciting areas in all of data science right now is wearable computing
see for example this article : 
http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/ 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced 
algorithms to attract new users. 
The data linked to from the course website represent data collected from 
the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Original data source for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
there is no need to download this file because when you run the script [run_analysis.R] 
it will download it for you and uncompress the zip file in the current directory under 
a folder named : data

### Steps 

1. Patform check to see if user is running Linux,Windows or Mac warning message if the two later platform are used
	<br>*example of message: *This is  Gnu/Linux Os it should work like a charm. be sure wget is installed
1.  Check to see if archive is already in current directory,if it is no need to download it
	<br>*example of message: *I found the archive of data here : /home/laotseu/tmp/coursera-datacleaningprojectfiles-UCI_HAR_Dataset.zip
1. Check if the archive was already extracted, if not, just do it
	<br>*example of message: *I found one ot the dataset here : /home/laotseu/tmp/coursera-datacleaningdata/UCI HAR Dataset/train/X_train.txt
	<br>+ I think the archive was already extracted ...
	<br> + so I decide to pass the extract the archive again ...
1. load traning dataset from : data/UCI HAR Dataset/train/X_train.txt inside r_train
1. load test dataset from : data/UCI HAR Dataset/train/X_train.txt inside r_test
1. load the fields name from : data/UCI HAR Dataset/features.txt
1. add the fields (column) names to the 2 data frames (r_train and r_test)
1. add the subject column to the train dataset (r_train)
1. add the subject column to the test dataset (r_test)
1. read the activity labels from data data/UCI HAR Dataset/activity_labels.txt
1. add the activity column to the train dataset
1. add the activity column to the test dataset
1. use rbind to append the test dataset to the training dataset, store it in data_full 
1. search the column names containing mean()
1. search the column names containing std()
1. merge them to get the column filter adding columns 1,2 for  activity and subject
1. create data_filtered by taking only the columns filter above (activity,subject and 66 other fields that have mean() or st() in their names)
1. create the tidy dataset from the previous data_filterd (without the 2 first factors columns) with the average of each variable for each activity and each subject by using aggregate
1. fix the first column name back to activity
1. fix the second column name back to subject
1. write the final result tidy_data to a file on disk : tidy_projectfiles-UCI_HAR_Dataset.txt ready to be uploaded to coursera
