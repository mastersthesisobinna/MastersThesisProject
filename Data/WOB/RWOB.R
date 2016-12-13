setwd("C:/MastersThesisProject/") #set currently directory to find saved workspace
source(file="loadWorkspaceHistory.R") #load the workspace and history upon starting

setwd("C:/MastersThesisProject/Data/WOB/") #set working directory

#This file extracts the women on boards in technology firms situated in the United States


#install required packages
ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

# usage
packages <- c("rvest", "XML", "plyr", "gdata")
ipak(packages)


#install.packages("rvest")
#install.packages("XML")
#install.packages("plyr")
#install.packages("gdata")

#load library
library("rvest") # load rvest
library("XML") # load XML
library("plyr") # load plyr
library("gdata") # load gdata to use remove.vars command and support excel


#Gather the raw unclean data
url1 <- "https://www.2020wob.com/company-directory?page="
url2 <- "&company=&city=&women_on_board=&sector="
sec <- "Technology" #set once the sector
url2.sector <- paste0(url2, sec) #attach value to url
for(i in 0:5){
  url1.page <- paste0(url1, i) #page i
  searchURL <- paste0(url1.page, url2.sector) #attach both sector and page number or page i
  wob.sight<-read_html(searchURL)
  wob.sight%>%html_table(header=TRUE)->co_list
  write.table(co_list, file = "./uncleanWOB.csv", sep = ",", row.names = F, append = T)
  x1 <- runif(1, 3, 6) # gen a random number between 30 and 60
  Sys.sleep(x1) # wait x1 seconds before reading the next page
}


#Clean the data
x.df <- read.csv("./uncleanWOB.csv")
y.df <- subset(x.df, Var.9 != "Var.9") # remove extra headers that occurs in almost every 51 steps of the dataset
selectColumns <- c("X2020.Rating","X..of.Women","Var.9") 
df <- remove.vars(data=y.df, names=selectColumns) #remove x2020.Rating, xPercentage.Women, and Var.9
df <- rename(df, replace=c("Company"="firm", 
                           "Total.Board"="Board",
                           "X..of.women"="WOB")) #rename columns
#names(df)
#class(df$Firm); class(df$Board); class(df$WOB); class(df$Sector); class(df$State); class(df$City)
#str(df$Firm)
df$firm <- as.character(df$firm)
df$Sector <- as.character(df$Sector)
df$State <- as.character(df$State)
df$City <- as.character(df$City)
df$Country <- "United States"
df$Board <-as.numeric(levels(df$Board ))[df$Board ] # convert Board to numeric
df$WOB<-as.numeric(levels(df$WOB))[df$WOB] # convert WOB to numeric

df$percentWOB <- round((df$WOB/df$Board)*100 , digits = 0) #create new value for percentage of WOB

df <- df[order(-df$percentWOB, df$firm), ]

cleanDataset <- df
#summary(cleanDataset) #checking for any NAs in dataset and studying the overview of the data.

write.csv(cleanDataset, file = "C:/MastersThesisProject/Data/WOB/wob.csv", row.names = FALSE)
#View(read.csv(file="./wob.csv")) #view new file in R.



setwd("C:/MastersThesisProject/") #set working directory where project file is saved
source(file="saveWorkspaceHistory.R") #save the workspace and history before quiting
