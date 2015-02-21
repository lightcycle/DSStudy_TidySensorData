# Codebook for DSStudy_TidySensorData
Codebook for the course project for the Johns Hopkins Getting and Cleaning Data course on Coursera.

## Overview

This project resulted in the script run_analysis.R, which tidies and summerizes data from the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  Data from the training and test data sets of the original study are combined.  The resulting tidy data set is written to a file named tidydata.txt in the same directory as the script.

For an overview the the original study and data set, see [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Variables

The original data set included triaxial acceleration and angular velocity measurements collected at a rate of 50hz using Samsumg Galaxy S II phones worn on the waist.  Each subject was also videotaped in order to categorize their activity at the time of each measurement.

The run_analysis.R script preserves the feature names provided in the original data set.  Only features for the mean and standard deviation were retained, along with the original subject identifiers and activity names:

Name | Description
---- | -----------
Subject | Test subject identifier.  Ranges from 1 to 30.
Activity | Descriptive name for observed activity at time of measurement.

All other variables are means of the cooresponding variables from the original data set.  From the original study:

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
> 
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
> 
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
> 
> These signals were used to estimate variables of the feature vector for each pattern:  
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
> 
> tBodyAcc-XYZ
> tGravityAcc-XYZ
> tBodyAccJerk-XYZ
> tBodyGyro-XYZ
> tBodyGyroJerk-XYZ
> tBodyAccMag
> tGravityAccMag
> tBodyAccJerkMag
> tBodyGyroMag
> tBodyGyroJerkMag
> fBodyAcc-XYZ
> fBodyAccJerk-XYZ
> fBodyGyro-XYZ
> fBodyAccMag
> fBodyAccJerkMag
> fBodyGyroMag 
> fBodyGyroJerkMag
>
> The set of variables that were estimated from these signals are: 
> mean(): Mean value
> std(): Standard deviation


