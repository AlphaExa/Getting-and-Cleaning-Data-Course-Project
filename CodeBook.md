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

The detailed procedures and codes for the transformations can be found in `run_analysis.R` in the resipotary.

## Variables
There are 68 variables for 180 observations in the data set, which include 2 identifier variables and 66 averaged values of the mean and standard deviation for each feature. The descriptions of the variables are mostly derived from the original data source.

### Identifier
`Subject`
* Type: Interger
* Description: The identifier code for each subject, ranging from 1 - 30.
 
 `Activity`
 * Type: Factor with 6 levels
 * Description: The identifier code for the activities performed by the subject while wearing a smartphone (Samsung Galaxy S II) on the waist..
 * Labels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
 
 ### Averaged Mean and Standard Deviation for Each Feature
In the original data source, the subjects had performed the same activity for multiple times with respective mean and standard deviation of each feature. In this data set, however, the multiple means and standard deviations of each feature are averaged for each subject and activity. 

All features are normalized and bounded within \[-1, 1\]. 

The features come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals (prefix `Time-` to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
  
* Relevant variables: (variables)
  + Time-BodyAccelerometer-mean-X, Y, Z
  + Time-BodyAccelerometer-standardDeviation-X, Y, Z
  + Time-GravityAccelerometer-mean-X, Y, Z
  + Time-GravityAccelerometer-standardDeviation-X, Y, Z
  + Time-BodyGyroscope-mean-X, Y, Z
  + Time-BodyGyroscope-standardDeviation-X, Y, Z
  
  
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

* Relevant variables: (variables)
  + Time-BodyAccelerometerJerk-mean-X, Y, Z
  + Time-BodyAccelerometerJerk-standardDeviation-X, Y, Z
  + Time-BodyGyroscopeJerk-mean-X, Y, Z
  + Time-BodyGyroscopeJerk-standardDeviation-X, Y, Z
 
                                        
             
      
                   
              
[33] "Time-BodyAccelerometerMagnitude-mean"                       "Time-BodyAccelerometerMagnitude-standardDeviation"         
[35] "Time-GravityAccelerometerMagnitude-mean"                    "Time-GravityAccelerometerMagnitude-standardDeviation"      
[37] "Time-BodyAccelerometerJerkMagnitude-mean"                   "Time-BodyAccelerometerJerkMagnitude-standardDeviation"     
[39] "Time-BodyGyroscopeMagnitude-mean"                           "Time-BodyGyroscopeMagnitude-standardDeviation"             
[41] "Time-BodyGyroscopeJerkMagnitude-mean"                       "Time-BodyGyroscopeJerkMagnitude-standardDeviation"         
[43] "Frequency-BodyAccelerometer-mean-X"                         "Frequency-BodyAccelerometer-mean-Y"                        
[45] "Frequency-BodyAccelerometer-mean-Z"                         "Frequency-BodyAccelerometer-standardDeviation-X"           
[47] "Frequency-BodyAccelerometer-standardDeviation-Y"            "Frequency-BodyAccelerometer-standardDeviation-Z"           
[49] "Frequency-BodyAccelerometerJerk-mean-X"                     "Frequency-BodyAccelerometerJerk-mean-Y"                    
[51] "Frequency-BodyAccelerometerJerk-mean-Z"                     "Frequency-BodyAccelerometerJerk-standardDeviation-X"       
[53] "Frequency-BodyAccelerometerJerk-standardDeviation-Y"        "Frequency-BodyAccelerometerJerk-standardDeviation-Z"       
[55] "Frequency-BodyGyroscope-mean-X"                             "Frequency-BodyGyroscope-mean-Y"                            
[57] "Frequency-BodyGyroscope-mean-Z"                             "Frequency-BodyGyroscope-standardDeviation-X"               
[59] "Frequency-BodyGyroscope-standardDeviation-Y"                "Frequency-BodyGyroscope-standardDeviation-Z"               
[61] "Frequency-BodyAccelerometerMagnitude-mean"                  "Frequency-BodyAccelerometerMagnitude-standardDeviation"    
[63] "Frequency-BodyAccelerometerJerkMagnitude-mean"              "Frequency-BodyAccelerometerJerkMagnitude-standardDeviation"
[65] "Frequency-BodyGyroscopeMagnitude-mean"                      "Frequency-BodyGyroscopeMagnitude-standardDeviation"        
[67] "Frequency-BodyGyroscopeJerkMagnitude-mean"                  "Frequency-BodyGyroscopeJerkMagnitude-standardDeviation"  
 
 



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




Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
