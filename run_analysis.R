<<<<<<< HEAD
# Getting and Cleaning Data Course Project
# This is the final project of the Getting and Cleaning Data Course
#install.packages("plyr")
#install.packages("dplyr")


library(plyr)
library(dplyr)
library(stringr)

ra <-function(){
#  setwd('C:/Users/J/Documents/R/GettingClean/data/UCI HAR Dataset')
  setwd('D:/R/GettingClean/data/UCI HAR Dataset')
  feat <- read.table('features.txt')
  activity <- read.table('activity_labels.txt')
  subject_test <- read.table('test/subject_test.txt')
  
  y_test <- read.table('test/y_test.txt')
#  #3
  y_test$stw <- plyr::mapvalues(y_test$V1, from = activity$V1, to =c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING'))
  X_test <- read.table('test/X_test.txt')
#  #4
  names(X_test) <-feat$V2
  names(subject_test) <- c('subject')
  names(y_test) <- c('numbers','activity')
  
  
  subject_train <- read.table('train/subject_train.txt')
  y_train <- read.table('train/y_train.txt')
#   #3  
  y_train$stw <- plyr::mapvalues(y_train$V1, from = activity$V1, to =c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING'))
  
  X_train <- read.table('train/X_train.txt')
  
  names(X_train) <-feat$V2
  names(subject_train) <- c('subject')
  names(y_train) <- c('numbers','activity')
  
  st <- data.frame(subject_test, y_test$activity)
  names(st) <- c('subject', 'activity')
  test <- data.frame(st, X_test)
  at <- data.frame(subject_train, y_train$activity)
  names(at) <- c('subject', 'activity')
  train <- data.frame(at, X_train)
#   #2  
  com <- rbind(test, train)
  comSTD <- select(com, contains("std"))
  comMEAN <- select(com, contains("mean"))
  comleft<- cbind(com[1:2], comMEAN)
  comALL <- cbind(comleft, comSTD)
#   #5  
  comSummary <-comALL %>% group_by(subject, activity) %>% summarise_all(mean)
  write.table(comSummary, file = "tidyset5.txt", row.names = FALSE)
  
  return(comALL)
  
  
=======
# Getting and Cleaning Data Course Project
# This is the final project of the Getting and Cleaning Data Course
#install.packages("plyr")
#install.packages("dplyr")


library(plyr)
library(dplyr)

ra <-function(){
  setwd('C:/Users/J/Documents/R/GettingClean/data/UCI HAR Dataset')
  feat <- read.table('features.txt')
  activity <- read.table('activity_labels.txt')
  subject_test <- read.table('test/subject_test.txt')
  
  y_test <- read.table('test/y_test.txt')
#  #3
  y_test$stw <- plyr::mapvalues(y_test$V1, from = activity$V1, to =c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING'))
  X_test <- read.table('test/X_test.txt')
#  #4
  names(X_test) <-feat$V2
  names(subject_test) <- c('subject')
  names(y_test) <- c('numbers','activity')
  
  
  subject_train <- read.table('train/subject_train.txt')
  y_train <- read.table('train/y_train.txt')
#   #3  
  y_train$stw <- plyr::mapvalues(y_train$V1, from = activity$V1, to =c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING'))
  
  X_train <- read.table('train/X_train.txt')
  
  names(X_train) <-feat$V2
  names(subject_train) <- c('subject')
  names(y_train) <- c('numbers','activity')
  
  st <- data.frame(subject_test, y_test$activity)
  names(st) <- c('subject', 'activity')
  test <- data.frame(st, X_test)
  at <- data.frame(subject_train, y_train$activity)
  names(at) <- c('subject', 'activity')
  train <- data.frame(at, X_train)
#   #2  
  com <- rbind(test, train)
  comSTD <- select(com, contains("std"))
  comMEAN <- select(com, contains("mean"))
  comleft<- cbind(com[1:2], comMEAN)
  comALL <- cbind(comleft, comSTD)
#   #5  
  comSummary <-comALL %>% group_by(subject, activity) %>% summarise_all(mean)
  write.table(comSummary, file = "tidyset5.txt", row.names = FALSE)
  
  return(comALL)
  
  
>>>>>>> f2ee751885a7f29d1886f6a9c02b0d1e92efadd7
}