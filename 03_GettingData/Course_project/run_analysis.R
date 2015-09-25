 
#header of file
h <- as.character(read.table("figures/UCI HAR Dataset/features.txt")[[2]])

# to read only means and standatr deviation I need vector with classes
col_Classes <- rep("NULL", length(h))
col_Classes[grep("mean\\(\\)|std\\(\\)", h)] <- "numeric"

activity_labels <- as.character(read.table("figures/UCI HAR Dataset/activity_labels.txt")[[2]])

data_train <- read.table("figures/UCI HAR Dataset/train/X_train.txt",
                         sep = "",  header = FALSE, strip.white = TRUE,
                         colClasses = col_Classes, col.names = h)

activity_train <- activity_labels[read.table("figures/UCI HAR Dataset/train/y_train.txt")[[1]]]
data_train$activity <- activity_train

data_test <- read.table("figures/UCI HAR Dataset/test/X_test.txt",
                         sep = "",  header = FALSE, strip.white = TRUE,
                         colClasses = col_Classes, col.names = h)
activity_test <- activity_labels[read.table("figures/UCI HAR Dataset/test/y_test.txt")[[1]]]
data_test$activity <- activity_test

data_total <- rbind(data_train, data_test)

means <- by(data_total[, 1:66], as.factor(data_total$activity), colMeans)

sapply(as.list(means), function(x) x)
