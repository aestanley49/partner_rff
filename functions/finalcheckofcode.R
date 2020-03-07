### repeating code but for AS8 document 

library(readxl)
library(tidyverse)
library(janitor)
count <- AS8_codingdata <- read_excel("/usr/local/bin/store/partner_rff/data/AS8_codingdata.xlsx", "new notes")

View(count)
str(count)
count <- count[,-c(7:11, 14:16,19:21,24,25)]


count <- count[-which(is.na(count$`Partner identity CP1`)),] #removed all rows that had na's for partners aka the ones with no information

cleancount <- count %>%  ##cleaning/reformating colunm names --> default is lower_case_snake
  clean_names()


## getting list of column names cleancounts$partner_identity_cp1, cleancounts$partner_identity_cp2, cleancounts$partner_identity_cp3

together <- cleancount %>% 
  unite(col = "all_partner_names", #what to name the new column 
        c(partner_identity_cp1, partner_identity_cp2, partner_identity_cp3), #counts being united
        sep = "," #how to seperate the things we are uniting
  )


additions <- together %>%
  unite(col = "sum_part",
        c(partners_present_cp1, partners_present_cp2, partners_present_cp33),
        sep = "_")

##Go through and get count based on how many strings in a cell 
#Need to check no lengthy notes first 
# really didn't structure this in a way that was easy to count, probs need to go through and edit each cell
View(addition)


