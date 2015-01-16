##Damien Edwards  
## Course Project 1 Getting and Cleaning Data


## 1.Merges the training and the test sets to create one data set.
train_x <- read.table("train/X_train.txt")
train_y <-read.table("train/y_train.txt")
test_x<-read.table("test/X_test.txt")
test_y<-read.table("test/y_test.txt")
subject_train<-read.table("train/subject_train.txt")
subject_test<-read.table("test/subject_test.txt")

Merge_1<-rbind(train_x ,test_x)
Merge_2<-rbind(train_y ,test_y)
Merge_3<-rbind(subject_train ,subject_test)

##2.Extracts only the measurements on the mean and standard deviation for each measurement. 

feature<- read.table("features.txt")
temp1<- grep("-mean\\(\\)|-std\\(\\)", feature[, 2])
Merge_1<-Merge_1[,temp1]
names(Merge_1)<-feature[temp1,2]
names(Merge_1)<-sub("\\(|\\)", "", names(Merge_1))
names(Merge_1) <- tolower(names(Merge_1))

##3.Uses descriptive activity names to name the activities in the data set
activity<- read.table("activity_labels.txt")
activity[, 2] = gsub("_", "", tolower(as.character(activity[, 2])))
Merge_2[,1] = activity[Merge_2[,1], 2]
names(Merge_2) <- "activity"

##4.Appropriately labels the data set with descriptive variable names. 
names(Merge_3)<- "subject"
Merge_4<-cbind(Merge_3,Merge_2,Merge_1)
write.table(Merge_4, "clean_data.txt")

##5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
Tidy_data<- melt(Merge_4, id.vars=c("subject", "activity"))
Tidy_data_comp<- dcast(Tidy_data, subject + activity ~ variable, mean)

## Write file with tidy data
write.table(Tidy_data_comp, "tidy_data.txt",row.name=FALSE )
