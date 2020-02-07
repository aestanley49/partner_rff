### ### ### checking the count of original list of species 
library(readxl)
library(tidyverse)
library(janitor)
counts <- read_excel("~/Desktop/RFF/partner_rff/data/archive/loose excel sheets/11_3_19partnershipdata_cleaned_AS7.xlsx", "notes on each doc")
#View(counts)
str(counts)
counts <- counts[,-c(6:9, 13,14,15,18,19,20,23,24)]


counts <- counts[-which(is.na(counts$`Partner identity CP1`)),] #removed all rows that had na's for partners aka the ones with no information

cleancounts <- counts %>%  ##cleaning/reformating colunm names --> default is lower_case_snake
                  clean_names()


## getting list of column names cleancounts$partner_identity_cp1, cleancounts$partner_identity_cp2, cleancounts$partner_identity_cp3

together <- cleancounts %>% 
                      unite(col = "all_partner_names", #what to name the new column 
                           c(partner_identity_cp1, partner_identity_cp2, partner_identity_cp3), #counts being united
                            sep = "," #how to seperate the things we are uniting
                            )

?mutate
##could remove non-numeric arguements to check, but there are MANY 
together$partners_present_cp1
together$partners_present_cp2
together$partners_present_cp33
 
#adding up values won't work unless non-numeric   
    #additions <- additions %>%
       #  mutate(sum_part = partners_present_cp1 + partners_present_cp2+ partners_present_cp33)


additions <- together %>%
                  unite(col = "sum_part",
                        c(partners_present_cp1, partners_present_cp2, partners_present_cp33),
                        sep = "_")

##Go through and get count based on how many strings in a cell 
  #Need to check no lengthy notes first 
  # really didn't structure this in a way that was easy to count, probs need to go through and edit each cell
View(additions)

additions$all_partner_names[1] <- "USFS,BLM" #removed NA
additions$all_partner_names[2] <- "USFS" #removed NA
additions$all_partner_names[3] <- "BLM, Idaho Department of Fish and Game,Seeds of Success program, Utah State University and the Agricultural Research Service"
      # removed BLM’s Lower Snake River District, 
      #shrunk- Idaho Department of Fish and Game’s Conservation Data Center to Idaho Department of Fish and Game
      #duplicate of BLM 
      #also note for last three partners : (don't think all 3 are in partnership just BLM working with each)
additions$all_partner_names[4] <- "Montana Department of Fish Wildlife and Parks, USFWS"
      #In cooperation with Montana Department of Natural Resources and Conservation + USDA NRCS,BLM,Montana Fish, Wildlife and Parks (MFWP), Montana Department of Natural Resources and Conservation (DNRC)"
additions$all_partner_names[5] <- "USFS, USFWS" #removed NA
additions$all_partner_names[6] <- "USFS, USFWS" #removed NA
additions$all_partner_names[7] <- "Rare Care, NPS" #removed NA
additions$all_partner_names[8] <- "Kentucky Ecological Services Field Office, the owner of the Beaver Cave property, 
        Kentucky Department of Fish and Wildlife Resources, Natural Resource Conservation Service, Farm Service Agency, 
        Kentucky State Nature Preserves Commission, Kentucky Division of Forestry" #just reformatted and removed NA
additions$all_partner_names[9] <- "BLM"
### ### ### ### took partner that was relevant for species, not partners in total agreement *** other sheet is inconsistent 
additions$all_partner_names[10] <- "US Navy, US Marine Corps, US Customs and Border Protection, California State Parks, USFWS,
      California Department of Fish & Game, California Department of Forestry & Fire Protection, California Department of Parks & Recreation, Center for Natural Lands Management, 
      City of Riverside Park and Recreation Department, Metropolitan Water District, Riverside County Environmental Programs Department, Riverside County Habitat Conservation Agency, 
      Riverside County Regional Park and Open-Space District, Riverside Land Conservancy, San Diego State University Field Stations Program, The Nature Conservancy, University of California Riverside U.S., BLM, USFWS, USFS"