additions[additions$scientific_name == "Calochortus persistens", 8] <- "USFS,BLM" #removed NA
additions[additions$scientific_name == "Allium gooddingii", 8] <- "USFS" #removed NA
additions$all_partner_names[3] <- "BLM, Idaho Department of Fish and Game,Seeds of Success program, Utah State University and the Agricultural Research Service"
# removed BLM’s Lower Snake River District, 
#shrunk- Idaho Department of Fish and Game’s Conservation Data Center to Idaho Department of Fish and Game
#duplicate of BLM 
#also note for last three partners : (don't think all 3 are in partnership just BLM working with each)
additions[additions$scientific_name == "Astragalus cusickii var. packardiae", 8] <- "BLM" #other agreement wasn't valid
additions[additions$scientific_name == "Thymallus arcticus", 8] <- "Montana Department of Fish Wildlife and Parks, USFWS, BLM"
additions[additions$scientific_name == "Cimicifuga arizonica", 8] <- "USFS, USFWS"
additions[additions$scientific_name == "Lupinus aridus ssp. ashlandensis", 8] <- "USFS, USFWS"
additions[additions$scientific_name == "Erigeron basalticuss", 8] <- "Rare Care, NPS"
additions[additions$scientific_name == "Pseudanophthalmus major", 8] <- "Kentucky Ecological Services Field Office, Owner of the Beaver Cave property,  Kentucky Department of Fish and Wildlife Resources,  Natural Resources Conservation Service,  Farm Service Agency,  Kentucky State Nature Preserves Commission,  Kentucky Division of Forestry"
additions[additions$scientific_name == "Opuntia X multigeniculata", 8] <- "BLM"
additions[additions$scientific_name == "Phacelia stellaris", 8] <- "California Department of Fish and Game, California Department of Forestry and Fire Protection, California Department of Parks and Recreation, Center for Natural Lands Management, City of Riverside Park and Recreation Department, Metropolitan Water District, Riverside County Environmental Programs Department, Riverside County Habitat Conservation Agency, Riverside County Regional Park and Open-Space District, Riverside Land Conservancy, San Diego State University Field Stations Program, The Nature Conservancy, University of California Riverside, BLM, USFWS, USFS, US Navy, US Marine Corps, US Customs and Border Protection, California State Parks"
additions[additions$scientific_name == "Fallicambarus gordoni", 8] <- "Mississippi Army National Guard, USFS, Mississippi Department of Wildlife Fisheries and Parks, USFWS"
additions[additions$scientific_name == "Synthyris ranunculina", 8] <- "Nevada Department of Conservation and Natural Resources, Clark County, USFS, USFWS, BLM, NPS, Nevada Department of Wildlife, Nevada Department of Transportation, Nevada Division of State Parks, U.S. Air Force, Boulder City"
additions[additions$scientific_name == "Castilleja christii", 8] <- "USFS,  USFWS"
additions[additions$scientific_name == "Astragalus oophorus clokeyanus", 8] <- "Nevada Department of Conservation and Natural Resources, Clark County, USFS, USFWS, BLM, NPS, Nevada Department of Wildlife, Nevada Department of Transportation, Nevada Division of State Parks, U.S. Air Force, Boulder City"
additions[additions$scientific_name == "Nerodia erythrogaster neglecta", 8] <- "Illinois Department of Natural Resources, Indiana Department of Natural Resources, Kentucky Department of Fish and Wildlife Resources, Kentucky Coal Association, Kentucky Coal Country Association, Kentucky Farm Bureau, Kentucky Natural Resources and Environmental Cabinet, Western Kentucky Coal Association, USFWS"
additions[additions$scientific_name == "Cicindela albissima", 8] <- "Utah Division of Parks and Recreation, BLM, USFWS, Kane County"
###not sure if the one below will print out as 4 private landowners
additions[additions$scientific_name == "Gila bicolor vaccaceps", 8] <- "private landowners of Cow Head Lake Cow Head Slough and California reach of Barrel Creek (four owners, all CA signatories), principal permittees on BLM lands within the drainage, California and Modoc County Cattlemen's Associations, the California Farm Bureau Federation, BLM, California Department of Fish and Game"
additions[additions$scientific_name == "Downingia concolor brevior", 8] <- "California Department of Fish and Wildlife Natural Heritage Division Endangered plant program"
additions[additions$scientific_name == "Cymopterus deserticola", 8] <- NA
additions[additions$scientific_name == "Sceloporus arenicolus", 8] <- "USFWS, BLM, Center of Excellence for Hazardous Materials Management, Natural Resources Conservation Service, Texas A&M University, Texas Comptroller of Public Accounts, Texas Interagency Task Force on Economic Growth and Endangered Species, Texas Department of Agriculture, Texas Parks and Wildlife Department, Railroad Commission of Texas, University of Texas System - University Lands, Texas Farm Bureau, Texas Oil and Gas Association, Texas Royalty Council, Texas and Southwestern Cattle Raisers Association, Texas Wildlife Association, Texas Association of Business"
additions[additions$scientific_name == "Oncorhynchus mykiss aquilarum", 8] <- "California Department of Fish and Wildlife, USFS, USFWS"
additions[additions$scientific_name == "Pyrgulopsis notidicola", 8] <- "Nevada Department of Wildlife, NPS, BLM, USFWS, Nevada Natural Heritage Program, The Nature Conservancy, Desert Research Institute"
additions[additions$scientific_name == "Phrynosoma mcallii", 8] <- "Anza-Borrego State Park, Arizona Game and Fish Department, California Department of Fish and Game, California State Parks, Ocotillo Wells State Vehicular Recreation Area, BLM, U.S. Bureau of Reclamation, USFWS, U.S. Marine Corps Air Station, U.S. Naval Air Facility, U.S. Navy SW Division, The Arizona Department of Water Resources, Arizona Electric Power Cooperative Inc., Arizona Game and Fish Commission, Arizona Power Authority, Central Arizona Water Conservation District, Cibola Valley Irrigation and Drainage District, City of Bullhead City, City of Lake Havasu City, City of Mesa, City of Somerton, City of Yuma, Electrical District No. 3 Pinal County Arizona, Golden Shores Water Conservation District, Mohave County Water Authority, Mohave Valley Irrigation and Drainage District, Mohave Water Conservation District, North Gila Valley Irrigation and Drainage District, Salt River Project Agricultural Improvement and Power District, Town of Fredonia, Town of Thatcher, Town of Wickenburg, Unit ‚Äö√Ñ√∫B‚Äö√Ñ√π Irrigation and Drainage District, Wellton-Mohawk Irrigation and Drainage District, Yuma County Water Users‚Äö√Ñ√¥ Association; Yuma Irrigation District, Yuma Mesa Irrigation and Drainage District, City of Needles, Coachella Valley Water District, Colorado River Board of California, Imperial Irrigation District, Los Angeles Department of Water and Power, Palo Verde Irrigation District, San Diego County Water Authority, Southern California Edison Company, the Southern California Public Power Authority, Bard Water District, Metropolitan Water District of Southern California, NPS, Bureau of Indian Affairs, Western Area Power Administration (Western), Colorado River Commission of Nevada, Nevada Department of Wildlife, Basic Water Company, Southern Nevada Water Authority"
additions[additions$scientific_name == "Dalea tentaculoides", 8] <- "USFWS, Tohono Oodham Nation" #spelt wrong because of '
additions[additions$scientific_name == "Symphyotrichum georgianum", 8] <- "USFWS, Clemson University, Georgia Department of Natural Resources, Georgia Department of Transportation, Georgia Power, Mecklenburg County Park and Recreation North Carolina, NPS, North Carolina Department of Agriculture & Consumer Services Plant Conservation Program, USFS"
additions[additions$scientific_name == "Astragalus anserinus", 8] <- "BLM, USFWS"
additions[additions$scientific_name == "Penstemon grahamii", 8] <- "Uintah County, Rio Blanco County, Utah School and Institutional Trust Lands Administration, Utah Governors Public Lands Policy Coordination Office, Utah Division of Wildlife Resources, BLM, USFWS"
additions[additions$scientific_name == "Pseudanophthalmus pholeter", 8] <- "Southern conservation corporation,  USFWS"
additions[additions$scientific_name == "Horkelia hendersonii", 8] <- "USFS, USFWS"
additions[additions$scientific_name == "Pediocactus paradinei", 8] <- "USFS, BLM, USFWS"
additions[additions$scientific_name == "Iotichthys phlegethontis", 8] <- "Utah Department of Natural Resources,  BLM, Bureau of Reclamation, Utah Reclamation Mitigation and Conservation Commission, Confederated Tribes of the Goshute Reservation, Central Utah Water Conservancy District, Southern Nevada Water Authority"
additions[additions$scientific_name == "Pseudanophthalmus catorycetes", 8] <- "Southern conservation corporation,  USFWS"
additions[additions$scientific_name == "Polites mardon", 8] <- NA
additions[additions$scientific_name == "Oncorhynchus mykiss ssp.", 8] <- "USFWS,  USFS,  California Department of Fish and Game,  John Hancock Mutual Life Insurace Company,  Bob McIntsh (Private landowner),  Sierra Pacific Industries, Hearest Corporation,  Siskiyou County Board of Supervisors"
additions[additions$scientific_name == "Clarkia lingulata", 8] <- "USFS, BLM, California Department of Transportation (caltrans), California Department of Fish and Wildlife, Pacific Gas and Electric"
additions[additions$scientific_name == "Ambrysus funebris", 8] <- "Department of Forest and Rangeland Stewardship Colorado State University, Desert Research Institute, NPS"
additions[additions$scientific_name == "Sylvilagus transitionalis", 8] <- "USGS, Natural Resources Conservation Service, USFWS, Mashpee Wampanoag Tribe, Lyme Land Conservation Trust, American Forest Foundation, Woodcock Limited, WCS Queens Zoo, Wells National Esturarine Research Reserve, Roger Williams Park Zoo, Audubon Connecticut, Connecticut Audubon Society, Open Space Institute, Audubon New York, Quail Forever, Pheasants Forever, Doris Duke Charitable Foundation, Wildlife Conservation Society, Amrican Bird Conservancy, Quality Deer Management Association, Sustainable Forestry Initiative, White Memorial Foundation, National Fish and Wildlife Foundation, Ruffed Grouse Society/American Woodcock Society, National Wild Turkey Federation, Wildlife Management Institute, New Engalnd Cottontail Conservation Initiative, Northeast Forest and Fire Management, Lyme Timber Company, Monterey Preservation Land Trust, Narrow River Land Trust, Nantucket Conservation Foundation, Scarborough Land Trust, Avalonia Land Conservancy, Orenda Wildlife Land Trust, Trustees of Reservations, Berkshire Natural Resources Council, York Land Trust, Becket Land Trust, Trust for Public Land, Massachusetts National Guard, New York Division of Fish Wildlife and Marine Resources, Northeast Association of Fish and Wildlife Agencies, Rhode Island Division of Fish and Wildlife, Connecticute Department of Energy and Environmental Protection, Massachusetts Division of Fisheries and Wildlife, New Hampshire Fish and Game Department, Maine Department of Inland Fisheries and Wildlife, University of Rhode Island College of Envionment and Life Sciences, University of New Hampshire, University of New Hampshire Cooperative Extenson, New Hampshire Fish and Game Department"
additions[additions$scientific_name == "Hazardia orcuttii", 8] <- "City of NCCP, USFWS, California Department of Fish and Game, California Resources Agency"
additions[additions$scientific_name == "Pyrgulopsis morrisoni", 8] <- "Arizona Game and Fish Department, USFWS"
additions[additions$scientific_name == "Lithobates subaquavocalis", 8] <- NA
additions[additions$scientific_name == "Lithobates onca", 8] <- "USFWS,  Nevada Department of Wildlife"
additions[additions$scientific_name == "Oncorhynchus clarkii virginalis", 8] <- "Colorado Parks and Wildlife, New Mexico Department of Game and Fish, USFS, USFWS, Mescalero Apache Nation, Jicarilla Apache Nation, Taos Pueblo, NPS, BLM,  Trout Unlimited, Vermejo Park Ranch, Colorado Division of Parks and Wildlife"
additions[additions$scientific_name == "Euphydryas anicia cloudcrofti", 8] <- "Otero County, USFS, USFWS, Village of Cloudcroft"
additions[additions$scientific_name == "Dudleya blochmaniae brevifolia", 8] <- "California Department of Fish and Game, San Diego Gas and Electric Company, USFWS"
additions[additions$scientific_name == "Moxostoma sp 2", 8] <- "North Carolina Wildlife Resources Commission, Duke Energy Carolinas, Eastern Band of Cherokee Indians, Tennessee Valley Authority, Georgia Department of Natural Resources, USFWS"
additions[additions$scientific_name == "Lepidium papilliferum", 8] <- "Office of Species Conservation,  Idaho Department of Fish and Game,  Idaho Department of Lands,  Idaho Army National Guard,  Nongovernmental Cooperator Representative,  Nongovernmental Cooperator Representative, BLM, US Air Force"
additions[additions$scientific_name == "Potentilla basaltica", 8] <- "BLM,  Nevada Division of Wildlife, USFWS"
additions[additions$scientific_name == "Urocitellus endemicus", 8] <- "Idaho Department of Fish and Game, Idaho Governor's Office of Species Conservation, USFWS, Soulen Livestock Company Inc. (Soulen Livestock)"
additions[additions$scientific_name == "Pseudanophthalmus inexpectatus", 8] <- "USFWS, NPS"
additions[additions$scientific_name == "Vulpes velox", 8] <- NA
additions[additions$scientific_name == "Rorippa subumbellata", 8] <- "California Department of Fish and Wildlife, California State Lands Commission, California Department of Parks and Recreation, California Tahoe Conservancy, League to Save Lake Tahoe, Nevada Division of Forestry, Nevada Division of State Lands, Nevada Division of State Parks, Nevada Natural Heritage Program, Tahoe Lakefront Owners's Association, Tahoe Regional Planning Agency, USFWS, USFS"
additions[additions$scientific_name == "Calochortus umpquaensis", 8] <- "USDA, USFWS, BLM"
additions[additions$scientific_name == "Zaitzevia thermae", 8] <- "USFWS,  Montana State University,  Montana Fish Wildlife and Parks"
additions[additions$scientific_name == "Urocitellus washingtoni", 8] <- "Foster Creek Conservation District, Threemile Canyon Farms, The Nature Conservancy,  General Electric, USFWS"
additions[additions$scientific_name == "Nysius wekiuicola", 8] <- "University of Hawaii"
additions[additions$scientific_name == "Sonorella macrophallus", 8] <- "USFS,  USFWS,  Arizona Game and Fish Department"
additions[additions$scientific_name == "Penstemon scariosus albifluvis", 8] <- "Uintah County, Rio Blanco County,  Utah School and Institutional Trust Lands Administration, Utah Governors Public Lands Policy Coordination Office, Utah Division of Wildlife Resources, BLM, USFWS"
additions[additions$scientific_name == "Aliciella caespitosa", 8] <- "USFS, NPS,  Utah State Office, USFWS, BLM"
additions[additions$scientific_name == "Solidago plumosa", 8] <- "Alcoa Power Generating Inc, USFWS"

  
additions <- additions[-which(is.na(additions$all_partner_names)),] #removed all rows that had na's 



