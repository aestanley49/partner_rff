

FormatData <- function(RawData){ # inside the parenthesis indicates what the function needs to work. These are specified in the main MD document

## this function takes the raw data and formats it into something more useful for later analyses
# I put some of your "sums code.Rmd" code in this function

#dim(RawData)
#head(RawData)   ## just looking at the dataset
  
## 1. Remove columns with extra information 
  
RawData <- RawData[,-c(3:10, 11,14:16, 19:21, 24:26)]

## 2. Clean and merge columns of raw data together

RawData <- RawData %>%  ##cleaning/reformating colunm names --> default is lower_case_snake
  clean_names()
  
  ### getting list of column names cleancounts$partner_identity_cp1, cleancounts$partner_identity_cp2, cleancounts$partner_identity_cp3
  RawData <- RawData %>% 
    unite(col = "all_partner_names_raw", #what to name the new column 
          c(partner_identity_cp1, partner_identity_cp2, partner_identity_cp3), #counts being united
          sep = "," #how to seperate the things we are uniting
    )
  ### combining manual counts of partners
  RawData <- RawData %>%
    unite(col = "sum_part_raw",
          c(partners_present_cp1, partners_present_cp2, partners_present_cp33),
          sep = "_")
  

## old code - Replace "N/A" with NA so that fields with no data all behave the same
#RawData[which(RawData$`Who the partners are` =="N/A"),5] <- NA # 5 is the column called 'Who the partner are'. I called it this way to avoid writing but it is less safe if things move around // note this changed when other dataset was read in 
#which(is.na(RawData$`Who the partners are`)) # Check to make sure it worked

## 2. Manually change spelling errors

RawData[RawData$scientific_name == "Calochortus persistens", 5] <- NA 
RawData[RawData$scientific_name == "Allium gooddingii", 5] <- "USFS, USFWS" #removed NA
RawData[RawData$scientific_name == "Astragalus cusickii var. packardiae", 5] <- "BLM, Idaho Department of Fish and Game,Seeds of Success program, Utah State University and the Agricultural Research Service"
# removed BLM’s Lower Snake River District, 
#shrunk- Idaho Department of Fish and Game’s Conservation Data Center to Idaho Department of Fish and Game
#duplicate of BLM 
#also note for last three partners : (don't think all 3 are in partnership just BLM working with each)
RawData[RawData$scientific_name == "Astragalus cusickii var. packardiae", 5] <- "BLM" #other agreement wasn't valid
RawData[RawData$scientific_name == "Thymallus arcticus", 5] <- "Montana Department of Fish Wildlife and Parks, USFWS, BLM"
RawData[RawData$scientific_name == "Cimicifuga arizonica", 5] <- "USFS, USFWS"
RawData[RawData$scientific_name == "Lupinus aridus ssp. ashlandensis", 5] <- "USFS, USFWS"
RawData[RawData$scientific_name == "Erigeron basalticuss", 5] <- "Rare Care, NPS"
RawData[RawData$scientific_name == "Pseudanophthalmus major", 5] <- "Kentucky Ecological Services Field Office, Owner of the Beaver Cave property,  Kentucky Department of Fish and Wildlife Resources,  Natural Resources Conservation Service,  Farm Service Agency,  Kentucky State Nature Preserves Commission,  Kentucky Division of Forestry"
RawData[RawData$scientific_name == "Opuntia X multigeniculata", 5] <- "BLM"
RawData[RawData$scientific_name == "Phacelia stellaris", 5] <- "California Department of Fish and Game, California Department of Forestry and Fire Protection, California Department of Parks and Recreation, Center for Natural Lands Management, City of Riverside Park and Recreation Department, Metropolitan Water District, Riverside County Environmental Programs Department, Riverside County Habitat Conservation Agency, Riverside County Regional Park and Open-Space District, Riverside Land Conservancy, San Diego State University Field Stations Program, The Nature Conservancy, University of California Riverside, BLM, USFWS, USFS, US Navy, US Marine Corps, US Customs and Border Protection, California State Parks"
RawData[RawData$scientific_name == "Fallicambarus gordoni", 5] <- "Mississippi Army National Guard, USFS, Mississippi Department of Wildlife Fisheries and Parks, USFWS"
RawData[RawData$scientific_name == "Synthyris ranunculina", 5] <- NA 
RawData[RawData$scientific_name == "Castilleja christii", 5] <- "USFS,  USFWS"
RawData[RawData$scientific_name == "Astragalus oophorus clokeyanus", 5] <- "Nevada Department of Conservation and Natural Resources, Clark County, USFS, USFWS, BLM, NPS, Nevada Department of Wildlife, Nevada Department of Transportation, Nevada Division of State Parks, U.S. Air Force, Boulder City"
RawData[RawData$scientific_name == "Nerodia erythrogaster neglecta", 5] <- "Illinois Department of Natural Resources, Indiana Department of Natural Resources, Kentucky Department of Fish and Wildlife Resources, Kentucky Coal Association, Kentucky Coal Country Association, Kentucky Farm Bureau, Kentucky Natural Resources and Environmental Cabinet, Western Kentucky Coal Association, USFWS, Office of Surface Mining Reclamation and Enforcement"
RawData[RawData$scientific_name == "Cicindela albissima", 5] <- "Utah Division of Parks and Recreation, BLM, USFWS, Kane County"
###not sure if the one below will print out as 4 private landowners
RawData[RawData$scientific_name == "Gila bicolor vaccaceps", 5] <- "private landowners of Cow Head Lake Cow Head Slough and California reach of Barrel Creek (four owners all CA signatories), principal permittees on BLM lands within the drainage, California and Modoc County Cattlemen's Associations, the California Farm Bureau Federation, BLM, California Department of Fish and Game"
RawData[RawData$scientific_name == "Downingia concolor brevior", 5] <- "California Department of Fish and Wildlife Natural Heritage Division Endangered plant program"
RawData[RawData$scientific_name == "Cymopterus deserticola", 5] <- NA
RawData[RawData$scientific_name == "Sceloporus arenicolus", 5] <- "USFWS, BLM, Center of Excellence for Hazardous Materials Management, NRCS, Texas A&M University, Texas Comptroller of Public Accounts, Texas Interagency Task Force on Economic Growth and Endangered Species, Texas Department of Agriculture, Texas Parks and Wildlife Department, Railroad Commission of Texas, University of Texas System - University Lands, Texas Farm Bureau, Texas Oil and Gas Association, Texas Royalty Council, Texas and Southwestern Cattle Raisers Association, Texas Wildlife Association, Texas Association of Business"
RawData[RawData$scientific_name == "Oncorhynchus mykiss aquilarum", 5] <- "California Department of Fish and Wildlife, USFS, USFWS"
RawData[RawData$scientific_name == "Pyrgulopsis notidicola", 5] <- "Nevada Department of Wildlife, NPS, BLM, USFWS, Nevada Natural Heritage Program, The Nature Conservancy, Desert Research Institute"
RawData[RawData$scientific_name == "Phrynosoma mcallii", 5] <- "Anza-Borrego State Park, Arizona Game and Fish, California Department of Fish and Game, California State Parks, Ocotillo Wells, BLM, US Bureau of Reclamation, USFWS, US Marine Corps, US Naval Air Facility, US Navy"
RawData[RawData$scientific_name == "Dalea tentaculoides", 5] <- "USFWS, Tohono Oodham Nation" #spelt wrong because of '
RawData[RawData$scientific_name == "Symphyotrichum georgianum", 5] <- "USFWS, Clemson University, Georgia Department of Natural Resources, Georgia Department of Transportation, Georgia Power, Mecklenburg County Park and Recreation North Carolina, NPS, North Carolina Department of Agriculture & Consumer Services Plant Conservation Program, USFS"
RawData[RawData$scientific_name == "Astragalus anserinus", 5] <- "BLM, USFWS"
RawData[RawData$scientific_name == "Penstemon grahamii", 5] <- "Uintah County, Rio Blanco County, Utah School and Institutional Trust Lands Administration, Utah Governors Public Lands Policy Coordination Office, Utah Division of Wildlife Resources, BLM, USFWS"
RawData[RawData$scientific_name == "Pseudanophthalmus pholeter", 5] <- "USFWS"
RawData[RawData$scientific_name == "Horkelia hendersonii", 5] <- "USFS, USFWS"
RawData[RawData$scientific_name == "Pediocactus paradinei", 5] <- "USFS, BLM, USFWS"
RawData[RawData$scientific_name == "Iotichthys phlegethontis", 5] <- "Utah Department of Natural Resources,  BLM, Bureau of Reclamation, Utah Reclamation Mitigation and Conservation Commission, Confederated Tribes of the Goshute Reservation, Central Utah Water Conservancy District, Southern Nevada Water Authority"
RawData[RawData$scientific_name == "Pseudanophthalmus catorycetes", 5] <- "USFWS"
RawData[RawData$scientific_name == "Polites mardon", 5] <- NA
RawData[RawData$scientific_name == "Oncorhynchus mykiss ssp.", 5] <- "USFWS,  USFS,  California Department of Fish and Game,  John Hancock Mutual Life Insurace Company,  Bob McIntsh (Private landowner),  Sierra Pacific Industries, Hearest Corporation,  Siskiyou County Board of Supervisors"
RawData[RawData$scientific_name == "Clarkia lingulata", 5] <- "USFS, BLM, California Department of Transportation (caltrans), California Department of Fish and Wildlife, Pacific Gas and Electric"
RawData[RawData$scientific_name == "Ambrysus funebris", 5] <- "Department of Forest and Rangeland Stewardship Colorado State University, Desert Research Institute, NPS"
RawData[RawData$scientific_name == "Sylvilagus transitionalis", 5] <- "USGS, Natural Resources Conservation Service, USFWS, Mashpee Wampanoag Tribe, Lyme Land Conservation Trust, American Forest Foundation, Woodcock Limited, WCS Queens Zoo, Wells National Esturarine Research Reserve, Roger Williams Park Zoo, Audubon Connecticut, Connecticut Audubon Society, Open Space Institute, Audubon New York, Quail Forever, Pheasants Forever, Doris Duke Charitable Foundation, Wildlife Conservation Society, Amrican Bird Conservancy, Quality Deer Management Association, Sustainable Forestry Initiative, White Memorial Foundation, National Fish and Wildlife Foundation, Ruffed Grouse Society/American Woodcock Society, National Wild Turkey Federation, Wildlife Management Institute, New Engalnd Cottontail Conservation Initiative, Northeast Forest and Fire Management, Lyme Timber Company, Monterey Preservation Land Trust, Narrow River Land Trust, Nantucket Conservation Foundation, Scarborough Land Trust, Avalonia Land Conservancy, Orenda Wildlife Land Trust, Trustees of Reservations, Berkshire Natural Resources Council, York Land Trust, Becket Land Trust, Trust for Public Land, Massachusetts National Guard, New York Division of Fish Wildlife and Marine Resources, Northeast Association of Fish and Wildlife Agencies, Rhode Island Division of Fish and Wildlife, Connecticute Department of Energy and Environmental Protection, Massachusetts Division of Fisheries and Wildlife, New Hampshire Fish and Game Department, Maine Department of Inland Fisheries and Wildlife, University of Rhode Island College of Envionment and Life Sciences, University of New Hampshire, University of New Hampshire Cooperative Extenson, New Hampshire Fish and Game Department"
RawData[RawData$scientific_name == "Hazardia orcuttii", 5] <- "City of NCCP, USFWS, City of Carlsbad, City of San Marcos, California Department of Fish and Game, California Resources Agency"
RawData[RawData$scientific_name == "Pyrgulopsis morrisoni", 5] <- "Arizona Game and Fish Department, USFWS"
RawData[RawData$scientific_name == "Lithobates subaquavocalis", 5] <- NA
RawData[RawData$scientific_name == "Lithobates onca", 5] <- "USFWS,  Nevada Department of Wildlife"
RawData[RawData$scientific_name == "Oncorhynchus clarkii virginalis", 5] <- "Colorado Parks and Wildlife, New Mexico Department of Game and Fish, USFS, USFWS, Mescalero Apache Nation, Jicarilla Apache Nation, Taos Pueblo, NPS, BLM,  Trout Unlimited, Vermejo Park Ranch, Colorado Division of Parks and Wildlife"
RawData[RawData$scientific_name == "Euphydryas anicia cloudcrofti", 5] <- "Otero County, USFS, USFWS, Village of Cloudcroft"
RawData[RawData$scientific_name == "Lotus argophyllus adsurgens", 5] <- "USFWS, Newhall Land and Farming Company"
RawData[RawData$scientific_name == "Dudleya blochmaniae brevifolia", 5] <- "California Department of Fish and Game, San Diego Gas and Electric Company, USFWS"
RawData[RawData$scientific_name == "Moxostoma sp 2", 5] <- "North Carolina Wildlife Resources Commission, Duke Energy Carolinas, Eastern Band of Cherokee Indians, Tennessee Valley Authority, Georgia Department of Natural Resources, USFWS"
RawData[RawData$scientific_name == "Lepidium papilliferum", 5] <- "Office of Species Conservation,  Idaho Department of Fish and Game,  Idaho Department of Lands,  Idaho Army National Guard,  Nongovernmental Cooperator Representative,  Nongovernmental Cooperator Representative, BLM, US Air Force"
RawData[RawData$scientific_name == "Potentilla basaltica", 5] <- "BLM,  Nevada Division of Wildlife, USFWS"
RawData[RawData$scientific_name == "Urocitellus endemicus", 5] <- "Idaho Department of Fish and Game, Idaho Governor's Office of Species Conservation, USFWS, Soulen Livestock Company Inc. (Soulen Livestock)"
RawData[RawData$scientific_name == "Pseudanophthalmus inexpectatus", 5] <- "USFWS, NPS"
RawData[RawData$scientific_name == "Vulpes velox", 5] <- NA
RawData[RawData$scientific_name == "Rorippa subumbellata", 5] <- "California Department of Fish and Wildlife, California State Lands Commission, California Department of Parks and Recreation, California Tahoe Conservancy, League to Save Lake Tahoe, Nevada Division of Forestry, Nevada Division of State Lands, Nevada Division of State Parks, Nevada Natural Heritage Program, Tahoe Lakefront Owners's Association, Tahoe Regional Planning Agency, USFWS, USFS"
RawData[RawData$scientific_name == "Calochortus umpquaensis", 5] <- "USDA, USFWS, BLM"
RawData[RawData$scientific_name == "Zaitzevia thermae", 5] <- "USFWS,  Montana State University,  Montana Fish Wildlife and Parks"
RawData[RawData$scientific_name == "Urocitellus washingtoni", 5] <- "Foster Creek Conservation District, Threemile Canyon Farms, The Nature Conservancy, Portland General Electric, USFWS, Washington State Department of Fish and Wildlife, NRCS, Farm Service Agency, Washington State Department of Natural Resources, BLM"
RawData[RawData$scientific_name == "Nysius wekiuicola", 5] <- "University of Hawaii"
RawData[RawData$scientific_name == "Sonorella macrophallus", 5] <- "USFS,  USFWS,  Arizona Game and Fish Department"
RawData[RawData$scientific_name == "Penstemon scariosus albifluvis", 5] <- "Uintah County, Rio Blanco County,  Utah School and Institutional Trust Lands Administration, Utah Governors Public Lands Policy Coordination Office, Utah Division of Wildlife Resources, BLM, USFWS"
RawData[RawData$scientific_name == "Aliciella caespitosa", 5] <- "USFS, NPS,  Utah State Office, USFWS, BLM"
RawData[RawData$scientific_name == "Solidago plumosa", 5] <- "Alcoa Power Generating Inc, USFWS"

## 3. count how many different strings of partners sperated by commas

  ###name column 5
RawData$partner_names <- RawData$V5
RawData <- RawData[,-c(5)]

total <- str_count(RawData$partner_names, ",") #counting the number of commas in each row
total <- (total + 1) #because partners are seperated by a , need to add 1 to each 
RawData <- add_column(RawData, total) #add column to dataframe 

write.csv(RawData,paste(DataSource,"/EditedFormatDataOutputwithTotals.csv", sep = "")) # save the edited file to the data repository (could also go in output repository)

EditedData<- RawData # can also use this location to make a logical to call up the saved file if you don't want to do all the processing again

## 4. format dataset so that there is a column for each partner and a 1 in the column if the species is worked on by that partner

# need to drop the rows with NA first so split works properly

EditedData <- EditedData[-which(is.na(EditedData$partner_names)),] # here i deleted all the rows with an NA
EditedData <- EditedData[,-c(3,4,6)] #remove all columns that won't be used in loop


for (i in 1:nrow(EditedData)) {
  dvec <- trimws(strsplit(EditedData$partner_names[i],split=",")[[1]])
  for (dname in dvec) {
    if (dname%in%colnames(EditedData)) {
      EditedData[i, dname] <- 1              
    } else {
      EditedData[dname] <- 0
      EditedData[i, dname] <- 1                                    
    }
  }
}

## 4. Save file that only has the partner info and the names

names(EditedData) # to see what the column names are

EditedData2 <- EditedData[,c(1,2,4:203)]

write.csv(RawData,paste(DataSource,"/PartnersData.csv", sep = ""))

#View(EditedData2)

PartnersData <- EditedData2

return(PartnersData) # return indicates what will get spit out of the function and what will be accessible in the MD doc

}
