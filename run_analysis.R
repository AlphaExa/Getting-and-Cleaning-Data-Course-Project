# File: run_analysis.R

# Overview:
#   Merges the training and the test sets to create one data set.
#   Extracts only the measurements on the mean and standard deviation for each measurement.
#   Uses descriptive activity names to name the activities in the data set
#   Appropriately labels the data set with descriptive variable names.
#   Create an independent tidy data set with the average of each variable for each activity and each subject.

# Step 0: Load library
    library(dplyr)


# Step 1: Obtain data from web
    # Download the data (in zip file) if it hasn't already been downloaded
    zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    zipFile <- "UCI HAR Dataset.zip"
    
    if (!file.exists(zipFile)) {
        download.file(url = zipURL, destfile = zipFile, method = "curl")
    }

    # Unzip the zip file if the unzipped folder is not existed yet
    dataFile <- "UCI HAR Dataset"
    
    if (!file.exists(dataFile)){
        unzip(zipFile)
    }

    
# Step 2: Read data
    # Read names of features data and activity labels data, while not converting the data to factors
    # These data are for renaming columns and factors of the data set later
    features <- read.table(file.path(dataFile,"features.txt"), as.is = TRUE)
    actLabels <- read.table(file.path(dataFile,"activity_labels.txt"), as.is = TRUE)
    
    # Read test data
    testSubjects <- read.table(file.path(dataFile,"test/subject_test.txt"))     # Subjects
    testActivity <- read.table(file.path(dataFile,"test/y_test.txt"))           # Activity types
    testValues <- read.table(file.path(dataFile,"test/X_test.txt"))             # Feature values
    
    # Read training data
    trainSubjects <- read.table(file.path(dataFile,"train/subject_train.txt"))  # Subjects
    trainActivity <- read.table(file.path(dataFile,"train/y_train.txt"))        # Activity types
    trainValues <- read.table(file.path(dataFile,"train/X_train.txt"))          # Feature values
    
# Step 3: Merge the training and the test sets to create one data set.
    # Merge the training and test data for Subjects, Values, and Activity by rows
    dataSubjects <- rbind(trainSubjects, testSubjects)
    dataActivity <- rbind(trainActivity, testActivity)
    dataValues <- rbind(trainValues, testValues)
    
    # Merge the newly created Subjects, Activity, and Values data sets by columns
    data <- cbind(dataSubjects, dataActivity, dataValues)
    
    # Assign column names to the variables in Data - "Subject", "Activity" and the names of features
    names(data) <- c("Subject", "Activity", features[,2])
    
# Step 4: Extract only the measurements on the mean and standard deviation for each measurement.
    # Subset only the columns "Subject", "Activity", and the features with "mean" and "std"
    # "meanFreq" columns are not included as they refer to the weighed average of frequency
    columnsKeep <- grep("Subject|Activity|mean\\(\\)|std\\(\\)", names(data))
    subdata <- data[, columnsKeep]

# Step 5: Use descriptive activity names to name the activities in the data set
    subdata$Activity <- factor(subdata$Activity, levels = actLabels[,1], labels = actLabels[,2])

# Step 6: Appropriately labels the data set with descriptive variable names
    # Replace the prefix "t" with "Time-", and "f" with "Frequency-"
    names(subdata) <- gsub("^t", "Time-", names(subdata))
    names(subdata) <- gsub("^f", "Frequency-", names(subdata))
    
    # Replace "Acc" with "Accelerometer", "Gyro" with "Gyroscope", and "Mag" with "Magnitude"
    names(subdata) <- gsub("Acc", "Accelerometer", names(subdata))
    names(subdata) <- gsub("Gyro", "Gyroscope", names(subdata))
    names(subdata) <- gsub("Mag", "Magnitude", names(subdata))
    
    # Replace "std" with "standardDeviation", remove the brackets "()"
    names(subdata) <- gsub("std", "standardDeviation", names(subdata))
    names(subdata) <- gsub("\\(\\)", "", names(subdata))
    
    # Typo corrected: Replace "BodyBody" with "Body"
    names(subdata) <- gsub("BodyBody", "Body", names(subdata))
    
    # Check the variable names
    names(subdata)

# Step 7: Create an independent tidy data set with the average of each variable for each activity and each subject.
    # Summarize the data with average value of each variable, grouped by Subject & Activity
    tidydata <- subdata %>%
        group_by(Subject, Activity) %>%
        summarize_all(funs(mean))
        
    # Produce the tidydata
    write.table(tidydata, "tidy_data.txt", row.names = FALSE, quote = FALSE)
    View(read.table("tidy_data.txt", header = TRUE))