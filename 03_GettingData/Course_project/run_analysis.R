# set right working directory
setwd("~/Documents/R/courses/03_GettingData/Course_project")

# download required files:
data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("figures/init_dataset.zip"))
    download.file(data_url, "figures/init_dataset.zip", method = "curl")
unzip("figures/init_dataset.zip", exdir = "figures")

#header for X files
h <- as.character(read.table("figures/UCI HAR Dataset/features.txt")[[2]])
# need to remove parethesis and tire
h <- gsub("\\(\\)", "", h)
h <- gsub("-", "_", h)
h <- gsub("^t", "TDS_", h)
h <- gsub("^f", "FDS_", h)
h <- gsub("BodyBody", "Body", h)
h <- gsub("Body", "body_", h)
h <- gsub("Gravity", "gravity_", h)
h <- gsub("Acc", "accelerometer_", h)
h <- gsub("Gyro", "gyroscope_", h)
h <- gsub("Jerk", "jerk_", h)
h <- gsub("Mag", "magnitude_", h)
h <- gsub("__", "_", h)

# vector with needed fields - means and standart deviations
h_m_sd <- h[grep("_mean_[X-Z]$|_std", h)]


# to read only means and standart deviation I need vector with classes
col_Classes <- rep("NULL", length(h))
col_Classes[h %in% h_m_sd] <- "numeric"

# meaning of activities
activity_labels <- as.character(read.table("figures/UCI HAR Dataset/activity_labels.txt")[[2]])

#read train&test X datasets (main measurement)
data_X <- rbind(
    read.table("figures/UCI HAR Dataset/train/X_train.txt",
               sep = "",  header = FALSE, strip.white = TRUE,
               colClasses = col_Classes, col.names = h),
    read.table("figures/UCI HAR Dataset/test/X_test.txt",
               sep = "",  header = FALSE, strip.white = TRUE,
               colClasses = col_Classes, col.names = h)
        )
# read train & test Y datasets (activity codes)
data_Y <- rbind(
    read.table("figures/UCI HAR Dataset/train/y_train.txt"),
    read.table("figures/UCI HAR Dataset/test/y_test.txt"))[[1]]
    
#read train & test subjects dataset
data_S <- rbind(
    read.table("figures/UCI HAR Dataset/train/subject_train.txt"),
    read.table("figures/UCI HAR Dataset/test/subject_test.txt"))[[1]]

# combine all together (main measurements + activity type + subject)
data_main <- cbind("subject" = data_S, "activity" = activity_labels[data_Y], data_X)


# Means for every metric for each subject and activity type
data_means <- aggregate(. ~ activity + subject, data_main, mean)


#writing result to the file.
write.table(data_means, "figures/data_means.txt", row.name = FALSE)

