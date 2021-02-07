h1. tidy.txt

* subject - subject number
* activity - activity code
* activity_label - activity label
* features - feature contains mean and std but not meanFreq
* measurments - measured value

h1. tidy_summary.txt

* subject - subject number
* activity - activity code
* activity_label - activity label
* features - feature contains mean and std but not meanFreq
* mean_measurments - mean of measured value, group by subject, activity and feature

h1. source data

see https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Assume all files extracted into folder ucihardataset

h1. transformation

```
    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement. 
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names. 
    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
```
