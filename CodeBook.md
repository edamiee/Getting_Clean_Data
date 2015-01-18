---
title: "CodeBook"
author: "Damien Edwards"
date: "January 18, 2015"
output: html_document
---
##Source Data
The original data was downloaded

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Original Data Definitions are located:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The R script ( run_analysis.R) is used to clean up the original data set:

Merges the training and test data sets from the downloaded data to create one tidy data set.
The first intermediate Merge_1 data frame contains the merge train/train_x.txt and test/test_x.tst data.The second intermediate Merge_2 data frame contains train/train_y.txt and test/test_y.tst The third intermediate Merge_3 data frame contains train/subject_train.txt with test/subject_test.txt 

The features.txt data will have only the measurements on the mean and standard deviation for each measurement.

Will read theactivity_labels.txt and applies descriptive activity names to name the activities in the data set:

walking

walkingupstairs

walkingdownstairs

sitting

standing

laying

The data set also creates descriptive names for all feature names. Names are converted to lower case, remove underscores and ‘()’.

The data from the features data frame is merged and contains activity labels and subject IDs. The result of this data is written to the file clean_data.txt

The data contains the subject ID, column activity names , and the measurements. The names of the attributes are similar to the following:

tbodyacc-mean-x 

tbodyacc-mean-y 

tbodyacc-mean-z 

tbodyacc-std-x 

tbodyacc-std-y 

tbodyacc-std-z 

tgravityacc-mean-x 

tgravityacc-mean-y

The data from Merge_4 itermediate data frame is used to create an independent tidy data set with the average of each measurement for each activity and each subject. The resulting file name is tidy_data.txt The file contains subject ID, activity names, and the average of each attribute. 




