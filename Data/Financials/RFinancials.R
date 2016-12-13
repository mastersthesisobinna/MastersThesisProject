setwd("C:/MastersThesisProject/") #set currently directory to find saved workspace
#environment
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_92\\jre')

source(file="loadWorkspaceHistory.R") #load the workspace and history upon starting

setwd("C:/MastersThesisProject/Data/Financials/") #please specify your working directory within the project.
getwd()

#File instruction or description specified here.
#This RFinancials.R file pulls the required financial data that is needed for the present study.
#Data is pulled from each firms finanicial 10-K report stored in the firm directory.
#Data pulled are net income, 2015 and 2014 total asset, and 2015 and 2014 stockholders' equity.
#Always run the environment command below before loading the installed XLConnect package. 
#Do this each time you need to use this file to extract the data from Excel spreadsheet.



#install packages
ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

# usage
packages <- c("XLConnect", "plyr")
ipak(packages)

#install.packages("XLConnect")
#install.packages("plyr")




#load library
library("plyr")
library("gdata")
library("XLConnect")

#1
ticker <- "ATVI"
firm <- "Activision Blizzard, Inc."
filePath <- "./firms/ATVI.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'CONSOLIDATED STATEMENTS OF OPER', startRow = 19, endRow = 20, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X229 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 20, endRow = 21, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X7.095
asset2014 <- balanceSheet$X7.086
balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 37, endRow = 38, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.633.
stock2014 <- balanceSheet$X.303.

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfATVI <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
ATVI <- dfATVI

#-----------------------------------------------------------------------------------------------------------------

#2
ticker <- "AYI"
firm <- "Acuity Brands, Inc."
filePath <- "./firms/AYI.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Cash', startRow = 3, endRow = 4, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$Col1 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 21, endRow = 22, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X818.5
asset2014 <- balanceSheet$X827.5
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 42, endRow = 43, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.420.2.
stock2014 <- balanceSheet$X.420.2..1

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfAYI <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
AYI <- dfAYI

compiledDataSet <- rbind(ATVI, AYI)

#-----------------------------------------------------------------------------------------------------------------

#3
ticker <- "ADBE"
firm <- "Adobe Systems Inc."
filePath <- "./firms/ADBE.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Inco', startRow = 28, endRow = 29, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X244.230 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 13, endRow = 14, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X159.832
asset2014 <- balanceSheet$X126.315
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 38, endRow = 39, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.4.267.715.
stock2014 <- balanceSheet$X.3.918.851.

#Convert to appropriate estimate (In thousands)
netIncome2015 <- netIncome2015 * 1000
asset2015 <- asset2015 * 1000
asset2014 <- asset2014 * 1000
stock2015 <- stock2015 * 1000
stock2014 <- stock2014 * 1000

dfADBE <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
ADBE <- dfADBE

compiledDataSet <- rbind(compiledDataSet, ADBE)

#-----------------------------------------------------------------------------------------------------------------


#4
ticker <- "AKAM"
firm <- "Akamai Technologies, Inc."
filePath <- "./firms/AKAM.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Inco', startRow = 18, endRow = 19, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X135.218 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 14, endRow = 15, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X95.844
asset2014 <- balanceSheet$X81.747
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 33, endRow = 34, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.1.276.861.
stock2014 <- balanceSheet$X.1.598.267.

#Convert to appropriate estimate (In thousand)
netIncome2015 <- netIncome2015 * 1000
asset2015 <- asset2015 * 1000
asset2014 <- asset2014 * 1000
stock2015 <- stock2015 * 1000
stock2014 <- stock2014 * 1000

dfAKAM <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
AKAM <- dfAKAM

compiledDataSet <- rbind(compiledDataSet, AKAM)

#-----------------------------------------------------------------------------------------------------------------

#5
ticker <- "GOOG" #filings for GOOG and GOOGL are the same. Owned by Alphabet or Google (Same companies). 
firm <- "Google, Inc."
filePath <- "./firms/GOOG.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'CONSOLIDATED STATEMENTS OF INCO', startRow = 15, endRow = 16, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X0 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 16, endRow = 17, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X15.869
asset2014 <- balanceSheet$X15.599
balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 78, endRow = 79, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X90.892
stock2014 <- balanceSheet$X75.066

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfGOOG <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
GOOG <- dfGOOG

compiledDataSet <- rbind(compiledDataSet, GOOG)

#-----------------------------------------------------------------------------------------------------------------


#6
ticker <- "APH"
firm <- "Amphenol Corporation"
filePath <- "./firms/APH.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Inco', startRow = 15, endRow = 16, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X.8.8. #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 22, endRow = 23, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X306
asset2014 <- balanceSheet$X326.3
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 39, endRow = 40, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.349.5.
stock2014 <- balanceSheet$X.205.8.

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfAPH <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
APH <- dfAPH

compiledDataSet <- rbind(compiledDataSet, APH)

#-----------------------------------------------------------------------------------------------------------------



#7
ticker <- "ADI"
firm <- "Analog Devices, Inc."
filePath <- "./firms/ADI.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Inco', startRow = 28, endRow = 29, startCol = 3, endCol = 4, header = TRUE)
netIncome2015 <- incomeStatement$Col1 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 28, endRow = 29, startCol = 3, endCol = 4, header = TRUE)
asset2015 <- balanceSheet$X2.338.520
asset2014 <- balanceSheet$X2.425.382
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 49, endRow = 50, startCol = 3, endCol = 4, header = TRUE)
stock2015 <- balanceSheet$X.50.851.
stock2014 <- balanceSheet$X.168.526.

#Convert to appropriate estimate (In thousands)
netIncome2015 <- netIncome2015 * 1000
asset2015 <- asset2015 * 1000
asset2014 <- asset2014 * 1000
stock2015 <- stock2015 * 1000
stock2014 <- stock2014 * 1000

dfADI <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
ADI <- dfADI

compiledDataSet <- rbind(compiledDataSet, ADI)

#-----------------------------------------------------------------------------------------------------------------


