## Load required libraries for the analysis
library(dplyr)

## Read in the relevant training datasets
training_set <- read.table("X_train.txt")
subject_train <- read.table("subject_train.txt")
activity_train <- read.table("y_train.txt")

## Read in the relevant test datasets
test_set <- read.table("X_test.txt")
subject_test <- read.table("subject_test.txt")
activity_test <- read.table("y_test.txt")

## Read in the label datasets for activities and feature variables. For feature variables, filter for the second column only
activity_labels <-read.table("activity_labels.txt")
feature_labels <-read.table("features.txt")
variable_labels <- feature_labels[,2]

## Label all column headers of the training and test datasets
colnames(training_set) <- variable_labels
colnames(test_set) <- variable_labels
colnames(subject_test) <- "SubjectNumber"
colnames(subject_train) <- "SubjectNumber"
colnames(subject_test) <- "SubjectNumber"
colnames(activity_train) <- "ActivityType"
colnames(activity_test) <- "ActivityType"
colnames(activity_labels) <- c("ActivityType","ActivityDescription")

## Merge the training and test datasets to create one dataset
full_training <- cbind(subject_train, activity_train, training_set)
full_test <- cbind(subject_test, activity_test, test_set)
combined_data <- rbind(full_training, full_test)

## Extract only the measurements on the mean and standard deviation for each measurement. 
## The code assumes only those variables with mean() and std() at the end are required. 
## Entries with means or std in an earlier part of the name is assumed to be not required
myvars <- grep("\\bmean()\\b|\\bstd()\\b|SubjectNumber|ActivityType", colnames(combined_data))
datawithmeanstd <- combined_data[,myvars]

## Add descriptive activity names to name the activities in the dataset
datamergeactivity <- merge(datawithmeanstd, activity_labels, by="ActivityType")

## Create an independent tidy dataset with the average of each variable for each activity and each subject
## The tidy dataset meets the principles of a wide form of tidy data which assumes that the variables are
## independent measurements of activity / subject actions
groupdata <- group_by(datamergeactivity,ActivityType, ActivityDescription, SubjectNumber)
tidydataset<-summarise_each(groupdata, funs(mean))

## Write resulting tidy data set into a txt file with filename tidydataset.txt
write.table(tidydataset, file = "tidydataset.txt", row.names=FALSE)