additions$all_partner_names[11] <- "Mississippi Army National Guard, USFS, Mississippi Department of Wildlife Fisheries and Parks, USFWS"
additions$all_partner_names[12] <- "USFS, USFWS, Nevada Department of Conservation and Natural Resources"
  #total agreement: Clark County, USFS, USFWS, BLM, NPS, NDOW, Nevada Division of State parks, USAF, boulder city, state parks ---> ‚Ä¢ Clark County (all ecosystems) ‚Ä¢ USFS (alpine, bristlecone pine, mixed conifer, pinyon-juniper, sagebrush, and blackbrush) ‚Ä¢ USFWS (as a resource agency, throughout Clark County; as land managers, bristlecone pine, mixed conifer, pinyon-juniper, sagebrush, blackbrush, salt desert scrub, Mojave desert scrub, and mesquite/catclaw) ‚Ä¢ BLM (pinyon-juniper, sagebrush, blackbrush, salt desert scrub, Mojave desert scrub, mesquite/catclaw, and desert riparian/aquatic) ‚Ä¢ USAF (salt desert scrub and Mojave desert scrub) ‚ NPS, Boulder City ‚ State Parks ‚NDOW‚NDOT‚NDF"
additions$all_partner_names[13] <- "USFS, USFWS"
additions$all_partner_names[14] <- "USFS, USFWS, Nevada Department of Conservation and Natural Resources"
  ### ### same as row 12 
additions$all_partner_names[15] <- "Illinois Department of Natural Resources, Indiana Department of Natural Resources, Kentucky Department of Fish and Wildlife Resources, Kentucky Coal Association, Kentucky Coal Country Association, Kentucky Farm Bureau, Kentucky Natural Resources and Environmental Cabinet, Western Kentucky Coal Association, USFWS"
#"*unclear if in addition to or separate from other agreement - "Indiana Coal Council, Indiana Department of Natural Resources, USFWS"
additions$all_partner_names[16] <- "Utah Division of parks and recreation, BLM, FWS, Kane County Utah"
additions$all_partner_names[17] <- "private landowners of Cow Head Lake Cow Head Slough and California reach of Barrel Creek (four owners, all CA signatories), principal permittees on BLM lands within the drainage, California and Modoc County Cattlemen’s Associations, the California Farm Bureau Federation, BLM, California Department of Fish and Game"
additions$all_partner_names[18] <- "California department of Fish and Wildlife Natural Heritage Division Endangered plant program"
additions$all_partner_names[19] <- "Adelanto, Barstow, California City, Hesperia, Lancaster, Palmdale, Ridgecrest, Twentynine Palms,  Victorville, Apple Valley, Yucca Valley, Counties of Inyo, Kern, Los Angeles, San Bernardino, Indian Wells Valley Water District. ‚The California Department of Fish and Game, California Department of Transportation ‚ BLM, USFWS, US Air Force"
additions$all_partner_names[20] <- "USFWS, BLM, Center of Excellence for Hazardous Materials Management, Southwest Region, Natural Resources Conservation Service, Texas A&M University, Texas Comptroller of Public Accounts, Texas Interagency Task Force on Economic Growth and Endangered Species, Texas Department of Agriculture, Texas Parks and Wildlife Department, Railroad Commission of Texas, University of Texas System University Lands, Texas Farm Bureau, Texas Oil & Gas Association, Texas Royalty Council, Texas & Southwestern Cattle Raisers Association, Texas Wildlife Association, Texas Association of Business"
additions$all_partner_names[21] <- "California department of Fish and Wildlife, USFS, USFWS" #in other excel sheet, had counted Eagle Lake as partner when its actually part of USFS
# started just adding commas here
additions$all_partner_names[22] <- "Nevada Department of Wildlife, The National Park Service, The Bureau of Land Management, the Fish and Wildlife Service, in addition to The Nevada Natural Heritage Program (NNHP), The Nature Conservancy (TNC), and Desert Research Institute"
additions$all_partner_names[23] <- "Anza-Borrego State Park, Arizona Game and Fish, California Department of Fish and Game, California State Parks, Ocotillo Wells, Bureau of Land Management, U.S. Bureau of Reclamation, U.S. Fish and Wildlife Service,Marine Corps Air Station, Naval Air Facility,Navy SW Division"
    ### ### More to add? Pages 6-6 (done regionally) - looks like these were manually added later to other list 
additions$all_partner_names[24] <- "USFWS, Tohono O’odham Nation" # removed NA
additions$all_partner_names[25] <- "U.S. Fish and Wildlife Service, Clemson University, Georgia Department of Natural Resources, Georgia Department of Transportation, Georgia Power, Mecklenburg County Park and Recreation North Carolina, National Park Service, North Carolina Department of Agriculture & Consumer Services Plant Conservation Program, Forest Service"
    ### ### cooperators seperate