#8
ticker <- "AAPL"
firm <- "Apple Inc."
filePath <- "./firms/AAPL.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'CONSOLIDATED STATEMENTS OF OPER', startRow = 13, endRow = 14, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X19.121 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 15, endRow = 16, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X5.556
asset2014 <- balanceSheet$X3.764
balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 32, endRow = 33, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.345.
stock2014 <- balanceSheet$X1.082

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfAAPL <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
AAPL <- dfAAPL

compiledDataSet <- rbind(compiledDataSet, AAPL)

#-----------------------------------------------------------------------------------------------------------------


#9
ticker <- "AMAT"
firm <- "Applied Materials, Inc."
filePath <- "./firms/AMAT.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Oper', startRow = 19, endRow = 20, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X221 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 13, endRow = 14, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X145
asset2014 <- balanceSheet$X156
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 30, endRow = 31, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.92.
stock2014 <- balanceSheet$X.76.

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfAMAT <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
AMAT <- dfAMAT

compiledDataSet <- rbind(compiledDataSet, AMAT)

#-----------------------------------------------------------------------------------------------------------------


#10
ticker <- "ADSK"
firm <- "Autodesk, Inc."
filePath <- "./firms/ADSK.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'CONSOLIDATED STATEMENTS OF OPER', startRow = 22, endRow = 23, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X.1.2. #2015 net income

balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 14, endRow = 15, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X163.5

balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 33, endRow = 34, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X499.4

filePath <- "./firms/ADSK2.xlsx"
excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile)
balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED_BALANCE_SHEETS', startRow = 15, endRow = 16, startCol = 2, endCol = 3, header = TRUE)
asset2014 <- balanceSheet$X148.3
balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED_BALANCE_SHEETS', startRow = 33, endRow = 34, startCol = 2, endCol = 3, header = TRUE)
stock2014 <- balanceSheet$X624.8

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfADSK <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
ADSK <- dfADSK

compiledDataSet <- rbind(compiledDataSet, ADSK)
first10Firms <- compiledDataSet
save(first10Firms, file = "./savepointFirst10.RData")
#load(file="savepointFirst10.RData")

#-----------------------------------------------------------------------------------------------------------------


#11
ticker <- "CA"
firm <- "CA, Inc."
filePath <- "./firms/CA.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Oper', startRow = 23, endRow = 24, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X36 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 12, endRow = 13, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X106

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 36, endRow = 37, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.3.868.

filePath <- "./firms/CA2.xlsx"
excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile)
balanceSheet <- readWorksheet(excelFile, 'Consolidated_Balance_Sheets', startRow = 13, endRow = 14, startCol = 2, endCol = 3, header = TRUE)
asset2014 <- balanceSheet$X118
balanceSheet <- readWorksheet(excelFile, 'Consolidated_Balance_Sheets', startRow = 36, endRow = 37, startCol = 2, endCol = 3, header = TRUE)
stock2014 <- balanceSheet$X.3.746

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfCA <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
CA <- dfCA

compiledDataSet <- rbind(compiledDataSet, CA)

#-----------------------------------------------------------------------------------------------------------------


#12 Incomplete data on sec No 2014 record on assets and stock. 
ticker <- "CSRA"
firm <- "CSRA Inc."
filePath <- "./firms/CSRA.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'CONSOLIDATED AND COMBINED STATE', startRow = 19, endRow = 20, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X.1.877. #2015 net income

balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED AND COMBINED BALAN', startRow = 13, endRow = 14, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X436.732
asset2014 <- NA
balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED AND COMBINED BALAN', startRow = 33, endRow = 34, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.405.
stock2014 <- NA

#Convert to appropriate estimate (In thousands)
netIncome2015 <- netIncome2015 * 1000
asset2015 <- asset2015 * 1000
asset2014 <- asset2014 * 1000
stock2015 <- stock2015 * 1000
stock2014 <- stock2014 * 1000

dfCSRA <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
CSRA <- dfCSRA

compiledDataSet <- rbind(compiledDataSet, CSRA)

#-----------------------------------------------------------------------------------------------------------------

#13 Incomplete data on sec No 2014 record on assets and stock.
ticker <- "CERN"
firm <- "Cerner Corporation"
filePath <- "./firms/CERN.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements Of Oper', startRow = 20, endRow = 21, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X.248.741. #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 15, endRow = 16, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X158.999
asset2014 <- NA
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 33, endRow = 34, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.44.096.
stock2014 <- NA

#Convert to appropriate estimate (In thousands)
netIncome2015 <- netIncome2015 * 1000
asset2015 <- asset2015 * 1000
asset2014 <- asset2014 * 1000
stock2015 <- stock2015 * 1000
stock2014 <- stock2014 * 1000

dfCERN <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
CERN <- dfCERN

compiledDataSet <- rbind(compiledDataSet, CERN)

#-----------------------------------------------------------------------------------------------------------------

#14
ticker <- "CSCO"
firm <- "Cisco Systems, Inc."
filePath <- "./firms/CSCO.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements Of Oper', startRow = 25, endRow = 26, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X2.220 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 15, endRow = 16, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X1.516

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 35, endRow = 36, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X61

filePath <- "./firms/CSCO2.xlsx"
excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile)
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 15, endRow = 16, startCol = 2, endCol = 3, header = TRUE)
asset2014 <- balanceSheet$X3.267
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 35, endRow = 36, startCol = 2, endCol = 3, header = TRUE)
stock2014 <- balanceSheet$X677

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfCSCO <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
CSCO <- dfCSCO

compiledDataSet <- rbind(compiledDataSet, CSCO)

#-----------------------------------------------------------------------------------------------------------------

#15
ticker <- "CTXS"
firm <- "Citrix Systems, Inc."
filePath <- "./firms/CTXS.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Inco', startRow = 27, endRow = 28, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X.7.484. #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 15, endRow = 16, startCol = 3, endCol = 4, header = TRUE)
asset2015 <- balanceSheet$X70.370
asset2014 <- balanceSheet$X67.028
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 33, endRow = 34, startCol = 3, endCol = 4, header = TRUE)
stock2015 <- balanceSheet$X.6.039.870.
stock2014 <- balanceSheet$X.5.237.830.

#Convert to appropriate estimate (In thousands)
netIncome2015 <- netIncome2015 * 1000
asset2015 <- asset2015 * 1000
asset2014 <- asset2014 * 1000
stock2015 <- stock2015 * 1000
stock2014 <- stock2014 * 1000

