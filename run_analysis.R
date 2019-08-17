## Getting and Cleaning Data Course Project

# Downloading the data

file_name <- "getdata_projectfiles_UCI HAR Dataset.zip"
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Download the data files
if(!file.exists(file_name)) {
  download.file(fileUrl, file_name, method = "curl")
}

# Unzip the data files
if (!file.exists("UCI HAR Dataset")) { 
  unzip(file_name) 
}

# Read the data

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("num","feature"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("labels", "activity_name"))

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "labels")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "labels")

## Step 1: Merge the training and the test sets to create one data set.

Subject <- rbind(subject_train, subject_test)
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)

merged_data <- cbind(Subject, X, y)

## Step 2: Extract only the measurements on the mean and standard deviation for each measurement. 
install.packages("dplyr")
library(dplyr)

Tidy_data_1 <- merged_data %>% select(subject, labels, contains("mean"), contains("std"))

## Step 3: Uses descriptive activity names to name the activities in the data set
Tidy_data_1$labels <- activity_labels[Tidy_data_1$labels, 2]

## Step 4: Appropriately label the data set with descriptive variable names
# Labelling columns with more descriptive names

names(Tidy_data_1) <- gsub("^t","time",names(Tidy_data_1))
names(Tidy_data_1) <- gsub("Acc","Accelerometer",names(Tidy_data_1))
names(Tidy_data_1) <- gsub("Gyro","Gyroscope",names(Tidy_data_1))
names(Tidy_data_1) <- gsub("^f","Frequency",names(Tidy_data_1))
names(Tidy_data_1) <- gsub("Freq","Frequency",names(Tidy_data_1))
names(Tidy_data_1) <- gsub("Mag","Magnitude",names(Tidy_data_1))
names(Tidy_data_1) <- gsub("BodyBody","Body",names(Tidy_data_1))
names(Tidy_data_1)[2] <- "activity_name"

## Step 5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

Tidy_data_2 <- Tidy_data_1 %>% group_by(subject, activity_name) %>% summarise_all(funs(mean))

## Export the second, independent tidy data set for submission
write.table(Tidy_data_2, "TidyData.txt", row.name = F)
