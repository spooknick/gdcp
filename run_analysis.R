# filter relevant features
featureList <- read.table('./UCI HAR Dataset/features.txt')

# create a logical vector to filter relevant data
relevantFeatures <- grepl("^.+[-](mean|std)[(].*$", features$V2)
variablesNames <- featureList$V2[relevantFeatures]
activityLabels <- read.table('./UCI HAR Dataset/activity_labels.txt', col.names=c('id','activity'))


# open training set
tmp <- read.table('./UCI HAR Dataset/train/X_train.txt',row.names=NULL, header=FALSE)

# filter data before doing anything else
train <- tmp[,relevantFeatures]
names(train) <- variablesNames
train$set <- 'Training'

# add subject column
subjects <- read.table('./UCI HAR Dataset/train/subject_train.txt', col.names='subject')
train$subject <- subjects$subject

# add activity
activities <- read.table('./UCI HAR Dataset/train/y_train.txt', col.names='activity')
train$activity <- factor(activities$activity, labels=activityLabels$activity)



# the same for the test set
tmp <- read.table('./UCI HAR Dataset/test/X_test.txt',row.names=NULL, header=FALSE)

# filter data before doing anything else
test <- tmp[,relevantFeatures]
names(test) <- variablesNames
test$set <- 'Test'

# add subject column
subjects <- read.table('./UCI HAR Dataset/test/subject_test.txt', col.names='subject')
test$subject <- subjects$subject

# add activity
activities <- read.table('./UCI HAR Dataset/test/y_test.txt', col.names='activity')
test$activity <- factor(activities$activity, labels=activityLabels$activity)

# merge train and test sets
tidy1 <- rbind(train,test)