dfCTXS <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
CTXS <- dfCTXS

compiledDataSet <- rbind(compiledDataSet, CTXS)

#-----------------------------------------------------------------------------------------------------------------


#16
ticker <- "CTSH"
firm <- "Cognizant Technology Solutions Corporation"
filePath <- "./firms/CTSH.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements Of Oper', startRow = 17, endRow = 18, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X540 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Statements Of Fina', startRow = 13, endRow = 14, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X268.6
asset2014 <- balanceSheet$X209.7
balanceSheet <- readWorksheet(excelFile, 'Consolidated Statements Of Fina', startRow = 32, endRow = 33, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.106.2.
stock2014 <- balanceSheet$X.123.1.

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfCTSH <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
CTSH <- dfCTSH

compiledDataSet <- rbind(compiledDataSet, CTSH)

#-----------------------------------------------------------------------------------------------------------------


#17
ticker <- "GLW"
firm <- "Corning, Inc."
filePath <- "./firms/GLW.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Inco', startRow = 20, endRow = 21, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X.147. #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 16, endRow = 17, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X1.513
asset2014 <- balanceSheet$X1.722
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 34, endRow = 35, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.1.811.
stock2014 <-  balanceSheet$X.1.307.

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfGLW <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
GLW <- dfGLW

compiledDataSet <- rbind(compiledDataSet, GLW)

#-----------------------------------------------------------------------------------------------------------------


#18
ticker <- "EA"
firm <- "Electronic Arts Inc."
filePath <- "./firms/EA.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements Of Oper', startRow = 23, endRow = 24, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X50 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 14, endRow = 15, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X131

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 34, endRow = 35, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X2

filePath <- "./firms/EA2.xlsx"
excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile)
balanceSheet <- readWorksheet(excelFile, 'Consolidated_Balance_Sheets', startRow = 15, endRow = 16, startCol = 2, endCol = 3, header = TRUE)
asset2014 <- balanceSheet$X140
balanceSheet <- readWorksheet(excelFile, 'Consolidated_Balance_Sheets', startRow = 35, endRow = 36, startCol = 2, endCol = 3, header = TRUE)
stock2014 <- balanceSheet$X37

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfEA <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
EA <- dfEA

compiledDataSet <- rbind(compiledDataSet, EA)

#-----------------------------------------------------------------------------------------------------------------


#19
ticker <- "FFIV"
firm <- "F5 Networks, Inc."
filePath <- "./firms/FFIV.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Income Statements', startRow = 21, endRow = 22, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X196.330 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 14, endRow = 15, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X68.128
asset2014 <- balanceSheet$X75.003
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 30, endRow = 31, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X1.321.857
stock2014 <- balanceSheet$X1.363.141

#Convert to appropriate estimate (In thousands)
netIncome2015 <- netIncome2015 * 1000
asset2015 <- asset2015 * 1000
asset2014 <- asset2014 * 1000
stock2015 <- stock2015 * 1000
stock2014 <- stock2014 * 1000

dfFFIV <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
FFIV <- dfFFIV

compiledDataSet <- rbind(compiledDataSet, FFIV)

#-----------------------------------------------------------------------------------------------------------------


#20
ticker <- "FLIR"
firm <- "FLIR Systems, Inc."
filePath <- "./firms/FLIR.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'CONSOLIDATED STATEMENTS OF INCO', startRow = 17, endRow = 18, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X63.760 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 12, endRow = 13, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X53.210
asset2014 <-  balanceSheet$X61.240
balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 34, endRow = 35, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.125.126.
stock2014 <- balanceSheet$X.63.409.

#Convert to appropriate estimate (In thousands)
netIncome2015 <- netIncome2015 * 1000
asset2015 <- asset2015 * 1000
asset2014 <- asset2014 * 1000
stock2015 <- stock2015 * 1000
stock2014 <- stock2014 * 1000

dfFLIR <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
FLIR <- dfFLIR

compiledDataSet <- rbind(compiledDataSet, FLIR)

first20Firms <- compiledDataSet
save(first20Firms, file = "./savepointFirst20.RData")
#load(file="savepointFirst20.RData")

#-----------------------------------------------------------------------------------------------------------------

#SAVE FIRST TWENTY
#CHECKPOINT


#21
ticker <- "FB"
firm <- "Facebook, Inc."
filePath <- "./firms/FB.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'CONSOLIDATED STATEMENTS OF INCO', startRow = 15, endRow = 16, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X19 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 11, endRow = 12, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X796
asset2014 <- balanceSheet$X699
balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 28, endRow = 29, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X9.787
stock2014 <- balanceSheet$X6.099

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfFB <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
FB <- dfFB

compiledDataSet <- rbind(compiledDataSet, FB)

#-----------------------------------------------------------------------------------------------------------------


#22
ticker <- "FSLR"
firm <- "First Solar, Inc."
filePath <- "./firms/FSLR.xlsx"


excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Oper', startRow = 19, endRow = 20, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X20.430 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 23, endRow = 24, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X69.722
asset2014 <- balanceSheet$X61.670
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 43, endRow = 44, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X15.480
stock2014 <- balanceSheet$X50.140

#Convert to appropriate estimate (In thousands)
netIncome2015 <- netIncome2015 * 1000
asset2015 <- asset2015 * 1000
asset2014 <- asset2014 * 1000
stock2015 <- stock2015 * 1000
stock2014 <- stock2014 * 1000

dfFSLR <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
FSLR <- dfFSLR

compiledDataSet <- rbind(compiledDataSet, FSLR)

#-----------------------------------------------------------------------------------------------------------------


#23 Incomplete data on sec
ticker <- "FTV"
firm <- "Fortive Corp"
#filePath <- "./firms/"

#excelFile <- loadWorkbook(filePath)
#sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
#incomeStatement <- readWorksheet(excelFile, 'CONSOLIDATED AND COMBINED STATE', startRow = 19, endRow = 20, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- NA #2015 net income

#balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED AND COMBINED BALAN', startRow = 13, endRow = 14, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- NA
asset2014 <- NA
#balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED AND COMBINED BALAN', startRow = 35, endRow = 36, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- NA
stock2014 <- NA

