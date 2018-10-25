library(dplyr)
library(RSQLite)
library(DBI)
library(reshape)
source('./R/netgap.r')

# read tables from database
gcon <- dbConnect(SQLite(), '~/Documents/grass/rep/will/sqlite/sqlite.db')

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

c("cm_pad414271", "fc_pad43", "fc_pad414390", "fc_pad41424390", "fhctx_pad52", "fhctx_pad41", "figab_pad41424390", "flwo_pad43", "flwo_pad414390",
  "flwo_pad41424390", "fp_pad42", "fp_pad41424390", "fril_pad41424390", "fs_pad95", "fs_pad71", "fs_pad42", "fva_pad41", "fva_pad42", "fva_pad41424390",
  "gorjac_pad42", "gorjac_pad43", "gorjac_pad41424390", "gorjac_pad71", "graf_pad41424390", "huach_pad71", "huach_pad42", "huach_pad43", "huach_pad41",
  "mccoy_pad43", "mccoy_pad41424390", "mccoy_pad71", "mta_pad41424390", "mta_pad71", "rave_pad41424390", "rip_pad42", "rip_pad41424390", "shel_pad42",
  "sill_pad52", "west_pad41424390") -> tmp

# read in database tables
system.time(for(i in 1:length(tmp)){
  assign(paste(tmp[i]), dbReadTable(gcon, paste(tmp[i])))
  }) # 65 sec, laptop

# 39 nets read in, need to select proper records, then get crosstab of gap status
# cm_pad414271
which(cm_pad414271$b_cat>=0) -> i.cm414271
cm_pad414271[i.cm414271,] -> cmbeetle
netgap(cmbeetle) -> cmbeetle.g
cbind(rep('cmbeetle', dim(cmbeetle.g)[1]), cmbeetle.g) -> cmbeetle.gap
names(cmbeetle.gap) <- c('net', 'gap', 'area')

# fc_pad43
which(fc_pad43$b_cat>=0) -> i.fc43
fc_pad43[i.fc43,] -> fc_gbat
netgap(fc_gbat) -> fc_gbat.g
cbind(rep('fcgbat', dim(fc_gbat.g)[1]), fc_gbat.g) -> fc_gbat.gap
names(fc_gbat.gap) <- c('net', 'gap', 'area')

# fc_pad414390
which(fc_pad414390$b_cat>=0) -> i.fc414390
fc_pad414390[i.fc414390,] -> fc_ibat
netgap(fc_ibat) -> fc_ibat.g
cbind(rep('fcibat', dim(fc_ibat.g)[1]), fc_ibat.g) -> fc_ibat.gap
names(fc_ibat.gap) <- c('net', 'gap', 'area')

# "fc_pad41424390"
which(fc_pad41424390$b_cat>=0) -> i.fc41424390
fc_pad41424390[i.fc41424390,] -> fc_nbat
netgap(fc_nbat) -> fc_nbat.g
cbind(rep('fcnbat', dim(fc_nbat.g)[1]), fc_nbat.g) -> fc_nbat.gap
names(fc_nbat.gap) <- c('net', 'gap', 'area')
fc_nbat.gap
fc_nbat.gap$gap <- c(1,2,3,4,4)

# "fhctx_pad52"
which(fhctx_pad52$b_cat>=0) -> i.fbcvi
fhctx_pad52[i.fbcvi,] -> fhbcvi
netgap(fhbcvi) -> fhbcvi.g
cbind(rep('fhbcvi', dim(fhbcvi.g)[1]), fhbcvi.g) -> fhbcvi.gap
names(fhbcvi.gap) <- c('net', 'gap', 'area')
fhbcvi.gap
fhbcvi.gap$gap <- c(2,3,4,4)

# fhctx_pad41
which(fhctx_pad41$b_cat>=0) -> i.fgcwa
fhctx_pad41[i.fgcwa,] -> fhgcwa
netgap(fhgcwa) -> fhgcwa.g
cbind(rep('fhgcwa', dim(fhgcwa.g)[1]), fhgcwa.g) -> fhgcwa.gap
names(fhgcwa.gap) <- c('net', 'gap', 'area')
fhgcwa.gap
fhgcwa.gap$gap <- c(2,3,4,4)

