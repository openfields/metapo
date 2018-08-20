# script to calculate metapopulation metrics from csv data
# source function
require("./R/instmc.r")
# load library
library(rgrass7)

# read vector data in - need to get data and check that it's either centroid or straight up polygon, whichever is needed
# replace with csv data 
# readVECT("huach_65r42_5") -> huach_65r42_5
# readVECT("huach_65r41_5") -> huach_65r41_5  # decid network for ocelot only has 2 patches > 5 ha, won't work, need to run again with 
# readVECT("huach_65r43_5") -> huach_65r43_5
# readVECT("huach_65r71_5") -> huach_65r71_5

read.csv(".csv", header=TRUE) -> 

# dispersal distances
dds <- c(400, 22, 80, 30, 8, 2)

# names of habitat networks
mnames <- c("huach_65r71_5", "huach_65r42_5", "huach_65r43_5", "huach_65r42_5", "huach_65r41_5", "huach_65r42_5")


# output names
onames <- c("huach.apfa", "huach.mso", "huach.llnb", "huach.jagu", "huach.ocel", "huach.nmgs")

# call for maps  
instmc(dds = dds, mnames = mnames, onames = onames) 