#Convert to appropriate estimate (In thousands)
netIncome2015 <- netIncome2015 * 1000
asset2015 <- asset2015 * 1000
asset2014 <- asset2014 * 1000
stock2015 <- stock2015 * 1000
stock2014 <- stock2014 * 1000

dfFTV <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
FTV <- dfFTV

compiledDataSet <- rbind(compiledDataSet, FTV)

#-----------------------------------------------------------------------------------------------------------------

#24 No data on cleanWOB.csv
ticker <- "HPQ"
firm <- "HP Inc."
filePath <- "./firms/HPQ.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Earn', startRow = 24, endRow = 25, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X.178. #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 12, endRow = 13, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X2.014
asset2014 <- balanceSheet$X2.128
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 31, endRow = 32, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.6.302.
stock2014 <- balanceSheet$X.5.881.

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfHPQ <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
HPQ <- dfHPQ

compiledDataSet <- rbind(compiledDataSet, HPQ)

#-----------------------------------------------------------------------------------------------------------------


#25
ticker <- "HAR"
firm <- "Harman International Industries Inc."
filePath <- "./firms/HAR.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Inco', startRow = 17, endRow = 18, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X309 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 12, endRow = 13, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X428.008.000

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 33, endRow = 34, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.1.232.602.000.

filePath <- "./firms/HAR2.xlsx"
excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile)
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 12, endRow = 13, startCol = 2, endCol = 3, header = TRUE)
asset2014 <- balanceSheet$X263.323
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 33, endRow = 34, startCol = 2, endCol = 3, header = TRUE)
stock2014 <- balanceSheet$X.1.267.693.

#Convert to appropriate estimate (mixed)
netIncome2015 <- netIncome2015 * 1000 #thousand
asset2015 <- asset2015 #original
asset2014 <- asset2014 * 1000 #thousand
stock2015 <- stock2015 #original
stock2014 <- stock2014 * 1000 #thousand

dfHAR <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
HAR <- dfHAR

compiledDataSet <- rbind(compiledDataSet, HAR)

#-----------------------------------------------------------------------------------------------------------------


#26
ticker <- "HRS"
firm <- "Harris Corporation"
filePath <- "./firms/HRS.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statement of Incom', startRow = 19, endRow = 20, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X0 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheet', startRow = 16, endRow = 17, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X9.944

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheet', startRow = 40, endRow = 41, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.16.

filePath <- "./firms/HRS2.xlsx"
excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile)
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheet', startRow = 18, endRow = 19, startCol = 2, endCol = 3, header = TRUE)
asset2014 <- balanceSheet$X2.928
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheet', startRow = 43, endRow = 44, startCol = 2, endCol = 3, header = TRUE)
stock2014 <- balanceSheet$X.15.

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfHRS <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
HRS <- dfHRS

compiledDataSet <- rbind(compiledDataSet, HRS)

#-----------------------------------------------------------------------------------------------------------------


#27
ticker <- "HPE"
firm <- "Hewlett-Packard Company"
filePath <- "./firms/HPE.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Combined and Consolidated State', startRow = 24, endRow = 25, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X991 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Combined and Consolidated Balan', startRow = 12, endRow = 13, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X1.930
asset2014 <- balanceSheet$X2.057
balanceSheet <- readWorksheet(excelFile, 'Combined and Consolidated Balan', startRow = 29, endRow = 30, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.5.015.
stock2014 <- balanceSheet$X.2.248.

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfHPE <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
HPE <- dfHPE

compiledDataSet <- rbind(compiledDataSet, HPE)

#-----------------------------------------------------------------------------------------------------------------


#28 No data on cleanWOB.csv
ticker <- "IBM"
firm <- "IBM Corp"
filePath <- "./firms/IBM.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statement of Earni', startRow = 24, endRow = 25, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X.174. #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Statement of Finan', startRow = 19, endRow = 20, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X5.187
asset2014 <- balanceSheet$X5.520
balanceSheet <- readWorksheet(excelFile, 'Consolidated Statement of Finan', startRow = 39, endRow = 40, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.29.607.
stock2014 <- balanceSheet$X.27.875.

#Convert to appropriate estimate (In MILLIONS)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfIBM <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
IBM <- dfIBM

compiledDataSet <- rbind(compiledDataSet, IBM)

#-----------------------------------------------------------------------------------------------------------------


#29
ticker <- "INTC"
firm <- "Intel Corporation"
filePath <- "./firms/INTC.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Inco', startRow = 16, endRow = 17, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X2.792 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 16, endRow = 17, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X7.735
asset2014 <- balanceSheet$X6.505
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 35, endRow = 36, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X37.614
stock2014 <- balanceSheet$X33.418

#Convert to appropriate estimate (In MILLIONS)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfINTC <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
INTC <- dfINTC

compiledDataSet <- rbind(compiledDataSet, INTC)

#-----------------------------------------------------------------------------------------------------------------

#30
ticker <- "INTU"
firm <- "Intuit Inc."
filePath <- "./firms/INTU.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Oper', startRow = 23, endRow = 24, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X.48. #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 19, endRow = 20, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X235

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 43, endRow = 44, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X6.027

filePath <- "./firms/INTU2.xlsx"
excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile)
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 18, endRow = 19, startCol = 2, endCol = 3, header = TRUE)
asset2014 <- balanceSheet$X396
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 41, endRow = 42, startCol = 2, endCol = 3, header = TRUE)
stock2014 <- balanceSheet$X5.949

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfINTU <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
INTU <- dfINTU

compiledDataSet <- rbind(compiledDataSet, INTU)

first30Firms <- compiledDataSet
save(first30Firms, file = "./savepointFirst30.RData")
#load(file="savepointFirst30.RData")

#-----------------------------------------------------------------------------------------------------------------

#SAVE FIRST THIRTY
#CHECKPOINT


#31
ticker <- "JNPR"
firm <- "Juniper Networks, Inc."
filePath <- "./firms/JNPR.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Comp', startRow = 3, endRow = 4, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$Col1 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 13, endRow = 14, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X390.2
asset2014 <- balanceSheet$X343.5
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 33, endRow = 34, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.3.741.2.
stock2014 <- balanceSheet$X.3.861.1.

