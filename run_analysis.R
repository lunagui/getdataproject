## This script is to get the tidy data which is  average
## of each variable for each activity and each subject.
### Befor you run this script, 
### you should follow the Instruction list of README.md at first.

## read train data
x_train <- read.table("X_train.txt", stringsAsFactors=FALSE)
y_train <- read.table("y_train.txt", stringsAsFactors=FALSE)
subject_train <- read.table("subject_train.txt", stringsAsFactors=FALSE)
### conbind train data with subject and y(lables)
train <- cbind(subject_train, x_train, y_train)

## read test data
x_test <- read.table("X_test.txt", stringsAsFactors=FALSE)
y_test <- read.table("y_test.txt", stringsAsFactors=FALSE)
subject_test <- read.table("subject_test.txt", stringsAsFactors=FALSE)
### conbind test data with subject and y(lables)
test <- cbind(subject_test, x_test, y_test)

## merge two table
DT <-rbind(train,test)

## get colum names based on features
features <- read.table("features.txt",stringsAsFactors=FALSE)
names <- c("subject", features$V2,"activity_labels")
names(DT) <- names

## get activity labels
activity_labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)
labels <- activity_labels$V2
DT$activity_labels <- as.character(DT$activity_labels)
for(i in 1:6){### change the column vluse to descriptive name
        DT$activity_labels[DT$activity_labels==i] <- labels[i]
}

## subset data of the measurements on the mean and standard deviation
meannum <- grep("mean()", names(DT))
stdnum <- grep("std()", names(DT))
num <- sort(c(meannum,stdnum))
library(dplyr)
subsetDT <- select(DT, subject, num, activity_labels)
## change names and lables to tidy data
names(subsetDT) <- gsub("*-*_*)*", "", names(subsetDT))
names(subsetDT) <- gsub("\\(", "", names(subsetDT))
names(subsetDT) <- tolower(names(subsetDT))
subsetDT$activitylabels <- gsub("_","",subsetDT$activitylabels)
subsetDT$activitylabels <- tolower(subsetDT$activitylabels)

## get tidy average data
df <-matrix(data=NA, 30*6,79)### inital empty data frame
labels <- gsub("_","",tolower(activity_labels$V2))
for(i in 1:30){### based on each subject
        for(j in 1:6){### based on each activity
                x <- filter(subsetDT, subject==i & activitylabels==labels[j]) 
                subx <- select(x,-c(subject,activitylabels))
                df[j+(i-1)*6,] <- colMeans(subx)
        }    
}
### tidy data to final data frame called average
subject <- rep(1:30, each=6)
ctivity <- rep(labels, times=30)
average <- as.data.frame(cbind(subject,df,activity))
names(average) <- names(subsetDT)

## write average data to text
write.table(average,"average.txt", row.names = FALSE)
