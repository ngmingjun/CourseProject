## Data Introduction  
* The data was acquired from the **UCI HAR Dataset**. The data used for this project is obtained from 6 .txt files, namely x_train.txt, y_train.txt, subject_train.txt, x_test.txt, y_test.txt and subject_test.txt.  
* The feature.txt file contains the names of each variable, which correspond to each column in x_train.txt and x_test.txt. Explanation of each feature is available in features.info.txt.  
* The activity_labels.txt contains the descriptive names for each activity label, which correspond to each label in y_train.txt and y_test.txt. 
* The number tag of each participant is available in subject_train.txt and subject_test.txt. 
## Variable Introduction  
The following variables are present in the tidy dataset:  
1. *Subject_Number* - The ID number of the participants  
2. *Activity* - Type of activity performed by partcipants  
3. The mean and standard deviation of the following measurements were extracted from the dataset and used:  
    
* tBodyAcc-XYZ  
* tGravityAcc-XYZ  
* tBodyAccJerk-XYZ  
* tBodyGyro-XYZ  
* tBodyGyroJerk-XYZ  
* tBodyAccMag  
* tGravityAccMag  
* tBodyAccJerkMag  
* tBodyGyroMag  
* tBodyGyroJerkMag  
* fBodyAcc-XYZ  
* fBodyAccJerk-XYZ  
* fBodyGyro-XYZ  
* fBodyAccMag  
* fBodyAccJerkMag  
* fBodyGyroMag  
* fBodyGyroJerkMag  
  
"-XYZ" is used to denote 3 axial-signals in the X, Y and Z directions.  
  
## Data Transformations
1. The activity labels and features were loaded into R. The features were filtered to only the mean and standard deviation values.  
2. The train and test datasets were loaded into R and subsequently merged together.  
3. Replaced the activity labels with activity names in the merged dataset.  
4. Calculated the average of each variable grouped by Subject_Number and Activity.  
5. The tidy dataset was written out as tidy_dataset.txt.