### ### add column and fill with cases where there is a cooperator 

coop <- c(0)
additions <- add_column(additions, coop)

additions$coop[4] <- "Montana Department of Natural Resources and Conservation, USDA NRCS,BLM,Montana Fish Wildlife and Parks (MFWP), Montana Department of Natural Resources and Conservation (DNRC)"
additions[additions$scientific_name  == "Thymallus arcticus", 9] <- "Montana Department of Natural Resources and Conservation, NRCS"

additions$coop[25] <- "U.S. Fish and Wildlife Service, Clemson University, Georgia Department of Natural Resources, Georgia Department of Transportation, Georgia Power, Mecklenburg County Park and Recreation North Carolina, National Park Service, North Carolina Department of Agriculture & Consumer Services Plant Conservation Program, Forest Service"
### ### cooperators seperate
additions$coop[41] <- "USFS, Nevada Department of Wildlife"
## plus unspecified cooperator 

additions$coop[45] <- "North Carolina Wildlife Resources Commission, Duke Energy Carolinas, Eastern Band of Cherokee Indians, Tennessee Valley Authority,  Georgia Department of Natural Resources, USFWS"
## cooperators in original doc were counted in total
additions$coop[53] <- "added the 1 cooperator to total count"


###  ###need to write code that will count how many different strings sperated by commas 

library(stringr)
total <- str_count(additions$all_partner_names, ",") #counting the number of commas in each row
total <- (total + 1) #because partners are seperated by a , need to add 1 to each 
total

mydata <- add_column(additions, total)
View(mydata)

## have new correct counts
write.csv(mydata, "/usr/local/bin/store/partner_rff/output/cleanedcountofpartners.csv")
  
  ###########################################################################


#####notes on what was done in this scrip vs others
#-	Check_count.R script was run on AS7 excel sheet 
# "/data11.8a.csv" was complited manually 
# this script starts with AS8 Excel
# I created a excel document that pulled all three sheets together - "checkofchecksstartshere"
#went through cell by cell to identifiy discrepancies and figure out which was correct list of partners to use
# correct list was over written into cell here
# I would have used the old script "check_count" but the rows wouldn't have matched 
# result is correct count of partners
#which will not be added to Partner_RFF markdown and FortmatData.R script
  
  
