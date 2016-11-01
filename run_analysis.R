install.packages("dplyr")
library(dplyr)

install.packages("data.table")
library(data.table)




#Create file and Download data
if (!file.exists("datatest")) {dir.create("datatest")}
fileurl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "./datatest/datatest.zip")

#Unzip Files
zipfile <- "./datatest/datatest.zip"
outputdir<- "./datatest"
unzip(zipfile,exdir=outputdir)

path_data <- "./datatest/UCI HAR Dataset"

#1.Merges the training and the test sets to create one data set.
#i. Get/read Data and assign var
ActivityTest  <- read.table(file.path(path_data, "test" , "Y_test.txt" ),header = FALSE)
ActivityTrain <- read.table(file.path(path_data, "train", "Y_train.txt"),header = FALSE)
SubjectTrain <- read.table(file.path(path_data, "train", "subject_train.txt"),header = FALSE)
SubjectTest  <- read.table(file.path(path_data, "test" , "subject_test.txt"),header = FALSE)
FeaturesTest  <- read.table(file.path(path_data, "test" , "X_test.txt" ),header = FALSE)
FeaturesTrain <- read.table(file.path(path_data, "train", "X_train.txt"),header = FALSE)

#ii.Merge data
Subject <- rbind(SubjectTrain, SubjectTest)
Activity<- rbind(ActivityTrain, ActivityTest)
Features<- rbind(FeaturesTrain, FeaturesTest)

#iii. Names
names(Subject)<-c("subject")
names(Activity)<- c("activity")
FeaturesNames <- read.table(file.path(path_data, "features.txt"),head=FALSE)
names(Features)<- FeaturesNames$V2

#iv. Merge Columns
Combine <- cbind(Subject, Activity)
Data <- cbind(Features, Combine)


#2.Extracts only the measurements on the mean and standard deviation for each measurement.

#i. Pattern matching
Mean_Std_FeaturesNames <- FeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", FeaturesNames$V2)]

#ii. SUbject and Activity SUbset
Subject_Activity<-c(as.character(Mean_Std_FeaturesNames), "subject", "activity" )
Data<-subset(Data,select=Subject_Activity)

#3. Uses descriptive activity names to name the activities in the data set

#i. activity names
activity_Labels <- read.table(file.path(path_data, "activity_labels.txt"),header = FALSE)

#ii. create new column with descriptive names (rather than renaming acitivities in Data)

Data <- merge(Data, activity_Labels, by.x = "activity", by.y = "activityID")


## ==> Factorize
#check
edit(Data)

#4. Appropriately labels the data set with descriptive variable names.


names(Data)<-gsub("^t", "Time", names(Data))
names(Data)<-gsub("^f", "Frequency", names(Data))
names(Data)<-gsub("-freq()", "Frequency", names(Data), ignore.case = TRUE)
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("tBody", "TimeBody", names(Data))
## change new column name
names(Data)<-gsub("activity_Label.x", "activity_Label", names(Data))

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
independenttidydata <- aggregate(. ~subject + activity, Data, mean)


# Export tidy datda (independenttidydata)
write.table(independenttidydata, './datatest/independenttidydata.txt',row.names=TRUE,sep='\t')









