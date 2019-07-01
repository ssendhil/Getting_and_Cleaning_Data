# Getting and Cleaning Data

## File summary

In this project, I  used data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone to prepare a tidy dataset that is easy to access and understand.

This repository contains the following files:

- `CodeBook.md` This is the code book, which describes the contents of the dataset

- `README.md` This file provides an overview of the dataset and how it was created

- `tidy_data.txt` This file contains the first tidy dataset created

- `final_data.txt` This file contains the final tidy dataset with the avg of each variable, activity, subject

- `run_analysis.R` This is the R script that was used to create the dataset 

## Creating the data set 

I wrote the R script `run_analysis.R` to create the tidy dataset. Below are the steps I took to achieve this:

- Download and unzip source data
- Read data
- Merge the training and the test data sets to create one dataset
- Extract only the measurements on the mean and standard deviation for each measurement
- Use descriptive activity names to name the activities in the dataset
- Appropriately label the dataset with descriptive variable names (see: `tidy_data.txt`)
- Create a second, independent tidy set with the average of each variable for each activity and each subject.
- Write the dataset to the `final_data.txt` file
