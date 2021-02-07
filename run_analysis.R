library(tidyverse)
activity_labels <- read.table("./ucihardataset/activity_labels.txt", header=FALSE)
features <- read.table("./ucihardataset/features.txt", header=FALSE)
subject_train <- read.table("./ucihardataset/train/subject_train.txt", header = FALSE)
x_train <-  read.table("./ucihardataset/train/X_train.txt", header = FALSE, col.names = features$V2)
y_train <-  read.table("./ucihardataset/train/y_train.txt", header = FALSE)
subject_test <- read.table("./ucihardataset/test/subject_test.txt", header = FALSE)
x_test <-  read.table("./ucihardataset/test/X_test.txt", header = FALSE, col.names = features$V2)
y_test <-  read.table("./ucihardataset/test/y_test.txt", header = FALSE)
x_all <- rbind(x_train, x_test)
y_all <- rbind(y_train, y_test)
subject <- subject %>% rename("subject"=V1)
y_all <- y_all %>% rename("activity"=V1)
#1. Merges the training and the test sets to create one data set.
data <- cbind(subject, y_all, x_all)
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
data1 <- select(data, subject, activity, contains("mean"), contains("std"), -contains("meanFreq"))
#3. Uses descriptive activity names to name the activities in the data set
activity_labels <- activity_labels %>% rename("activity_label"=V2, "activity"=V1)
data2 <- merge(data1, activity_labels, by="activity")
#4. Appropriately labels the data set with descriptive variable names. 
data2 <- data2 %>% select(2, 1, 76, 3:75) %>% arrange(subject, activity_label)
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy <- data2 %>% gather("features", "measurments", 4:76)
tidy_summary <- tidy %>% group_by(subject, activity_label, features) %>% summarise(mean_measurments=mean(measurments)) %>% ungroup() %>% ungroup() %>% arrange(subject, activity_label, features)

write.table(tidy, "tidy.txt", row.names = FALSE)
write.table(tidy_summary, "tidy_summary.txt", row.names = FALSE)