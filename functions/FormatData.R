FormatData <- function(RawData){ # inside the parenthesis indicates what the function needs to work. These are specified in the main MD document

## this function takes the raw data and formats it into something more useful for later analyses
# I put some of your "sums code.Rmd" code in this function

#dim(RawData)
#head(RawData)   ## just looking at the dataset
  

## Data tidying
#names(RawData) 
#View(RawData$`Who the partners are`)

## 0. Remove empty column
  RawData$X5 <- NULL

## 1. Replace "N/A" with NA so that fields with no data all behave the same
  
RawData[which(RawData$`Who the partners are` =="N/A"),5] <- NA # 5 is the column called 'Who the partner are'. I called it this way to avoid writing but it is less safe if things move around // note this changed when other dataset was read in 
#which(is.na(RawData$`Who the partners are`)) # Check to make sure it worked

## 2. Manually change spelling errors

RawData[RawData$`Scientific name` == "Calochortus persistens", 5] <- "USFS,BLM" #removed NA
RawData[RawData$`Scientific name` == "Allium gooddingii", 5] <- "USFS" #removed NA
RawData[RawData$`Scientific name` == "Astragalus cusickii var. packardiae", 5] <- "BLM, Idaho Department of Fish and Game,Seeds of Success program, Utah State University and the Agricultural Research Service"
# removed BLM’s Lower Snake River District, 
#shrunk- Idaho Department of Fish and Game’s Conservation Data Center to Idaho Department of Fish and Game
#duplicate of BLM 
#also note for last three partners : (don't think all 3 are in partnership just BLM working with each)
RawData[RawData$`Scientific name` == "Astragalus cusickii var. packardiae", 5] <- "BLM" #other agreement wasn't valid
RawData[RawData$`Scientific name` == "Thymallus arcticus", 5] <- "Montana Department of Fish Wildlife and Parks, USFWS, BLM"
RawData[RawData$`Scientific name` == "Cimicifuga arizonica", 5] <- "USFS, USFWS"
RawData[RawData$`Scientific name` == "Lupinus aridus ssp. ashlandensis", 5] <- "USFS, USFWS"
RawData[RawData$`Scientific name` == "Erigeron basalticuss", 5] <- "Rare Care, NPS"
RawData[RawData$`Scientific name` == "Pseudanophthalmus major", 5] <- "Kentucky Ecological Services Field Office, Owner of the Beaver Cave property,  Kentucky Department of Fish and Wildlife Resources,  Natural Resources Conservation Service,  Farm Service Agency,  Kentucky State Nature Preserves Commission,  Kentucky Division of Forestry"
RawData[RawData$`Scientific name` == "Opuntia X multigeniculata", 5] <- "BLM"
RawData[RawData$`Scientific name` == "Phacelia stellaris", 5] <- "California Department of Fish and Game, California Department of Forestry and Fire Protection, California Department of Parks and Recreation, Center for Natural Lands Management, City of Riverside Park and Recreation Department, Metropolitan Water District, Riverside County Environmental Programs Department, Riverside County Habitat Conservation Agency, Riverside County Regional Park and Open-Space District, Riverside Land Conservancy, San Diego State University Field Stations Program, The Nature Conservancy, University of California Riverside, BLM, USFWS, USFS, US Navy, US Marine Corps, US Customs and Border Protection, California State Parks"
RawData[RawData$`Scientific name` == "Fallicambarus gordoni", 5] <- "Mississippi Army National Guard, USFS, Mississippi Department of Wildlife Fisheries and Parks, USFWS"
RawData[RawData$`Scientific name` == "Synthyris ranunculina", 5] <- "Nevada Department of Conservation and Natural Resources, Clark County, USFS, USFWS, BLM, NPS, Nevada Department of Wildlife, Nevada Department of Transportation, Nevada Division of State Parks, U.S. Air Force, Boulder City"
RawData[RawData$`Scientific name` == "Castilleja christii", 5] <- "USFS,  USFWS"
RawData[RawData$`Scientific name` == "Astragalus oophorus clokeyanus", 5] <- "Nevada Department of Conservation and Natural Resources, Clark County, USFS, USFWS, BLM, NPS, Nevada Department of Wildlife, Nevada Department of Transportation, Nevada Division of State Parks, U.S. Air Force, Boulder City"
RawData[RawData$`Scientific name` == "Nerodia erythrogaster neglecta", 5] <- "Illinois Department of Natural Resources, Indiana Department of Natural Resources, Kentucky Department of Fish and Wildlife Resources, Kentucky Coal Association, Kentucky Coal Country Association, Kentucky Farm Bureau, Kentucky Natural Resources and Environmental Cabinet, Western Kentucky Coal Association, USFWS"
RawData[RawData$`Scientific name` == "Cicindela albissima", 5] <- "Utah Division of Parks and Recreation, BLM, USFWS, Kane County"
###not sure if the one below will print out as 4 private landowners
RawData[RawData$`Scientific name` == "Gila bicolor vaccaceps", 5] <- "private landowners of Cow Head Lake Cow Head Slough and California reach of Barrel Creek (four owners, all CA signatories), principal permittees on BLM lands within the drainage, California and Modoc County Cattlemen's Associations, the California Farm Bureau Federation, BLM, California Department of Fish and Game"
RawData[RawData$`Scientific name` == "Downingia concolor brevior", 5] <- "California Department of Fish and Wildlife Natural Heritage Division Endangered plant program"
RawData[RawData$`Scientific name` == "Cymopterus deserticola", 5] <- NA
RawData[RawData$`Scientific name` == "Sceloporus arenicolus", 5] <- "USFWS, BLM, Center of Excellence for Hazardous Materials Management, Natural Resources Conservation Service, Texas A&M University, Texas Comptroller of Public Accounts, Texas Interagency Task Force on Economic Growth and Endangered Species, Texas Department of Agriculture, Texas Parks and Wildlife Department, Railroad Commission of Texas, University of Texas System - University Lands, Texas Farm Bureau, Texas Oil and Gas Association, Texas Royalty Council, Texas and Southwestern Cattle Raisers Association, Texas Wildlife Association, Texas Association of Business"
RawData[RawData$`Scientific name` == "Oncorhynchus mykiss aquilarum", 5] <- "California Department of Fish and Wildlife, USFS, USFWS"
RawData[RawData$`Scientific name` == "Pyrgulopsis notidicola", 5] <- "Nevada Department of Wildlife, NPS, BLM, USFWS, Nevada Natural Heritage Program, The Nature Conservancy, Desert Research Institute"
RawData[RawData$`Scientific name` == "Phrynosoma mcallii", 5] <- "Anza-Borrego State Park, Arizona Game and Fish Department, California Department of Fish and Game, California State Parks, Ocotillo Wells State Vehicular Recreation Area, BLM, U.S. Bureau of Reclamation, USFWS, U.S. Marine Corps Air Station, U.S. Naval Air Facility, U.S. Navy SW Division, The Arizona Department of Water Resources, Arizona Electric Power Cooperative Inc., Arizona Game and Fish Commission, Arizona Power Authority, Central Arizona Water Conservation District, Cibola Valley Irrigation and Drainage District, City of Bullhead City, City of Lake Havasu City, City of Mesa, City of Somerton, City of Yuma, Electrical District No. 3 Pinal County Arizona, Golden Shores Water Conservation District, Mohave County Water Authority, Mohave Valley Irrigation and Drainage District, Mohave Water Conservation District, North Gila Valley Irrigation and Drainage District, Salt River Project Agricultural Improvement and Power District, Town of Fredonia, Town of Thatcher, Town of Wickenburg, Unit ‚Äö√Ñ√∫B‚Äö√Ñ√π Irrigation and Drainage District, Wellton-Mohawk Irrigation and Drainage District, Yuma County Water Users‚Äö√Ñ√¥ Association; Yuma Irrigation District, Yuma Mesa Irrigation and Drainage District, City of Needles, Coachella Valley Water District, Colorado River Board of California, Imperial Irrigation District, Los Angeles Department of Water and Power, Palo Verde Irrigation District, San Diego County Water Authority, Southern California Edison Company, the Southern California Public Power Authority, Bard Water District, Metropolitan Water District of Southern California, NPS, Bureau of Indian Affairs, Western Area Power Administration (Western), Colorado River Commission of Nevada, Nevada Department of Wildlife, Basic Water Company, Southern Nevada Water Authority"
RawData[RawData$`Scientific name` == "Dalea tentaculoides", 5] <- "USFWS, Tohono Oodham Nation" #spelt wrong because of '
RawData[RawData$`Scientific name` == "Symphyotrichum georgianum", 5] <- "USFWS, Clemson University, Georgia Department of Natural Resources, Georgia Department of Transportation, Georgia Power, Mecklenburg County Park and Recreation North Carolina, NPS, North Carolina Department of Agriculture & Consumer Services Plant Conservation Program, USFS"
RawData[RawData$`Scientific name` == "Astragalus anserinus", 5] <- "BLM, USFWS"
RawData[RawData$`Scientific name` == "Penstemon grahamii", 5] <- "Uintah County, Rio Blanco County, Utah School and Institutional Trust Lands Administration, Utah Governors Public Lands Policy Coordination Office, Utah Division of Wildlife Resources, BLM, USFWS"
RawData[RawData$`Scientific name` == "Pseudanophthalmus pholeter", 5] <- "Southern conservation corporation,  USFWS"
RawData[RawData$`Scientific name` == "Horkelia hendersonii", 5] <- "USFS, USFWS"
RawData[RawData$`Scientific name` == "Pediocactus paradinei", 5] <- "USFS, BLM, USFWS"
RawData[RawData$`Scientific name` == "Iotichthys phlegethontis", 5] <- "Utah Department of Natural Resources,  BLM, Bureau of Reclamation, Utah Reclamation Mitigation and Conservation Commission, Confederated Tribes of the Goshute Reservation, Central Utah Water Conservancy District, Southern Nevada Water Authority"
RawData[RawData$`Scientific name` == "Pseudanophthalmus catorycetes", 5] <- "Southern conservation corporation,  USFWS"
RawData[RawData$`Scientific name` == "Polites mardon", 5] <- NA
RawData[RawData$`Scientific name` == "Oncorhynchus mykiss ssp.", 5] <- "USFWS,  USFS,  California Department of Fish and Game,  John Hancock Mutual Life Insurace Company,  Bob McIntsh (Private landowner),  Sierra Pacific Industries, Hearest Corporation,  Siskiyou County Board of Supervisors"
RawData[RawData$`Scientific name` == "Clarkia lingulata", 5] <- "USFS, BLM, California Department of Transportation (caltrans), California Department of Fish and Wildlife, Pacific Gas and Electric"
RawData[RawData$`Scientific name` == "Ambrysus funebris", 5] <- "Department of Forest and Rangeland Stewardship Colorado State University, Desert Research Institute, NPS"
RawData[RawData$`Scientific name` == "Sylvilagus transitionalis", 5] <- "USGS, Natural Resources Conservation Service, USFWS, Mashpee Wampanoag Tribe, Lyme Land Conservation Trust, American Forest Foundation, Woodcock Limited, WCS Queens Zoo, Wells National Esturarine Research Reserve, Roger Williams Park Zoo, Audubon Connecticut, Connecticut Audubon Society, Open Space Institute, Audubon New York, Quail Forever, Pheasants Forever, Doris Duke Charitable Foundation, Wildlife Conservation Society, Amrican Bird Conservancy, Quality Deer Management Association, Sustainable Forestry Initiative, White Memorial Foundation, National Fish and Wildlife Foundation, Ruffed Grouse Society/American Woodcock Society, National Wild Turkey Federation, Wildlife Management Institute, New Engalnd Cottontail Conservation Initiative, Northeast Forest and Fire Management, Lyme Timber Company, Monterey Preservation Land Trust, Narrow River Land Trust, Nantucket Conservation Foundation, Scarborough Land Trust, Avalonia Land Conservancy, Orenda Wildlife Land Trust, Trustees of Reservations, Berkshire Natural Resources Council, York Land Trust, Becket Land Trust, Trust for Public Land, Massachusetts National Guard, New York Division of Fish Wildlife and Marine Resources, Northeast Association of Fish and Wildlife Agencies, Rhode Island Division of Fish and Wildlife, Connecticute Department of Energy and Environmental Protection, Massachusetts Division of Fisheries and Wildlife, New Hampshire Fish and Game Department, Maine Department of Inland Fisheries and Wildlife, University of Rhode Island College of Envionment and Life Sciences, University of New Hampshire, University of New Hampshire Cooperative Extenson, New Hampshire Fish and Game Department"
RawData[RawData$`Scientific name` == "Hazardia orcuttii", 5] <- "City of NCCP, USFWS, California Department of Fish and Game, California Resources Agency"
RawData[RawData$`Scientific name` == "Pyrgulopsis morrisoni", 5] <- "Arizona Game and Fish Department, USFWS"
RawData[RawData$`Scientific name` == "Lithobates subaquavocalis", 5] <- NA
RawData[RawData$`Scientific name` == "Lithobates onca", 5] <- "USFWS,  Nevada Department of Wildlife"
RawData[RawData$`Scientific name` == "Oncorhynchus clarkii virginalis", 5] <- "Colorado Parks and Wildlife, New Mexico Department of Game and Fish, USFS, USFWS, Mescalero Apache Nation, Jicarilla Apache Nation, Taos Pueblo, NPS, BLM,  Trout Unlimited, Vermejo Park Ranch, Colorado Division of Parks and Wildlife"
RawData[RawData$`Scientific name` == "Euphydryas anicia cloudcrofti", 5] <- "Otero County, USFS, USFWS, Village of Cloudcroft"
RawData[RawData$`Scientific name` == "Dudleya blochmaniae brevifolia", 5] <- "California Department of Fish and Game, San Diego Gas and Electric Company, USFWS"
RawData[RawData$`Scientific name` == "Moxostoma sp 2", 5] <- "North Carolina Wildlife Resources Commission, Duke Energy Carolinas, Eastern Band of Cherokee Indians, Tennessee Valley Authority, Georgia Department of Natural Resources, USFWS"
RawData[RawData$`Scientific name` == "Lepidium papilliferum", 5] <- "Office of Species Conservation,  Idaho Department of Fish and Game,  Idaho Department of Lands,  Idaho Army National Guard,  Nongovernmental Cooperator Representative,  Nongovernmental Cooperator Representative, BLM, US Air Force"
RawData[RawData$`Scientific name` == "Potentilla basaltica", 5] <- "BLM,  Nevada Division of Wildlife, USFWS"
RawData[RawData$`Scientific name` == "Urocitellus endemicus", 5] <- "Idaho Department of Fish and Game, Idaho Governor's Office of Species Conservation, USFWS, Soulen Livestock Company Inc. (Soulen Livestock)"
RawData[RawData$`Scientific name` == "Pseudanophthalmus inexpectatus", 5] <- "USFWS, NPS"
RawData[RawData$`Scientific name` == "Vulpes velox", 5] <- NA
RawData[RawData$`Scientific name` == "Rorippa subumbellata", 5] <- "California Department of Fish and Wildlife, California State Lands Commission, California Department of Parks and Recreation, California Tahoe Conservancy, League to Save Lake Tahoe, Nevada Division of Forestry, Nevada Division of State Lands, Nevada Division of State Parks, Nevada Natural Heritage Program, Tahoe Lakefront Owners's Association, Tahoe Regional Planning Agency, USFWS, USFS"
RawData[RawData$`Scientific name` == "Calochortus umpquaensis", 5] <- "USDA, USFWS, BLM"
RawData[RawData$`Scientific name` == "Zaitzevia thermae", 5] <- "USFWS,  Montana State University,  Montana Fish Wildlife and Parks"
RawData[RawData$`Scientific name` == "Urocitellus washingtoni", 5] <- "Foster Creek Conservation District, Threemile Canyon Farms, The Nature Conservancy,  General Electric, USFWS"
RawData[RawData$`Scientific name` == "Nysius wekiuicola", 5] <- "University of Hawaii"
RawData[RawData$`Scientific name` == "Sonorella macrophallus", 5] <- "USFS,  USFWS,  Arizona Game and Fish Department"
RawData[RawData$`Scientific name` == "Penstemon scariosus albifluvis", 5] <- "Uintah County, Rio Blanco County,  Utah School and Institutional Trust Lands Administration, Utah Governors Public Lands Policy Coordination Office, Utah Division of Wildlife Resources, BLM, USFWS"
RawData[RawData$`Scientific name` == "Aliciella caespitosa", 5] <- "USFS, NPS,  Utah State Office, USFWS, BLM"
RawData[RawData$`Scientific name` == "Solidago plumosa", 5] <- "Alcoa Power Generating Inc, USFWS"

write.csv(RawData,paste(DataSource,"/EditedDatanew.csv", sep = "")) # save the edited file to the data repository (could also go in output repository)

EditedData<- RawData # can also use this location to make a logical to call up the saved file if you don't want to do all the processing again

## 3. format dataset so that there is a column for each partner and a 1 in the column if the species is worked on by that partner

# need to drop the rows with NA first so split works properly

EditedData <- EditedData[-which(is.na(EditedData$`Who the partners are`)),] # here i deleted all the rows with an NA

for (i in 1:nrow(EditedData)) {
  dvec <- trimws(strsplit(EditedData$`Who the partners are`[i],split=",")[[1]])
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

#names(EditedData) # to see what the column names are

EditedData2 <- EditedData[,c(1,2,8:243)]

write.csv(RawData,paste(DataSource,"/PartnersData.csv", sep = ""))

View(EditedData2)

PartnersData <- EditedData2

return(PartnersData) # return indicates what will get spit out of the function and what will be accessible in the MD doc

}
