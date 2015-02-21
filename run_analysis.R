###Subject

subjecttrain <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
subjecttest <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
subject <- rbind(subjecttrain,subjecttest)
colnames(subject) <- c("subject")


###ACTIVITY
activitytrain <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")

activitytrain$V1 <- as.character(activitytrain$V1)

activitytrain$V1[activitytrain$V1 == "1"] <- "WALKING"
activitytrain$V1[activitytrain$V1 == "2"] <- "WALKING_UPSTAIRS"
activitytrain$V1[activitytrain$V1 == "3"] <- "WALKING_DOWNSTAIRS"
activitytrain$V1[activitytrain$V1 == "4"] <- "SITTING"
activitytrain$V1[activitytrain$V1 == "5"] <- "STANDING"
activitytrain$V1[activitytrain$V1 == "6"] <- "LAYING"

activitytest <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")


activitytest$V1 <- as.character(activitytest$V1)

activitytest$V1[activitytest$V1 == "1"] <- "WALKING"
activitytest$V1[activitytest$V1 == "2"] <- "WALKING_UPSTAIRS"
activitytest$V1[activitytest$V1 == "3"] <- "WALKING_DOWNSTAIRS"
activitytest$V1[activitytest$V1 == "4"] <- "SITTING"
activitytest$V1[activitytest$V1 == "5"] <- "STANDING"
activitytest$V1[activitytest$V1 == "6"] <- "LAYING"


activity <- rbind(activitytrain, activitytest)
colnames(activity) <- c("activity")



###DATA
datatrain <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")

datatest <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")

data <- rbind(datatrain, datatest)


features <- read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
features <- features$V2
colnames(data) <- features


library(dplyr)
library(data.table)
data <- data.table(data)
data <- select(data, contains("mean"), contains("std") )


data <- cbind(subject, activity, data)

dataSTEP5 <- data %>% group_by(subject, activity)
dataSTEP5 <- dataSTEP5 %>% summarise_each(funs(mean))
write.table(dataSTEP5, file = "run_analysis.txt", row.name = F)
