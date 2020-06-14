# Coursera: Getting and Cleaning Data - Course Project
This repository is pertaining to the submission for the course project for [*Getting and Cleaning Data*](https://www.coursera.org/learn/data-cleaning/) on Coursera. This README file 

In this repository, you may find the following files:
* README.md: This file, which contains the relevant information of the course project and data set.
* tidy_data.txt: The finalized data set after data cleaning.
* CodeBook.md: The code book that describes the content of `tidy_data.txt`
* run_analysis.R: The R script that contains all the codes and brief instructions of the process of producing the `tidy_data.txt`. Please refer to the sections below for a brief overview of the data cleaning process.

## Overview of Course Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!

## Original Data Source
The original data is obtained from [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The brief overview of the study is stated below:
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Citation:
> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.  
> URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Cleaning Process
The `run_analysis.R` script can be used to replicate the data cleaning process I have done to create the `tidy_data.txt`. The `tidy_data.txt` in the repository was created using R version 3.6.3 (2020-02-29) on Windows 10 64-bit edition.

Below depicts the steps of the process:

0. Load the package `dplyr` to use relevant codes later.
1. Obtain the original data source from internet and unzip it, if the original data source is not already existed in the working directoty.
2. Read the original data file
    + Read the features data (`features.txt`) and the activity labels data (`activity_labels.txt`). These data files will be used to rename columns and factors of the data set produced later.
    + Read the test sets and training sets. There are 3 data files for test sets and training sets respectively, namely Subjects, Activity, and Values
      + Subjects data (`subject_test.txt` and `subject_train.txt`) contains the Subject Identifier Code.
      + Activity data (`y_test.txt` and `y_train.txt`) contains the Activity Identifier Code.
      + Values data (`x_test.txt` and `x_train.txt`) contains the values of measurement for each features.
3. Merge the training and test sets to create one data set.
    + First, the Subjects data of test sets and training sets are merged by rows to produce one Subject data. The same goes for the Activity data and Values data.
    + Then, the 3 data above are merged by columns, resulting in a combined data set of 10299 observations and 563 variables, with first column as Subject, second column as Activity, with the rest of the columns coming from Values data.
    + The variables (i.e. columns) are renamed for easier identification. The first column is called "Subject", followed by "Activity" for the second column. The rest of columns are asasigned named using the `features` data.
 4. Extract only the measurements on the mean and standard deviation for each measurement.
    + First, `grep` function is used to search for the relevant columns, namely `Subject`, `Activity`, variables with the names of `mean() ` and `std()`.
    + Note that the meanFreq() from the original data source is not included in this data set as it refers to the weighted average of the frequency components to obtain a mean frequency. Thus, it is deemed as irrelevant from the mean of each feature.
    + Then, a subdata is created by subsetting only the relevant variables, resulting in 10299 observations but only 68 variables.
5. The activity labels data is used to label the data of Activity variables for easier identification.
6. In order to better comprehend the variable names, some change are made to the variable names:
    + The prefix `t` is replaced with `Time-`, the prefix `f` is replaced with `Frequency-`
    + The terms `Acc`, `Gyro`, and `Mag` are replaced with `Accelerometer`, `Gyroscope`, and `Magnitude` respectively.
    + The term `std` is replaced with `standardDeviation`. The brackets `()` in `mean()` and `standardDeviation()` are also removed.
    + A typo of `BodyBody` is spotted and thus replaced with `Body`.
7. Create an independent tidy data with the average value of each variable for each activity and subject
    + The summarized tidy data is created using codes from `dplyr` packages, namely `group_by` (to group data based on subject and activity), `summarize_all` (to calculate mean value according to the group assigned) and the pipe operator `%>%` (for quicker operation without typing too much codes).
    + The newly created tidy daya has 180 observations and 68 variables. It is then exported as `tidy_data.txt` in the working directory using the function `write.table()` with `row.names = FALSE`.

Please refer to the CodeBook.md for the details of the `tidy_data.txt`.
