#Code Book for result set produced by run_Analysis.R file

###Subjects  
Has a list of subjects identified by Subject ID (1..30)  

###activityName  
A list of activities   
1.WALKING  
2.WALKING_UPSTAIRS  
3.WALKING_DOWNSTAIRS  
4.SITTING  
5.STANDING   
6.LAYING 

## Naming Convention for the remaining features

The following section has a list of features. Some generic naming conventions are listed below.  

1. The features are prefixed with a **"t"** or a **"f"** indicatng whether these features represent a **t**ime domain signal or a **"f"**requency domain signal. The time domain signals were obtained at a constant sampling frequency of 50Hz. The frequency domain signals were obtained by performing a Fast Fourier Transform (FFT) was applied to the signals. Examples - **t**BodyAccMeanX, **f**BodyAccStdX  

2. Each time and frequency domain feature has associated values along 3 axis i.e. **"x"**, **"y"**, **"z"**. These are indicated by a suffix **"X"**, **"Y"** or **"Z"**. Example - tBodyAccStd**X**, tBodyAccStd**Y**,fBodyAccMean**Z**  

3. The **"Acc"** phrase as part of the feature name indicates that the raw signal was obtained from the Accelerometer in the mobile phone and the **"Gyro"** phrase indicates that the raw signal was obtained from the Gyroscope. Examples - tBody**Acc**MeanZ, tBody**Gyro**MeanZ

4. The **"Body"** phrase as part of the feature name indicates that feature was derived from the Body component of the acceleration signal (from the accelerometer) and the **"Gravity"** phrase indicates that the feature was derived from the Gravity component of the acceleration signal. These two components are obtained as a result of applying filters to the raw acceleration signal. Examples - t**Body**AccStdZ, t**Gravity**AccMeanZ  

5. The **"Mean"** phrase indicates that the value is the average value of the specific feature for a specifc subject and the associated activity performed by that subject. Similarly, the **"Std"** phrase indicates that the value is the Standard Deviation value of the specific feature for a specific subject and the associated activity peformed by that subject. Examples - tBodyAccJerk**Mean**Z, tBodyAccJerk**Std**Z  

6.The body linear acceleration and angular velocity were derived in time to obtain Jerk signals. These features have a phrase **"Jerk"** as part of the name. Examples - tBodyAcc**Jerk**MeanX and tBodyGyro**Jerk**MeanX  

7.The magnitude of these three-dimensional signals were calculated using the Euclidean norm. These features have a  phrase **"Mag"** as part of the name. Examples - tBodyAcc**Mag**Mean, tGravityAcc**Mag**Std  

8. Additional vectors obtained by averaging the signals in a signal window sample. These are identified with the **"angle"** in the feature name. used on the angle variable. Examples - **angle**XGravityMean

## Comprehensive list of features  

tBodyAccMeanX  
tBodyAccMeanY  
tBodyAccMeanZ  
tBodyAccStdX  
tBodyAccStdY  
tBodyAccStdZ  
tGravityAccMeanX  
tGravityAccMeanY  
tGravityAccMeanZ  
tGravityAccStdX  
tGravityAccStdY  
tGravityAccStdZ  
tBodyAccJerkMeanX  
tBodyAccJerkMeanY  
tBodyAccJerkMeanZ  
tBodyAccJerkStdX  
tBodyAccJerkStdY  
tBodyAccJerkStdZ  
tBodyGyroMeanX  
tBodyGyroMeanY  
tBodyGyroMeanZ  
tBodyGyroStdX  
tBodyGyroStdY  
tBodyGyroStdZ  
tBodyGyroJerkMeanX  
tBodyGyroJerkMeanY  
tBodyGyroJerkMeanZ  
tBodyGyroJerkStdX  
tBodyGyroJerkStdY  
tBodyGyroJerkStdZ  
tBodyAccMagMean  
tBodyAccMagStd  
tGravityAccMagMean  
tGravityAccMagStd  
tBodyAccJerkMagMean  
tBodyAccJerkMagStd  
tBodyGyroMagMean  
tBodyGyroMagStd  
tBodyGyroJerkMagMean  
tBodyGyroJerkMagStd  
fBodyAccMeanX  
fBodyAccMeanY  
fBodyAccMeanZ  
fBodyAccStdX  
fBodyAccStdY  
fBodyAccStdZ  
fBodyAccMeanFreqX  
fBodyAccMeanFreqY  
fBodyAccMeanFreqZ  
fBodyAccJerkMeanX  
fBodyAccJerkMeanY  
fBodyAccJerkMeanZ  
fBodyAccJerkStdX  
fBodyAccJerkStdY  
fBodyAccJerkStdZ  
fBodyAccJerkMeanFreqX  
fBodyAccJerkMeanFreqY  
fBodyAccJerkMeanFreqZ  
fBodyGyroMeanX  
fBodyGyroMeanY  
fBodyGyroMeanZ  
fBodyGyroStdX  
fBodyGyroStdY  
fBodyGyroStdZ  
fBodyGyroMeanFreqX  
fBodyGyroMeanFreqY  
fBodyGyroMeanFreqZ  
fBodyAccMagMean  
fBodyAccMagStd  
fBodyAccMagMeanFreq  
fBodyAccJerkMagMean  
fBodyAccJerkMagStd  
fBodyAccJerkMagMeanFreq  
fBodyGyroMagMean  
fBodyGyroMagStd  
fBodyGyroMagMeanFreq  
fBodyGyroJerkMagMean  
fBodyGyroJerkMagStd  
fBodyGyroJerkMagMeanFreq  
angleTBodyAccMeanGravity  
angleTBodyAccJerkMeanGravityMean  
angleTBodyGyroMeanGravityMean  
angleTBodyGyroJerkMeanGravityMean  
angleXGravityMean  
angleYGravityMean  
angleZGravityMean  
