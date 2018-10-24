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


# write to csv and fix NA's

# read in csv's

# bundle data

# melt & cast

# function for gap score

# calc gap score

# load aquatic nets
load('./data/aq_gs.rda')