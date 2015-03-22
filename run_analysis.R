# GettingCleaningDataCourseProject

# 1. Merges the training and the test sets to create one data set.

temp1 <- read.table("UCI HAR Dataset/train/X_train.txt")
temp2 <- read.table("UCI HAR Dataset/test/X_test.txt")
X <- rbind(temp1, temp2)

temp1 <- read.table("UCI HAR Dataset/train/subject_train.txt")
temp2 <- read.table("UCI HAR Dataset/test/subject_test.txt")
Subj <- rbind(temp1, temp2)

temp1 <- read.table("UCI HAR Dataset/train/y_train.txt")
temp2 <- read.table("UCI HAR Dataset/test/y_test.txt")
Y <- rbind(temp1, temp2)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("UCI HAR Dataset/features.txt")
good_featur_ind <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, good_featur_ind]
names(X) <- features[good_featur_ind, 2]
names(X) <- gsub("\\(|\\)", "", names(X))

# 3. Uses descriptive activity names to name the activities in the data set.

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

# 4. Appropriately labels the data set with descriptive variable names.

names(Subj) <- "subject"
tidy_data <- cbind(Subj, Y, X)

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

uniqueSubj = unique(Subj)[,1]
qtySubj = length(unique(Subj)[,1])
qtyActiv = length(activities[,1])
qtyCols = dim(tidy_data)[2]
tidy2_data = tidy_data[1:(qtySubj*qtyActiv), ]

curRow = 1
for (i in 1:qtySubj) {
    for (j in 1:qtyActiv) {
        tidy2_data[curRow , 1] = uniqueSubj[i]
        tidy2_data[curRow , 2] = activities[j, 2]
        temp <- tidy_data[tidy_data$subject==i & tidy_data$activity==activities[j, 2], ]
        tidy2_data [curRow , 3:qtyCols] <- colMeans(temp[, 3:qtyCols])
        curRow = curRow +1
    }
}
write.table(tidy2_data, "second_tidy_data_set.txt", row.name=FALSE)
