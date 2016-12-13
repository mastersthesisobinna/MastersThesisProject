wobData <- read.csv("C:/MastersThesisProject/Data/MainData.csv")

#format characteristics of the data
wobData$firm <- as.character(wobData$firm )
wobData$ticker <- as.character(wobData$ticker)
wobData$Board <- as.numeric(wobData$Board)
wobData$WOB <- as.numeric(wobData$WOB)
wobData$Sector <- as.character(wobData$Sector)
wobData$State <- as.character(wobData$State)
wobData$City <- as.character(wobData$City)
wobData$Country <- as.character(wobData$Country)
wobData$percentWOB <- as.numeric(wobData$percentWOB)


#Scatter plot linear regression analysis for degree of correlation between percent of WOB and ROAA
#plot(x, y)
plot(wobData$percentWOB, wobData$ROAE, main="Scatterplot Diagram", xlab="percentWOB", ylab="ROAE", pch=19, las=1)

