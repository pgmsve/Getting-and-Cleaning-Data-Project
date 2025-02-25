CodeBook.md

This is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data for the project came from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Data

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
 
The set of variables that were estimated from these signals are: 

  mean(): Mean value
  
  std(): Standard deviation
  
Description of abbreviations of measurements

leading t or f is based on time or frequency measurements.
Body = related to body movement.
Gravity = acceleration of gravity
Acc = accelerometer measurement
Gyro = gyroscopic measurements
Jerk = sudden movement acceleration
Mag = magnitude of movement
mean and std are calculated for each subject for each activity for each mean and std measurements.
    
The tidy data set a set of variables for each activity and each subject. 
10299 instances are split into 180 groups (30 subjects and 6 activities) and 66 mean and standard deviation features are averaged for each group. The resulting data table has 
180 rows and 69 columns - 33 Mean variables + 33 Standard deviation variables + 1 Subject( 1 of of the 30 test subjects) + 
ActivityName + ActivityNum . 
The tidy data set's first row is the header containing the names for each column.

Description of new names

'data.frame':	180 obs. of  68 variables:
$ subject                                      : int  1 2 3 4 5 6 7 8 9 10 ...
                                                        1..30
                                                        
$ label                                        : chr  "LAYING" "LAYING" "LAYING" "LAYING" ...
                                                       "WALKING"
                                                       "WALKING_UPSTAIRS"
                                                       "WALKING_DOWNSTAIRS"
                                                       "SITTING"
                                                       "STANDING"
                                                       "LAYING"
                                                       
 $ timeBodyAcceler_mean_X                   : num  0.222 0.281 0.276 0.264 0.278 ...
 
 $ timeBodyAcceler_mean_Y                   : num  -0.0405 -0.0182 -0.019 -0.015 -0.0183 ...

 $ timeBodyAcceler_mean_Z                   : num  -0.113 -0.107 -0.101 -0.111 -0.108 ...
 
 $ timeBodyAcceler_std_X                    : num  -0.928 -0.974 -0.983 -0.954 -0.966 ...

 $ timeBodyAcceler_std_Y                    : num  -0.837 -0.98 -0.962 -0.942 -0.969 ...

 $ timeBodyAcceler_std_Z                    : num  -0.826 -0.984 -0.964 -0.963 -0.969 ...
 
 $ timeGravityAcceler_mean_X                : num  -0.249 -0.51 -0.242 -0.421 -0.483 ...

 $ timeGravityAcceler_mean_Y                : num  0.706 0.753 0.837 0.915 0.955 ...
 
 $ timeGravityAcceler_mean_Z                : num  0.446 0.647 0.489 0.342 0.264 ...

 $ timeGravityAcceler_std_X                 : num  -0.897 -0.959 -0.983 -0.921 -0.946 ...

 $ timeGravityAcceler_std_Y                 : num  -0.908 -0.988 -0.981 -0.97 -0.986 ...

 $ timeGravityAcceler_std_Z                 : num  -0.852 -0.984 -0.965 -0.976 -0.977 ...

 $ timeBodyAccelerJerk_mean_X               : num  0.0811 0.0826 0.077 0.0934 0.0848 ...

 $ timeBodyAccelerJerk_mean_Y               : num  0.00384 0.01225 0.0138 0.00693 0.00747 ...

 $ timeBodyAccelerJerk_mean_Z               : num  0.01083 -0.0018 -0.00436 -0.00641 -0.00304 ...

 $ timeBodyAccelerJerk_std_X                : num  -0.958 -0.986 -0.981 -0.978 -0.983 ...

 $ timeBodyAccelerJerk_std_Y                : num  -0.924 -0.983 -0.969 -0.942 -0.965 ...

 $ timeBodyAccelerJerk_std_Z                : num  -0.955 -0.988 -0.982 -0.979 -0.985 ...

 $ timeBodyGyroscope_mean_X                 : num  -0.01655 -0.01848 -0.02082 -0.00923 -0.02189 ...

 $ timeBodyGyroscope_mean_Y                 : num  -0.0645 -0.1118 -0.0719 -0.093 -0.0799 ...

 $ timeBodyGyroscope_mean_Z                 : num  0.149 0.145 0.138 0.17 0.16 ...

 $ timeBodyGyroscope_std_X                  : num  -0.874 -0.988 -0.975 -0.973 -0.979 ...

 $ timeBodyGyroscope_std_Y                  : num  -0.951 -0.982 -0.977 -0.961 -0.977 ...

 $ timeBodyGyroscope_std_Z                  : num  -0.908 -0.96 -0.964 -0.962 -0.961 ...

 $ timeBodyGyroscopeJerk_mean_X             : num  -0.107 -0.102 -0.1 -0.105 -0.102 ...

 $ timeBodyGyroscopeJerk_mean_Y             : num  -0.0415 -0.0359 -0.039 -0.0381 -0.0404 ...
 
 $ timeBodyGyroscopeJerk_mean_Z             : num  -0.0741 -0.0702 -0.0687 -0.0712 -0.0708 ...

 $ timeBodyGyroscopeJerk_std_X              : num  -0.919 -0.993 -0.98 -0.975 -0.983 ...

 $ timeBodyGyroscopeJerk_std_Y              : num  -0.968 -0.99 -0.987 -0.987 -0.984 ...

 $ timeBodyGyroscopeJerk_std_Z              : num  -0.958 -0.988 -0.983 -0.984 -0.99 ...

 $ timeBodyAccelerMagnitude_mean_           : num  -0.842 -0.977 -0.973 -0.955 -0.967 ...
 
 $ timeBodyAccelerMagnitude_std_            : num  -0.795 -0.973 -0.964 -0.931 -0.959 ...

 $ timeGravityAccelerMagnitude_mean_        : num  -0.842 -0.977 -0.973 -0.955 -0.967 ...
 
 $ timeGravityAccelerMagnitude_std_         : num  -0.795 -0.973 -0.964 -0.931 -0.959 ...
 
 $ timeBodyAccelerJerkMagnitude_mean_       : num  -0.954 -0.988 -0.979 -0.97 -0.98 ...
 
 $ timeBodyAccelerJerkMagnitude_std_        : num  -0.928 -0.986 -0.976 -0.961 -0.977 ...
 
 $ timeBodyGyroscopeMagnitude_mean_         : num  -0.875 -0.95 -0.952 -0.93 -0.947 ...
 
 $ timeBodyGyroscopeMagnitude_std_          : num  -0.819 -0.961 -0.954 -0.947 -0.958 ...
 
 $ timeBodyGyroscopeJerkMagnitude_mean_     : num  -0.963 -0.992 -0.987 -0.985 -0.986 ...
 
 $ timeBodyGyroscopeJerkMagnitude_std_      : num  -0.936 -0.99 -0.983 -0.983 -0.984 ...
 
 $ frequencyBodyAcceler_mean_X              : num  -0.939 -0.977 -0.981 -0.959 -0.969 ...
 
 $ frequencyBodyAcceler_mean_Y              : num  -0.867 -0.98 -0.961 -0.939 -0.965 ...
 
 $ frequencyBodyAcceler_mean_Z              : num  -0.883 -0.984 -0.968 -0.968 -0.977 ...
 
 $ frequencyBodyAcceler_std_X               : num  -0.924 -0.973 -0.984 -0.952 -0.965 ...
 
 $ frequencyBodyAcceler_std_Y               : num  -0.834 -0.981 -0.964 -0.946 -0.973 ...
 
 $ frequencyBodyAcceler_std_Z               : num  -0.813 -0.985 -0.963 -0.962 -0.966 ...
 
 $ frequencyBodyAccelerJerk_mean_X          : num  -0.957 -0.986 -0.981 -0.979 -0.983 ...
 
 $ frequencyBodyAccelerJerk_mean_Y          : num  -0.922 -0.983 -0.969 -0.944 -0.965 ...
 
 $ frequencyBodyAccelerJerk_mean_Z          : num  -0.948 -0.986 -0.979 -0.975 -0.983 ...
 
 $ frequencyBodyAccelerJerk_std_X           : num  -0.964 -0.987 -0.983 -0.98 -0.986 ...
 
 $ frequencyBodyAccelerJerk_std_Y           : num  -0.932 -0.985 -0.971 -0.944 -0.966 ...
 
 $ frequencyBodyAccelerJerk_std_Z           : num  -0.961 -0.989 -0.984 -0.98 -0.986 ...
 
 $ frequencyBodyGyroscope_mean_X            : num  -0.85 -0.986 -0.97 -0.967 -0.976 ...
 
 $ frequencyBodyGyroscope_mean_Y            : num  -0.952 -0.983 -0.978 -0.972 -0.978 ...
 
 $ frequencyBodyGyroscope_mean_Z            : num  -0.909 -0.963 -0.962 -0.961 -0.963 ...
 
 $ frequencyBodyGyroscope_std_X             : num  -0.882 -0.989 -0.976 -0.975 -0.981 ...
 
 $ frequencyBodyGyroscope_std_Y             : num  -0.951 -0.982 -0.977 -0.956 -0.977 ...
 
 $ frequencyBodyGyroscope_std_Z             : num  -0.917 -0.963 -0.967 -0.966 -0.963 ...
 
 $ frequencyBodyAccelerMagnitude_mean_      : num  -0.862 -0.975 -0.966 -0.939 -0.962 ...
 
 $ frequencyBodyAccelerMagnitude_std_       : num  -0.798 -0.975 -0.968 -0.937 -0.963 ...
 
 $ frequencyBodyAccelerJerkMagnitude_mean_  : num  -0.933 -0.985 -0.976 -0.962 -0.977 ...
 
 $ frequencyBodyAccelerJerkMagnitude_std_   : num  -0.922 -0.985 -0.975 -0.958 -0.976 ...
 
 $ frequencyBodyGyroscopeMagnitude_mean_    : num  -0.862 -0.972 -0.965 -0.962 -0.968 ...
 
 $ frequencyBodyGyroscopeMagnitude_std_     : num  -0.824 -0.961 -0.955 -0.947 -0.959 ...
 
 $ frequencyBodyGyroscopeJerkMagnitude_mean_: num  -0.942 -0.99 -0.984 -0.984 -0.985 ...
 
 $ frequencyBodyGyroscopeJerkMagnitude_std_ : num  -0.933 -0.989 -0.983 -0.983 -0.983 ...

