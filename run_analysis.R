## Check for and load required packages and download data
if("data.table" %in% rownames(installed.packages()) == FALSE) {
        install.packages("data.table")
}
library(data.table)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./Dataset.zip")
unzip("Dataset.zip")

## Load activity labels and features
actLab <- fread("./UCI HAR Dataset/activity_labels.txt", 
                col.names = c("activity_label", "activity_name"))
feat <- fread("./UCI HAR Dataset/features.txt", 
              col.names = c("index", "feature_name"))
featWant <- grep("(mean|std)\\(\\)", feat$feature_name)
measurements <- feat[featWant, feature_name]
measurements <- gsub("\\(\\)", "", measurements)

## Load train dataset
train <- fread("./UCI HAR Dataset/train/X_train.txt")[ , featWant, with = FALSE]
data.table::setnames(train, colnames(train), measurements)
trainAct <- fread("./UCI HAR Dataset/train/y_train.txt", col.names = "Activity")
trainSub <- fread("./UCI HAR Dataset/train/subject_train.txt", 
                  col.names = "Subject_Number")
train <- cbind(trainSub, trainAct, train)

## Load test dataset
test <- fread("./UCI HAR Dataset/test/X_test.txt")[ , featWant, with = FALSE]
data.table::setnames(test, colnames(test), measurements)
testAct <- fread("./UCI HAR Dataset/test/y_test.txt", col.names = "Activity")
testSub <- fread("./UCI HAR Dataset/test/subject_test.txt",
                 col.names = "Subject_Number")
test <- cbind(testSub, testAct, test)

## Merge the train and test datasets
merged <- rbind(train, test)


## Convert activity from labels to names
merged$Activity <- factor(merged$Activity, levels = actLab[["activity_label"]], 
                         labels = actLab[["activity_name"]])

## Calculate the average for each variable for each activity and each subject
merged <- aggregate(. ~ Subject_Number + Activity, data = merged, FUN = mean)
        
## Write new tidy dataset into .txt file
write.table(merged, file = "tidy_dataset.txt", row.names = FALSE)