# figab_pad41424390
which(figab_pad41424390$b_cat>=0) -> i.finbat
figab_pad41424390[i.finbat,] -> finbat
netgap(finbat) -> finbat.g
cbind(rep('finbat', dim(finbat.g)[1]), finbat.g) -> finbat.gap
names(finbat.gap) <- c('net', 'gap', 'area')
finbat.gap
finbat.gap$gap <- c(1,2,3,4,4)

# flwo_pad43 
which(flwo_pad43$b_cat>=0) -> i.flw43
flwo_pad43[i.flw43,] -> flwo43
netgap(flwo43) -> flwo43.g
cbind(rep('flwo43', dim(flwo43.g)[1]), flwo43.g) -> flwo43.gap
names(flwo43.gap) <- c('net', 'gap', 'area')
flwo43.gap
flwo43.gap$gap <- c(1,2,3,4,4)

# "", "flwo_pad414390",
which(flwo_pad414390$b_cat>=0) -> i.flibat
flwo_pad414390[i.flibat,] -> flibat
netgap(flibat) -> flibat.g
cbind(rep('flibat', dim(flibat.g)[1]), flibat.g) -> flibat.gap
names(flibat.gap) <- c('net', 'gap', 'area')
flibat.gap
flibat.gap$gap <- c(1,2,3,4,4)

# "flwo_pad41424390", 
which(flwo_pad41424390$b_cat>=0) -> i.flnbat
flwo_pad41424390[i.flnbat,] -> flnbat
netgap(flnbat) -> flnbat.g
cbind(rep('flnbat', dim(flnbat.g)[1]), flnbat.g) -> flnbat.gap
names(flnbat.gap) <- c('net', 'gap', 'area')
flnbat.gap
flnbat.gap$gap <- c(1,2,3,4,4)

# "fp_pad42", 
which(fp_pad42$b_cat>=0) -> i.fp42
fp_pad42[i.fp42,] -> fpine
netgap(fpine) -> fpine.g
cbind(rep('fpine', dim(fpine.g)[1]), fpine.g) -> fpine.gap
names(fpine.gap) <- c('net', 'gap', 'area')
fpine.gap
fpine.gap$gap <- c(1,2,3,4,4)

# "fp_pad41424390"
which(fp_pad41424390$b_cat>=0) -> i.fpnbat
fp_pad41424390[i.fpnbat,] -> fpnbat
netgap(fpnbat) -> fpnbat.g
cbind(rep('fpnbat', dim(fpnbat.g)[1]), fpnbat.g) -> fpnbat.gap
names(fpnbat.gap) <- c('net', 'gap', 'area')
fpnbat.gap
fpnbat.gap$gap <- c(1,2,3,4,4)

# "fril_pad41424390", 
which(fril_pad41424390$b_cat>=0) -> i.fr_nbat
fril_pad41424390[i.fr_nbat,] -> frnbat
netgap(frnbat) -> frnbat.g
cbind(rep('frnbat', dim(frnbat.g)[1]), frnbat.g) -> frnbat.gap
names(frnbat.gap) <- c('net', 'gap', 'area')
frnbat.gap
frnbat.gap$gap <- c(1,2,3,4,4)

# "fs_pad95", 
which(fs_pad95$b_cat>=0) -> i.fs_wost
fs_pad95[i.fs_wost,] -> fswost
netgap(fswost) -> fswost.g
cbind(rep('fswost', dim(fswost.g)[1]), fswost.g) -> fswost.gap
names(fswost.gap) <- c('net', 'gap', 'area')
fswost.gap
fswost.gap$gap <- c(1,2,3,4,4)