additions$all_partner_names[26] <- "BLM, USFWS" # removed NA
additions$all_partner_names[27] <- "Uintah County Utah, Rio Blanco County Colorado, the Utah School and Institutional Trust Lands Administration, the Utah Governor’s Public Lands Policy Coordination Office, the Utah Division of Wildlife Resources, and the BLM in Utah and Colorado, FWS" #I think BLM was counted twice in the original
additions$all_partner_names[28] <- "Southern conservation corporation, USFWS"
additions$all_partner_names[29] <- "USFS, USFWS"
additions$all_partner_names[30] <- "USFWS, USFS, BLM"
additions$all_partner_names[31] <- "Utah Department of Natural Resources, Bureau of Land Management, Bureau of Reclamation, Utah Reclamation Mitigation and Conservation Commission, Confederated Tribes of the Goshute Reservation, Central Utah Water Conservancy District, Southern Nevada Water Authority" #should be 7 - no changes in either list, maybe miscounted 
additions$all_partner_names[32] <- "Southern conservation corporation, USFWS"
additions$all_partner_names[33] <- "Gifford Pinchot National Forest Service"
# *************** additions$all_partner_names[34]
additions$all_partner_names[34]
additions$all_partner_names[35] <- "USFS, Bureau of Land Management, Caltrans, CDFW,  Pacific Gas and Electric"
additions$all_partner_names[36] <- "Department of Forest and Rangeland Stewardship Colorado State University, Desert Research Institute, National Park Service"
# ************** additions$all_partner_names[37] 
additions$all_partner_names[38] <- #    ???????
additions$all_partner_names[39] <- "Arizona Game and Fish Department, USFWS"
# ***************** additions$all_partner_names[40]
additions$all_partner_names[41] <- "USFS, Nevada Department of Wildlife"
    ## plus unspecified cooperator 
additions$all_partner_names[42] <- "Vermejo Park Ranch, New Mexico Department of Game and Fish, Colorado Division of Parks and Wildlife,  USFWS, Colorado Parks and Wildlife, New Mexico Department of Game and Fish, USFS, Mescalero Apache Nation, Jicarilla Apache Nation, Taos Pueblo, National Park Service, BLM, Trout Unlimited" #counted New Mexico Department of Game and Fish and New Mexico Department of Fish and Game as different partners 
additions$all_partner_names[43] <- "Otero County, USFS Lincoln National Forest, USFWS, Village of Cloudcroft" #multiple mis counts
additions$all_partner_names[44] <- "City of San Diego, County of San Diego, California Department of Fish and Wildlife, Fish and Wildlife Service, private land holders" #unsure what caused discrepancy here
additions$all_partner_names[45] <- "North Carolina Wildlife Resources Commission, Duke Energy Carolinas, Eastern Band of Cherokee Indians, Tennessee Valley Authority,  Georgia Department of Natural Resources, USFWS"
        ## cooperators in original doc were counted in total
additions$all_partner_names[46] <- "Office of Species Conservation, Idaho Department of Fish & Game, Idaho Department of Lands, Idaho Army National Guard, Nongovernmental Cooperator Representative, Nongovernmental Cooperator Representative, BLM, 366th Fighter Wing Commander, 366th OG and 366th OSS, HQ ACC/A3A, HQ ACC/A7AN, Morale Welfare Recreation and Services, 266th RANS, MHAFB ESOHC, 366th Civil Engineering Squadron (CES)"
        ## a number of military terms/units that are confusing/don't mean anything to me. Currently counted seperately but could be consolidated?
additions$all_partner_names[47] <- "BLM, Nevada Division of Wildlife, USFWS"
additions$all_partner_names[48] <- "Idaho Department of Fish and Game, the Idaho Governor's Office of Species Conservation, USFWS, Soulen Livestock" #had double counted partners in other doc
### ??????  additions$all_partner_names[49] 
additions$all_partner_names[50] <- "California Department of Fish and Wildlife, California State Lands Commission, California Department of Parks and Recreation California State Parks, California Tahoe Conservancy, League to Save Lake Tahoe, Nevada Division of Forestry, Nevada Division of State Lands, Nevada Division of State Parks, Nevada Natural Heritage Program, Tahoe Lakefront Owners Association, Tahoe Regional Planning Agency, US Fish and Wildlife Service, US Forest Service" ## somehow duplicated number of partners
additions$all_partner_names[51] <- "USDA, BLM, USFWS"
additions$all_partner_names[52] <- "Montana Fish Wildlife & Parks, Montana State University, USFWS" #counted USFWS bozeman fish technology center as an additional partner
additions$all_partner_names[53] <- "The Foster Creek Conservation District, Threemile Canyon Farms, The Nature Conservancy, Portland General Electric, US Fish and Wildlife Service, Oregon Department of Fish and Wildlife" #added the 1 cooperator to total count 
additions$all_partner_names[54] <- "University of Hawaii"
additions$all_partner_names[55] <- "USDA Forest Service Coronado National Forest Safford Ranger District, US Fish and Wildlife Service Arizona Ecological Services Field Office, Arizona Game and Fish Department Nongame and Endangered Wildlife Program"
additions$all_partner_names[56] <- "Uintah County Utah, Rio Blanco County Colorado, the Utah School and Institutional Trust Lands Administration, the Utah Governors Public Lands Policy Coordination Office, the Utah Division of Wildlife Resources, BLM in Utah and Colorado"
additions$all_partner_names[57] <- "Forest Service, Bureau of Land Management, National Park Service, USFWS" 
additions$all_partner_names[58] <- "Alcoa Power Generating Inc, USFWS" #had added cooperator to total 



