###################################################################################
######### Purpose: Add final rounds of cleaning to salafsky action df
###################################################################################
######### Why: have errors in multipartner strings that need correcting 
###################################################################################
######### This will next be run through multipartnerstrings.R function 

#final round of cleaning for Salafsky 


#load in dataset 
#tableofPandA <- read.csv(paste0("/usr/local/bin/store/partner_rff/data/tableofPandAmodified.csv"), stringsAsFactors = FALSE, na = "", #issue was that "" is coming up instead of NA
      #                              strip.white=TRUE) #trying to see if this will fix problem 
      
salafsky_final_edits <- function(tableofPandA){ 
                   

##### 1. Change names / remove commas 

tableofPandA[which(tableofPandA$partner.in.agreement == "Kentucky Coal Association, Kentucky Coal Country Association, Kentucky Farm Bureau, Western Kentucky Coal Association,"),1] <- "Kentucky Coal Association, Kentucky Coal Country Association, Kentucky Farm Bureau, Western Kentucky Coal Association"
# the comma at the end of this string Kentucky Coal Association, Kentucky Coal Country Association, Kentucky Farm Bureau, Western Kentucky Coal Association,

tableofPandA[which(tableofPandA$partner.in.agreement == "Air force, BLM, ???"),1] <- "Air force, BLM"
#Air force, BLM, ???	Lepidium papilliferum	SLICKSPOT PEPPERGRASS - Removed the "???" in this string, EIT stands for "Enhanced Training in Idaho"

tableofPandA[which(tableofPandA$partner.in.agreement == "** I think this refers to all: ICC Interagency Coordinating Committee"),1]  <- "Anza-Borrego State Park, Arizona Game and Fish Yuma, California Department of Fish and Game, California State Parks, Ocotillo Wells, BLM El Centro, BLM Palm Springs, BLM Yuma, US Bureau of Reclamation Yuma, USFWS Carlsbad, USFWS Phoenix, US Marine Corps Air Station Yuma, US Naval Air Facility El Centro, US Navy SW Division"
# ** I think this refers to all: ICC Interagency Coordinating Committee	Phrynosoma mcallii	FLAT-TAILED HORNED LIZARD
# change to :: Anza-Borrego State Park, Arizona Game and Fish Yuma, California Department of Fish and Game, California State Parks, Ocotillo Wells, BLM El Centro, BLM Palm Springs, BLM Yuma, US Bureau of Reclamation Yuma, USFWS Carlsbad, USFWS Phoenix, US Marine Corps Air Station Yuma, US Naval Air Facility El Centro, US Navy SW Division


tableofPandA[which(tableofPandA$partner.in.agreement == "??"),1] <- "NRCS, USFWS"
# ???	Sceloporus arenicolus	DUNES SAGEBRUSH LIZARD
#NRCS, FWS	Sceloporus arenicolus	DUNES SAGEBRUSH LIZARD


tableofPandA[which(tableofPandA$partner.in.agreement == "All parties"),1] <- "Participating landowners, Center of Excellence for Hazardous Materials Management (CEHMM), USFWS Southwest Region	Sceloporus arenicolus	DUNES SAGEBRUSH LIZARD"
# "All parties"	DUNES SAGEBRUSH LIZARD
# Participating landowners, Center of Excellence for Hazardous Materials Management (CEHMM), USFWS Southwest Region	Sceloporus arenicolus	DUNES SAGEBRUSH LIZARD


### Need to set up code to make sure that all partners for this species & agreement are fed into this cell --> 
# ******Also need to code in all for this one
tableofPandA[which(tableofPandA$partner.in.agreement == "ALL (all parties)"),1] 


#### taken from multipartnerstrings.R function so that have edits all in one place 


### First need to fix any spelling inconsistencies between strings and individual partners or won't combine
### Add any found here 

tableofPandA[13,1]  <- "CPSD State Park" #for Cicindela albissima, now matches what is in strings 


tableofPandA[which(tableofPandA$partner.in.agreement == "Anza-Borrego Desert State Park (ABDSP)"),1] <- "Anza-Borrego Desert State Park"

tableofPandA[which(tableofPandA$partner.in.agreement == "Anza-Borrego Desert State Park, Arizona Game and Fish Yuma, California Department of Fish and Game, California State Parks, Ocotillo Wells, BLM El Centro, BLM Palm Springs, BLM Yuma, US Bureau of Reclamation Yuma, USFWS Carlsbad, USFWS Phoenix, US Marine Corps Air Station Yuma, US Naval Air Facility El Centro, US Navy SW Division"),1] <- "Anza-Borrego State Park, Arizona Game and Fish Yuma, California Department of Fish and Game, California State Parks, Ocotillo Wells, BLM El Centro, BLM Palm Springs, BLM Yuma, US Bureau of Reclamation Yuma, USFWS Carlsbad, USFWS Phoenix, US Marine Corps Air Station Yuma, US Naval Air Facility El Centro, US Navy SW Division"

tableofPandA[which(tableofPandA$partner.in.agreement == "Anza-Borrego Desert State Park (ABDSP)"),1] <- "Anza-Borrego Desert State Park"


## And changing from abreviations so actually know who partner is

tableofPandA[which(tableofPandA$partner.in.agreement == "USFWS, neighboring land owners, EPA, COE, MSU"),1] <- "USFWS, neighboring land owners, EPA, Montana State University, U.S. Army Corps of Engineers"

tableofPandA[which(tableofPandA$partner.in.agreement == "CPSD State Park"),1] <- "Coral Pink Sand Dunes State Park"
tableofPandA[which(tableofPandA$partner.in.agreement == "CPSD State Park, BLM Utah State office"),1] <- "Coral Pink Sand Dunes State Park, BLM Utah State office"
tableofPandA[which(tableofPandA$partner.in.agreement == "CPSD State Park, BLM Utah State office, USFWS Utah Field Office"),1] <- "Coral Pink Sand Dunes State Park, BLM Utah State office, USFWS Utah Field Office"

tableofPandA[which(tableofPandA$partner.in.agreement == "Vauge/Unspecified cooperators: NRCS, New Mexico Department of Game and Fish"),1] <- "NRCS, New Mexico Department of Game and Fish"





##### 2. Delete rows with no actions 

tableofPandA <- tableofPandA[-which(tableofPandA$partner.in.agreement == "Implementation and Monitoring Committee (IM Committee)"),]
# delete - Implementation and Monitoring Committee (IM Committee) wash g squirrel
tableofPandA <- tableofPandA[-which(tableofPandA$partner.in.agreement == "Duties and Responsibilities of the FCCD Board of Supervisors"),]
# Duties and Responsibilities of the FCCD Board of Supervisors/
tableofPandA <- tableofPandA[-which(tableofPandA$partner.in.agreement == "Duties and Responsibilities of the MSGCP Administrator"),]
#Duties and Responsibilities of the MSGCP Administrator because no actions
#

##  Parties mutually agree to.. lines in both greater and lesser beetles (line below deletes both)
tableofPandA <- tableofPandA[-which(tableofPandA$partner.in.agreement == "parties mutually agree to…"),]



# Add 1 in action 9 for NRCS, FWS	Sceloporus arenicolus	DUNES SAGEBRUSH LIZARD bc have technical assistance actions that wasn't categorized 
tableofPandA[which(tableofPandA$partner.in.agreement == "NRCS, USFWS"),21] <- 1 ##note column no could change



##### Checking to see if any rows have all 0s (those which do will be added to section above)

## final df is all rows with all 0s 

allzero <- filter_all(tableofPandA, all_vars(. == 0))
zero <- tableofPandA %>% rownames_to_column() %>% filter_at(vars(rowname), all_vars(. == 0))
## all non zero rows have been reomved 

# check in coding salafsky before deleting row 
modPA <- tableofPandA


##### Check to see if species x documents are consistent with federal organization name changes 
  # some cases where hard to distinguish difference in document - making that list of species here 

          ##*#******_____________________________********#####

return(modPA) # return indicates what will get spit out of the function and what will be accessible in the MD doc

}