#Convert to appropriate estimate (In MILLIONS)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfJNPR <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
JNPR <- dfJNPR

compiledDataSet <- rbind(compiledDataSet, JNPR)

#-----------------------------------------------------------------------------------------------------------------


#32
ticker <- "KLAC"
firm <- "KLA-Tencor Corporation"
filePath <- "./firms/KLAC.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Oper', startRow = 15, endRow = 16, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X67.973 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 13, endRow = 14, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X259.687
asset2014 <- balanceSheet$X256.436
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 33, endRow = 34, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.40.573.
stock2014 <- balanceSheet$X.30.271.

#Convert to appropriate estimate (In thousands)
netIncome2015 <- netIncome2015 * 1000
asset2015 <- asset2015 * 1000
asset2014 <- asset2014 * 1000
stock2015 <- stock2015 * 1000
stock2014 <- stock2014 * 1000

dfKLAC <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
KLAC <- dfKLAC

compiledDataSet <- rbind(compiledDataSet, KLAC)

#-----------------------------------------------------------------------------------------------------------------



#33
ticker <- "LRCX"
firm <- "Lam Research Corporation"
filePath <- "./firms/LRCX.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Oper', startRow = 14, endRow = 15, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X.85.273. #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 13, endRow = 14, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X185.763
asset2014 <- balanceSheet$X159.353
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 33, endRow = 34, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X4.096.855
stock2014 <- balanceSheet$X3.575.737

#Convert to appropriate estimate (In thousands)
netIncome2015 <- netIncome2015 * 1000
asset2015 <- asset2015 * 1000
asset2014 <- asset2014 * 1000
stock2015 <- stock2015 * 1000
stock2014 <- stock2014 * 1000

dfLRCX <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
LRCX <- dfLRCX

compiledDataSet <- rbind(compiledDataSet, LRCX)

#-----------------------------------------------------------------------------------------------------------------


#34
ticker <- "LLTC"
firm <- "Linear Technology Corporation"
filePath <- "./firms/LLTC.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements Of Inco', startRow = 15, endRow = 16, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X164.426 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 23, endRow = 24, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X299.327
asset2014 <- balanceSheet$X290.865
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 41, endRow = 42, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.475.124.
stock2014 <- balanceSheet$X.616.992.

#Convert to appropriate estimate (In thousands)
netIncome2015 <- netIncome2015 * 1000
asset2015 <- asset2015 * 1000
asset2014 <- asset2014 * 1000
stock2015 <- stock2015 * 1000
stock2014 <- stock2014 * 1000

dfLLTC <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
LLTC <- dfLLTC

compiledDataSet <- rbind(compiledDataSet, LLTC)

#-----------------------------------------------------------------------------------------------------------------


#35
ticker <- "MCHP"
firm <- "Microchip Technology Incorporated"
filePath <- "./firms/MCHP.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'CONSOLIDATED_STATEMENTS_OF_INC', startRow = 23, endRow = 24, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X3.684 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED_BALANCE_SHEETS', startRow = 17, endRow = 18, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X75.510
asset2014 <- balanceSheet$X45.956
balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED_BALANCE_SHEETS', startRow = 38, endRow = 39, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X1.549.540
stock2014 <- balanceSheet$X1.467.009

#Convert to appropriate estimate (In thousands)
netIncome2015 <- netIncome2015 * 1000
asset2015 <- asset2015 * 1000
asset2014 <- asset2014 * 1000
stock2015 <- stock2015 * 1000
stock2014 <- stock2014 * 1000

dfMCHP <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
MCHP <- dfMCHP

compiledDataSet <- rbind(compiledDataSet, MCHP)

#-----------------------------------------------------------------------------------------------------------------


#36
ticker <- "MU"
firm <- "Micron Technology, Inc."
filePath <- "./firms/MU.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'CONSOLIDATED STATEMENTS OF OPER', startRow = 21, endRow = 22, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X0 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 14, endRow = 15, startCol = 2, endCol = 4, header = TRUE)
asset2015 <- balanceSheet$X455
asset2014 <- balanceSheet$X415
balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 31, endRow = 32, startCol = 2, endCol = 4, header = TRUE)
stock2015 <- balanceSheet$X13
stock2014 <- balanceSheet$X56

#Convert to appropriate estimate (In MILLIONS)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfMU <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
MU <- dfMU

compiledDataSet <- rbind(compiledDataSet, MU)

#-----------------------------------------------------------------------------------------------------------------


#37
ticker <- "MSFT"
firm <- "Microsoft Corporation"
filePath <- "./firms/MSFT.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'INCOME STATEMENTS', startRow = 19, endRow = 20, startCol = 2, endCol = 4, header = TRUE)
netIncome2015 <- incomeStatement$X6.314 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'BALANCE SHEETS', startRow = 14, endRow = 15, startCol = 2, endCol = 4, header = TRUE)
asset2015 <- balanceSheet$X3.117

balanceSheet <- readWorksheet(excelFile, 'BALANCE SHEETS', startRow = 35, endRow = 36, startCol = 2, endCol = 4, header = TRUE)
stock2015 <- balanceSheet$X2.522

filePath <- "./firms/MSFT2.xlsx"
excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile)
balanceSheet <- readWorksheet(excelFile, 'BALANCE SHEETS', startRow = 15, endRow = 16, startCol = 2, endCol = 3, header = TRUE)
asset2014 <- balanceSheet$X3.422
balanceSheet <- readWorksheet(excelFile, 'BALANCE SHEETS', startRow = 36, endRow = 37, startCol = 2, endCol = 3, header = TRUE)
stock2014 <- balanceSheet$X3.708

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfMSFT <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
MSFT <- dfMSFT

compiledDataSet <- rbind(compiledDataSet, MSFT)

#-----------------------------------------------------------------------------------------------------------------


#38
ticker <- "MSI"
firm <- "Motorola Solutions, Inc."
filePath <- "./firms/MSI.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements Of Oper', startRow = 25, endRow = 26, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X3 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 15, endRow = 16, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X40
asset2014 <- balanceSheet$X0
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 29, endRow = 30, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.1.866.
stock2014 <- balanceSheet$X.1.855.

