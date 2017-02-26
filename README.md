## Getting and Cleaning Data Course Project
Below is an explanation of how run_analysis.R works.

### Loading the data
The script loads the following files of the 'Human Activity Recognition Using Smartphones Dataset(Version 1.0)':

* 'features_info.txt' - Shows information about the variables used on the feature vector.
* 'features.txt' - List of all features.
* 'activity_labels.txt' - Links the class labels with their activity name.
* 'train/X_train.txt' - Training set.
* 'train/y_train.txt' - Training labels.
* 'test/X_test.txt' - Test set.
* 'test/y_test.txt' - Test labels.
* 'train/subject_train.txt', 'test/subject_test.txt' - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

Note: the script assumes the dataset exists in the working directory, maintaining the original folders structure (train and test folders with their respective data inside)
A full description of the dataset is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Merging test and train data, extracting only the measurements on the mean and standard deviation for each measurement
* Combining the 7352 obs. X 561 var train data (taken from 'train/X_train.txt') with the 2947 obs. X 561 var test data (taken from 'test/X_test.txt') using rbind, resulting with 10299 obs. X 561 var dataset.
* Extracting only the columns with measurements of mean or std. In this case, the corresponding feature name (taken from 'features.txt') includes the expression "mean()" or "std()". The result is a 10299 obs. X 66 var dataset (trainAndTestData).
* Creating the subject number vector (length 10299) by combining the 7352 long train subject vector (taken from 'train/subject_train.txt') with the 2947 long test subject vector (taken from 'test/subject_test.txt') using rbind.
* Creating the activity vector (length 10299) by combining the 7352 long train activity vector (taken from 'train/y_train.txt') with the 2947 long test activity vector (taken from 'test/y_test.txt') using rbind.
* Renaming the activity labels in the activity vector using the descriptive activity names from 'activity_labels.txt'. 
* Combining the subject vector, activity vector and trainAndTestData using cbind, to obtain the first tidy dataset. The result is a 10299 obs. X 68 var dataset (combinedData).

### Renaming the dataset variables into descriptive names
* The subject and activity columns are named "subject_num" and "activity_label", respectively.
* The mean and std measurement columns names are extracted from the features vector (taken from 'features.txt').
* Abbreviated components of the features names are changed into descriptive expressions, to create descriptive variable names:
	- t => timeDomain
	- f => frequencyDomain
	- Acc => Accelerometer
	- Gyro => Gyroscope
	- Mag => Magnitude
	- Body => BodySignal
	- Gravity => GravitySignal

### Creating a second tidy data set with the average of each variable for each activity and each subject
The combinedData dataset is grouped by activity_label and subject_num, and the mean function is applied to all of the feature columns (using summarize_all) to obtain a second tidy dataset  with the average of each variable for each activity and each subject.
Then, the data is written to a .txt file named 'avgActivityData.txt' using write.table().

### Libraries in use:
* dplyr