# benn_ter.r: terrestrial habitat network analysis for Ft. Benning
source('./R/instmc.r')
# load library
library(rgrass7)

# dispersal distances: decided to make dispersal distance for wood stork 100km - only max dispersal range of 1000km was reported in data 
# 
dds <- c(100000) #, 5000, 2, 10000, 100000)
mnames <- c("benruc_65r90_5") #, "benruc_65r42_5", "benruc_65r42_5", "benruc_65r42_5", "benruc_65r41424390_5" )
onames <- c("benruc.wost") #, "benruc.rcwo", "benruc.retr", "benruc.amal", "benruc.nleb")

# run analysis for all species
system.time(instmc(dds=dds, mnames=mnames, onames=onames)) # 37 seconds for just wood stork

gc()

dds <- c(5000) #, 2, 10000) #, 100000)
mnames <- c("benruc_65r42_5") #, "benruc_65r42_5", "benruc_65r42_5") #, "benruc_65r41424390_5" )
onames <- c("benruc.rcwo") #, "benruc.retr", "benruc.amal") #, "benruc.nleb")

system.time(instmc(dds=dds, mnames=mnames, onames=onames))
