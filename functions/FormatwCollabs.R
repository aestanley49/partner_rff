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
#library(tidyverse)

#load in dataset 

#PartnersDataModified <- read.csv(paste0("/usr/local/bin/store/partner_rff/data/PartnersDataModified.csv"), 
        #                        stringsAsFactors = FALSE, na = c("", " ", "NA"))

FormatwCollabs <- function(PartnersDataModified){ 
  
  ## 1a. Remove columns with extra information 
  PartnersDataModified <- PartnersDataModified[,-c(1, 4,5, 11:15)]
  
  ## 1b. Need to remove comma at end of Flat-tailed horned lizard or have comma issue 
  
  PartnersDataModified[which(PartnersDataModified$common_name =="FLAT-TAILED HORNED LIZARD"),5] <- "California Department of Parks and Recreation Anza Borrego Desert State Park, BLM El Centro, BLM Palm Springs, BLM Yuma District, BLM California Desert District, Bureau of Reclamation Yuma, USFWS Carlsbad Field Office, USFWS Phoenix Field Office, US Marine Corps Air Station Yuma, US Naval Air Facility-El Centro, US Navy SW Division San Diego, Arizona Game and Fish, California Department of Fish and Game, California Department of Parks and Recreation Off-Highway Motor Vehicle Division Ocotillo Wells State Recreational Vehicle Area, California Department of Parks and Recreation Anza Borrego Desert State Park"
  PartnersDataModified[which(PartnersDataModified$common_name =="FLAT-TAILED HORNED LIZARD"),6] <- "California Department of Parks and Recreation Anza Borrego Desert State Park, BLM, Bureau of Reclamation, USFWS, US Marine Corps, US Navy, Arizona Game and Fish, California Department of Fish and Game, California Department of Parks and Recreation Off-Highway Motor Vehicle Division Ocotillo Wells State Recreational Vehicle Area, California Department of Parks and Recreation Anza Borrego Desert State Park"

  
  ## 1c. Add "prepared by" consultants with interest in species to collaborators columns for species 
  
  PartnersDataModified[which(PartnersDataModified$common_name =="ARCTIC GRAYLING- UPPER MISSOURI RIVER DPS"),7] ##BLM Dillon Feild Office listed under "prepared by" but already counted in code 
  PartnersDataModified[which(PartnersDataModified$common_name =="CORAL PINK SAND DUNES TIGER BEETLE"),7] ##Conservation Committe for the Coral Pink Sand Dunes Tiger Beetle - not added because this is a group of multiple entities not a single partner
  PartnersDataModified[which(PartnersDataModified$common_name =="CUYAMAC LAKE DOWNINGIA"),7] <- "Department of Biology San Diego State University"
  PartnersDataModified[which(PartnersDataModified$common_name =="LEAST CHUB"),7] <- "Utah Department of Natural Resources"
##PartnersDataModified[which(PartnersDataModified$common_name =="NEVARES SPRING NAUCORID BUG (=FURNACE CREEK)"),7] <- "Desert Reserach Institute, NPS Death Valley National Park" --> already included in partner list
##PartnersDataModified[which(PartnersDataModified$common_name == "NEW ENGLAND COTTONTAIL"),7] <- "Wildlife Management Institute, USFWS, the New England Cottontail Technical Committee" --> already included in partner list
  PartnersDataModified[which(PartnersDataModified$common_name =="ORCUTTS'S HAZARDIA"),7] <- "Center for Natural Lands Management"
##PartnersDataModified[which(PartnersDataModified$common_name =="WASHINGTON GROUND SQUIRREL"),7] <- "Foster Creek Conservation District" --> already included in partner list

  # 2. Counts for each of the new columns 
    #Column with federal agency offices added 
  count_w_FedAg_wo_collab <- str_count(PartnersDataModified$partner_names_changed, ",") #counting the number of commas in each row
  count_w_FedAg_wo_collab <- (count_w_FedAg_wo_collab + 1) #because partners are seperated by a , need to add 1 to each 
  PartnersDataModified <- add_column(PartnersDataModified, count_w_FedAg_wo_collab) #add column to dataframe 
    #Original partner list with slight alteration withou federal agency offices 
  count_wo_FedAg_wo_collab <- str_count(PartnersDataModified$partner_names_changed_back, ",") #counting the number of commas in each row
  count_wo_FedAg_wo_collab <- (count_wo_FedAg_wo_collab + 1) #because partners are seperated by a , need to add 1 to each 
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

   #write to csv 
   write.csv(PartnersDataModified,paste(DataSource,"/ProcessedPartnersDataModified.csv", sep = ""))

   newpdata <- PartnersDataModified
   
   return(newpdata) # return indicates what will get spit out of the function and what will be accessible in the MD doc
   
   
}

