# R script for the 3rd Week Data cleaning Project
if(!file.exists(".//Proj")){dir.create(".//Proj")}
Url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
download.file(Url,destfile=".//Proj/Dataset.zip", mode='wb')
###Unzip DataSet to /data directory
unzip(zipfile=".//Proj/Dataset.zip",exdir=".//Proj")
# Load the following packages
###Load required packages
library(dplyr)
library(data.table)
library(tidyr)
## Reading individual files and creating data tables
path <- "C:/Users/Hafiz/Documents/Proj/UCI HAR Dataset"
# Reading Activity files
ATrain <- tbl_df(read.table(file.path(path, "train", "y_train.txt")))
ATest  <- tbl_df(read.table(file.path(path, "test" , "y_test.txt" )))
# Reading Subject files
STrain <- tbl_df(read.table(file.path(path, "train", "subject_train.txt")))
STest  <- tbl_df(read.table(file.path(path, "test" , "subject_test.txt" )))
#Reading data files
DTrain <- tbl_df(read.table(file.path(path, "train", "X_train.txt" )))
DTest  <- tbl_df(read.table(file.path(path, "test" , "X_test.txt" )))
####Step 1 #### Merging Training and Test sets ### Step 1####
### We will merge the Training and test sets by row binding and rename the variables as below
MergedSubject <- rbind(STrain, STest)
setnames(MergedSubjet, "V1", "subject")
MergedActivity<- rbind(ATrain, ATest)
setnames(MergedActivity, "V1", "activityNum")
#Merging the DATA files from train and test folders
MergedData <- rbind(DTrain, DTest)
### naming variables by feature e.g.(V1 = "tBodyAcc-mean()-X")
Features <- tbl_df(read.table(file.path(path, "features.txt")))
setnames(Features, names(Features), c("featureNum", "featureName"))
colnames(MergedData) <- Features$featureName
## Renaming columns in Activity table.
activityLabels<- tbl_df(read.table(file.path(path, "activity_labels.txt")))
setnames(activityLabels, names(activityLabels), c("activityNum","activityName"))
### Merging columns from the 3 tables
MergedSubject<- cbind(MergedSubject, MergedActivity)
MergedData <- cbind(MergedSubject, MergedData)
####Step 2 ### Extracting only the measurements on the mean and standard deviation for each measurement### Step 2 ###
# Reading "features.txt" and extracting only the mean and standard deviation
MeanSTD <- grep("mean\\(\\)|std\\(\\)",Features$featureName,value=TRUE) #var name

# Taking only measurements for the mean and standard deviation and add "subject","activityNum"

MeanSTD <- union(c("subject","activityNum"), MeanSTD)
MergedData<- subset(MergedData,select=MeanSTD) 
#### Step 3 ####Using descriptive activity names to name the activities in the data set#### Step 3 ####
##enter name of activity into MergedData
MergedData <- merge(activityLabels, MergedData , by="activityNum", all.x=TRUE)
MergedData$activityName <- as.character(MergedData$activityName)

## create MergedData with variable means sorted by subject and Activity
MergedData$activityName <- as.character(MergedData$activityName)
dataAggrigated<- aggregate(. ~ subject - activityName, data = MergedData, mean) 
MergedData<- tbl_df(arrange(dataAggrigated,subject,activityName))

####Step 4 #### Appropriately labels the data set with descriptive variable names ####Step 4 ####

names(MergedData)<-gsub("std()", "SD", names(MergedData))
names(MergedData)<-gsub("mean()", "MEAN", names(MergedData))
names(MergedData)<-gsub("^t", "time", names(MergedData))
names(MergedData)<-gsub("^f", "frequency", names(MergedData))
names(MergedData)<-gsub("Acc", "Accelerometer", names(MergedData))
names(MergedData)<-gsub("Gyro", "Gyroscope", names(MergedData))
names(MergedData)<-gsub("Mag", "Magnitude", names(MergedData))
names(MergedData)<-gsub("BodyBody", "Body", names(MergedData))

#### Step 5 #### From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject #### Step 5 ####
write.table(MergedData, ".//Proj/TidyDataSet.txt", row.name=FALSE)