# "fs_pad71", 
which(fs_pad71$b_cat>=0) -> i.fs_71
fs_pad71[i.fs_71,] -> fs71
netgap(fs71) -> fs71.g
cbind(rep('fs71', dim(fs71.g)[1]), fs71.g) -> fs71.gap
names(fs71.gap) <- c('net', 'gap', 'area')
fs71.gap
fs71.gap$gap <- c(1,2,3,4,4)

# "fs_pad42",
which(fs_pad42$b_cat>=0) -> i.fspine
fs_pad42[i.fspine,] -> fspine
netgap(fspine) -> fspine.g
cbind(rep('fspine', dim(fspine.g)[1]), fspine.g) -> fspine.gap
names(fspine.gap) <- c('net', 'gap', 'area')
fspine.gap
fspine.gap$gap <- c(1,2,3,4,4)


#   "fva_pad41",
which(fva_pad41$b_cat>=0) -> i.fv41
fva_pad41[i.fv41,] -> fv41
netgap(fv41) -> fv41.g
cbind(rep('fv41', dim(fv41.g)[1]), fv41.g) -> fv41.gap
names(fv41.gap) <- c('net', 'gap', 'area')
fv41.gap
fv41.gap$gap <- c(1,2,3,4,4)

#  "fva_pad42", 
which(fva_pad42$b_cat>=0) -> i.fv42
fva_pad42[i.fv42,] -> fv42
netgap(fv42) -> fv42.g
cbind(rep('fv42', dim(fv42.g)[1]), fv42.g) -> fv42.gap
names(fv42.gap) <- c('net', 'gap', 'area')
fv42.gap
fv42.gap$gap <- c(1,2,3,4,4)

# "fva_pad41424390",
which(fva_pad41424390$b_cat>=0) -> i.fvnbat
fva_pad41424390[i.fvnbat,] -> fvnbat
netgap(fvnbat) -> fvnbat.g
cbind(rep('fvnbat', dim(fvnbat.g)[1]), fvnbat.g) -> fvnbat.gap
names(fvnbat.gap) <- c('net', 'gap', 'area')
fvnbat.gap
fvnbat.gap$gap <- c(1,2,3,4,4)

# "gorjac_pad42", 
which(gorjac_pad42$b_cat>=0) -> i.gjpine
gorjac_pad42[i.gjpine,] -> gjpine
netgap(gjpine) -> gjpine.g
cbind(rep('gjpine', dim(gjpine.g)[1]), gjpine.g) -> gjpine.gap
names(gjpine.gap) <- c('net', 'gap', 'area')
gjpine.gap
gjpine.gap$gap <- c(1,2,3,4,4)

#  "gorjac_pad43", 
which(gorjac_pad43$b_cat>=0) -> i.gj43
gorjac_pad43[i.gj43,] -> gj43
netgap(gj43) -> gj43.g
cbind(rep('gj43', dim(gj43.g)[1]), gj43.g) -> gj43.gap
names(gj43.gap) <- c('net', 'gap', 'area')
gj43.gap
gj43.gap$gap <- c(1,2,3,4,4)

#  "gorjac_pad41424390", 
which(gorjac_pad41424390$b_cat>=0) -> i.gjnbat
gorjac_pad41424390[i.gjnbat,] -> gjnbat
netgap(gjnbat) -> gjnbat.g
cbind(rep('gjnbat', dim(gjnbat.g)[1]), gjnbat.g) -> gjnbat.gap
names(gjnbat.gap) <- c('net', 'gap', 'area')
gjnbat.gap
gjnbat.gap$gap <- c(1,2,3,4,4)

# "gorjac_pad71", 
which(gorjac_pad71$b_cat>=0) -> i.gj71
gorjac_pad71[i.gj71,] -> gj71
netgap(gj71) -> gj71.g
cbind(rep('gj71', dim(gj71.g)[1]), gj71.g) -> gj71.gap
names(gj71.gap) <- c('net', 'gap', 'area')
gj71.gap
gj71.gap$gap <- c(1,2,3,4,4)