#Convert to appropriate estimate (In MILLIONS)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfMSI <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
MSI <- dfMSI

compiledDataSet <- rbind(compiledDataSet, MSI)

#-----------------------------------------------------------------------------------------------------------------


#39
ticker <- "NVDA"
firm <- "NVIDIA Corporation"
filePath <- "./firms/NVDA.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'CONSOLIDATED STATEMENTS OF INCO', startRow = 16, endRow = 17, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X124 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 13, endRow = 14, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X91

balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 32, endRow = 33, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X3.949

filePath <- "./firms/NVDA2.xlsx"
excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile)
balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED_BALANCE_SHEETS', startRow = 14, endRow = 15, startCol = 2, endCol = 3, header = TRUE)
asset2014 <- balanceSheet$X104.252
balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED_BALANCE_SHEETS', startRow = 30, endRow = 31, startCol = 2, endCol = 3, header = TRUE)
stock2014 <- balanceSheet$X3.504.742

#Convert to appropriate estimate (MIXED)
netIncome2015 <- netIncome2015 * 1000000 #millions
asset2015 <- asset2015 * 1000000 #millions
asset2014 <- asset2014 * 1000    #thousands
stock2015 <- stock2015 * 1000000 #millions
stock2014 <- stock2014 * 1000    #thousands

dfNVDA <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
NVDA <- dfNVDA

compiledDataSet <- rbind(compiledDataSet, NVDA)

#-----------------------------------------------------------------------------------------------------------------


#40
ticker <- "NTAP"
firm <- "NetApp Inc."
filePath <- "./firms/NTAP.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'CONSOLIDATED STATEMENTS OF OPER', startRow = 25, endRow = 26, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X153 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 12, endRow = 13, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X481

balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 29, endRow = 30, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.24.

filePath <- "./firms/NTAP2.xlsx"
excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile)
balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED_BALANCE_SHEETS', startRow = 13, endRow = 14, startCol = 2, endCol = 3, header = TRUE)
asset2014 <- balanceSheet$X524.1
balanceSheet <- readWorksheet(excelFile, 'Consolidated_Balance_Sheets', startRow = 30, endRow = 31, startCol = 2, endCol = 3, header = TRUE)
stock2014 <- balanceSheet$X9.1

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfNTAP <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
NTAP <- dfNTAP

compiledDataSet <- rbind(compiledDataSet, NTAP)

first40Firms <- compiledDataSet
save(first40Firms, file = "./savepointFirst40.RData")
#load(file="savepointFirst40.RData")

#-----------------------------------------------------------------------------------------------------------------


#SAVE FIRST FORTY
#CHECKPOINT


#41
ticker <- "ORCL"
firm <- "Oracle Corporation"
filePath <- "./firms/ORCL.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'CONSOLIDATED STATEMENTS OF OPER', startRow = 35, endRow = 36, startCol = 2, endCol = 4, header = TRUE)
netIncome2015 <- incomeStatement$X2.896 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 15, endRow = 16, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X48.383

balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 34, endRow = 35, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.996.

filePath <- "./firms/ORCL2.xlsx"
excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile)
balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 16, endRow = 17, startCol = 2, endCol = 3, header = TRUE)
asset2014 <- balanceSheet$X42.138
balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 36, endRow = 37, startCol = 2, endCol = 3, header = TRUE)
stock2014 <- balanceSheet$X.164.

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfORCL <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
ORCL <- dfORCL

compiledDataSet <- rbind(compiledDataSet, ORCL)

#-----------------------------------------------------------------------------------------------------------------


#42 No data on cleanWOB.csv
ticker <- "QRVO"
firm <- "Qorvo Inc."
filePath <- "./firms/QRVO.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Oper', startRow = 18, endRow = 19, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X75.062 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 26, endRow = 27, startCol = 2, endCol = 4, header = TRUE)
asset2015 <- balanceSheet$X57.005

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 42, endRow = 43, startCol = 2, endCol = 4, header = TRUE)
stock2015 <- balanceSheet$X.410.963.

filePath <- "./firms/QRVO2.xlsx"
excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile)
balanceSheet <- readWorksheet(excelFile, 'Consolidated_Balance_Sheets', startRow = 27, endRow = 28, startCol = 2, endCol = 4, header = TRUE)
asset2014 <- balanceSheet$X24.166
balanceSheet <- readWorksheet(excelFile, 'Consolidated_Balance_Sheets', startRow = 43, endRow = 44, startCol = 2, endCol = 4, header = TRUE)
stock2014 <- balanceSheet$X.607.266

#Convert to appropriate estimate (In THOUSANDS)
netIncome2015 <- netIncome2015 * 1000
asset2015 <- asset2015 * 1000
asset2014 <- asset2014 * 1000
stock2015 <- stock2015 * 1000
stock2014 <- stock2014 * 1000

dfQRVO <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
QRVO <- dfQRVO

compiledDataSet <- rbind(compiledDataSet, QRVO)

#-----------------------------------------------------------------------------------------------------------------


#43
ticker <- "QCOM"
firm <- "Qualcomm, Inc."
filePath <- "./firms/QCOM.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'CONSOLIDATED STATEMENTS OF OPER', startRow = 21, endRow = 22, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X3 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 15, endRow = 16, startCol = 2, endCol = 4, header = TRUE)
asset2015 <- balanceSheet$X1.863
asset2014 <- balanceSheet$X975
balanceSheet <- readWorksheet(excelFile, 'CONSOLIDATED BALANCE SHEETS', startRow = 33, endRow = 34, startCol = 2, endCol = 4, header = TRUE)
stock2015 <- balanceSheet$X195
stock2014 <- balanceSheet$X634

#Convert to appropriate estimate (In MILLIONS)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfQCOM <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
QCOM <- dfQCOM

compiledDataSet <- rbind(compiledDataSet, QCOM)

#-----------------------------------------------------------------------------------------------------------------


#44
ticker <- "RHT"
firm <- "Red Hat, Inc."
filePath <- "./firms/RHT.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Oper', startRow = 23, endRow = 24, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X75.297 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 14, endRow = 15, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X22.731

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 31, endRow = 32, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.60.621.

