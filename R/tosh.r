library(foreign)
read.dbf('F:/data/nwi/KS_shapefile_wetlands/nwi_nhd_tosh.dbf') -> tosh.n
table(tosh.n$ATTRIBUTE)