### ### placed reason there was a discepancy into column 
discrep <- c("none")

additions <- add_column(additions, discrep)

View(both)


additions$discrep[3] <- "duplicate of BLM , also note for last three partners : (don't think all 3 are in partnership just BLM working with each)"
additions$discrep[4] <- "In cooperation with Montana Department of Natural Resources and Conservation + USDA NRCS,BLM,Montana Fish, Wildlife and Parks (MFWP), Montana Department of Natural Resources and Conservation (DNRC)"
additions$discrep[9] <- "took partner that was relevant for species, not partners in total agreement *** other sheet is inconsistent" 
additions$discrep[12] <- "total agreement: Clark County, USFS, USFWS, BLM, NPS, NDOW, Nevada Division of State parks, USAF, boulder city, state parks ---> ‚Ä¢ Clark County (all ecosystems) ‚Ä¢ USFS (alpine, bristlecone pine, mixed conifer, pinyon-juniper, sagebrush, and blackbrush) ‚Ä¢ USFWS (as a resource agency, throughout Clark County; as land managers, bristlecone pine, mixed conifer, pinyon-juniper, sagebrush, blackbrush, salt desert scrub, Mojave desert scrub, and mesquite/catclaw) ‚Ä¢ BLM (pinyon-juniper, sagebrush, blackbrush, salt desert scrub, Mojave desert scrub, mesquite/catclaw, and desert riparian/aquatic) ‚Ä¢ USAF (salt desert scrub and Mojave desert scrub) ‚ NPS, Boulder City ‚ State Parks ‚NDOW‚NDOT‚NDF"
additions$discrep[14] <- "total agreement: Clark County, USFS, USFWS, BLM, NPS, NDOW, Nevada Division of State parks, USAF, boulder city, state parks ---> ‚Ä¢ Clark County (all ecosystems) ‚Ä¢ USFS (alpine, bristlecone pine, mixed conifer, pinyon-juniper, sagebrush, and blackbrush) ‚Ä¢ USFWS (as a resource agency, throughout Clark County; as land managers, bristlecone pine, mixed conifer, pinyon-juniper, sagebrush, blackbrush, salt desert scrub, Mojave desert scrub, and mesquite/catclaw) ‚Ä¢ BLM (pinyon-juniper, sagebrush, blackbrush, salt desert scrub, Mojave desert scrub, mesquite/catclaw, and desert riparian/aquatic) ‚Ä¢ USAF (salt desert scrub and Mojave desert scrub) ‚ NPS, Boulder City ‚ State Parks ‚NDOW‚NDOT‚NDF"
additions$discrep[15] <- "unclear if in addition to or separate from other agreement - Indiana Coal Council, Indiana Department of Natural Resources, USFWS"
additions$discrep[21] <- "#in other excel sheet, had counted Eagle Lake as partner when its actually part of USFS"
additions$discrep[23] <- "Pages 6-6 (done regionally) - looks like these were manually added later to other list" 
additions$discrep[25] <- "cooperators seperate"
additions$discrep[27] <- "I think BLM was counted twice in the original"
additions$discrep[31] <- "#should be 7 - no changes in either list, maybe miscounted"
# *************** additions$all_partner_names[34]
# ************** additions$all_partner_names[37] 
additions$all_partner_names[38] <- #    ???????
  # ***************** additions$all_partner_names[40]
  additions$discrep[41] <- "plus unspecified cooperator"
