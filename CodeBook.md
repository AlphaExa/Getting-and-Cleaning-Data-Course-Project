# Code Book for Coursera: Getting and Cleaning Data - Course Project
This code book contains the necessary information for the dataset `tidy_data.txt`, with the following sections: *Data*, *Transformations*, *Variables*.

## Data
The `tidy_data.txt` is a space-separated data set with a text file format. It has 181 rows and 68 columns. The first row of the data contains the names of the variables, while the following rows contain the values of the variables.

The data was originally obtained from UCI HAR Dataset.  
Link:
> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

Citation:
> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Transformations
Upon the request of the course project, the original data source had undergone data cleaning and transformation using R, which includes:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The detailed procedures and codes for the transformations can be found in `run_analysis.R` in the repository.

## Variables
There are 68 variables for 180 observations in the data set, which include 2 identifier variables and 66 averaged values of the mean and standard deviation for each feature. The descriptions of the variables are mostly derived from the original data source.

### Identifier
Subject
* Integer data. The identifier code for each subject, ranging from 1 - 30.
 
Activity
* Factor with 6 levels. The identifier code for the activities performed by the subject while wearing a smartphone (Samsung Galaxy S II) on the waist.
* Levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
 
### Averaged Mean and Standard Deviation for Each Feature
In the original data source, the subjects had performed the same activity for multiple times with respective mean and standard deviation of each feature. In this data set, however, the multiple means and standard deviations of each feature are averaged for each subject and activity. 

All features are normalized and bounded within \[-1, 1\], stored as numeric value. Prior to normalization, the units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2), while the gyroscope units are rad/seg.

The features come from the accelerometer and gyroscope 3-axial raw signals (`-X, -Y, -Z` are used to denote the 3-axial signals in the X, Y, and Z directions). These time domain signals (prefix `Time-` to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
  
* Relevant variables: (18 variables)
  + Time-BodyAccelerometer-mean-X, Y, Z
  + Time-BodyAccelerometer-standardDeviation-X, Y, Z
  + Time-GravityAccelerometer-mean-X, Y, Z
  + Time-GravityAccelerometer-standardDeviation-X, Y, Z
  + Time-BodyGyroscope-mean-X, Y, Z
  + Time-BodyGyroscope-standardDeviation-X, Y, Z
  
  
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm.

* Relevant variables: (22 variables)
  + Time-BodyAccelerometerJerk-mean-X, Y, Z
  + Time-BodyAccelerometerJerk-standardDeviation-X, Y, Z
  + Time-BodyGyroscopeJerk-mean-X, Y, Z
  + Time-BodyGyroscopeJerk-standardDeviation-X, Y, Z
  + Time-BodyAccelerometerMagnitude-mean
  + Time-BodyAccelerometerMagnitude-standardDeviation
  + Time-GravityAccelerometerMagnitude-mean
  + Time-GravityAccelerometerMagnitude-standardDeviation
  + Time-BodyAccelerometerJerkMagnitude-mean
  + Time-BodyAccelerometerJerkMagnitude-standardDeviation
  + Time-BodyGyroscopeMagnitude-mean
  + Time-BodyGyroscopeMagnitude-standardDeviation
  + Time-BodyGyroscopeJerkMagnitude-mean
  + Time-BodyGyroscopeJerkMagnitude-standardDeviation
 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals (Note the prefix `Frequency-` to indicate frequency domain signals). 

* Relevant variables: (26 variables)  
  + Frequency-BodyAccelerometer-mean-X, Y, Z
  + Frequency-BodyAccelerometer-standardDeviation-X, Y, Z
  + Frequency-BodyAccelerometerJerk-mean-X, Y, Z
  + Frequency-BodyAccelerometerJerk-standardDeviation-X, Y, Z
  + Frequency-BodyGyroscope-mean-X, Y, Z
  + Frequency-BodyGyroscope-standardDeviation-X, Y, Z
  + Frequency-BodyAccelerometerMagnitude-mean
  + Frequency-BodyAccelerometerMagnitude-standardDeviation
  + Frequency-BodyAccelerometerJerkMagnitude-mean
  + Frequency-BodyAccelerometerJerkMagnitude-standardDeviation
  + Frequency-BodyGyroscopeMagnitude-mean
  + Frequency-BodyGyroscopeMagnitude-standardDeviation
  + Frequency-BodyGyroscopeJerkMagnitude-mean
  + Frequency-BodyGyroscopeJerkMagnitude-standardDeviation
