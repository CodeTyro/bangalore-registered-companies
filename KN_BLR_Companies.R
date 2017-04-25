#####################################################################################################
#This R script lets you download, state-specific company data from the https://data.gov.in/ portal
#I have chosen Karnataka company data and I downloaded the data into 'Kar_Ind_Master.csv' file
#####################################################################################################
library(ggplot2)
library('xlsx') 
Kar_All_Ind <- read.csv(file = "Kar_Ind_Master.csv",head = TRUE,sep = ",")
dim(Kar_All_Ind)
names(Kar_All_Ind)
#Filter out dormant and inactive companies in the list
Only_Active__Kar_All_Ind <- subset(Kar_All_Ind, COMPANY_STATUS %in% c("ACTIVE","ACTIVE IN PROGRESS","AMALGAMATED","CONVERTED TO LLP"))
dim(Only_Active__Kar_All_Ind)
#Now filter out the registered office address for the string 'Bangalore'
Active_KN_Subset <- Only_Active__Kar_All_Ind[grep("BANGALORE", Only_Active__Kar_All_Ind$REGISTERED_OFFICE_ADDRESS), ]
#Now plot those companies in Bangalore based on their principal business activity
ggplot(Active_KN_Subset,  aes(x = "Business", fill = PRINCIPAL_BUSINESS_ACTIVITY)) + geom_bar()



