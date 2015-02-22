# GettingAndCleaningDataCourseProject
Course Project for Getting and Cleaning Data course in the Data Science Specialization series

## Goal
The goal of this project is to transform the data provided into a form that is consistent with
tidy principles i.e. 
1. Each variable forms a column
2. Each observation forms a row
3. Each type of observational unit forms a table

"Tidy Data", Journal of Statistical Sofware MMMMMM YYYY, Volume VV, Issue II. by Hadley Wickham

## Context to the data
Data obtained from a group of 30 volunteers each performing a set of six 
activities is used as input for this project. Each person performed the 
following six activities while wearing a Samsung Galaxy SII smart phone

1.WALKING
2.WALKING_UPSTAIRS
3.WALKING_DOWNSTAIRS
4.SITTING
5.STANDING, 
6.LAYING 

Three axial (X,Y and Z axis) Linear Acceleration and Angular velocity data was 
obtained from the embedded accelerometer and gyroscope in the phone. 

The accelerometer signal has body and gravity acceleration signals components. 
In addition, there are time and frequency domain elements derived from these 
signals. The body linear acceleration and angular velocity were derived 
in time to obtain Jerk signals. Also the magnitude of these three-axial 
signals were calculated using the Euclidean norm

The obtained dataset has been 
randomly partitioned into two sets, where 70% of the volunteers was 
selected for generating the training data and 30% the test data

## Relevant Input Data 
Among the different data sets provided, the following files are relevant for the
assignment  
1. X_test.txt   
+ Data from 30% of the group of volunteers  
2. X_train.txt  
+ Data from 70% of the group of volunteers  
3. y_test.txt  
+ Activities performed by 30% of the group  
4. y_train.txt  
+ Activities performed by 70% of the group  
5. activity_labels.txt  
+ File has mapping between activity number and activity name  
6. subject_test.txt  
+ File has id number of the subject that performed the activity. There is an id for each activity in the x_test.txt file  
7. subject_train.txt  
+ File has id number of the subject that performed the activity. There is an id for each activity in the x_train.txt file  
8. features.txt  
+ File has the name of each variable provided in the input data files  
9. feature_info.txt  
+ File has information about each of the variables in the features.txt file 

**KEY ASSUMPTION**: All the data files must be in the same directory as the run_analysis.R file

## High level Steps
**Step 1** : Read and merge measurements for diff activities from the test and training data set  
**Step 2** : Read and merge labels for diff activities from the test and training data set  
**Step 3** : Map descriptive activity names associated with the labels  
**Step 4** : Read and merge subjects that performed diff activities from the test and training data set  
**Step 5** : create a set of relevant data from the list of features. Relevant data pertains to features that have a mean or standard deviation in the feature name  
**Step 6** : Create a valid list of descriptive feature names. The input data has some feature names that are not valid (i.e. having characters like "(", ")" etc.). These invalid characters must be removed and the names must be descriptive to assist reader in interpreting the meaning of that data  
**Step 7** : Aggregate the activity names (from STEP 3) and subjects (from STEP 4) into a consolidated data set  
**Step 8** : Melt the consolidated data using Subjects and ActivityNames as the id. This step is needed for further analysis  
**Step 9** : Recast the molten data to have a single row for each subject and each activity and the average value (from multiple observations for that activity from that subject)  
**Step 10**: Create an output file of the resulting data set from Step 9
