# This script run_analysis.R achieves the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#The functions used here need to be sourced from the utility script.
source("./run_analysis_util.R")


setwd(home_dir)
download()


#Load Xtrain, Xtest, and join them to create X
print("Loading Xtrain")
Xtrain <- loadfile(home_dir, Xtrain_dir, view = FALSE)
print("Loading Xtest")
Xtest <- loadfile(home_dir, Xtest_dir,view = FALSE)
print("Joining Xtrain and Xtest")
X <- rjoin(Xtrain, Xtest)

#Load ytrain, ytest, and join them to create y
print("Loading ytrain")
ytrain <- loadfile(home_dir, ytrain_dir, view = FALSE)
print("Loading ytest")
ytest <- loadfile(home_dir, ytest_dir,view = FALSE)
print("Joining ytrain and ytest")
y <- rjoin(ytrain, ytest)

#Load subtrain, subtest, and join them to create sub
print("Loading subtrain")
subtrain <- loadfile(home_dir, subtrain_dir, view = FALSE)
print("Loading subtest")
subtest <- loadfile(home_dir, subtest_dir,view = FALSE)
print("Joining subtrain and subtest")
sub <- rjoin(subtrain, subtest)

#Load the feature names and activity labels
print("Loading features")
features <- loadfile(home_dir, features_dir, view = FALSE)
print("Loading activitylabels")
activitylabels <- loadfile(home_dir, activitylabels_dir, view = FALSE)


#Assign proper column names to X
print("Extracting featurelabels from table : features")
featurelabels <- features[,2]
#head(featurelabels)
#length(featurelabels)
print("Assigning proper text labels : featurelabels to the column names of X")
names(X) <- featurelabels

#Assign proper column names to y
print("Assigning proper text labels to the column names of y")
names(y) <- "activitylabels"

#Assign proper column names to sub
print("Assigning proper text labels to the column names of sub")
names(sub) <- "subjects"

#The values of y in the table are in the range [1,6]
#But they don't make much sense
#So we will change the integer labels with proper text labels
#The labels of the activities are present in the table
print("Extracting activity labels from table : activitylabels")
labels <- as.character(activitylabels[,2])
#labelledy is the moified table y with its integer labels substituted by text labels.
print("Applying text labels to the integer values in the labels table : y")
ylabelled <- data.frame(sapply(y, function(x) {labels[x]}))


#Now we will extract only the columns of X that have "mean" or "std" in their names
#Firstly we will need to exract the features that have "mean" or "std" in their names. Then subset X for only this columns.
#featurelabels contains all the column names for X
print("Extracting column names in X that contain the words mean or std using a regex" )
Xcolnames <- grep("[Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]", featurelabels, value = TRUE)
Xcolsub <- grepl("[Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]", featurelabels)
print("Subsetting X to contain only the selected columns")
if (sum(Xcolsub) == length(Xcolnames)){
        Xfinal <- X[Xcolsub]
}

#Now we can join the 3 individual tables Xfinal,y and sub.
print("Joining the 3 seperate tables : Data table X, Labels table y, Subjects table sub")
data <- cbind(Xfinal,ylabelled,sub)



#We will create another table with the average of each variable for each activity and each subject.
#We will use dplyr for that.
print("Loading dplyr library")
library(dplyr)

print("Creating another tidy dataset containing the mean of each variabe for every activity and every subject")
Avgdata <- data %>%
        group_by(activitylabels,subjects) %>%
        summarize_all(funs(mean))



print("Showing the first data table : data")
View(data)

print("Showing the second data table : Avgdata")
View(Avgdata)