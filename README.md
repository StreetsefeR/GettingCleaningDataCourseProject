# GettingCleaningDataCourseProject

##Course project (peer assignment)

###Following repository contains files related to course project of Getting and Cleaning Data, namely:

* CodeBook.md (describes data)

* run_analysis.R (R processing code of raw data)

###To reproduce follow next steps(it is provided for work directory, so be sure to change it before starting due to preferences):

* Unzip the source(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) file into your work directory

* Copy script run_analysis.R to your work directory

* Open R and run command: source("run_analysis.R")

* The resulting second_tidy_data_set.txt file will be created in your work directory, to load it to R use command: data <- read.table("second_tidy_data_set.txt")
