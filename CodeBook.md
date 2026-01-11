The data used in this project came from accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The input files used are:
  1. UCI HAR Dataset/train/X_train.txt
  2. UCI HAR Dataset/test/X_test.txt
  3. UCI HAR Dataset/train/y_train.txt
  4. UCI HAR Dataset/test/y_test.txt
  5. UCI HAR Dataset/train/subject_train.txt
  6. UCI HAR Dataset/test/subject_test.txt
  7. UCI HAR Dataset/features.txt
  8. UCI HAR Dataset/activity_labels.txt

Variables in the tidy data set
  1. Activity:
     factor with 6 levels: "WALKING" "WALKING UPSTAIRS" WALKING DOWNSTAIRS "SITTING" "STANDING" "LAYING"
  2. Subject:
     Integer 1-30 identifying the participants
  3. All remaining variables
     Numeric values representing the average of each selected measurement for each subject and activity
     
Following Data Transformation performed
   1. Training and Test data sets were merged into one data set.
   2. Only the measurements on the mean and standard deviation for each measurement were retained
   3. Added descriptive activity names to name the activities in the data set
   4. Appropriately labelled the data set with descriptive variable names
   5. A second tidy data set with the average of each variable for each activity and each subject was created
