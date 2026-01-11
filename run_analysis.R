# Read the train and test the data set

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")

y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Merge the training and testing data sets for X
X <- rbind(x_train, x_test)

# Get the column index and column names from features with names having mean and std
features <- read.table("UCI HAR Dataset/features.txt")
mean_std_cols <- grep("mean\\(\\)|std\\(\\)", features$V2)
mean_std_col_names <- grep("mean\\(\\)|std\\(\\)", features$V2, value = TRUE)

# Subset X with only those data with columns having mean and std
X_subset <- X[,mean_std_cols]

# Replace the column with descriptive column names in X subset.
colnames(X_subset) <- mean_std_col_names

# Merge the training and test data for y
y <- rbind(y_train, y_test)

# Merge the training and test data for subject
subject <- rbind(subject_train, subject_test)

# Add descriptive column name for subject
colnames(subject) <- "subject"

# Add descriptive column name for subject
colnames(y) <- "activity"

# Merge the data sets into one data frame
merged_data <- cbind(subject, y, X_subset)

# Read the activity labels into a data frame
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Add descriptive names into the activity data frame
colnames(activity_labels) <- c("activity", "activity_name")

#library(dplyr)

#Add descriptive name to the activity in merged data frame
merged_data_with_acitvity_labels <- merged_data %>% left_join(activity_labels, by = "activity") %>% select(-activity)%>% rename(activity = activity_name)

# Add descriptive names to the columns of merged data frame
average_activity_subject_group <- merged_data_with_acitvity_labels %>% group_by(subject, activity) %>% summarise(across(where(is.numeric), \(x) mean(x, na.rm = TRUE)), .groups = "drop")

