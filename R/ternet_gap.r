library(dplyr)
library(RSQLite)
library(DBI)
library(reshape)
source('./R/netgap.r')

# read tables from database
gcon <- dbConnect(SQLite(), 'F:/report_data/grass_sqlite/sqlite.db')

##########################
# calculate gap values
##########################
#allen65r_pad41424390
dbReadTable(gcon, "allen65r_pad41424390") -> ea_bat 
which(ea_bat$b_cat>=0) -> i.eabat
ea_bat[i.eabat,] -> ea_b

netgap(ea_b, ea_b.g) -> ea_b.g
rep('ea_b', dim(ea_b.g)[1]) -> ea_b.gname
cbind(ea_b.gname, ea_b.g) -> ea_b.gap
names(ea_b.gap) <- c('net', 'gap', 'area')

c("allen65r_pad41424390", "benruc_pad90", "benruc_pad42", "benruc_pad41424390", "bland_pad52", "bland_pad95", "bland_pad42", "blws_pad31", "blws_pad41",
  "blws_pad71", "catmer_pad43", "catmer_pad41", "catmer_pad41424390", "catt_pad41424390", "catt_pad414390", "cdaw_pad414390", "cdaw_pad41", "cdaw_pad41424390",
"ced_pad41424390", "cnav_pad42", "cust_pad41424390", "cwdp_pad52", "dix_pad41424390", "fb_pad42", "fb_pad41424390", "fccg_pad414271", "fccg_pad41424390",
"fccg_pad31", "fcpc_pad42", "fd_pad414390", "fd_pad41424390", "gray_pad42", "gray_pad41424390", "hlcrslo_pad71", "hlcrslo_pad52", "hlcrslo_pad43", "jblmcr_pad71", "jblmcr_pad42", "knox_pad43", "knox_pad414390", 
"knox_pad41424390", "macon_pad414390", "west_pad414390") -> tmp

# read in database tables
system.time(for(i in 1:length(tmp)){
  assign(paste(tmp[i]), dbReadTable(gcon, paste(tmp[i])))
  }) # 56 sec, desktop

# 43 nets read in, need to select proper records, then get crosstab of gap status
# allen65r_pad41424390 
which(allen65r_pad41424390$b_cat>=0) -> i.anbat
allen65r_pad41424390[i.anbat,] -> anbat
netgap(anbat) -> anbat.g
cbind(rep('anbat', dim(anbat.g)[1]), anbat.g) -> anbat.gap
names(anbat.gap) <- c('net', 'gap', 'area')
anbat.gap
anbat.gap <- c(1,2,3,4,4)

# "benruc_pad90", 
which(benruc_pad90$b_cat>=0) -> i.br90
benruc_pad90[i.br90,] -> br90
netgap(br90) -> br90.g
cbind(rep('br90', dim(br90.g)[1]), br90.g) -> br90.gap
names(br90.gap) <- c('net', 'gap', 'area')
br90.gap
br90.gap$gap <- c(1,2,3,4,4)

# "benruc_pad42", 
which(benruc_pad90$b_cat>=0) -> i.br90
benruc_pad90[i.br90,] -> br90
netgap(br90) -> br90.g
cbind(rep('br90', dim(br90.g)[1]), br90.g) -> br90.gap
names(br90.gap) <- c('net', 'gap', 'area')
br90.gap

# "benruc_pad41424390", 
which(benruc_pad41424390$b_cat>=0) -> i.brnbat
benruc_pad41424390[i.brnbat,] -> brnbat
netgap(brnbat) -> brnbat.g
cbind(rep('brnbat', dim(brnbat.g)[1]), brnbat.g) -> brnbat.gap
names(brnbat.gap) <- c('net', 'gap', 'area')
brnbat.gap
brnbat.gap$gap <- c(1,2,3,4,4)

# "bland_pad52", 
which(bland_pad52$b_cat>=0) -> i.blp52
bland_pad52[i.blp52,] -> blp52
netgap(blp52) -> blp52.g
cbind(rep('blp52', dim(blp52.g)[1]), blp52.g) -> blp52.gap
names(blp52.gap) <- c('net', 'gap', 'area')
blp52.gap
blp52.gap$gap <- c(1,2,3,4,4)


