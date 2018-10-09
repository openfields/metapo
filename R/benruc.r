# Script for Fort Benning/Fort Rucker region:
# 1. Red-cockaded woodpecker: 42, 5000m
# 2. Wood stork: 90, 500000m
# 3. Relict trillium: 42, 2m
# 4. Northern long-eared bat: 41/42/43/90, 100000m
# 5. Choctaw bean: river
# 6. Fuzzy pigtoe: river
# American alligator (excluded)
source('./R/mcmapcsv.r')

# export habitat network data to csv: need to export 90, 41/42/43/90

# import habitat network data for rcwo
read.csv(file="./data/benruc_65r42_5c.csv", header=TRUE) -> br42

# calculate rcwo network stats
system.time(mcmapcsv(dd=5000, vname=br42) -> br.rcwo)

# export data


# calculate trillium network stats
system.time(mcmapcsv(dd=2, vname=br42) -> br.retr)

# import & calculate for wood stork
read.csv(file="./data/benruc_65r90_5.csv", header=TRUE) -> br90
system.time(mcmapcsv(dd=500000, vname=br90) -> br.wost)

# import & calculate for northern long-eared bat
read.csv(file="./data/benruc_65r41424390.csv", header=TRUE) -> br41424390
system.time(mcmapcsv(dd=100000, vname=br_batnet) -> br.nleb)




# join data: python script for GRASS 