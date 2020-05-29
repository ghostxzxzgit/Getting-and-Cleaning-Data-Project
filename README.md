# README.md
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
The data was collected from here : 
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## run_analysis.R
This script run_analysis.R achieves the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This script uses run_analysis_util.R to load the various files read them into tables, join them and do the transformations.
The definitive list is :

 - Load Xtrain, Xtest, and join them to create X.
 - Load ytrain, ytest, and join them to create y.
 - Load subtrain, subtest, and join them to create sub.
 - Load the feature names and activity labels.
 - Assign proper column names to X.
 -  Assign proper column names to y.
 -  Assign proper column names to sub.
 - The values of y in the table are in the range [1,6] But they don't make much sense So we will change the integer labels with proper text labels The labels of the activities are present in the table.
 - ylabelled is the moified table y with its integer labels substituted by text labels.
 - Now we will extract only those columns of X that have "mean" or "std" in their names. Firstly we will need to exract the features that have "mean" or "std" in their names. Then subset X for only this columns. 
 - featurelabels contains all the column names for X.
 - Now we can join the 3 individual tables Xfinal,y and sub. 
 - We will create another table with the average of each variable for each activity and each subject. We will use dplyr for that.
 - Grouping the data by activitylabels and subjects.
 - Then we are gonna find the mean for every column.
## run_analysis_util.R
This script loads the required variables for the files and the required functions.
The functions loaded are :
 - download() - To download the files if they don't exist.
 - loadfile() - To load the specified file into a dataframe and pass it to the assigned variable.
 - rjoin() - To check dimensions and join two tables row wise.
 - cjoin() - To check dimensions and join two tables column wise.
 
 ## Running the script 
 - The easiest way to run the script is to clone or download from this repo. That way the data will already be downloaded, unzipped and ready to operate on.
 - Set the *home_dir* in **run_analysis_util.R** as your project directory. All the other file directories are relative to this *home_dir*.
 - Then source("run_analysis_util.R")
 - Then source("run_analysis.R")
 - **run_analysis.R** automatically calls itself and all the other required functions. Finally shows the two generated tidy data sets.
 - Make sure your free RAM is greater than 150 MB before running the script. 
## FAQ
If you haven't downloaded the data from the git repo, then the script can automatically download the zip file from the given url. But unfortunately it can't unzip  the contents. The user needs to go to the project directory and unzip its contents. The rest of the script is automated. Just run it again.
