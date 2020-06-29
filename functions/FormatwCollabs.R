###################################################################################
######### Purpose: To set up a new function that will combine and then count different combinations of name variables 
###################################################################################
######### Variable sets and counts:
            ## A) Partner names with federal agecny offices added
            ## B) Partner names without federal agency offices added 
            ## cooperators 
            ## A with cooperators
            ## B with cooperators 

#load in packages
library(tidyverse)

#load in dataset 

PartnersDataModified <- read.csv(paste0("/usr/local/bin/store/partner_rff/data/PartnersDataModified.csv"), 
                                 stringsAsFactors = FALSE, na = c("", " ", "NA"))

FormatDataPartTwo <- function(){ 
  
  ## 1. Remove columns with extra information 
  PartnersDataModified <- PartnersDataModified[,-c(1, 4,5, 11:15)]

  # 2. Counts for each of the new columns 
    #Column with federal agency offices added 
  count_w_FedAg_wo_collab <- str_count(PartnersDataModified$partner_names_changed, ",") #counting the number of commas in each row
  count_w_FedAg_wo_collab <- (count_w_FedAg_wo_collab + 1) #because partners are seperated by a , need to add 1 to each 
  PartnersDataModified <- add_column(PartnersDataModified, count_w_FedAg_wo_collab) #add column to dataframe 
    #Original partner list with slight alteration withou federal agency offices 
  count_wo_FedAg_wo_collab <- str_count(PartnersDataModified$partner_names_changed_back, ",") #counting the number of commas in each row
  count_wo_FedAg_wo_collab <- (count_w_FedAg + 1) #because partners are seperated by a , need to add 1 to each 
  PartnersDataModified <- add_column(PartnersDataModified, count_wo_FedAg_wo_collab) #add column to dataframe 
    # Count of number of collaborators for each 
  count_collab <- str_count(PartnersDataModified$collaborators.to.add.in.code, ",") #counting the number of commas in each row
  count_collab <- (count_collab + 1) #because partners are seperated by a , need to add 1 to each 
  PartnersDataModified <- add_column(PartnersDataModified, count_collab) #add column to dataframe 
  
  # 2. Duplicate collaborators column so that it can be combined with two different columns 
  
  PartnersDataModified <- PartnersDataModified[,c(1:10,7)]
  
  # 3. Combine collaborators two the two columns and then count
 
  PartnersDataModified <- PartnersDataModified %>% 
    unite(col = "FedAg_w_collab", #what to name the new column 
          c(partner_names_changed, collaborators.to.add.in.code), #counts being united
          sep = "," , na.rm = TRUE) #how to seperate the things we are uniting
         
   PartnersDataModified <- PartnersDataModified %>% 
      unite(col = "wo_FedAg_w_collab", #what to name the new column 
            c(partner_names_changed_back, collaborators.to.add.in.code.1), #counts being united
               sep = "," , na.rm = TRUE) #how to seperate the things we are uniting 
   
   # counting FedAg with Collab
   
   PartnersDataModified$count_wo_FedAg_wo_collab
  
   PartnersDataModified$count_w_FedAg_w_collab <- rowSums(PartnersDataModified[,c("count_collab", "count_w_FedAg_wo_collab")], na.rm=TRUE)
   
   #count_w_FedAg_w_collab <- (count_w_FedAg_wo_collab + count_collab, na.rm = TRUE) #because partners are seperated by a , need to add 1 to each 
  # PartnersDataModified <- add_column(PartnersDataModified, count_w_FedAg_w_collab) #add column to dataframe 
   
  # Counting Original with Collab
  
   PartnersDataModified$count_wo_FedAg_w_collab <- rowSums(PartnersDataModified[,c("count_collab", "count_wo_FedAg_wo_collab")], na.rm=TRUE)
   
   
}
