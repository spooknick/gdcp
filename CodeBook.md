# CodeBook

## Getting and Cleaning Data, peer assessment

### Data set description

* 'train/Inertial Signals/\*.\*' and 'test/Inertial Signals/\*.\*' contains the raw measurements,
* 'train/X\_train.txt' and 'test/X\_test.txt' contains the features (processed raw measurements) needed for the tidy data set 
* 'feature_info.txt' explains how the features have being processed
* 'features.txt' list the features
* 'train/subject\_train.txt' and 'test/subject\_train.txt' 

### Filtering relevent features
UCI HAR Dataset/features.txt contains the variables names for the datasets. Relevant columns are the columns containing the substrings "mean()" and  "std()"
