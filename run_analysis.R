library(reshape2)
library(data.table)

data_URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("data.zip")) download.file(data_URL,"data.zip")
if (!file.exists("UCI HAR Dataset")) unzip(zipfile = "data.zip")

activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")
setnames(activity_labels,c("act_no","activity"))

#Load all the data for the tests
test_data<-read.table("UCI HAR Dataset/test/X_test.txt")

#Load all the data for the training
train_data<-read.table("UCI HAR Dataset/train/X_train.txt")

#Combine both datasets
data<-as.data.table(rbind(test_data,train_data))

#Read the labels from file and set as column names
labels<-make.names(c(read.table("UCI HAR Dataset/features.txt",stringsAsFactors =FALSE)[,2]))
setnames(data,labels)

#Select only the data with mean() or std() in their column name
selected_cols<-c(grep("*mean\\.|*std\\.",labels))
selected_data<-subset(data,select = selected_cols)


#Read the activity names and subject id's for test and train set
test_y<-read.table("UCI HAR Dataset/test/y_test.txt")
test_subjects<-read.table("UCI HAR Dataset/test/subject_test.txt")
test_desc<-cbind(test_subjects,test_y)

train_y<-read.table("UCI HAR Dataset/train/y_train.txt")
train_subjects<-read.table("UCI HAR Dataset/train/subject_train.txt")
train_desc<-cbind(train_subjects,train_y)

#Combine descriptions of test and train dataset and give columns names
desc<-rbind(test_desc,train_desc)
setnames(desc,c("subject_id","act_no"))

#Transform the activity numbers into descriptive names by merging desc with activity_labels
desc<-merge(desc,activity_labels)[,c(2,3)]

#Combine description with dataset
data_clean<-cbind(desc,selected_data)

melted<-melt(data_clean,id=c(1,2))
cast<-dcast(melted, activity + subject_id ~ variable ,fun.aggregate = mean)
tidy_data<-melt(cast,id=c(1,2))

#Write tidy dataset to a csv file
write.table(tidy_data,"tidy_data.txt",row.names=FALSE)
