---
title: "Getting and Cleaning Data : Final Assignment"
output: README.md
---

## Abstract

The purpose of this project is to load, combine, clean and summarize some variables into a new file. The data to be processed were obtained from a Human Activity Recognition Experiment from this url: 
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

And the dataset is available at this url:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>


## Data Set Information 

This database were built from the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone (Samsung Galaxy S II) with embedded inertial sensors fixed on the waist.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities : 
+ WALKING  
+ WALKING_UPSTAIRS  
+ WALKING_DOWNSTAIRS  
+ SITTING  
+ STANDING  
+ LAYING  

Using this embedded accelerometer and gyroscope, were captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been partitioned into two datasets: 70% of the data were generated from the training data and 30% from the test data.  

## Attribute Information

For each record in the dataset it is provided:
+ Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration  
+ Triaxial Angular velocity from the gyroscope  
+ A 561-feature vector with time and frequency domain variables  
+ Its activity label  
+ An identifier of the subject who carried out the experiment  

## Steps Executed

1 - Merges the training and the test sets to create one data set.
2 - Extracts only the measurements on the mean and standard deviation for each measurement.
3 - Uses descriptive activity names to name the activities in the data set
4 - Appropriately labels the data set with descriptive variable names.
5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## R File

"run_analysis.R"

## Variables Used

myDataSetFeatures   : loaded file "UCI HAR Dataset/features.txt"
myDataSetActivities : loaded file "UCI HAR Dataset/activity_labels.txt"
myDataSet           : combined files :  "UCI HAR Dataset/train/subject_train.txt"
                                        "UCI HAR Dataset/test/subject_test.txt"
                                        "UCI HAR Dataset/train/y_train.txt"
                                        "UCI HAR Dataset/test/y_test.txt"
                                        "UCI HAR Dataset/train/X_train.txt"
                                        "UCI HAR Dataset/test/X_test.txt"
myDataSetExtracted  : reduced "myDataSet"
myDataSetFinal      : final results
output              : FinalResult.txt

