# The run_analysis.R script reads a set of data files in the current working 
# directory to produce a "tidy" data set. These files contain data from the 
# accelerometer and gyroscope of the mobile device worn by a group of volunteers
# performing a pre-defined set of activities. The set of data files expected 
# in the current directory are as follows :
# X_test.txt  (Data from 30% of the group of volunteers)
# X_train.txt (Data from 70% of the group of volunteers)
# y_test.txt (Activities performed by 30% of the group)
# y_train.txt (Activities performed by 70% of the group)
# activity_labels.txt (has mapping between activity number and activity name)
# subject_test.txt (has id number of the subject that performed the activity. 
#                  There is an id for each activity in the x_test.txt file)
# subject_train.txt (has id number of the subject that performed the activity. 
#                  There is an id for each activity in the x_train.txt file)
# features.txt (has the name of each variable provided in the input data files)

# Functions have been utilized from following packages have been used for 
# different steps in this program

require(data.table)
require(plyr)
require(dplyr)
require(reshape2)

# This section will perform the task of merging the test and the training
# data sets into one set

# STEP ONE :
# Read the measurements for diff activities from the test and training data set 
# files and append the data into the mergedX data frame

testX <- read.table("X_test.txt",header=FALSE)
trainX <- read.table("X_train.txt",header=FALSE)
mergedX <- bind_rows(trainX,testX)

# STEP TWO :
# Read the labels from the test and training data set files and append the
# data into the mergedY data frame. Each label identifies the activity
# performed by the subject and is associated with the measurements in the 
# corresponding data set

testY <- read.table("y_test.txt", header=FALSE)
trainY <- read.table("y_train.txt", header=FALSE)
mergedY <- bind_rows(trainY,testY)
names(mergedY) <- "Activity"

# STEP THREE : 
# Substitute descriptive activity names in-lieu of the activity IDs

# STEP THREE (a) Read the list of labels and the activity names associated with the labels.
# This is used to make the data more descriptive in the final result 

activityLabelTable <- read.table("activity_labels.txt",header=FALSE,stringsAsFactors=FALSE)
names(activityLabelTable) <- c("ActivityNumber","ActivityName")


# STEP THREE (b) This step uses the match function used for to replace the 
# activity labels (read in STEP TWO) with activity name associated with the label

activityName <- activityLabelTable$ActivityName[match(mergedY$Activity,activityLabelTable$ActivityNumber)]

# STEP FOUR: Read the subjects (i.e. volunteers that participated in the study) 
# that performed the activities that were measured. As in STEPS 1 and 2
# data from the test and training groups are merged as well.

testSubjects <- read.table("subject_test.txt", header=FALSE)
trainSubjects <- read.table("subject_train.txt", header=FALSE)
mergedSubjects <- bind_rows(trainSubjects,testSubjects)
names(mergedSubjects) <- "Subjects"

# STEP FIVE: Read the feature names from the features.txt file, These feature
# names correspond to the data in the test and training data sets that were 
# obtained in STEP ONE. 
# Per the requirement in the assignment, only features pertaining to mean
# and standard deviation are relevant. So only data pertaining to the 
# mean and standard deviation are retained for subsequent steps

# STEP FIVE (a) : Read features from the features.txt file. These features
# are assigned to each column of data obtained in STEP ONE
featureNames <- read.table("features.txt",header=FALSE, stringsAsFactors=FALSE)
names(mergedX) <- featureNames$V2

# STEP FIVE (b) : Search for the releveant features using the regular expression. 
# The regular expression searches for "mean", "Mean" or "std" 
# optionally followed by a (). A list of the relevant feature names is
# then used in the next step to retain only the relevant data

relevantColumnNames <- featureNames$V2[grep("([mM]ean|std)\\(\\)|[mM]ean|std)",featureNames$V2)]

# STEP FIVE (c) : Retain only data pertaining to the relevant columns
relevantMergedX <- mergedX[,relevantColumnNames]

# STEP SIX : Ensure that the feature names read from the features.txt file are
# valid names and describe the feature appropriately. This step is necessary to
# ensure that these feature names can subsequently be used in other R functions 
# and also enable the reader to interpret the values in the observation

# The make.names function replaces invalid column name characters such as "(",
# ")" etc. with a ".". The gsub command is subsequently used to ensure 
# additional readability of the column names. Examples of transformation performed
# are shown below
#                   make.names              (additional gsub steps)
# tBodyAcc-mean()-X ---------> tBodyAcc.mean...X ----------------> tBodyAccMeanX
# fBodyBodyGyroMag-std() ----> fBodyBodyGyroMag.std..------------> fBodyGyroMagStd

validRelevantColumnNames <- make.names(names=relevantColumnNames,unique=TRUE,allow_=TRUE)

validRelevantColumnNames <- gsub(pattern = "\\.+", replacement = ".", x = validRelevantColumnNames,perl=TRUE)
validRelevantColumnNames <- gsub(pattern = "\\.$",replacement ="", x = validRelevantColumnNames,perl=TRUE)
validRelevantColumnNames <- gsub(pattern = "\\.([a-z])",replacement ="\\U\\1", x = validRelevantColumnNames,perl=TRUE)
validRelevantColumnNames <- gsub(pattern = "\\.([A-Z])",replacement ="\\E\\1", x = validRelevantColumnNames,perl=TRUE)
validRelevantColumnNames <- gsub(pattern = "BodyBody",replace ="Body", x = validRelevantColumnNames,perl=TRUE)

# Valid Relevant Column Names are not assigned to the data set
names(relevantMergedX) <- validRelevantColumnNames

# STEP 7 : The activity names (from STEP 3) and subects (from STEP 4) are now
# aggregated to obtain a consolidated data set

relevantMergedX <- cbind(activityName,relevantMergedX)
relevantMergedX <- cbind(mergedSubjects,relevantMergedX)

# STEP 8 : The consolidated data set is then "melted" using the Subjects and
# activity Names as ID. This yields a molten data set in the form. However there
# may be multiple rows for each subject for each activity.
# Subjects  activityName	variable	      value
# 1	        STANDING	    tBodyAccMeanX	  0.28858451
# 1         STANDING      tBodyAccMeanX	  0.27841883
#
relevantMergedXMelt <- melt(relevantMergedX,id=c("Subjects","activityName"))

# STEP 9: The molten data is now recast to have a single row for each
# subject and each activity and the average value for that activity.
# This results in a "wide" but "tidy" data set with each row representing
# a specific activity for each subject and each column representing a 
# specific feature measurement associated with that activity

resultData <- dcast(relevantMergedXMelt,Subjects + activityName ~ variable, mean)

# STEP 10: Results are written to the results.txt file for submission
write.table(resultData,"result.txt",row.names=FALSE)



