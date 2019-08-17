==================================================================
Peer-graded Assignment: Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate ability to collect, 
work with, and clean a data set. The goal is to prepare tidy data 
that can be used for later analysis. 

Version 1.0
==================================================================
Dataset: Human Activity Recognition Using Smartphones Data Set [1]
==================================================================

'run_analysis.R' : R script that performs the following steps:
=============================================================
Step 1: Downloads and reads the data
        
        The data set is downloaded from the url and unzipped in 
        the working directory inside "UCI HAR Dataset" in order to 
        prepare it to work with.
        
        The data is then read into different dataframes as follows:
        
        features: Created from features.txt" with columns "num" and "feature"
                  List of all features
                  (561 observation of  2 variables)
        
        activity_labels: Created from "activity_labels.txt" with columns "labels" and "activity_name"
                         Links the class labels with their activity name
                         (6 observation of  2 variables)


        subject_train: Created from "subject_train.txt" with column "subject"
                       Each row identifies the subject who performed the activity for each window sample. Its range                        is from 1 to 30
                       (7352 observation of  1 variable)
                       
        X_train: Created from "X_train.txt" with column features$feature
                 Train set
                 (7352 observation of  561 variables)
                 
                 
        y_train: Created from "y_train.txt" with column "labels"
                 Trainning labels
                 (7352 observation of  1 variable)
        
        subject_test: Created from"subject_test.txt" with column "subject"
                      Each row identifies the subject who performed the activity for each window sample. Its range                        is from 1 to 30
                      (2947 observation of  1 variable)
                      
        X_test: Created from X_test.txt" with column features$feature
                Test set
                (2947 observation of  561 variables)
                
        y_test: Created from y_test.txt" with column "labels"
                Test labels
                (2947 observation of  1 variable)
                
Step 2: Merges the training and the test sets to create one data set.

        Subject is created by merging subject_train and subject_test row-wise.
        X is created by merging X_train and X_test row-wise.
        y is created by merging y_train and y_test row-wise.
        Finally, merged_data is created by merging Subject, X, y column-wise.

Step 3: Extracts only the measurements on the mean and standard deviation for each measurement.

        From the merged_data obtained from Step 1, for each measurement, only the measurements on the mean (mean)           and standard deviation (std) are extracted. Each measurement also has a "subject" and "labels" columns. The         new dataset is called as Tidy_data_1 with 10299 observations of 88 variables.
        
Step 4: Uses descriptive activity names to name the activities in the data set.
 
        Based on the "labels" column in Tidy_data_1, activity_name from activity_labels dataset is used.                    Each label below in Tidy_data_1 is replaced with its corresponding activity_name from activity_labels:
        
        labels activity_name
        1      WALKING
        2      WALKING_UPSTAIRS
        3      WALKING_DOWNSTAIRS
        4      SITTING
        5      STANDING
        6      LAYING
 
Step 5: Appropriately labels the data set with descriptive variable names.

        The dataset is labelled with more descriptive variable names as follows:
        
        All instances of column names starting with "t" is replaced with "time".
        All instances of column names containing "Acc" is replaced with "Accelerometer".
        All instances of column names containing "Gyro" is replaced with "Gyroscope".
        All instances of column names starting with "f" or containning "Freq" is replaced with "frequency".
        All instances of column names containing "Mag" is replaced with "Magnitude".
        All instances of column names containing "Bodybody" is replaced with "Body".
        The column "label" is renamed as "activity_name".
        
Step 6: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

        Finally, it exports the final tidy data set "Tidy_data_2" into a text file "TidyData.txt", 
        to be submitted as part of this course project. Tidy_data_2 has 180 observations and 88 variables.
        It is the aggregated data with the average of each variable for each activity and each subject.
        