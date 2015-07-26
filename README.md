# Getting-and-Cleaning-Data-Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project.

Required to submit: 
1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis,
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
Also should be included a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data for the project came from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Files in this repo
  README.md      -- Project description
  CodeBook.md    -- codebook describing variables, the data and transformations
  run_analysis.R -- R script to transform raw data set in a tidy one

You should create one R script called run_analysis.R that does the following:

  Merges the training and the test sets to create one data set.
  Extracts only the measurements on the mean and standard deviation for each measurement.
  Uses descriptive activity names to name the activities in the data set
  Appropriately labels the data set with descriptive activity names.
  Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

How tidy data set was created:

  create repository on Github https://github.com/pgmsve/Getting-and-Cleaning-Data-Project.git
  clone this repository: get clone https://github.com/pgmsve/Getting-and-Cleaning-Data-Project.git
  download compressed raw data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  unzip raw data and copy the directory UCI HAR Dataset to the cloned repository root directory
  open R console and set the working directory to the repository root (use setwd())
  install and load requared packages
  git add . add all new files to a local repository
  git commit -m "message" where message is a usefule decription of what was done
  git push  to update Github with changed files
  
  
1. Merges the training and the test sets to create one data set

# read training set of data
train_labels   <- read.table("UCI HAR Dataset/train/y_train.txt", col.names="label")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names="subject")
train_data     <- read.table("UCI HAR Dataset/train/X_train.txt")

# read test set of data
test_labels   <- read.table("UCI HAR Dataset/test/y_test.txt", col.names="label")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names="subject")
test_data     <- read.table("UCI HAR Dataset/test/X_test.txt")

# put it together in the format of: subjects, labels, everything else
sensor_data <- rbind(cbind(test_subjects, test_labels, test_data),
                     cbind(train_subjects, train_labels, train_data))

2. Extracts only the measurements on the mean and standard deviation for each measurement

# read the features
features <- read.table("UCI HAR Dataset/features.txt", strip.white=TRUE, stringsAsFactors=FALSE)

# extract only the measurements on the mean and standard deviation for each measurement
features_mean_std <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]

# select only the means and standard deviations from data
# increment by 2 because data has subjects and labels in the beginning
sensor_data_mean_std <- sensor_data[, c(1, 2, features_mean_std$V1+2)]

3. Uses descriptive activity names to name the activities in the data set

# read the labels (activities)
labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)

# replace labels in data with label names
sensor_data_mean_std$label <- labels[sensor_data_mean_std$label, 2]

4. Appropriately labels the data set with descriptive variable names

  leading t or f is based on time or frequency measurements.
  Body = related to body movement.
  Gravity = acceleration of gravity
  Acc = accelerometer measurement
  Gyro = gyroscopic measurements
  Jerk = sudden movement acceleration
  Mag = magnitude of movement
  mean and std are calculated for each subject for each activity for each mean and std measurements. 
  
# make a list of the current column names and feature names
good.colnames <- c("subject", "label", features_mean_std$V2)

# tidy that list by removing every non-alphabetic character
good.colnames <- gsub("[^[:alpha:]]", "", good.colnames)
good.colnames <- gsub("std()", "_std_", good.colnames)
good.colnames <- gsub("mean()", "_mean_", good.colnames)
good.colnames <- gsub("^t", "time", good.colnames)
good.colnames <- gsub("^f", "frequency", good.colnames)
good.colnames <- gsub("Acc", "Acceler", good.colnames)
good.colnames <- gsub("Gyro", "Gyroscope", good.colnames)
good.colnames <- gsub("Mag", "Magnitude", good.colnames)
good.colnames <- gsub("BodyBody", "Body", good.colnames)

# use the list as column names for data
colnames(sensor_data_mean_std) <- good.colnames

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

# find the mean for each combination of subject and label
aggr_data <- aggregate(sensor_data_mean_std[, 3:ncol(sensor_data_mean_std)],
                       by=list(subject = sensor_data_mean_std$subject, 
                               label = sensor_data_mean_std$label),
                       mean)

# write the data for course upload
write.table(format(aggr_data, scientific=T), "tidydataset.txt", row.names=FALSE, col.names=FALSE, quote=2)

The tidy data set a set of variables for each activity and each subject. 
10299 instances are split into 180 groups (30 subjects and 6 activities) and 66 mean and standard deviation features are averaged for each group. The resulting data table has 
180 rows and 69 columns - 33 Mean variables + 33 Standard deviation variables + 1 Subject( 1 of of the 30 test subjects) + 
ActivityName + ActivityNum . 
The tidy data set's first row is the header containing the names for each column.
 
  
  



