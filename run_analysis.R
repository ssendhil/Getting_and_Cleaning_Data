# download zip file 
zip_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zip_file <- "UCI HAR Dataset.zip"

if (!file.exists(zip_file)) {
  download.file(zip_url, zip_file, method = "curl")
}

# unzip zip file with the data
data_path <- "UCI HAR Dataset"
if (!file.exists(data_path)) {
  unzip(zip_file)
}

library(dplyr)

#Cleaning the data

# read in features
varNames <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
dim(varNames)

# read training data
x.train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = varNames$functions)
y.train <- read.table("UCI HAR Dataset/train/Y_train.txt", col.names = "code")
subj.train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

# read testing data
x.test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = varNames$functions)
y.test <- read.table("UCI HAR Dataset/test/Y_test.txt", col.names = "code")
subj.test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

# read in the activity labels
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
dim(activityLabels)

# Part 1. Merges the training and the test sets to create one data set.
training.merge <- cbind(subj.train, x.train, y.train)
testing.merge <- cbind(subj.test, x.test, y.test)

merged_data <- rbind(training.merge, testing.merge)

dim(merged_data)

# Part 2. Extracts only the measurements on the mean and standard deviation for each measurement.
tidy_data <- merged_data %>% select(subject, code, contains("mean"), contains("std"))

# Part 3. Uses descriptive activity names to name the activities in the data set
tidy_data$code <- activityLabels[tidy_data$code, 2]

# Part 4. Appropriately label the data set with descriptive variable names
names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data) <- gsub("BodyBody", "Body", names(tidy_data))
names(tidy_data) <- gsub("-freq()", "Frequency", names(tidy_data), ignore.case = TRUE)
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("-mean()", "Mean", names(tidy_data), ignore.case = TRUE)
names(tidy_data) <- gsub("-std()", "STD", names(tidy_data), ignore.case = TRUE)
names(tidy_data) <- gsub("tBody", "TimeBody", names(tidy_data))
names(tidy_data) <- gsub("^t", "Time", names(tidy_data))
names(tidy_data) <- gsub("^f", "Frequency", names(tidy_data))

names(tidy_data) <- gsub("\\.", "", names(tidy_data))

write.table(tidy_data, "tidy_data.txt", row.name=FALSE, col.name=TRUE)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject

final_data <- tidy_data %>% group_by(subject, code) %>% summarise_all(funs(mean))

names(final_data) <- gsub("\\.", "", names(final_data))

write.table(final_data, "final_data.txt", row.name=FALSE, col.name=TRUE)
