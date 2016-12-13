setwd("C:/MastersThesisProject/") #set currently directory to find saved workspace
source(file="loadWorkspaceHistory.R") #load the workspace and history upon starting


financialCSV <- read.csv("C:/MastersThesisProject/Data/Financials/financials.csv")
wobCSV <- read.csv("C:/MastersThesisProject/Data/WOB/wob.csv")

financial <- financialCSV
financial$ticker <- as.character(financial$ticker)
financial$firm <- as.character(financial$firm)
financial$netIncome2015 <- as.numeric(financial$netIncome2015)
financial$asset2015 <- as.numeric(financial$asset2015)
financial$asset2014 <- as.numeric(financial$asset2014)
financial$stock2015 <- as.numeric(financial$stock2015)
financial$stock2014 <- as.numeric(financial$stock2014)
financial$ROAA <- as.numeric(financial$ROAA)
financial$ROAE <- as.numeric(financial$ROAE)

women <- wobCSV
women$firm <- as.character(women$firm)
women$Board <- as.numeric(women$Board)
women$WOB <- as.numeric(women$WOB)
women$Sector <- as.character(women$Sector)
women$State <- as.character(women$State)
women$City <- as.character(women$City)
women$Country <- as.character(women$Country)
women$percentWOB <- as.numeric(women$percentWOB)


mergeData <- merge(x=financial, y=women, by="firm", all=FALSE)

#remove NA values from final data.
mergeDataRemoveNAs <- subset(x=mergeData, !is.na(mergeData$asset2014))

write.csv(mergeDataRemoveNAs, "C:/MastersThesisProject/Data/MainData.csv")

markdownFile <- "C:/MastersThesisProject/Data/VariableDescription.md"
cat("Variable Description::::\n", file=markdownFile, append=FALSE)
cat("(1) firm- contains the name of companies in the S&P500 Index\n", file=markdownFile, append=TRUE)
cat("(2) ticker- contains each company stock symbol\n", file=markdownFile, append=TRUE)
cat("(3) netIncome2015 - 2015 net income of firms\n", file=markdownFile, append=TRUE)
cat("(4) asset2015- 2015 total asset of firms\n", file=markdownFile, append=TRUE)
cat("(5) asset2014- 2014 total asset of firms\n", file=markdownFile, append=TRUE)
cat("(6) stock2015- 2015 stockholder's equity of firms\n", file=markdownFile, append=TRUE)
cat("(7) stock2014- 2014 stockholder's equity of firms\n", file=markdownFile, append=TRUE)
cat("(8) ROAA- Return on Average Assets expressed in as a two-decimal percentage\n", file=markdownFile, append=TRUE)
cat("(9) ROAE- Return on Average Equity expressed in as a two-decimalpercentage\n", file=markdownFile, append=TRUE)
cat("(10) Sector- Focus area of the economy, which in this case are firms belonging to the Technology sector\n", file=markdownFile, append=TRUE)
cat("(11) State- Headquarters location by state for each technology firm used in the study\n", file=markdownFile, append=TRUE)
cat("(12) Country- Headquarters location by country for each technology firm used in the study\n", file=markdownFile, append=TRUE)
cat("(13) Board- Total board size in a firm\n", file=markdownFile, append=TRUE)
cat("(14) WOB- Number of women on the board of directors in firm\n", file=markdownFile, append=TRUE)
cat("(15) percentWOB- Number of women on the board of directors in firm expressed as a percentage\n", file=markdownFile, append=TRUE)
cat("==================================================================================================\n", file=markdownFile, append=TRUE)
cat("==================================================================================================\n", file=markdownFile, append=TRUE)
cat("Variable Source::::\n", file=markdownFile, append=TRUE)
cat("(1) firm- sec.gov and www.2020wob.com\n", file=markdownFile, append=TRUE)
cat("(2) ticker- sec.gov\n", file=markdownFile, append=TRUE)
cat("(3) netIncome2015 - sec.gov\n", file=markdownFile, append=TRUE)
cat("(4) asset2015- sec.gov\n", file=markdownFile, append=TRUE)
cat("(5) asset2014- sec.gov\n", file=markdownFile, append=TRUE)
cat("(6) stock2015- sec.gov\n", file=markdownFile, append=TRUE)
cat("(7) stock2014- sec.gov\n", file=markdownFile, append=TRUE)
cat("(8) ROAA- sec.gov\n", file=markdownFile, append=TRUE)
cat("(9) ROAE- sec.gov\n", file=markdownFile, append=TRUE)
cat("(10) Sector- www.2020wob.com\n", file=markdownFile, append=TRUE)
cat("(11) State- www.2020wob.com\n", file=markdownFile, append=TRUE)
cat("(12) Country- www.2020wob.com\n", file=markdownFile, append=TRUE)
cat("(13) Board- www.2020wob.com\n", file=markdownFile, append=TRUE)
cat("(14) WOB- www.2020wob.com\n", file=markdownFile, append=TRUE)
cat("(15) percentWOB- www.2020wob.com\n", file=markdownFile, append=TRUE)

setwd("C:/MastersThesisProject/") #set working directory where project file is saved
source(file="saveWorkspaceHistory.R") #save the workspace and history before quiting