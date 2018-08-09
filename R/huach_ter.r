# script to calculate metapopulation metrics for Ft. Huachuca
# source function

# load library
library(rgrass7)

# read vector data in - need to get data and check that it's either centroid or straight up polygon, whichever is needed
readVECT("huach_65r42_5") -> huach_65r42_5
readVECT("huach_65r41_5") -> huach_65r41_5
readVECT("huach_65r43_5") -> huach_65r43_5
readVECT("huach_65r71_5") -> huach_65r71_5

# dispersal distances
dds <- c(400, 22, 80, 30, 8, 2)

# names of habitat networks
mnames <- c("huach_65r71_5", "huach_65r42_5", "huach_65r43_5", "huach_65r42_5", "huach_65r41_5", "huach_65r42_5")

# output names
onames <- c("huach.apfa", "huach.mso", "huach.llnb", "huach.jagu", "huach.ocel", "huach.nmgs")

#   
instmc()
