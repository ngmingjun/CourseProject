# Getting and Cleaning Data Course Project
## Files
* CodeBook.md describes the data, variables and the work performed to clean up the data.  
* run_analysis.R contains the code to produce a tidy dataset from the data provided in the **UCI HAR Dataset**. The R script loads and filters the train and test datasets into R and merges them together. Descriptive activity names are then assigned to the data and activities. A tidy dataset of the average of each variable grouped by Subject_Number and Activity is then calculated and written. 
* tidy_dataset.txt is produced from running run_analysis.R. 