filePath <- "./firms/RHT2.xlsx"
excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile)
balanceSheet <- readWorksheet(excelFile, 'Consolidated_Balance_Sheets', startRow = 15, endRow = 16, startCol = 2, endCol = 3, header = TRUE)
asset2014 <- balanceSheet$X35.391
balanceSheet <- readWorksheet(excelFile, 'Consolidated_Balance_Sheets', startRow = 32, endRow = 33, startCol = 2, endCol = 3, header = TRUE)
stock2014 <- balanceSheet$X.4.459

#Convert to appropriate estimate (In THOUSAND)
netIncome2015 <- netIncome2015 * 1000
asset2015 <- asset2015 * 1000
asset2014 <- asset2014 * 1000
stock2015 <- stock2015 * 1000
stock2014 <- stock2014 * 1000

dfRHT <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
RHT <- dfRHT

compiledDataSet <- rbind(compiledDataSet, RHT)

#-----------------------------------------------------------------------------------------------------------------


#45
ticker <- "CRM"
firm <- "Salesforce.com"
filePath <- "./firms/CRM.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Oper', startRow = 24, endRow = 25, startCol = 2, endCol = 4, header = TRUE)
netIncome2015 <- incomeStatement$X.49.603. #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 17, endRow = 18, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X115.015

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 34, endRow = 35, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.605.845.

filePath <- "./firms/CRM2.xlsx"
excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile)
balanceSheet <- readWorksheet(excelFile, 'Consolidated_Balance_Sheets', startRow = 17, endRow = 18, startCol = 2, endCol = 3, header = TRUE)
asset2014 <- balanceSheet$X0
balanceSheet <- readWorksheet(excelFile, 'Consolidated_Balance_Sheets', startRow = 37, endRow = 38, startCol = 2, endCol = 3, header = TRUE)
stock2014 <- balanceSheet$X.343.157

#Convert to appropriate estimate (In THOUSAND)
netIncome2015 <- netIncome2015 * 1000
asset2015 <- asset2015 * 1000
asset2014 <- asset2014 * 1000
stock2015 <- stock2015 * 1000
stock2014 <- stock2014 * 1000

dfCRM <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
CRM <- dfCRM

compiledDataSet <- rbind(compiledDataSet, CRM)

#-----------------------------------------------------------------------------------------------------------------


#46
ticker <- "SWKS"
firm <- "Skyworks Solutions, Inc."
filePath <- "./firms/SWKS.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements Of Oper', startRow = 16, endRow = 17, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X225.3 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 12, endRow = 13, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X20.3
asset2014 <- balanceSheet$X11.9
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 29, endRow = 30, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.8.2.
stock2014 <- balanceSheet$X.4.9.

#Convert to appropriate estimate (In million)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfSWKS <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
SWKS <- dfSWKS

compiledDataSet <- rbind(compiledDataSet, SWKS)

#-----------------------------------------------------------------------------------------------------------------




#47
ticker <- "SYMC"
firm <- "Symantec Corporation"
filePath <- "./firms/SYMC.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Oper', startRow = 21, endRow = 22, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X769 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 15, endRow = 16, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X3.110

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 37, endRow = 38, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.270.

filePath <- "./firms/SYMC2.xlsx"
excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile)
balanceSheet <- readWorksheet(excelFile, 'Consolidated_Balance_Sheets', startRow = 15, endRow = 16, startCol = 2, endCol = 3, header = TRUE)
asset2014 <- balanceSheet$X124
balanceSheet <- readWorksheet(excelFile, 'Consolidated_Balance_Sheets', startRow = 35, endRow = 36, startCol = 2, endCol = 3, header = TRUE)
stock2014 <- balanceSheet$X.1.148

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfSYMC <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
SYMC <- dfSYMC

compiledDataSet <- rbind(compiledDataSet, SYMC)

#-----------------------------------------------------------------------------------------------------------------


#48
ticker <- "TDC"
firm <- "Teradata Corporation"
filePath <- "./firms/TDC.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of (Los', startRow = 19, endRow = 20, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X70 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 14, endRow = 15, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X20
asset2014 <- balanceSheet$X98
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 37, endRow = 38, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.76.
stock2014 <- balanceSheet$X.4.

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfTDC <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
TDC <- dfTDC

compiledDataSet <- rbind(compiledDataSet, TDC)

#-----------------------------------------------------------------------------------------------------------------


#49
ticker <- "TXN"
firm <- "Texas Instruments, Inc."
filePath <- "./firms/TXN.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Inco', startRow = 15, endRow = 16, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X1.230 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 21, endRow = 22, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X62
asset2014 <- balanceSheet$X233
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 41, endRow = 42, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.532.
stock2014 <- balanceSheet$X.532..1

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfTXN <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
TXN <- dfTXN

compiledDataSet <- rbind(compiledDataSet, TXN)

#-----------------------------------------------------------------------------------------------------------------

#50
ticker <- "TRIP"
firm <- "TripAdvisor Inc."
filePath <- "./firms/TRIP.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Oper', startRow = 19, endRow = 20, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X.41. #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 12, endRow = 13, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X71
asset2014 <- balanceSheet$X37
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 32, endRow = 33, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.92.
stock2014 <- balanceSheet$X.145.

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfTRIP <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
TRIP <- dfTRIP

compiledDataSet <- rbind(compiledDataSet, TRIP)

first50Firms <- compiledDataSet
save(first50Firms, file = "./savepointFirst50.RData")
#load(file="savepointFirst50.RData")

#-----------------------------------------------------------------------------------------------------------------


#SAVE FIRST FIFTY
#CHECKPOINT


#51
ticker <- "VRSN"
firm <- "VeriSign, Inc."
filePath <- "./firms/VRSN.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements Of Comp', startRow = 15, endRow = 16, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X.112.414. #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 12, endRow = 13, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X389.813
asset2014 <- balanceSheet$X421.360
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 31, endRow = 32, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.3.993.
stock2014 <- balanceSheet$X.2.998.

