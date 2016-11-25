# Wk4DataAssignment
Week 4 assignment of the Getting and Cleaning Data Course Project
Note: You can read the final table back into R with df <-read.table("./data/tidydataset.txt")

The purpose of this project is to to prepare a tidy dataset that can be used for later analysis. The source data for this project is obtained from the following site https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
This data represents information collected from the accelerometers from the Samsung Galazy S smartphone. 

Included together is a code book (CodeBook.md) that describes the variables, the data, and any transformations performed to clean up the data. 

The R code used is provided in the script run_analysis.R. This script performs the following steps

Step 1: Set the working directory and load the relevant libraries (in this case, dplyr)
Step 2: Read in the relevant training and test datasets into memory using "read.table" function. Relevant columnn header tables are also read in
Step 3: All training and test dataset columns are then labeled appropriately using the "colnames" function.
Step 4: The training and test dataset is then merged to form a single combined dataset using "cbind" and "rbind" functions
Step 5: The columns of the dataset is then filtered to only include those variables that contain the words mean() or std() using the "grep" function
Step 6: The activity number of each row is then mapped to the relevant text description using the "merge" function
Step 7: A new independent dataset was created based on the wide format tidy data principle. This data summarises the mean of each variable, grouped by Activity and Subject. The "group_by" and "summarise" functions were used
Step 8: The resulting dataset was exported into a text file with the filename tidydataset.txt

