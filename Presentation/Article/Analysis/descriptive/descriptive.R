if (!require("xtable")) {
  install.packages("xtable", repos="http://cran.rstudio.com/") 
  library("xtable")
}
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

wobDataSubset <- wobData[,2:17] #exclude the first column of the sample data.
names(wobDataSubset)

#mean
incomeMean <- mean(wobDataSubset$netIncome2015)
asset2014Mean <- mean(wobDataSubset$asset2014)
asset2015Mean <- mean(wobDataSubset$asset2015)
stock2014Mean <- mean(wobDataSubset$stock2014)
stock2015Mean <- mean(wobDataSubset$stock2015)
roaaMean <- mean(wobDataSubset$ROAA)
roaeMean <- mean(wobDataSubset$ROAE)
boardMean <- mean(wobDataSubset$Board)
wobMean <- mean(wobDataSubset$WOB)
percentWOBMean <- mean(wobDataSubset$percentWOB)
allAverages <- c(incomeMean, asset2014Mean, asset2015Mean, stock2014Mean, stock2015Mean, roaaMean, roaeMean, boardMean, wobMean, percentWOBMean)

#max
incomeMax <- max(wobDataSubset$netIncome2015)
asset2014Max <- max(wobDataSubset$asset2014)
asset2015Max <- max(wobDataSubset$asset2015)
stock2014Max <- max(wobDataSubset$stock2014)
stock2015Max <- max(wobDataSubset$stock2015)
roaaMax <- max(wobDataSubset$ROAA)
roaeMax <- max(wobDataSubset$ROAE)
boardMax <- max(wobDataSubset$Board)
wobMax <- max(wobDataSubset$WOB)
percentWOBMax <- max(wobDataSubset$percentWOB)
allMax <- c(incomeMax, asset2014Max, asset2015Max, stock2014Max, stock2015Max, roaaMax, roaeMax, boardMax, wobMax, percentWOBMax)

#min
incomeMin <- min(wobDataSubset$netIncome2015)
asset2014Min <- min(wobDataSubset$asset2014)
asset2015Min <- min(wobDataSubset$asset2015)
stock2014Min <- min(wobDataSubset$stock2014)
stock2015Min <- min(wobDataSubset$stock2015)
roaaMin <- min(wobDataSubset$ROAA)
roaeMin <- min(wobDataSubset$ROAE)
boardMin <- min(wobDataSubset$Board)
wobMin <- min(wobDataSubset$WOB)
percentWOBMin <- min(wobDataSubset$percentWOB)
allMin <- c(incomeMin, asset2014Min, asset2015Min, stock2014Min, stock2015Min, roaaMin, roaeMin, boardMin, wobMin, percentWOBMin)


rowNames <- c("netIncome2015", "asset2014", "asset2015", "stock2014", "stock2015", "ROAA", "ROAE", "Board", "WOB", "percentWOB")
  
descriptiveDF <- data.frame(rowNames, allMin, allMax, allAverages)
changeRowNames <- data.frame(name=c("",
                       " ",
                       "  ",
                       "   ",
                       "    ",
                       "     ",
                       "      ",
                       "       ",
                       "        ",
                       "         "))
row.names(descriptiveDF) <- changeRowNames$name
colnames(descriptiveDF) <- c("Variable", "Min", "Max", "Mean")

#copy the output of xtable, which produces a table object and paste in latex document
xtable(descriptiveDF, caption="Descriptive Statistics: Showing the mininum, maximum, and average statistics for only selected variables included in the sample", label="percentWomen")
