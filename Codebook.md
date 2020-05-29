# Codebook.md
## Human Activity Recognition Using Smartphones Dataset Version 1.0C
Codebook explaining the different variables and functions used and the transformations applied in scripts for data cleaning project.
### filenames

 - home_dir : parent folder containing data files 
 - activitylabels_dir : file containing activity text labels
 - features_dir : file containing features name
 - Xtrain_dir : training data
 - ytrain_dir : training label data
 - subtrain_dir : file for subject numbers for training observations
 - Xtest_dir : testing data
 - ytest_dir : test label data
 - subtest_dir : file for subject numbers for test observations
### variables
 - X : Contains joined train and test observations.
 - y : Contains joined labels for train and test observations.
 - sub : Contains joined list of subjects from train and test observations.
 - labels : The proper text based activity labels.
 - ylabelled : Table y with its integer labels substituted by text labels from "labels".
 - Xcolnames : Column names to keep based on the given criteria.
 - Xcolsub : Column numbers to keep based on the given criteria.
 - Xfinal : The data set with only the required columns as per criteria
 - data : Total set of observations combined with activity labels and subject numbers.
 - Avgdata :  Stores the final result grouped by activity and subject with average value of all features for each group.

### The various transformations we run on the raw dataset are:
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