#Convert to appropriate estimate (In thousands)
netIncome2015 <- netIncome2015 * 1000
asset2015 <- asset2015 * 1000
asset2014 <- asset2014 * 1000
stock2015 <- stock2015 * 1000
stock2014 <- stock2014 * 1000

dfVRSN <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
VRSN <- dfVRSN

compiledDataSet <- rbind(compiledDataSet, VRSN)

#-----------------------------------------------------------------------------------------------------------------

#52
ticker <- "WDC"
firm <- "Western Digital Corporation"
filePath <- "./firms/WDC.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Inco', startRow = 19, endRow = 20, startCol = 2, endCol = 4, header = TRUE)
netIncome2015 <- incomeStatement$X112 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 13, endRow = 14, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X594

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 35, endRow = 36, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.2.299.

filePath <- "./firms/WDC2.xlsx"
excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile)
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 12, endRow = 13, startCol = 2, endCol = 3, header = TRUE)
asset2014 <- balanceSheet$X473
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 33, endRow = 34, startCol = 2, endCol = 3, header = TRUE)
stock2014 <- balanceSheet$X.1.570.

#Convert to appropriate estimate (In millions)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfWDC <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
WDC <- dfWDC

compiledDataSet <- rbind(compiledDataSet, WDC)

#-----------------------------------------------------------------------------------------------------------------


#53
ticker <- "XRX"
firm <- "Xerox Corporation"
filePath <- "./firms/XRX.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Inco', startRow = 24, endRow = 25, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X18 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 17, endRow = 18, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X2.088
asset2014 <- balanceSheet$X2.243
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 38, endRow = 39, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.4.642.
stock2014 <- balanceSheet$X.4.159.

#Convert to appropriate estimate (In MILLIONS)
netIncome2015 <- netIncome2015 * 1000000
asset2015 <- asset2015 * 1000000
asset2014 <- asset2014 * 1000000
stock2015 <- stock2015 * 1000000
stock2014 <- stock2014 * 1000000

dfXRX <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
XRX <- dfXRX

compiledDataSet <- rbind(compiledDataSet, XRX)

#-----------------------------------------------------------------------------------------------------------------


#54
ticker <- "XLNX"
firm <- "Xilinx, Inc."
filePath <- "./firms/XLNX.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Inco', startRow = 17, endRow = 18, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X91.860 #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 21, endRow = 22, startCol = 2, endCol = 3, header = TRUE)
asset2015 <- balanceSheet$X223.026

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 42, endRow = 43, startCol = 2, endCol = 3, header = TRUE)
stock2015 <- balanceSheet$X.11.149.

filePath <- "./firms/XLNX2.xlsx"
excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile)
balanceSheet <- readWorksheet(excelFile, 'Consolidated_Balance_Sheets', startRow = 22, endRow = 23, startCol = 2, endCol = 3, header = TRUE)
asset2014 <- balanceSheet$X236.175
balanceSheet <- readWorksheet(excelFile, 'Consolidated_Balance_Sheets', startRow = 43, endRow = 44, startCol = 2, endCol = 3, header = TRUE)
stock2014 <- balanceSheet$X.548

#Convert to appropriate estimate (In THOUSAND)
netIncome2015 <- netIncome2015 * 1000
asset2015 <- asset2015 * 1000
asset2014 <- asset2014 * 1000
stock2015 <- stock2015 * 1000
stock2014 <- stock2014 * 1000

dfXLNX <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
XLNX <- dfXLNX

compiledDataSet <- rbind(compiledDataSet, XLNX)

#-----------------------------------------------------------------------------------------------------------------


#55
ticker <- "YHOO"
firm <- "Yahoo! Inc."
filePath <- "./firms/YHOO.xlsx"

excelFile <- loadWorkbook(filePath)
sheetsOnFile <- getSheets(excelFile) #see all worksheet in file
incomeStatement <- readWorksheet(excelFile, 'Consolidated Statements of Oper', startRow = 23, endRow = 24, startCol = 2, endCol = 3, header = TRUE)
netIncome2015 <- incomeStatement$X.7.975. #2015 net income

balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 14, endRow = 15, startCol = 2, endCol = 4, header = TRUE)
asset2015 <- balanceSheet$X2.503.229
asset2014 <- balanceSheet$X2.489.578
balanceSheet <- readWorksheet(excelFile, 'Consolidated Balance Sheets', startRow = 35, endRow = 36, startCol = 2, endCol = 4, header = TRUE)
stock2015 <- balanceSheet$X16.576.031
stock2014 <- balanceSheet$X22.019.628

#Convert to appropriate estimate (In thousands)
netIncome2015 <- netIncome2015 * 1000
asset2015 <- asset2015 * 1000
asset2014 <- asset2014 * 1000
stock2015 <- stock2015 * 1000
stock2014 <- stock2014 * 1000

dfYHOO <- data.frame(ticker, firm, netIncome2015, asset2015, asset2014, stock2015, stock2014)
YHOO <- dfYHOO

compiledDataSet <- rbind(compiledDataSet, YHOO)

finalFirms <- compiledDataSet
save(finalFirms, file = "./savepointFinalFirms.RData")
#load(file="savepointFinalFirms.RData")

#-----------------------------------------------------------------------------------------------------------------

#Compute ROAA and create a new variable in the compiledDataSet dataframe to store the ROA
#View(compiledDataSet)
averageAsset <- (compiledDataSet$asset2015 + compiledDataSet$asset2014) / 2
ROAA <- compiledDataSet$netIncome2015 / averageAsset
compiledDataSet$ROAA <- round(ROAA * 100, digits=2) #percentage

#Compute ROAE and create a new variable in the compiledDataSet dataframe to store the ROE
averageEquity <- (compiledDataSet$stock2015 + compiledDataSet$stock2014) / 2
ROAE <- compiledDataSet$netIncome2015 / averageEquity
compiledDataSet$ROAE <- round(ROAE * 100, digits=2) #percentage

#Store dataframe in a CSV file called financials.csv
write.csv(compiledDataSet, file="C:/MastersThesisProject/Data/Financials/financials.csv", row.names=FALSE)

#SAVE FINAL
#CHECKPOINT




setwd("C:/MastersThesisProject/") #set working directory where project file is saved
source(file="saveWorkspaceHistory.R") #save the workspace and history before quiting