# "graf_pad41424390", 
which(graf_pad41424390$b_cat>=0) -> i.grnbat
graf_pad41424390[i.grnbat,] -> grnbat
netgap(grnbat) -> grnbat.g
cbind(rep('grnbat', dim(grnbat.g)[1]), grnbat.g) -> grnbat.gap
names(grnbat.gap) <- c('net', 'gap', 'area')
grnbat.gap
grnbat.gap$gap <- c(2,3,4,4)

#  "huach_pad71", 
which(huach_pad71$b_cat>=0) -> i.hu71
huach_pad71[i.hu71,] -> hu71
netgap(hu71) -> hu71.g
cbind(rep('hu71', dim(hu71.g)[1]), hu71.g) -> hu71.gap
names(hu71.gap) <- c('net', 'gap', 'area')
hu71.gap
hu71.gap$gap <- c(1,2,3,4,4)

# "huach_pad42", 
which(huach_pad42$b_cat>=0) -> i.hupine
huach_pad42[i.hupine,] -> hupine
netgap(hupine) -> hupine.g
cbind(rep('hupine', dim(hupine.g)[1]), hupine.g) -> hupine.gap
names(hupine.gap) <- c('net', 'gap', 'area')
hupine.gap
hupine.gap$gap <- c(1,2,3,4,4)

# "huach_pad43", 
which(huach_pad43$b_cat>=0) -> i.humix
huach_pad43[i.humix,] -> humix
netgap(humix) -> humix.g
cbind(rep('humix', dim(humix.g)[1]), humix.g) -> humix.gap
names(humix.gap) <- c('net', 'gap', 'area')
humix.gap
humix.gap$gap <- c(1,2,3,4,4)

# "huach_pad41",
which(huach_pad41$b_cat>=0) -> i.hu41
huach_pad41[i.hu41,] -> hudec
netgap(hudec) -> hudec.g
cbind(rep('hudec', dim(hudec.g)[1]), hudec.g) -> hudec.gap
names(hudec.gap) <- c('net', 'gap', 'area')
hudec.gap
hudec.gap$gap <- c(1,2,3,4,4)

# "mccoy_pad43", 
which(mccoy_pad43$b_cat>=0) -> i.mcmix
mccoy_pad43[i.mcmix,] -> mcmix
netgap(mcmix) -> mcmix.g
cbind(rep('mcmix', dim(mcmix.g)[1]), mcmix.g) -> mcmix.gap
names(mcmix.gap) <- c('net', 'gap', 'area')
mcmix.gap
mcmix.gap$gap <- c(2,3,4,4)

# "mccoy_pad41424390", 
which(mccoy_pad41424390$b_cat>=0) -> i.mcnbat
mccoy_pad41424390[i.mcnbat,] -> mcnbat
netgap(mcnbat) -> mcnbat.g
cbind(rep('mcnbat', dim(mcnbat.g)[1]), mcnbat.g) -> mcnbat.gap
names(mcnbat.gap) <- c('net', 'gap', 'area')
mcnbat.gap
mcnbat.gap$gap <- c(1,2,3,4,4)

# "mccoy_pad71", 
which(mccoy_pad71$b_cat>=0) -> i.mc71
mccoy_pad71[i.mc71,] -> mc71
netgap(mc71) -> mc71.g
cbind(rep('mc71', dim(mc71.g)[1]), mc71.g) -> mc71.gap
names(mc71.gap) <- c('net', 'gap', 'area')
mc71.gap
mc71.gap$gap <- c(1,2,3,4,4)

# "mta_pad41424390", 
which(mta_pad41424390$b_cat>=0) -> i.mtnbat
mta_pad41424390[i.mtnbat,] -> mtnbat
netgap(mtnbat) -> mtnbat.g
cbind(rep('mtnbat', dim(mtnbat.g)[1]), mtnbat.g) -> mtnbat.gap
names(mtnbat.gap) <- c('net', 'gap', 'area')
mtnbat.gap
mtnbat.gap$gap <- c(1,2,3,4,4)

