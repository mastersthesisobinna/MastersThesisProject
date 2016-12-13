wobData <- read.csv("C:/MastersThesisProject/Data/MainData.csv")

#ROAA measures for percentage of WOB
roaaWOB <- wobData[,c("percentWOB","ROAA")]
roaaWOB$percentWOB <- as.numeric(roaaWOB$percentWOB)
meanPercentWOB <- mean(roaaWOB$percentWOB) #18.93878

#Bivariate data. 
#Using mean to factor percentWOB into levels and store as new variable percentWOBGroup
roaaWOB$percentWOBGroup[roaaWOB$percentWOB == meanPercentWOB] <- 2 #exactly equal to 18.9 percentWOB
roaaWOB$percentWOBGroup[roaaWOB$percentWOB > meanPercentWOB] <- 1 #greater than 18.9 percentWOB
roaaWOB$percentWOBGroup[roaaWOB$percentWOB < meanPercentWOB] <- 0 #less than 18.9 percentWOB
#roaaWOB


#Count the rows for each group
groupZero <- nrow(subset(roaaWOB, roaaWOB$percentWOBGroup == 0)) #less than 18.9 percentWOB
groupOne <- nrow(subset(roaaWOB, roaaWOB$percentWOBGroup == 1)) #greater than 18.9 percentWOB
groupTwo <- nrow(subset(roaaWOB, roaaWOB$percentWOBGroup == 2)) #exactly equal to 18.9 percentWOB

#Randomly select for percentWOB greater than mean and less than mean
#Random selection of 15 observations in each.
#Exclude groupTwo since no obeservation is exactly equal to the mean
subSampleLess <- subset(roaaWOB, roaaWOB$percentWOBGroup == 0) #groupZero, less than mean
subSampleGreater <- subset(roaaWOB, roaaWOB$percentWOBGroup == 1) #groupOne, greater than mean

finalLess <- subSampleLess[sample(nrow(subSampleLess), 15), ]
finalGreater <- subSampleGreater[sample(nrow(subSampleGreater), 15), ]


#Create new data frame
finalSampleROAA <- rbind(finalLess, finalGreater) #ROAA for firms with percentWOB greater/less than mean of 18.9

#Write sample to csv file
write.csv(finalSampleROAA, file="C:/MastersThesisProject/Data/randomSample_ROAA_percentWOBGroup.csv")