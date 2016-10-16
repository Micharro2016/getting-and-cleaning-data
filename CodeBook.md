
#Getting and Cleaning Data Project Code Book
Detailed information regarding the variables and the calculations used for this project.

##Raw Data
Wearable Computing data from Samsung's Galaxy smartphone. 

[Data Description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) <br />
[Raw Data Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

##Raw Data Description

•	Data from volunteers wearing a Samsung Galaxy Smartphone on the waist <br />
•	Total number of volunteers 30, within the age group 19 to 48 <br />
•	Volunteers performed six activities: walking, walking_upstairs, walking_downstairs, sitting, standing and laying <br />
•	Dataset randomly partitioned into two (70% of volunteers generetaed the training data and the rest the test data) <br />

##Data Set

####1.One data set was created by merging the training and the test sets. 

#####The following data sets were created first by merging the training and test data
•	Subject data set <br />
•	Activity data set <br />
•	Features data set <br />

The one Data set was then created by firstly merging the Subject and Activity data sets and the resulting one was then merged with the Features data set. Finally, the required data was extracted from the One Data Set (measurements on the mean and standard deviation for each observation).

####2.Tidy Data set

#####Descriptive Activity Labels were added to the data set. 

The following descriptive variables were created:

-Time, Frequency, Accelerometer, Gyroscope, Body, Magnitude, TimeBody. 

####3.Independent tidy data set

From the data set created in step 3, a new and final independent tidy data set was created, with the average of each variable for each Activity/ Subject.