# "mta_pad71", 
which(mta_pad71$b_cat>=0) -> i.mta71
mta_pad71[i.mta71,] -> mta71
netgap(mta71) -> mta71.g
cbind(rep('mta71', dim(mta71.g)[1]), mta71.g) -> mta71.gap
names(mta71.gap) <- c('net', 'gap', 'area')
mta71.gap
mta71.gap$gap <- c(1,2,3,4,4)

# "rave_pad41424390", 
which(rave_pad41424390$b_cat>=0) -> i.ranbat
rave_pad41424390[i.ranbat,] -> ranbat
netgap(ranbat) -> ranbat.g
cbind(rep('ranbat', dim(ranbat.g)[1]), ranbat.g) -> ranbat.gap
names(ranbat.gap) <- c('net', 'gap', 'area')
ranbat.gap
ranbat.gap$gap <- c(1,2,3,4,4)

# "rip_pad42", 
which(rip_pad42$b_cat>=0) -> i.rpine
rip_pad42[i.rpine,] -> rpine
netgap(rpine) -> rpine.g
cbind(rep('rpine', dim(rpine.g)[1]), rpine.g) -> rpine.gap
names(rpine.gap) <- c('net', 'gap', 'area')
rpine.gap
rpine.gap$gap <- c(1,2,3,4,4)

# "rip_pad41424390", 
which(rip_pad41424390$b_cat>=0) -> i.ripnbat
rip_pad41424390[i.ripnbat,] -> ripnbat
netgap(ripnbat) -> ripnbat.g
cbind(rep('ripnbat', dim(ripnbat.g)[1]), ripnbat.g) -> ripnbat.gap
names(ripnbat.gap) <- c('net', 'gap', 'area')
ripnbat.gap
ripnbat.gap$gap <- c(1,2,3,4,4)

# "shel_pad42",
which(shel_pad42$b_cat>=0) -> i.shpine
shel_pad42[i.shpine,] -> shpine
netgap(shpine) -> shpine.g
cbind(rep('shpine', dim(shpine.g)[1]), shpine.g) -> shpine.gap
names(shpine.gap) <- c('net', 'gap', 'area')
shpine.gap
shpine.gap$gap <- c(1,2,3,4,4)

# "sill_pad52", "
which(sill_pad52$b_cat>=0) -> i.sbcvi
sill_pad52[i.sbcvi,] -> sbcvi
netgap(sbcvi) -> sbcvi.g
cbind(rep('sbcvi', dim(sbcvi.g)[1]), sbcvi.g) -> sbcvi.gap
names(sbcvi.gap) <- c('net', 'gap', 'area')
sbcvi.gap
sbcvi.gap$gap <- c(1,2,3,4,4)

# west_pad41424390
which(west_pad41424390$b_cat>=0) -> i.wpnbat
west_pad41424390[i.wpnbat,] -> wpnbat
netgap(wpnbat) -> wpnbat.g
cbind(rep('wpnbat', dim(wpnbat.g)[1]), wpnbat.g) -> wpnbat.gap
names(wpnbat.gap) <- c('net', 'gap', 'area')
wpnbat.gap
wpnbat.gap$gap <- c(1,2,3,4,4)

# bundle data
rbind(cmbeetle.gap, fc_gbat.gap, fc_ibat.gap, fc_nbat.gap, fhbcvi.gap, fhgcwa.gap, finbat.gap, flibat.gap, flnbat.gap, flwo43.gap, fpine.gap, fpnbat.gap,
      frnbat.gap, fs71.gap, fspine.gap, fswost.gap, fv41.gap, fv42.gap, fvnbat.gap, gj43.gap, gj71.gap, gjnbat.gap, gjpine.gap, grnbat.gap, hu71.gap, 
      hudec.gap, humix.gap, hupine.gap, mc71.gap, mcmix.gap, mcnbat.gap, mta71.gap, mtnbat.gap, ranbat.gap, ripnbat.gap, rpine.gap, sbcvi.gap, shpine.gap,
      wpnbat.gap) -> lter_netgap

# save lter_netgap object
save(lter_netgap, file='./data/lter_netgap.rda')

# load aquatic nets
load('./data/aq_gs.rda')