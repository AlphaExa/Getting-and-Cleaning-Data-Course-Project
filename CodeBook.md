# Code Book for Coursera: Getting and Cleaning Data - Course Project
This cook book contains the necessary information for the dataset `tidy_data.txt`, with the following 2 sections: *Data* and *Variables*.

## Data
The `tidy_data.txt` is a space-separated data set with a text file format. It has 181 rows and 68 variables. The first row of the data contains the names of the variables, while the following rows contain the values of the variable.

The data was originally obtained from UCI HAR Dataset.  
Link:
> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

Citation:
> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Upon the request of the course project, the original data was undergone data cleaning and transformation using R, which includes:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The detailed procedures and codes for the transformations can be found in `run_analysis.R` in the resipotary.
