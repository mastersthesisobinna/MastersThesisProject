setwd("C:/MastersThesisProject/") #set currently directory to find saved workspace
source(file="loadWorkspaceHistory.R") #load the workspace and history upon starting



source("C:/MastersThesisProject/Data/Financials/RFinancials.R") #run the financial data extract file


setwd("C:/MastersThesisProject/") #set working directory where project file is saved
source(file="saveWorkspaceHistory.R") #save the workspace and history before quiting