additions$discrep[42] <- "#counted New Mexico Department of Game and Fish and New Mexico Department of Fish and Game as different partners"
additions$discrep[43] <- "#multiple mis counts"
additions$discrep[44] <- "unsure what caused discrepancy here"
additions$discrep[45] <- "cooperators in original doc were counted in total"
additions$discrep[46] <- "a number of military terms/units that are confusing/don't mean anything to me. Currently counted seperately but could be consolidated?"
additions$discrep[48] <- "had double counted partners in other doc"
### ??????  additions$all_partner_names[49] 
additions$discrep[50] <- "somehow duplicated number of partners"
additions$discrep[52] <- "counted USFWS bozeman fish technology center as an additional partner"
additions$discrep[53] <- "added the 1 cooperator to total count"
additions$discrep[58] <- "#had added cooperator to total" 





#used to get access to full cell if long list 
#write.csv (additions, "~/Desktop/rsumnorm.csv")
## for rows commented out, refer to AS8 to see what partner info was added 



### ### add column and fill with cases where there is a cooperator 

coop <- c(0)
additions <- add_column(additions, coop)

additions$all_partner_names[4] <- "Montana Department of Natural Resources and Conservation, USDA NRCS,BLM,Montana Fish Wildlife and Parks (MFWP), Montana Department of Natural Resources and Conservation (DNRC)"
additions$all_partner_names[25] <- "U.S. Fish and Wildlife Service, Clemson University, Georgia Department of Natural Resources, Georgia Department of Transportation, Georgia Power, Mecklenburg County Park and Recreation North Carolina, National Park Service, North Carolina Department of Agriculture & Consumer Services Plant Conservation Program, Forest Service"
### ### cooperators seperate
additions$all_partner_names[41] <- "USFS, Nevada Department of Wildlife"
## plus unspecified cooperator 

additions$all_partner_names[45] <- "North Carolina Wildlife Resources Commission, Duke Energy Carolinas, Eastern Band of Cherokee Indians, Tennessee Valley Authority,  Georgia Department of Natural Resources, USFWS"
## cooperators in original doc were counted in total
additions$all_partner_names[53] <- "added the 1 cooperator to total count"







###  ###need to write code that will count how many different strings sperated by commas 

library(stringr)
total <- str_count(additions$all_partner_names, ",") #counting the number of commas in each row
total <- (total + 1) #because partners are seperated by a , need to add 1 to each 
total

mydata <- add_column(additions, total)
#View(mydata)

## check counts against other raw data

Data <- read_csv(paste(DataSource,"/data11.8a.csv", sep = ""))
#View(RawData)

Data[which(RawData$`total number of partners for species` == 0),] <- NA
Data[-which(is.na(RawData$`total number of partners for species`)),]
#View(Data)

Data <- clean_names(Data)
Data$total_number_of_partners_for_species

both <- mydata %>%  #combine original and checked into new data frame
  full_join(Data, 
            by = c("scientific_name", "common_name"))

#View(both)

both <- both[, c(1,2,8,9,13,15)]

both <- both %>% filter(total_number_of_partners_for_species > 0) ##remove species that had 0 partners
View(both)

##try and remove species that have the same count 
same <- both %>% filter(rezeros$total[] == rezeros$total_number_of_partners_for_species[])
#View(same)

##species that do not have the same count 
neg <- both %>% anti_join(same, by = "common_name")
#View(neg)


### ### add column and fill with cases where there is a cooperator 

coop <- c(0)
both <- add_column(both, coop)

additions$all_partner_names[4] <- "Montana Department of Fish Wildlife and Parks, USFWS"
#In cooperation with Montana Department of Natural Resources and Conservation + USDA NRCS,BLM,Montana Fish, Wildlife and Parks (MFWP), Montana Department of Natural Resources and Conservation (DNRC)"
additions$all_partner_names[25] <- "U.S. Fish and Wildlife Service, Clemson University, Georgia Department of Natural Resources, Georgia Department of Transportation, Georgia Power, Mecklenburg County Park and Recreation North Carolina, National Park Service, North Carolina Department of Agriculture & Consumer Services Plant Conservation Program, Forest Service"
### ### cooperators seperate
additions$all_partner_names[41] <- "USFS, Nevada Department of Wildlife"
## plus unspecified cooperator 

additions$all_partner_names[45] <- "North Carolina Wildlife Resources Commission, Duke Energy Carolinas, Eastern Band of Cherokee Indians, Tennessee Valley Authority,  Georgia Department of Natural Resources, USFWS"
## cooperators in original doc were counted in total
additions$all_partner_names[53] <- "added the 1 cooperator to total count"


