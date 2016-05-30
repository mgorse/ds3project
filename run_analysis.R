library(dplyr)

   #download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="har.zip")
#unzip("har.zip")
#file.rename("UCI HAR Dataset", "data")

names_raw <- read.table("data/features.txt", stringsAsFactors = FALSE)
# sanitize column names
cnames <- gsub("-|\\(|\\)", "_", names_raw[,2])
activitylabels <- read.table("data/activity_labels.txt")
activitylabels <- gsub("_", " ", activitylabels[,2]);

train<- read.table("data/train/X_train.txt")
trainsubj <- read.table("data/train/subject_train.txt")
trainact <- read.table("data/train/y_train.txt")
train <- cbind(train, trainsubj, trainact)
colnames(train) = c(cnames, "subject", "activity")

test<- read.table("data/test/X_test.txt")
testsubj <- read.table("data/test/subject_test.txt")
testact <- read.table("data/test/y_test.txt")
test <- cbind(test, testsubj, testact)
colnames(test) = c(cnames, "subject", "activity")

full <- rbind(train, test)

meancols <- grep("_mean__", cnames)
meancolnames <- grep("_mean__", cnames, value=TRUE)
stdcols <- grep("_std__", cnames)
stdcolnames <- grep("_std__", cnames, value=TRUE)

sub <- full[c(meancols, stdcols)]
subject <- full$subject
sub <- cbind(sub, subject)

activity <- as.factor(full$activity)
levels(activity) <- activitylabels
sub <- cbind(sub, activity)

tbl <- tbl_df(sub)
tbl <- group_by(tbl, subject, activity)

means = data.frame()
for (col in c(meancolnames, stdcolnames)) {
	obname <- gsub("_", "", col)
	obname <- sub("mean", "Mean", tabname)
	obname <- sub("std", "Std", tabname)
	eval(parse(text=paste0("tab <- summarize(tbl, mean(", col, "))")))
	tab <- cbind(obname, tab)
	colnames(tab) = c("observation", "subject", "activity", "mean")
	means <- rbind(means, tab)
}
