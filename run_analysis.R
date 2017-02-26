library(dplyr)

## load relevant data files
# activity label names
activityLabels <- read.table("activity_labels.txt")
# features
features <- read.table("features.txt")
# train set
trainLabels <- read.table("train/y_train.txt") # activity labels
trainData <- read.table("train/X_train.txt") # feature vector
trainSubjectData <- read.table("train/subject_train.txt") # subjects vector
## test set
testLabels <- read.table("test/y_test.txt") # activity labels
testData <- read.table("test/X_test.txt") # feature vector
testSubjectData <- read.table("test/subject_test.txt") # subjects vector

## merge train and test data sets, selecting only the mean and std columns
meanOrStdFeaturePos <- grep("mean\\(\\)|std\\(\\)", features[,2])
trainAndTestData <- trainData %>% rbind(testData) %>% select(meanOrStdFeaturePos)
## merge train and test subject and activity data, replacing the activity number with a descriptive label
subjectVec <- rbind(trainSubjectData, testSubjectData)
activityVec <- sapply(rbind(trainLabels, testLabels), function(x) {tolower(activityLabels[x,2])})
## combine the subject and activity data with the features mean and std data to create the first final data set
combinedData <- cbind(subjectVec, activityVec, trainAndTestData)
## rename columns
featureNames <- as.character(features[,2][meanOrStdFeaturePos])
featureNames <- gsub("\\(\\)", "", featureNames)
featureNames <- gsub("^t", "timeDomain", featureNames)
featureNames <- gsub("^f", "frequencyDomain", featureNames)
featureNames <- gsub("Acc", "Accelerometer", featureNames)
featureNames <- gsub("Gyro", "Gyroscope", featureNames)
featureNames <- gsub("Mag", "Magnitude", featureNames)
featureNames <- gsub("BodyBody", "Body", featureNames)
featureNames <- gsub("Body", "BodySignal", featureNames)
featureNames <- gsub("Gravity", "GravitySignal", featureNames)
names(combinedData) <- c("subject_num", "activity_label", featureNames)
## create the second data set, containing the average of each variable for each activity and each subject
avgData <-  combinedData %>% group_by(activity_label, subject_num) %>% summarize_all(mean)
## write the dataset to file
write.table(avgData, file="avgActivityData.txt", row.name=FALSE) 
