home_dir <- "~/R_projects/Getting and Cleaning Data/Project"
activitylabels_dir <- "UCI HAR Dataset/activity_labels.txt"
features_dir <- "UCI HAR Dataset/features.txt"
Xtrain_dir <- "UCI HAR Dataset/train/X_train.txt"
ytrain_dir <- "UCI HAR Dataset/train/y_train.txt"
subtrain_dir <- "UCI HAR Dataset/train/subject_train.txt"
Xtest_dir <- "UCI HAR Dataset/test/X_test.txt"
ytest_dir <- "UCI HAR Dataset/test/y_test.txt"
subtest_dir <- "UCI HAR Dataset/test/subject_test.txt"

download <- function(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", file = "UCI HAR Dataset"){
        if(!file.exists(file)){
                download.file(url, file, method = "curl")
                date <- date()
        }
        else{
                print("File already exists.")
        }
        
}

loadfile <- function(dir = home_dir, filename, view = FALSE){
        setwd(dir)
        if(file.exists(filename)){
                table <- read.table(filename)
        }
        if(view == TRUE){
                View(table)
        }
        cat("The dimensions of the loaded table are: ", (dim(table)), "\n")
        invisible(table)
}

rjoin <- function(table1, table2, details = FALSE){
        #You can pass either a loaded table or a 
        #Make sure to pass the train file as the file1dir.
        #Binding two tables using rbind or cbind binds in the given order.
        table1dim <- dim(table1)
        table2dim <- dim(table2)
        if(table1dim[2] == table2dim[2]){
                rtable <- rbind(table1, table2)
        }
        
        if (details == TRUE){
                print("The variable names are:")
                print(names(rtable))
                str(rtable)
                }
        cat("The dimensions of the loaded table are: ", (dim(rtable)), "\n")
        invisible(rtable)
        
        }

cjoin <- function(table1, table2, details = TRUE){
        #You can pass either a loaded table or a 
        #Make sure to pass the train file as the file1dir.
        #Binding two tables using rbind or cbind binds in the given order.
        if (details == TRUE){
                print("The variable names are:")
                names(table1)
                str(table1)
                
                print("The variable names are:")
                names(table2)
                str(table2)
        }
        
        table1dim <- dim(table1)
        table2dim <- dim(table2)
        if(table1dim[1] == table2dim[1]){
                ctable <- cbind(table1, table2)
        }
        cat("The dimensions of the loaded table are: ", (dim(ctable)), "\n")
        invisible(ctable)
        
}

