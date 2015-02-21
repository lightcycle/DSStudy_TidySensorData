# Variables
dir_data <- "UCI\ HAR\ Dataset"
measurement_field_width <- 16

# Load features domain table
features <- read.delim(file.path(dir_data, "features.txt"), header=FALSE,
                       sep = " ", quote = "", col.names=c("id","name"))

# Create a logical vector identifying which features should be loaded: those
# with "mean()" or "std()" in their names
feature_mask <- grepl("mean\\(\\)|std\\(\\)", features$name)

# Use the feature mask to determine the names of features to be loaded.
masked_feature_names <- features$name[feature_mask]

# Use the feature mask to build the list of column widths for the fixed-width
# data file.  Columns with negative widths are skipped during the load.
masked_feature_data_widths <- ifelse(feature_mask, measurement_field_width,
                                     -measurement_field_width)

# Load training data files and combine into a single dataframe
measurements_train <- read.fwf(file.path(dir_data, "train/X_train.txt"),
                               widths=masked_feature_data_widths, header=FALSE,
                               colClasses=c("numeric"))
names(measurements_train) <- masked_feature_names
labels_train <- read.delim(file.path(dir_data, "train/y_train.txt"),
                           header=FALSE, sep = " ", quote = "",
                           colClasses=c("integer"), col.names=c("activity"))
subjects_train <- read.delim(file.path(dir_data, "train/subject_train.txt"),
                             header=FALSE, sep = " ", quote = "",
                             colClasses=c("factor"), col.names=c("subject"))
train <- cbind(measurements_train, labels_train, subjects_train)

# Load test data files and combine into a single dataframe
measurements_test <- read.fwf(file.path(dir_data, "test/X_test.txt"),
                              widths=masked_feature_data_widths, header=FALSE,
                              colClasses=c("numeric"))
names(measurements_test) <- masked_feature_names
labels_test <- read.delim(file.path(dir_data, "test/y_test.txt"), header=FALSE,
                          sep = " ", quote = "", colClasses=c("integer"),
                          col.names=c("activity"))
subjects_test <- read.delim(file.path(dir_data, "test/subject_test.txt"),
                            header=FALSE, sep = " ", quote = "",
                            colClasses=c("factor"), col.names=c("subject"))
test <- cbind(measurements_test, labels_test, subjects_test)

# Combine training and testing data
alldata <- rbind(train, test)

# Load activity domain table
activities <- read.delim(file.path(dir_data, "activity_labels.txt"),
                         header=FALSE, sep = " ", quote = "",
                         col.names=c("id","name"))

# Replace activity id numbers in data with factor value from activity domain table
alldata$activity <- merge(alldata, activities, by.x="activity", by.y="id")$name

# Group by subject and activity, get averages of each measurement, and correct
# column names
group_means <- aggregate(alldata[,1:66],
                         list(alldata$subject, alldata$activity), mean)
names(group_means)[1] <- "Subject"
names(group_means)[2] <- "Activity"

# Write tidy data to a file
write.table(group_means, "tidydata.txt", row.name=FALSE)