# script for metapopulation metrics at Ft. Bragg
# call python script for evergreen forest, forested places @ Bragg
system("python /Python/fb_terrnet.py")

# read in data
read.csv(file="C:/Users/u4cnnwrf/Documents/Regional Networks/metapo/data/fb_65r42.csv", header = TRUE) -> net42
read.csv(file="C:/Users/u4cnnwrf/Documents/Regional Networks/metapo/data/fb_65r_41424390.csv", header = TRUE) -> net41424390

# calculate metapopulation metrics

# rcwo
mcmapcsv(dd=5000, vname=net42) -> fb.rcwo

# American chaffseed
mcmapcsv(dd=2, vname=net42) -> fb.amch

# Michaux's sumac
mcmapcsv(dd=40, vname=net42) -> fb.misu

# Northern long-eared bat
mcmapcsv(dd=100000, vname=net41424390) -> fb.nleb



# # dispersal distances
# dd <- c(5000, 2, 40, 100)
# # map names
# mname <- c("net42", "net42", "net42", "net41424390")
# # output names
# oname <- c("fb.rcwo", "fb.amch", "fb.misu", "fb.nleb")
# 
# # run batch
# instmc(dds=dd, mnames=mname, onames=oname)
# 
# # more python: join data to vector data - /Python/fb_join.py