CODEBOOK DESCRIBING VARIABLES:

The variables have been renamed using the following idea:

1.	leading t or f is based on time or frequency measurements.
2.	Body = related to body movement.
3.	Gravity = acceleration of gravity
4.	Acc = accelerometer measurement
5.	Gyro = gyroscopic measurements
6.	Jerk = sudden movement acceleration
7.	Mag = magnitude of movement
8.	mean and SD are calculated for each subject for each activity for each mean and SD measurements. The units given are g’s for the accelerometer and rad/sec for the gyro and g/sec and rad/sec/sec for the corresponding jerks.

As using the following Code:
names(dataTable)<-gsub("std()", "SD", names(dataTable))
names(dataTable)<-gsub("mean()", "MEAN", names(dataTable))
names(dataTable)<-gsub("^t", "time", names(dataTable))
names(dataTable)<-gsub("^f", "frequency", names(dataTable))
names(dataTable)<-gsub("Acc", "Accelerometer", names(dataTable))
names(dataTable)<-gsub("Gyro", "Gyroscope", names(dataTable))
names(dataTable)<-gsub("Mag", "Magnitude", names(dataTable))
names(dataTable)<-gsub("BodyBody", "Body", names(dataTable))

and this is how they look in the output file now:

"subject" "activityName" "activityNum" "timeBodyAccelerometer-MEAN()-X" "timeBodyAccelerometer-MEAN()-Y" "timeBodyAccelerometer-MEAN()-Z" "timeBodyAccelerometer-SD()-X" "timeBodyAccelerometer-SD()-Y" "timeBodyAccelerometer-SD()-Z" "timeGravityAccelerometer-MEAN()-X" "timeGravityAccelerometer-MEAN()-Y" "timeGravityAccelerometer-MEAN()-Z" "timeGravityAccelerometer-SD()-X" "timeGravityAccelerometer-SD()-Y" "timeGravityAccelerometer-SD()-Z" "timeBodyAccelerometerJerk-MEAN()-X" "timeBodyAccelerometerJerk-MEAN()-Y" "timeBodyAccelerometerJerk-MEAN()-Z" "timeBodyAccelerometerJerk-SD()-X" "timeBodyAccelerometerJerk-SD()-Y" "timeBodyAccelerometerJerk-SD()-Z" "timeBodyGyroscope-MEAN()-X" "timeBodyGyroscope-MEAN()-Y" "timeBodyGyroscope-MEAN()-Z" "timeBodyGyroscope-SD()-X" "timeBodyGyroscope-SD()-Y" "timeBodyGyroscope-SD()-Z" "timeBodyGyroscopeJerk-MEAN()-X" "timeBodyGyroscopeJerk-MEAN()-Y" "timeBodyGyroscopeJerk-MEAN()-Z" "timeBodyGyroscopeJerk-SD()-X" "timeBodyGyroscopeJerk-SD()-Y" "timeBodyGyroscopeJerk-SD()-Z" "timeBodyAccelerometerMagnitude-MEAN()" "timeBodyAccelerometerMagnitude-SD()" "timeGravityAccelerometerMagnitude-MEAN()" "timeGravityAccelerometerMagnitude-SD()" "timeBodyAccelerometerJerkMagnitude-MEAN()" "timeBodyAccelerometerJerkMagnitude-SD()" "timeBodyGyroscopeMagnitude-MEAN()" "timeBodyGyroscopeMagnitude-SD()" "timeBodyGyroscopeJerkMagnitude-MEAN()" "timeBodyGyroscopeJerkMagnitude-SD()" "frequencyBodyAccelerometer-MEAN()-X" "frequencyBodyAccelerometer-MEAN()-Y" "frequencyBodyAccelerometer-MEAN()-Z" "frequencyBodyAccelerometer-SD()-X" "frequencyBodyAccelerometer-SD()-Y" "frequencyBodyAccelerometer-SD()-Z" "frequencyBodyAccelerometerJerk-MEAN()-X" "frequencyBodyAccelerometerJerk-MEAN()-Y" "frequencyBodyAccelerometerJerk-MEAN()-Z" "frequencyBodyAccelerometerJerk-SD()-X" "frequencyBodyAccelerometerJerk-SD()-Y" "frequencyBodyAccelerometerJerk-SD()-Z" "frequencyBodyGyroscope-MEAN()-X" "frequencyBodyGyroscope-MEAN()-Y" "frequencyBodyGyroscope-MEAN()-Z" "frequencyBodyGyroscope-SD()-X" "frequencyBodyGyroscope-SD()-Y" "frequencyBodyGyroscope-SD()-Z" "frequencyBodyAccelerometerMagnitude-MEAN()" "frequencyBodyAccelerometerMagnitude-SD()" "frequencyBodyAccelerometerJerkMagnitude-MEAN()" "frequencyBodyAccelerometerJerkMagnitude-SD()" "frequencyBodyGyroscopeMagnitude-MEAN()" "frequencyBodyGyroscopeMagnitude-SD()" "frequencyBodyGyroscopeJerkMagnitude-MEAN()" "frequencyBodyGyroscopeJerkMagnitude-SD()"