# "bland_pad95", 
which(bland_pad95$b_cat>=0) -> i.blp95
bland_pad95[i.blp95,] -> blp95
netgap(blp95) -> blp95.g
cbind(rep('blp95', dim(blp95.g)[1]), blp95.g) -> blp95.gap
names(blp95.gap) <- c('net', 'gap', 'area')
blp95.gap
blp95.gap$gap <- c(1,2,3,4,4)

# "bland_pad42", 
which(bland_pad42$b_cat>=0) -> i.blpine
bland_pad42[i.blpine,] -> blpine
netgap(blpine) -> blpine.g
cbind(rep('blpine', dim(blpine.g)[1]), blpine.g) -> blpine.gap
names(blpine.gap) <- c('net', 'gap', 'area')
blpine.gap
blpine.gap$gap <- c(1,2,3,4,4)

# "blws_pad31", 
which(benruc_pad41424390$b_cat>=0) -> i.brnbat
benruc_pad41424390[i.brnbat,] -> brnbat
netgap(brnbat) -> brnbat.g
cbind(rep('brnbat', dim(brnbat.g)[1]), brnbat.g) -> brnbat.gap
names(brnbat.gap) <- c('net', 'gap', 'area')
brnbat.gap
brnbat.gap$gap <- c(1,2,3,4,4)

# "blws_pad41",
which(blws_pad41$b_cat>=0) -> i.bldec
blws_pad41[i.bldec,] -> bldec
netgap(bldec) -> bldec.g
cbind(rep('bldec', dim(bldec.g)[1]), bldec.g) -> bldec.gap
names(bldec.gap) <- c('net', 'gap', 'area')
bldec.gap
bldec.gap$gap <- c(1,2,3,4,4)

# "blws_pad71", 
which(blws_pad71$b_cat>=0) -> i.blp71
blws_pad71[i.blp71,] -> blp71
netgap(blp71) -> blp71.g
cbind(rep('blp71', dim(blp71.g)[1]), blp71.g) -> blp71.gap
names(blp71.gap) <- c('net', 'gap', 'area')
blp71.gap
blp71.gap$gap <- c(1,2,3,4,4)

# "catmer_pad43", 
which(catmer_pad43$b_cat>=0) -> i.cmmix
catmer_pad43[i.cmmix,] -> cmmix
netgap(cmmix) -> cmmix.g
cbind(rep('cmmix', dim(cmmix.g)[1]), cmmix.g) -> cmmix.gap
names(cmmix.gap) <- c('net', 'gap', 'area')
cmmix.gap
cmmix.gap$gap <- c(1,2,3,4,4)

# "catmer_pad41",
which(catmer_pad41$b_cat>=0) -> i.cmdec
catmer_pad41[i.cmdec,] -> cmdec
netgap(cmdec) -> cmdec.g
cbind(rep('cmdec', dim(cmdec.g)[1]), cmdec.g) -> cmdec.gap
names(cmdec.gap) <- c('net', 'gap', 'area')
cmdec.gap
cmdec.gap$gap <- c(1,2,3,4,4)

#  "catmer_pad41424390",
which(catmer_pad41424390$b_cat>=0) -> i.cmnbat
catmer_pad41424390[i.cmnbat,] -> cmnbat
netgap(cmnbat) -> cmnbat.g
cbind(rep('cmnbat', dim(cmnbat.g)[1]), cmnbat.g) -> cmnbat.gap
names(cmnbat.gap) <- c('net', 'gap', 'area')
cmnbat.gap
cmnbat.gap$gap <- c(1,2,3,4,4)

#  "catt_pad41424390", 
which(catt_pad41424390$b_cat>=0) -> i.canbat
catt_pad41424390[i.canbat,] -> canbat
netgap(canbat) -> canbat.g
cbind(rep('canbat', dim(canbat.g)[1]), canbat.g) -> canbat.gap
names(canbat.gap) <- c('net', 'gap', 'area')
canbat.gap
canbat.gap$gap <- c(1,2,3,4,4)

