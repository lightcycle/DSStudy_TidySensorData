# DSStudy_TidySensorData
Course project for the Johns Hopkins Getting and Cleaning Data course on Coursera.

## Purpose

The run_analysis.R script tidies and summerizes data from the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  The resulting tidy data set is written to a file named tidydata.txt in the same directory as the script.

## Requirements

The [data set archive file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) is expected to extracted into the same directory as the run_analysis.R script.

## Process

The run_analysis.R script:

1. Loads the features domain table, which maps feature id numbers to feature names.
2. Produces a logical vector indicating which features should be loaded and retained.  The logical vector will be TRUE for features whose names contain the text "mean()" or "std()".
3. Uses the logical vector from step 2 as a mask to obtain the names of the features to be loaded.
4. Uses the logical vector from step 2 again to produce a list of widths for use with `read.fwf()`.  Negative widths are used for features that do not need to be loaded, because `read.fwf()` will drop these columns when loading the file.
5. Loads the training measurements, label list, and subject list files and combines them into a single data frame with `cbind()`.
6. Loads the testing measurements, label list, and subject list files and combines them into a single data frame with `cbind()`.
7. Combines the training and testing data frames with `rbind()`.
8. Loads the activities domain table, which maps activity id numbers to activity names.
9. Updates the activity column of the combined data data frame from step 7, replacing activity id numbers with a factor or descriptive activity names.
10. Uses `aggregate()` to produce a data frame with the mean of each feature, grouped by subject number and activity.
11. Writes the data from from step 10 to file tidydata.txt.