## Create one R script called run_analysis.R that does the following. 

## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set.
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## step 1   
## Merges the training and the test sets to create one data set

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

## step 2 
## Extracts only the measurements on the mean and standard deviation for each measurement

# read the features
features <- read.table("UCI HAR Dataset/features.txt", strip.white=TRUE, stringsAsFactors=FALSE)

# extract only the measurements on the mean and standard deviation for each measurement
features_mean_std <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]

# select only the means and standard deviations from data
# increment by 2 because data has subjects and labels in the beginning
sensor_data_mean_std <- sensor_data[, c(1, 2, features_mean_std$V1+2)]

## step 3 
## Uses descriptive activity names to name the activities in the data set

# read the labels (activities)
labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)

# replace labels in data with label names
sensor_data_mean_std$label <- labels[sensor_data_mean_std$label, 2]
 
## step 4 
## Appropriately labels the data set with descriptive variable names

# first make a list of the current column names and feature names
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

# then use the list as column names for data
colnames(sensor_data_mean_std) <- good.colnames

## step 5 
## Creates a second, independent tidy data set with the average of each variable for each activity and each subject

# find the mean for each combination of subject and label
aggr_data <- aggregate(sensor_data_mean_std[, 3:ncol(sensor_data_mean_std)],
                       by=list(subject = sensor_data_mean_std$subject, 
                               label = sensor_data_mean_std$label),
                       mean)

## step 
# write the data for course upload
write.table(format(aggr_data, scientific=T), "tidydataset.txt", row.names=FALSE, col.names=FALSE, quote=2)