# "catt_pad414390",
which(catt_pad414390$b_cat>=0) -> i.caibat
catt_pad414390[i.caibat,] -> caibat
netgap(caibat) -> caibat.g
cbind(rep('caibat', dim(caibat.g)[1]), caibat.g) -> caibat.gap
names(caibat.gap) <- c('net', 'gap', 'area')
caibat.gap
caibat.gap$gap <- c(1,2,3,4,4)

#  "cdaw_pad414390", 
which(cdaw_pad414390$b_cat>=0) -> i.cdibat
cdaw_pad414390[i.cdibat,] -> cdibat
netgap(cdibat) -> cdibat.g
cbind(rep('cdibat', dim(cdibat.g)[1]), cdibat.g) -> cdibat.gap
names(cdibat.gap) <- c('net', 'gap', 'area')
cdibat.gap
cdibat.gap$gap <- c(1,2,3,4,4)

# "cdaw_pad41", 
which(cdaw_pad41$b_cat>=0) -> i.cddec
cdaw_pad41[i.cddec,] -> cddec
netgap(cddec) -> cddec.g
cbind(rep('cddec', dim(cddec.g)[1]), cddec.g) -> cddec.gap
names(cddec.gap) <- c('net', 'gap', 'area')
cddec.gap
cddec.gap$gap <- c(1,2,3,4,4)

# "cdaw_pad41424390",
which(cdaw_pad41424390$b_cat>=0) -> i.cdnbat
cdaw_pad41424390[i.cdnbat,] -> cdnbat
netgap(cdnbat) -> cdnbat.g
cbind(rep('cdnbat', dim(cdnbat.g)[1]), cdnbat.g) -> cdnbat.gap
names(cdnbat.gap) <- c('net', 'gap', 'area')
cdnbat.gap
cdnbat.gap$gap <- c(1,2,3,4,4)

# "ced_pad41424390", 
which(ced_pad41424390$b_cat>=0) -> i.cenbat
ced_pad41424390[i.cenbat,] -> cenbat
netgap(cenbat) -> cenbat.g
cbind(rep('cenbat', dim(cenbat.g)[1]), cenbat.g) -> cenbat.gap
names(cenbat.gap) <- c('net', 'gap', 'area')
cenbat.gap
cenbat.gap$gap <- c(1,2,3,4,4)

# "cnav_pad42", 
which(cnav_pad42$b_cat>=0) -> i.cnpine
cnav_pad42[i.cnpine,] -> cnpine
netgap(cnpine) -> cnpine.g
cbind(rep('cnpine', dim(cnpine.g)[1]), cnpine.g) -> cnpine.gap
names(cnpine.gap) <- c('net', 'gap', 'area')
cnpine.gap
cnpine.gap$gap <- c(1,2,3,4,4)

# "cust_pad41424390", 
which(cust_pad41424390$b_cat>=0) -> i.cunbat
cust_pad41424390[i.cunbat,] -> cunbat
netgap(cunbat) -> cunbat.g
cbind(rep('cunbat', dim(cunbat.g)[1]), cunbat.g) -> cunbat.gap
names(cunbat.gap) <- c('net', 'gap', 'area')
cunbat.gap
cunbat.gap$gap <- c(1,2,3,4,4)

# "cwdp_pad52",

#  "dix_pad41424390",

#  "fb_pad42", 

# "fb_pad41424390", 

# "fccg_pad414271", 

# "fccg_pad41424390",

# "fccg_pad31",

#  "fcpc_pad42", 

# "fd_pad414390", 

# "fd_pad41424390",

#  "gray_pad42", 

# "gray_pad41424390", 

# "hlcrslo_pad71", 

# "hlcrslo_pad52", 

# "hlcrslo_pad43", 

# "jblmcr_pad71", 

# "jblmcr_pad42", 

# "knox_pad43", 

# "knox_pad414390", 

# "knox_pad41424390", 

# "macon_pad414390", 

# "west_pad414390



###############
# bundle data

# melt & cast

# function for gap score

# calc gap score

# load aquatic nets
load('./data/aq_gs.rda')