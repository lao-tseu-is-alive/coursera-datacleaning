# coursera-datacleaning
## this is part of my work for "Getting and Cleaning Data" Course Project Coursera 2015
This file [README.md] explains how to use the script run_analysis.R.  
The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. 

## INSTRUCTIONS : *short version* 
clone this repository on your computer under your favorite command line shell with:

**git clone https://github.com/lao-tseu-is-alive/coursera-datacleaning.git**

go inside the directory project

**cd coursera-datacleaning**

run the main script written in R 

**./run_analysis.R**

## INSTRUCTIONS : *long version* 
## REQUIREMENTS
This script can run "as is" with a recent GNU/Linux distribution and a recent version of R and wget
it was tested and runs succesfully on GNU/Linux : Ubuntu 14.04.2 LTS Trusty
with R version 3.2.0 (2015-04-16) Platform: x86_64-pc-linux-gnu (64-bit)
it should work with minor adjustments on other platforms like (Windows or Mac)
basically you need at least a recent version of R for your platform
you can find install instructions at : http://cran.r-project.org/
you will also need the wget package for the automatic download of the data
with ubuntu or debian variant of linux you can install it with this command line 
**sudo apt-get install wget***
on other platforms you can check on the main website of the project : https://www.gnu.org/software/wget/
for windows users ther is a port available here : http://gnuwin32.sourceforge.net/packages/wget.htm
but i  don't know if it will work with r 
### CONTEXT
The goal of this project is to prepare tidy data that can be used for later analysis. 
Graded will be done by peers on a series of yes/no questions related to the project. 
This project contains : 
1. a tidy data set as described below, 
2. a Github repository with the script performing the analysis [run_analysis.R] and all files except original data, 3. a code book that describes the variables, the data, and any transformations 
   or work performed to clean up the data called CodeBook.md. 
   
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
