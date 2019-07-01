# Getting and Cleaning Data

## File summary

In this project, I  used data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone to prepare a tidy dataset that is easy to access and understand.

This repository contains the following files:

- `CodeBook.md` This is the code book, which describes the contents of the data set

- `README.md` This file provides an overview of the data set and how it was created

- `tidy_data.txt` This file contains the first tidy data set created

- `final_data.txt` This file contains the final data set with the avg of each variable for each activity and subject

- `run_analysis.R` This is the R script that was used to create the data set 

## Creating the data set 

I wrote the R script `run_analysis.R` to create the tidy data set. Below are the steps I took to achieve this:

- Download and unzip source data
- Read data
- Merge the training and the test data sets to create one data set
- Extract only the measurements on the mean and standard deviation for each measurement
- Use descriptive activity names to name the activities in the data set
- Appropriately label the data set with descriptive variable names
- Create a second, independent tidy set with the average of each variable for each activity and each subject.
- Write the data set to the `final_data.txt` file
