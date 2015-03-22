# GettingCleaningDataCourseProject

##Code Book

###Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
###Data description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###The attached run_analysis.R script performs the following data conversions:

* Merges the training and test sets to create one data set, namely X_train.txt with X_test.txt, subject_train.txt with subject_test.txt, y_train.txt with y_test.txt (files are located in corresponding training and test folders)

* Extracts only the measurements on the mean and standard deviation for each measurement from features.txt

* Assingnes descriptive activity names(with removed underscores and in lower case) from activity_labels.txt to name the activities in the data set.

* Appropriately labels the data set with descriptive variable names(underscores and brackets are removed). At this step data frames containing features, activity labels and subject IDs are finally merged.

* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. The result is saved in work directory with a name second_tidy_data_set.txt, the first column contains subject IDs, the second column contains activity names followed by the averages for each attribute.
