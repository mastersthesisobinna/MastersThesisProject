if (!require("xtable")) {
  install.packages("xtable", repos="http://cran.rstudio.com/") 
  library("xtable")
}
if (!require("Hmisc")) {
  install.packages("Hmisc", repos="http://cran.rstudio.com/") 
  library("Hmisc")
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

wobData <- wobData[,c("ROAA","ROAE","percentWOB")] #select multiple variables

cormatrix <- rcorr(as.matrix(wobData), type='spearman')
prob <- as.data.frame(cormatrix$P) #can also do cormatrix$r for spearman correalation rho
xtable(prob, caption="P-Values from Spearman Correlation analysis", label="pValueRHO", digit=4)