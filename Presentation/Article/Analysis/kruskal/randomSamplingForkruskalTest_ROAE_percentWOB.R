wobData <- read.csv("C:/MastersThesisProject/Data/MainData.csv")


#ROAE measures for percentage of WOB
roaeWOB <- wobData[,c("percentWOB","ROAE")]
roaeWOB$percentWOB <- as.numeric(roaeWOB$percentWOB)
meanPercentWOB <- mean(roaeWOB$percentWOB) #18.93878 

#Bivariate data. 
#Using mean to factor percentWOB into levels and store as new variable percentWOBGroup
roaeWOB$percentWOBGroup[roaeWOB$percentWOB == meanPercentWOB] <- 2 #exactly equal to 18.9 percentWOB
roaeWOB$percentWOBGroup[roaeWOB$percentWOB > meanPercentWOB] <- 1 #greater than 18.9 percentWOB
roaeWOB$percentWOBGroup[roaeWOB$percentWOB < meanPercentWOB] <- 0 #less than 18.9 percentWOB
#roaeWOB


#Count the rows for each group
groupZero <- nrow(subset(roaeWOB, roaeWOB$percentWOBGroup == 0)) #less than 18.9 percentWOB
groupOne <- nrow(subset(roaeWOB, roaeWOB$percentWOBGroup == 1)) #greater than 18.9 percentWOB
groupTwo <- nrow(subset(roaeWOB, roaeWOB$percentWOBGroup == 2)) #exactly equal to 18.9 percentWOB

#Randomly select for percentWOB greater than mean and less than mean
#Random selection of 15 observations in each.
#Exclude groupTwo since no obeservation is exactly equal to the mean
subSampleLess <- subset(roaeWOB, roaeWOB$percentWOBGroup == 0) #groupZero, less than mean
subSampleGreater <- subset(roaeWOB, roaeWOB$percentWOBGroup == 1) #groupOne, greater than mean

finalLess <- subSampleLess[sample(nrow(subSampleLess), 15), ]
finalGreater <- subSampleGreater[sample(nrow(subSampleGreater), 15), ]


#Create new data frame
finalSampleROAE <- rbind(finalLess, finalGreater) #ROAA for firms with percentWOB greater/less than mean of 18.9

#write sample to csv file
write.csv(finalSampleROAE, file="C:/MastersThesisProject/Data/randomSample_ROAE_percentWOBGroup.csv")