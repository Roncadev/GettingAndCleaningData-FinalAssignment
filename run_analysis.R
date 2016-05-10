# Getting and Cleaning Data : Final Assignment
# ============================================
# Loading the dplyr library
library(dplyr)

# Download file in a new directory dedicated to the Assignment
# If the directory do not exists a new directory will be created
if(!file.exists("./Assignment")){dir.create("./Assignment")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./Assignment/UCIHARDataset.zip")

# The file is a zip file. This step unzip the file in the working directory
unzip("./Assignment/UCIHARDataset.zip", exdir = "./Assignment")

# Load files
myDataSetFeatures <- read.table("./Assignment/UCI HAR Dataset/features.txt", header = FALSE)
myDataSetActivities <- read.table("./Assignment/UCI HAR Dataset/activity_labels.txt", header = FALSE)

# 1 - Merges the training and the test sets to create one data set.
# myDataSet will be created binding the subjects, the activities and the measures 
myDataSet <- cbind.data.frame((rbind.data.frame(read.table("./Assignment/UCI HAR Dataset/train/subject_train.txt")
                                                , read.table("./Assignment/UCI HAR Dataset/test/subject_test.txt"))),
                              (rbind.data.frame(read.table("./Assignment/UCI HAR Dataset/train/y_train.txt")
                                                , read.table("./Assignment/UCI HAR Dataset/test/y_test.txt"))),
                              (rbind.data.frame(read.table("./Assignment/UCI HAR Dataset/train/X_train.txt")
                                                , read.table("./Assignment/UCI HAR Dataset/test/X_test.txt"))))

# Renames the myDataSet variables
names(myDataSet) <- c("IDsubject", "IDactivities", as.character(myDataSetFeatures$V2))

# 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
# selecting the mean and standard deviation variables
myDataSetExtracted <- subset(myDataSet, select = c("IDsubject", "IDactivities", grep("mean\\()|std\\()", myDataSetFeatures$V2, value = TRUE)))


# 3 - Uses descriptive activity names to name the activities in the data set
# Renames the myDataSetActivities variables
names(myDataSetActivities) <- c("IDactivities","Activity")

# Removing the IDactivities column
myDataSetExtracted <- merge(myDataSetActivities, myDataSetExtracted, by="IDactivities")
myDataSetExtracted <- myDataSetExtracted[-1]

# 4 - Appropriately labels the data set with descriptive variable names.
# renaming the variables substituting some text
names(myDataSetExtracted) <- sub("^t","time", names(myDataSetExtracted))
names(myDataSetExtracted) <- sub("^f","frequency", names(myDataSetExtracted))
names(myDataSetExtracted) <- sub("Gyro","Gyroscope", names(myDataSetExtracted))
names(myDataSetExtracted) <- sub("Acc","Acceleration", names(myDataSetExtracted))

# 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# preparing final result by grouping data
myDataSetFinal <- myDataSetExtracted %>%
  group_by(IDsubject,Activity) %>%
  summarise_each(funs(mean))

# Creating Output file "FinalResult.txt"
write.table(myDataSetFinal, file = "./Assignment/FinalResult.txt", row.names = FALSE)
