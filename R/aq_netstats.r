library(foreign)
library(dplyr)

# benruc_padmus
read.dbf('C:/Users/u4cnnwrf/Documents/gis/benruc_padmus.dbf') -> brpmus
which(brpmus$FID_benruc>-1) -> incl.brpmus
brpmus[incl.brpmus,] -> brpm

brpm %>%
  group_by(Own_Name) %>%
  summarise(totarea=sum(subarea)) -> brpm.m

brpm %>%
  group_by(GAP_Sts) %>%
  summarise(totarea=sum(subarea)) -> brpm.g

rep('brpmus', dim(brpm.m)[1]) -> brpm.mname
rep('brpmus', dim(brpm.g)[1]) -> brpm.gname

cbind(brpm.mname, brpm.m) -> brpm.own
names(brpm.own) <- c('net', 'own', 'area')

cbind(brpm.gname, brpm.g) -> brpm.gap
names(brpm.gap) <- c('net', 'gap', 'area')

# bland_padrhod
read.dbf('C:/Users/u4cnnwrf/Documents/gis/bland_padrhod.dbf') -> bland_prhod
which(bland_prhod$FID_bland1>-1) -> incl.blandr
bland_prhod[incl.blandr,] -> bla_prho

bla_prho %>%
  group_by(Own_Name) %>%
  summarise(totarea=sum(subarea)) -> brho.m

brpm %>%
  group_by(GAP_Sts) %>%
  summarise(totarea=sum(subarea)) -> brho.g

rep('blrho', dim(brho.m)[1]) -> brho.mname
rep('blrho', dim(brho.g)[1]) -> brho.gname

cbind(brho.mname, brho.m) -> brho.own
names(brho.own) <- c('net', 'own', 'area')

cbind(brho.gname, brho.g) -> brho.gap
names(brho.gap) <- c('net', 'gap', 'area')

# blws_nwi_swfl
read.dbf('C:/Users/u4cnnwrf/Documents/gis/blws_padswfl.dbf') -> blws_pswfl
which(blws_pswfl$FID_blws_n>-1) -> incl.bswfl
blws_pswfl[incl.bswfl,] -> bswf

bswf %>%
  group_by(Own_Name) %>%
  summarise(totarea = sum(subarea)) -> bswf.m

bswf %>%
  group_by(GAP_Sts) %>%
  summarise(totarea = sum(subarea)) -> bswf.g

rep('bswf', dim(bswf.m)[1]) -> bswf.mname
rep('bswf', dim(bswf.g)[1]) -> bswf.gname

cbind(bswf.mname, bswf.m) -> bswf.own
names(bswf.own) <- c('net', 'own', 'area')

cbind(bswf.gname, bswf.g) -> bswf.gap
names(bswf.gap) <- c('net', 'gap', 'area')

# catt_padrabe
read.dbf('C:/Users/u4cnnwrf/Documents/gis/catt_padrabe.dbf') -> catt_prabe
which(catt_prabe$FID_catt_r>-1) -> incl.crabe
catt_prabe[incl.crabe,] -> crabe

crabe %>%
  group_by(Own_Name) %>%
  summarise(totarea = sum(subarea)) -> crabe.m

crabe %>%
  group_by(GAP_Sts) %>%
  summarise(totarea = sum(subarea)) -> crabe.g

rep('crabe', dim(crabe.m)[1]) -> crabe.mname
rep('crabe', dim(crabe.g)[1]) -> crabe.gname

cbind(crabe.mname, crabe.m) -> crabe.own
names(crabe.own) <- c('net', 'own', 'area')

cbind(crabe.gname, crabe.g) -> crabe.gap
names(crabe.gap) <- c('net', 'gap', 'area')

# catt_padsnuf
read.dbf('C:/Users/u4cnnwrf/Documents/gis/catt_padsnuf.dbf') -> catt_psnuf
which(catt_psnuf$FID_catt_s>-1) -> incl.csnuf
catt_psnuf[incl.csnuf,] -> csnuf

csnuf %>%
  group_by(Own_Name) %>%
  summarise(totarea = sum(subarea)) -> csnuf.m

csnuf %>%
  group_by(GAP_Sts) %>%
  summarise(totarea = sum(subarea)) -> csnuf.g

rep('csnuf', dim(csnuf.m)[1]) -> csnuf.mname
rep('csnuf', dim(csnuf.g)[1]) -> csnuf.gname

cbind(csnuf.mname, csnuf.m) -> csnuf.own
names(csnuf.own) <- c('net', 'own', 'area')

cbind(csnuf.gname, csnuf.g) -> csnuf.gap
names(csnuf.gap) <- c('net', 'gap', 'area')

# cust_padmass
read.dbf('C:/Users/u4cnnwrf/Documents/gis/cust_padmass.dbf') -> cust_pmass
which(cust_pmass$FID_cust_n>-1) -> i.cpm
cust_pmass[i.cpm,] -> cmass

netown(cmass, cmass.m) -> cmass.m
netgap(cmass, cmass.g) -> cmass.g

rep('cmass', dim(cmass.m)[1]) -> cmass.mname
rep('cmass', dim(cmass.g)[1]) -> cmass.gname

cbind(cmass.mname, cmass.m) -> cmass.own
names(cmass.own) <- c('net', 'own', 'area')

cbind(cmass.gname, cmass.g) -> cmass.gap
names(cmass.gap) <- c('net', 'gap', 'area')

# fb_psfs
read.dbf('C:/Users/u4cnnwrf/Documents/gis/fb_psfs.dbf') -> fb_psfs
which(fb_psfs$b_cat>0) -> i.fbs
fb_psfs[i.fbs,] -> fsfs

netown(fsfs, fsfs.m) -> fsfs.m
netgap(fsfs, fsfs.g) -> fsfs.g

rep('fsfs', dim(fsfs.m)[1]) -> fsfs.mname
rep('fsfs', dim(fsfs.g)[1]) -> fsfs.gname

cbind(fsfs.mname, fsfs.m) -> fsfs.own
names(fsfs.own) <- c('net', 'own', 'area')

cbind(fsfs.gname, fsfs.g) -> fsfs.gap
names(fsfs.gap) <- c('net', 'gap', 'area')


# fb_prll
read.dbf('C:/Users/u4cnnwrf/Documents/gis/fb_prll.dbf') -> fb_prll
which(fb_psfs$b_cat>0) -> i.frll
fb_prll[i.frll,] -> frll

netown(frll, frll.m) -> frll.m
netgap(frll, frll.g) -> frll.g

rep('frll', dim(frll.m)[1]) -> frll.mname
rep('frll', dim(frll.g)[1]) -> frll.gname

cbind(frll.mname, frll.m) -> frll.own
names(frll.own) <- c('net', 'own', 'area')

cbind(frll.gname, frll.g) -> frll.gap
names(frll.gap) <- c('net', 'gap', 'area')

# flwo_padspec
read.dbf('C:/Users/u4cnnwrf/Documents/gis/flwo_padspec.dbf') -> flw_pspec
which(flw_pspec$FID_flwo_s>0) -> i.fspec
flw_pspec[i.fspec,] -> fspec

netown(fspec, frll.m) -> fspec.m
netgap(fspec, frll.g) -> fspec.g

rep('fspec', dim(fspec.m)[1]) -> fspec.mname
rep('fspec', dim(fspec.g)[1]) -> fspec.gname

cbind(fspec.mname, fspec.m) -> fspec.own
names(fspec.own) <- c('net', 'own', 'area')

cbind(fspec.gname, fspec.g) -> fspec.gap
names(fspec.gap) <- c('net', 'gap', 'area')

# fril_padpipl
read.dbf('C:/Users/u4cnnwrf/Documents/gis/fril_padpipl.dbf') -> fril_pipl
which(fril_pipl$b_cat>0) -> i.fpipl
fril_pipl[i.fpipl,] -> fpipl

netown(fpipl, frll.m) -> fpipl.m
netgap(fpipl, frll.g) -> fpipl.g

rep('fpipl', dim(fpipl.m)[1]) -> fpipl.mname
rep('fpipl', dim(fpipl.g)[1]) -> fpipl.gname

cbind(fpipl.mname, fpipl.m) -> fpipl.own
names(fpipl.own) <- c('net', 'own', 'area')

cbind(fpipl.gname, fpipl.g) -> fpipl.gap
names(fpipl.gap) <- c('net', 'gap', 'area')

# fril_padtosh
read.dbf('C:/Users/u4cnnwrf/Documents/gis/fril_padtosh.dbf') -> flw_tosh
which(flw_tosh$b_cat>=0) -> i.ftosh
flw_tosh[i.ftosh,] -> ftosh

netown(ftosh, ftosh.m) -> ftosh.m
netgap(ftosh, ftosh.g) -> ftosh.g

rep('ftosh', dim(ftosh.m)[1]) -> ftosh.mname
rep('ftosh', dim(ftosh.g)[1]) -> ftosh.gname

cbind(ftosh.mname, ftosh.m) -> ftosh.own
names(ftosh.own) <- c('net', 'own', 'area')

cbind(ftosh.gname, ftosh.g) -> ftosh.gap
names(ftosh.gap) <- c('net', 'gap', 'area')

# fs_padffs
read.dbf('C:/Users/u4cnnwrf/Documents/gis/fs_padffs.dbf') -> fs_pffs
which(fs_pffs$FID_fs_ffs>=0) -> i.ffs
fs_pffs[i.ffs,] -> ffs

netown(ffs, frll.m) -> ffs.m
netgap(ffs, frll.g) -> ffs.g

rep('ffs', dim(ffs.m)[1]) -> ffs.mname
rep('ffs', dim(ffs.g)[1]) -> ffs.gname

cbind(ffs.mname, ffs.m) -> ffs.own
names(ffs.own) <- c('net', 'own', 'area')

cbind(ffs.gname, ffs.g) -> ffs.gap
names(ffs.gap) <- c('net', 'gap', 'area')

# fs_padst
read.dbf('C:/Users/u4cnnwrf/Documents/gis/fs_padst.dbf') -> fs_pst
which(fs_pst$FID_fs_st>=0) -> i.fst
fs_pst[i.fst,] -> fst

netown(fst, frll.m) -> fst.m
netgap(fst, frll.g) -> fst.g

rep('fst', dim(fst.m)[1]) -> fst.mname
rep('fst', dim(fst.g)[1]) -> fst.gname

cbind(fst.mname, fst.m) -> fst.own
names(fst.own) <- c('net', 'own', 'area')

cbind(fst.gname, fst.g) -> fst.gap
names(fst.gap) <- c('net', 'gap', 'area')

# fva_padlance
read.dbf('C:/Users/u4cnnwrf/Documents/gis/fva_padlance.dbf') -> fva_plance
str(fva_plance)
which(fva_plance$b_cat>=0) -> i.lance
fva_plance[i.lance,] -> flance

netown(flance, frll.m) -> flance.m
netgap(flance, frll.g) -> flance.g

rep('flance', dim(flance.m)[1]) -> flance.mname
rep('flance', dim(flance.g)[1]) -> flance.gname

cbind(flance.mname, flance.m) -> flance.own
names(flance.own) <- c('net', 'own', 'area')

cbind(flance.gname, flance.g) -> flance.gap
names(flance.gap) <- c('net', 'gap', 'area')


# fva_padrlog
read.dbf('C:/Users/u4cnnwrf/Documents/gis/fva_rlog.dbf') -> fva_prlog
str(fva_prlog)
which(fva_prlog$b_cat>=0) -> i.rlog
fva_prlog[i.rlog,] -> frlog

netown(frlog, frll.m) -> frlog.m
netgap(frlog, frll.g) -> frlog.g

rep('frlog', dim(frlog.m)[1]) -> frlog.mname
rep('frlog', dim(frlog.g)[1]) -> frlog.gname

cbind(frlog.mname, frlog.m) -> frlog.own
names(frlog.own) <- c('net', 'own', 'area')

cbind(frlog.gname, frlog.g) -> frlog.gap
names(frlog.gap) <- c('net', 'gap', 'area')

# fva_padspink
read.dbf('C:/Users/u4cnnwrf/Documents/gis/fva_padspink.dbf') -> fva_pink
str(fva_pink)
which(fva_pink$b_cat>=0) -> i.pink
fva_pink[i.pink,] -> fpink

netown(fpink, frll.m) -> fpink.m
netgap(fpink, frll.g) -> fpink.g

rep('fpink', dim(fpink.m)[1]) -> fpink.mname
rep('fpink', dim(fpink.g)[1]) -> fpink.gname

cbind(fpink.mname, fpink.m) -> fpink.own
names(fpink.own) <- c('net', 'own', 'area')

cbind(fpink.gname, fpink.g) -> fpink.gap
names(fpink.gap) <- c('net', 'gap', 'area')

# gorjac_padrll
read.dbf('C:/Users/u4cnnwrf/Documents/gis/gorjac_padrll.dbf') -> gj_prll
str(gj_prll)
which(gj_prll$FID_gj_rll>=0) -> i.grll
gj_prll[i.grll,] -> riotgrll

netown(riotgrll, riotgrll.m) -> riotgrll.m
netgap(riotgrll, riotgrll.g) -> riotgrll.g

rep('gjrll', dim(riotgrll.m)[1]) -> riotgrll.mname
rep('gjrll', dim(riotgrll.g)[1]) -> riotgrll.gname

cbind(riotgrll.mname, riotgrll.m) -> gjrll.own
names(gjrll.own) <- c('net', 'own', 'area')

cbind(riotgrll.gname, riotgrll.g) -> gjrll.gap
names(gjrll.gap) <- c('net', 'gap', 'area')

# gray_padgrod
read.dbf('C:/Users/u4cnnwrf/Documents/gis/gray_padgrod.dbf') -> gr_grod
str(gr_grod)
which(gr_grod$FID_gray_n>=0) -> i.ggrod
gr_grod[i.ggrod,] -> ggrod

netown(ggrod, ggrod.m) -> ggrod.m
netgap(ggrod, ggrod.g) -> ggrod.g

rep('ggrod', dim(ggrod.m)[1]) -> ggrod.mname
rep('ggrod', dim(ggrod.g)[1]) -> ggrod.gname

cbind(ggrod.mname, ggrod.m) -> ggrod.own
names(ggrod.own) <- c('net', 'own', 'area')

cbind(ggrod.gname, ggrod.g) -> ggrod.gap
names(ggrod.gap) <- c('net', 'gap', 'area')

# gray_padmass
read.dbf('C:/Users/u4cnnwrf/Documents/gis/gray_padmass.dbf') -> gr_mas
str(gr_mas)
which(gr_mas$FID_gray_n>=0) -> i.gmas
gr_mas[i.gmas,] -> gmas

netown(gmas, gmas.m) -> gmas.m
netgap(gmas, gmas.g) -> gmas.g

rep('grmas', dim(gmas.m)[1]) -> gmas.mname
rep('grmas', dim(gmas.g)[1]) -> gmas.gname

cbind(gmas.mname, gmas.m) -> gmas.own
names(gmas.own) <- c('net', 'own', 'area')

cbind(gmas.gname, gmas.g) -> gmas.gap
names(gmas.gap) <- c('net', 'gap', 'area')

# hrcrslo_padcats
read.dbf('C:/Users/u4cnnwrf/Documents/gis/hlcrslo_padcats.dbf') -> h_pcats
str(h_pcats)
which(h_pcats$b_cat>=0) -> i.hcat
h_pcats[i.hcat,] -> hcats

netown(hcats, hcats.m) -> hcats.m
netgap(hcats, hcats.g) -> hcats.g

rep('hcats', dim(hcats.m)[1]) -> hcats.mname
rep('hcats', dim(hcats.g)[1]) -> hcats.gname

cbind(hcats.mname, hcats.m) -> hcats.own
names(hcats.own) <- c('net', 'own', 'area')

cbind(hcats.gname, hcats.g) -> hcats.gap
names(hcats.gap) <- c('net', 'gap', 'area')

# hlcrslo_padcrlf
read.dbf('C:/Users/u4cnnwrf/Documents/gis/hlrcslo_padcrlf.dbf') -> h_pcrlf
str(h_pcrlf)
which(h_pcrlf$b_cat>=0) -> i.hfrog
h_pcrlf[i.hfrog,] -> hfrog

netown(hfrog, hfrog.m) -> hfrog.m
netgap(hfrog, hfrog.g) -> hfrog.g

rep('hfrog', dim(hfrog.m)[1]) -> hfrog.mname
rep('hfrog', dim(hfrog.g)[1]) -> hfrog.gname

cbind(hfrog.mname, hfrog.m) -> hfrog.own
names(hfrog.own) <- c('net', 'own', 'area')

cbind(hfrog.gname, hfrog.g) -> hfrog.gap
names(hfrog.gap) <- c('net', 'gap', 'area')

# hlcrslo_padlbvi
read.dbf('C:/Users/u4cnnwrf/Documents/gis/hlrcslo_padlbvi.dbf') -> h_plbvi
str(h_plbvi)
which(h_plbvi$b_cat>=0) -> i.hvir
h_plbvi[i.hvir,] -> hvir

netown(hvir, hvir.m) -> hvir.m
netgap(hvir, hvir.g) -> hvir.g

rep('hvir', dim(hvir.m)[1]) -> hvir.mname
rep('hvir', dim(hvir.g)[1]) -> hvir.gname

cbind(hvir.mname, hvir.m) -> hvir.own
names(hvir.own) <- c('net', 'own', 'area')

cbind(hvir.gname, hvir.g) -> hvir.gap
names(hvir.gap) <- c('net', 'gap', 'area')

# hlrcslo_padshrimp
read.dbf('C:/Users/u4cnnwrf/Documents/gis/hlrcslo_padshrimp.dbf') -> h_pshrimp
str(h_pshrimp)
which(h_pshrimp$b_cat>=0) -> i.hshrimp
h_pshrimp[i.hshrimp,] -> hshrimp

netown(hshrimp, hshrimp.m) -> hshrimp.m
netgap(hshrimp, hshrimp.g) -> hshrimp.g

rep('hshrimp', dim(hshrimp.m)[1]) -> hshrimp.mname
rep('hshrimp', dim(hshrimp.g)[1]) -> hshrimp.gname

cbind(hshrimp.mname, hshrimp.m) -> hshrimp.own
names(hshrimp.own) <- c('net', 'own', 'area')

cbind(hshrimp.gname, hshrimp.g) -> hshrimp.gap
names(hshrimp.gap) <- c('net', 'gap', 'area')

hshrimp.own
hshrimp.gap

# hlrcslo_padsteel
read.dbf('C:/Users/u4cnnwrf/Documents/gis/hlrcslo_padsteel.dbf') -> h_psteel
str(h_psteel)
which(h_psteel$b_cat>=0) -> i.hsteel
h_psteel[i.hsteel,] -> hsteel

netown(hsteel, hsteel.m) -> hsteel.m
netgap(hsteel, hsteel.g) -> hsteel.g

rep('hsteel', dim(hsteel.m)[1]) -> hsteel.mname
rep('hsteel', dim(hsteel.g)[1]) -> hsteel.gname

cbind(hsteel.mname, hsteel.m) -> hsteel.own
names(hsteel.own) <- c('net', 'own', 'area')

cbind(hsteel.gname, hsteel.g) -> hsteel.gap
names(hsteel.gap) <- c('net', 'gap', 'area')

hsteel.own
hsteel.gap

# hlrcslo_padtoad
read.dbf('C:/Users/u4cnnwrf/Documents/gis/hlrcslo_padtoad.dbf') -> h_ptoad
str(h_ptoad)
which(h_ptoad$b_cat>=0) -> i.htoad
h_ptoad[i.htoad,] -> htoad

netown(htoad, htoad.m) -> htoad.m
netgap(htoad, htoad.g) -> htoad.g

rep('htoad', dim(htoad.m)[1]) -> htoad.mname
rep('htoad', dim(htoad.g)[1]) -> htoad.gname

cbind(htoad.mname, htoad.m) -> htoad.own
names(htoad.own) <- c('net', 'own', 'area')

cbind(htoad.gname, htoad.g) -> htoad.gap
names(htoad.gap) <- c('net', 'gap', 'area')

htoad.own
htoad.gap

# huach_padchub
read.dbf('C:/Users/u4cnnwrf/Documents/gis/huach_padchub.dbf') -> hu_pchub
which(hu_pchub$b_cat>=0) -> i.huchub
hu_pchub[i.huchub,] -> huchub

netown(huchub, huchub.m) -> huchub.m
netgap(huchub, huchub.g) -> huchub.g

rep('huchub', dim(huchub.m)[1]) -> huchub.mname
rep('huchub', dim(huchub.g)[1]) -> huchub.gname

cbind(huchub.mname, huchub.m) -> huchub.own
names(huchub.own) <- c('net', 'own', 'area')

cbind(huchub.gname, huchub.g) -> huchub.gap
names(huchub.gap) <- c('net', 'gap', 'area')

huchub.own
huchub.gap

# huach_padp
read.dbf('C:/Users/u4cnnwrf/Documents/gis/huach_padp.dbf') -> hu_pp
which(hu_pp$b_cat>=0) -> i.hup
hu_pp[i.hup,] -> hup

netown(hup, hup.m) -> hup.m
netgap(hup, hup.g) -> hup.g

rep('hup', dim(hup.m)[1]) -> hup.mname
rep('hup', dim(hup.g)[1]) -> hup.gname

cbind(hup.mname, hup.m) -> hup.own
names(hup.own) <- c('net', 'own', 'area')

cbind(hup.gname, hup.g) -> hup.gap
names(hup.gap) <- c('net', 'gap', 'area')

hup.own
hup.gap

# huach_padpem
read.dbf('C:/Users/u4cnnwrf/Documents/gis/huach_padpem.dbf') -> hu_ppem
which(hu_ppem$b_cat>=0) -> i.hupem
hu_ppem[i.hupem,] -> hupem

netown(hupem, hupem.m) -> hupem.m
netgap(hupem, hupem.g) -> hupem.g

rep('hupem', dim(hupem.m)[1]) -> hupem.mname
rep('hupem', dim(hupem.g)[1]) -> hupem.gname

cbind(hupem.mname, hupem.m) -> hupem.own
names(hupem.own) <- c('net', 'own', 'area')

cbind(hupem.gname, hupem.g) -> hupem.gap
names(hupem.gap) <- c('net', 'gap', 'area')

hupem.own
hupem.gap

# huach_spike
read.dbf('C:/Users/u4cnnwrf/Documents/gis/huach_padspike.dbf') -> hu_pspike
which(hu_pspike$b_cat>=0) -> i.hspike
hu_pspike[i.hspike,] -> hspike

netown(hspike, hspike.m) -> hspike.m
netgap(hspike, hspike.g) -> hspike.g

rep('hspike', dim(hspike.m)[1]) -> hspike.mname
rep('hspike', dim(hspike.g)[1]) -> hspike.gname

cbind(hspike.mname, hspike.m) -> hspike.own
names(hspike.own) <- c('net', 'own', 'area')

cbind(hspike.gname, hspike.g) -> hspike.gap
names(hspike.gap) <- c('net', 'gap', 'area')

hspike.own
hspike.gap

# huach_padswfl
read.dbf('C:/Users/u4cnnwrf/Documents/gis/huach_padswfl.dbf') -> hu_pswfl
which(hu_pswfl$b_cat>=0) -> i.hswfl
hu_pswfl[i.hswfl,] -> hswfl

netown(hswfl, hswfl.m) -> hswfl.m
netgap(hswfl, hswfl.g) -> hswfl.g

rep('hswfl', dim(hswfl.m)[1]) -> hswfl.mname
rep('hswfl', dim(hswfl.g)[1]) -> hswfl.gname

cbind(hswfl.mname, hswfl.m) -> hswfl.own
names(hswfl.own) <- c('net', 'own', 'area')

cbind(hswfl.gname, hswfl.g) -> hswfl.gap
names(hswfl.gap) <- c('net', 'gap', 'area')

hswfl.own
hswfl.gap

# huach_padtig
read.dbf('C:/Users/u4cnnwrf/Documents/gis/huach_padtig.dbf') -> hu_ptig
which(hu_ptig$b_cat>=0) -> i.htig
hu_ptig[i.htig,] -> htig

netown(htig, htig.m) -> htig.m
netgap(htig, htig.g) -> htig.g

rep('htig', dim(htig.m)[1]) -> htig.mname
rep('htig', dim(htig.g)[1]) -> htig.gname

cbind(htig.mname, htig.m) -> htig.own
names(htig.own) <- c('net', 'own', 'area')

cbind(htig.gname, htig.g) -> htig.gap
names(htig.gap) <- c('net', 'gap', 'area')

htig.own
htig.gap

# huach_padumb
read.dbf('C:/Users/u4cnnwrf/Documents/gis/huach_padumb.dbf') -> hu_pumb
which(hu_pumb$b_cat>=0) -> i.humb
hu_pumb[i.humb,] -> humb

netown(humb, humb.m) -> humb.m
netgap(humb, humb.g) -> humb.g

rep('humb', dim(humb.m)[1]) -> humb.mname
rep('humb', dim(humb.g)[1]) -> humb.gname

cbind(humb.mname, humb.m) -> humb.own
names(humb.own) <- c('net', 'own', 'area')

cbind(humb.gname, humb.g) -> humb.gap
names(humb.gap) <- c('net', 'gap', 'area')

humb.own
humb.gap

# jblmcr_howel
read.dbf('F:/report_data/arcgis_data/jblmcr_padhowel.dbf') -> jb_phow
str(jb_phow)
which(jb_phow$FID_jblm_1>=0) -> i.how ##
jb_phow[i.how,] -> jhow

netown(jhow, jhow.m) -> jhow.m
netgap(jhow, jhow.g) -> jhow.g

rep('jhow', dim(jhow.m)[1]) -> jhow.mname
rep('jhow', dim(jhow.g)[1]) -> jhow.gname

cbind(jhow.mname, jhow.m) -> jhow.own
names(jhow.own) <- c('net', 'own', 'area')

cbind(jhow.gname, jhow.g) -> jhow.gap
names(jhow.gap) <- c('net', 'gap', 'area')

jhow.own
jhow.gap

# jblmcr_orsf
read.dbf('F:/report_data/arcgis_data/jblmcr_padorsf.dbf') -> jb_porsf
str(jb_porsf)
which(jb_porsf$b_cat>=0) -> i.jfrog ##
jb_porsf[i.jfrog,] -> jfrog

netown(jfrog, jfrog.m) -> jfrog.m
netgap(jfrog, jfrog.g) -> jfrog.g

rep('jfrog', dim(jfrog.m)[1]) -> jfrog.mname
rep('jfrog', dim(jfrog.g)[1]) -> jfrog.gname

cbind(jfrog.mname, jfrog.m) -> jfrog.own
names(jfrog.own) <- c('net', 'own', 'area')

cbind(jfrog.gname, jfrog.g) -> jfrog.gap
names(jfrog.gap) <- c('net', 'gap', 'area')

jfrog.own
jfrog.gap

# jblmcr_padsalmon
read.dbf('F:/report_data/arcgis_data/jblmcr_padsalmon.dbf') -> jb_psalm
str(jb_psalm)
which(jb_psalm$FID_jblm_1>=0) -> i.jsal ##
jb_psalm[i.jsal,] -> jsalm

netown(jsalm, jsalm.m) -> jsalm.m
netgap(jsalm, jsalm.g) -> jsalm.g

rep('jsalm', dim(jsalm.m)[1]) -> jsalm.mname
rep('jsalm', dim(jsalm.g)[1]) -> jsalm.gname

cbind(jsalm.mname, jsalm.m) -> jsalm.own
names(jsalm.own) <- c('net', 'own', 'area')

cbind(jsalm.gname, jsalm.g) -> jsalm.gap
names(jsalm.gap) <- c('net', 'gap', 'area')

jsalm.own
jsalm.gap

# jblmcr_padtrout
read.dbf('F:/report_data/arcgis_data/jblmcr_padtrout.dbf') -> jb_ptrout
str(jb_ptrout)
which(jb_ptrout$FID_jblm_1>=0) -> i.jtr ##
jb_ptrout[i.jtr,] -> jtrou

netown(jtrou, jtrou.m) -> jtrou.m
netgap(jtrou, jtrou.g) -> jtrou.g

rep('jtrou', dim(jtrou.m)[1]) -> jtrou.mname
rep('jtrou', dim(jtrou.g)[1]) -> jtrou.gname

cbind(jtrou.mname, jtrou.m) -> jtrou.own
names(jtrou.own) <- c('net', 'own', 'area')

cbind(jtrou.gname, jtrou.g) -> jtrou.gap
names(jtrou.gap) <- c('net', 'gap', 'area')

jtrou.own
jtrou.gap

# mccoy_padmass
read.dbf('F:/report_data/arcgis_data/mccoy_padmass.dbf') -> mc_pmas
str(mc_pmas)
which(mc_pmas$FID_mccoy1>=0) -> i.mpm ##
mc_pmas[i.mpm,] -> mcmas

netown(mcmas, mcmas.m) -> mcmas.m
netgap(mcmas, mcmas.g) -> mcmas.g

rep('mcmas', dim(mcmas.m)[1]) -> mcmas.mname
rep('mcmas', dim(mcmas.g)[1]) -> mcmas.gname

cbind(mcmas.mname, mcmas.m) -> mcmas.own
names(mcmas.own) <- c('net', 'own', 'area')

cbind(mcmas.gname, mcmas.g) -> mcmas.gap
names(mcmas.gap) <- c('net', 'gap', 'area')

mcmas.own
mcmas.gap

# mta_padmass
read.dbf('F:/report_data/arcgis_data/mta_padmass.dbf') -> mt_pmas
str(mt_pmas)
which(mt_pmas$FID_mta_nw>=0) -> i.mtm ##
mt_pmas[i.mtm,] -> mtma

netown(mtma, mtma.m) -> mtma.m
netgap(mtma, mtma.g) -> mtma.g

rep('mtma', dim(mtma.m)[1]) -> mtma.mname
rep('mtma', dim(mtma.g)[1]) -> mtma.gname

cbind(mtma.mname, mtma.m) -> mtma.own
names(mtma.own) <- c('net', 'own', 'area')

cbind(mtma.gname, mtma.g) -> mtma.gap
names(mtma.gap) <- c('net', 'gap', 'area')

mtma.own
mtma.gap

# prfta_padcats
read.dbf('F:/report_data/arcgis_data/prfta_padcats.dbf') -> pr_pcat
str(pr_pcat)
which(pr_pcat$FID_prfta1>=0) -> i.ppc ##
pr_pcat[i.ppc,] -> pcat

netown(pcat, pcat.m) -> pcat.m
netgap(pcat, pcat.g) -> pcat.g

rep('pcat', dim(pcat.m)[1]) -> pcat.mname
rep('pcat', dim(pcat.g)[1]) -> pcat.gname

cbind(pcat.mname, pcat.m) -> pcat.own
names(pcat.own) <- c('net', 'own', 'area')

cbind(pcat.gname, pcat.g) -> pcat.gap
names(pcat.gap) <- c('net', 'gap', 'area')

pcat.own
pcat.gap

# prfta_padcrlf
read.dbf('F:/report_data/arcgis_data/prfta_padcrlf.dbf') -> pr_pf
str(pr_pf)
which(pr_pf$FID_prfta1>=0) -> i.ppf ##
pr_pf[i.ppf,] -> pfrog

netown(pfrog, pfrog.m) -> pfrog.m
netgap(pfrog, pfrog.g) -> pfrog.g

rep('pfrog', dim(pfrog.m)[1]) -> pfrog.mname
rep('pfrog', dim(pfrog.g)[1]) -> pfrog.gname

cbind(pfrog.mname, pfrog.m) -> pfrog.own
names(pfrog.own) <- c('net', 'own', 'area')

cbind(pfrog.gname, pfrog.g) -> pfrog.gap
names(pfrog.gap) <- c('net', 'gap', 'area')

pfrog.own
pfrog.gap

# shel_paddart
read.dbf('F:/report_data/arcgis_data/shel_paddart.dbf') -> sh_pdart
str(sh_pdart)
which(sh_pdart$FID_shel_d>=0) -> i.sd ##
sh_pdart[i.sd,] -> sdart

netown(sdart, sdart.m) -> sdart.m
netgap(sdart, sdart.g) -> sdart.g

rep('sdart', dim(sdart.m)[1]) -> sdart.mname
rep('sdart', dim(sdart.g)[1]) -> sdart.gname

cbind(sdart.mname, sdart.m) -> sdart.own
names(sdart.own) <- c('net', 'own', 'area')

cbind(sdart.gname, sdart.g) -> sdart.gap
names(sdart.gap) <- c('net', 'gap', 'area')

sdart.own
sdart.gap

# shel_padquil
read.dbf('F:/report_data/arcgis_data/shel_padquil.dbf') -> sh_pquil
str(sh_pquil)
which(sh_pquil$FID_shel_q>=0) -> i.squ ##
sh_pquil[i.squ,] -> squi

netown(squi, squi.m) -> squi.m
netgap(squi, squi.g) -> squi.g

rep('squi', dim(squi.m)[1]) -> squi.mname
rep('squi', dim(squi.g)[1]) -> squi.gname

cbind(squi.mname, squi.m) -> squi.own
names(squi.own) <- c('net', 'own', 'area')

cbind(squi.gname, squi.g) -> squi.gap
names(squi.gap) <- c('net', 'gap', 'area')

squi.own
squi.gap

#######################################################################
# FIXING NA'S & WRITING OUTPUT FILE
#######################################################################
# use find& replace for efficiency
# write out data
write.csv(brho.own, './data/net_own/brho_own.csv', row.names=FALSE)
write.csv(brpm.own, './data/net_own/brpm_own.csv', row.names=FALSE)
write.csv(bswf.own, './data/net_own/bswf_own.csv', row.names=FALSE)
write.csv(cmass.own, './data/net_own/cmass_own.csv', row.names=FALSE)
write.csv(crabe.own, './data/net_own/crabe_own.csv', row.names=FALSE)
write.csv(csnuf.own, './data/net_own/csnuf_own.csv', row.names=FALSE)
write.csv(ffs.own, './data/net_own/ffs_own.csv', row.names=FALSE)
write.csv(flance.own, './data/net_own/flance_own.csv', row.names=FALSE)
write.csv(fpink.own, './data/net_own/fpink_own.csv', row.names=FALSE)
write.csv(fpipl.own, './data/net_own/fpipl_own.csv', row.names=FALSE)
write.csv(frll.own, './data/net_own/frll_own.csv', row.names=FALSE)
write.csv(frlog.own, './data/net_own/frlog_own.csv', row.names=FALSE)
write.csv(fsfs.own, './data/net_own/fsfs_own.csv', row.names=FALSE)
write.csv(fspec.own, './data/net_own/fspec_own.csv', row.names=FALSE)
write.csv(fst.own, './data/net_own/fst_own.csv', row.names=FALSE)
write.csv(ftosh.own, './data/net_own/ftosh_own.csv', row.names=FALSE)
write.csv(ggrod.own, './data/net_own/ggrod_own.csv', row.names=FALSE)
write.csv(gjrll.own, './data/net_own/gjrll_own.csv', row.names=FALSE)
write.csv(gmas.own, './data/net_own/gmas_own.csv', row.names=FALSE)
write.csv(hcats.own, './data/net_own/hcats_own.csv', row.names=FALSE)
write.csv(hfrog.own, './data/net_own/hfrog_own.csv', row.names=FALSE)
write.csv(hshrimp.own, './data/net_own/hshrimp_own.csv', row.names=FALSE)
write.csv(hspike.own, './data/net_own/hspike_own.csv', row.names=FALSE)
write.csv(hsteel.own, './data/net_own/hsteel_own.csv', row.names=FALSE)
write.csv(hswfl.own, './data/net_own/hswfl_own.csv', row.names=FALSE)
write.csv(htig.own, './data/net_own/htig_own.csv', row.names=FALSE)
write.csv(htoad.own, './data/net_own/htoad_own.csv', row.names=FALSE)
write.csv(huchub.own, './data/net_own/huchub_own.csv', row.names=FALSE)
write.csv(humb.own, './data/net_own/humb_own.csv', row.names=FALSE)
write.csv(hup.own, './data/net_own/hup_own.csv', row.names=FALSE)
write.csv(hupem.own, './data/net_own/hupem_own.csv', row.names=FALSE)
write.csv(hvir.own, './data/net_own/hvir_own.csv', row.names=FALSE)
write.csv(jfrog.own, './data/net_own/jfrog_own.csv', row.names=FALSE)
write.csv(jhow.own, './data/net_own/jhow_own.csv', row.names=FALSE)
write.csv(jsalm.own, './data/net_own/jsalm_own.csv', row.names=FALSE)
write.csv(jtrou.own, './data/net_own/jtrou_own.csv', row.names=FALSE)
write.csv(mcmas.own, './data/net_own/mcmas_own.csv', row.names=FALSE)
write.csv(mtma.own, './data/net_own/mtma_own.csv', row.names=FALSE)
write.csv(pcat.own, './data/net_own/pcat_own.csv', row.names=FALSE)
write.csv(pfrog.own, './data/net_own/pfrog_own.csv', row.names=FALSE)
write.csv(squi.own, './data/net_own/squi_own.csv', row.names=FALSE)
write.csv(sdart.own, './data/net_own/sdart_own.csv', row.names=FALSE)



# read in data - it got the NA's replaced with 0's
read.csv('./data/net_own/brho_own.csv', header=TRUE) -> brho_own
read.csv('./data/net_own/brpm_own.csv', header=TRUE) -> brpm_own
read.csv('./data/net_own/bswf_own.csv', header=TRUE) ->bswf_own
read.csv('./data/net_own/cmass_own.csv', header=TRUE) ->cmass_own
read.csv('./data/net_own/crabe_own.csv', header=TRUE) ->crabe_own
read.csv('./data/net_own/csnuf_own.csv', header=TRUE)->csnuf_own
read.csv('./data/net_own/ffs_own.csv', header=TRUE)->ffs_own
read.csv('./data/net_own/flance_own.csv', header=TRUE)->flance_own
read.csv('./data/net_own/fpink_own.csv', header=TRUE)->fpink_own
read.csv('./data/net_own/fpipl_own.csv', header=TRUE)->fpipl_own
read.csv('./data/net_own/frll_own.csv', header=TRUE)->frll_own
read.csv('./data/net_own/frlog_own.csv', header=TRUE)->frlog_own
read.csv('./data/net_own/fsfs_own.csv', header=TRUE)->fsfs_own
read.csv('./data/net_own/fspec_own.csv', header=TRUE)->fspec_own
read.csv('./data/net_own/fst_own.csv', header=TRUE)->fst_own
read.csv('./data/net_own/ftosh_own.csv', header=TRUE)->ftosh_own
read.csv('./data/net_own/ggrod_own.csv', header=TRUE)->ggrod_own
read.csv('./data/net_own/gjrll_own.csv', header=TRUE)->gjrll_own
read.csv('./data/net_own/gmas_own.csv', header=TRUE)->gmas_own
read.csv('./data/net_own/hcats_own.csv', header=TRUE)->hcats_own
read.csv('./data/net_own/hfrog_own.csv', header=TRUE)->hfrog_own
read.csv('./data/net_own/hshrimp_own.csv', header=TRUE)->hshrimp_own
read.csv('./data/net_own/hspike_own.csv', header=TRUE)->hspike_own
read.csv('./data/net_own/hsteel_own.csv', header=TRUE)->hsteel_own
read.csv('./data/net_own/hswfl_own.csv', header=TRUE)->hswfl_own
read.csv('./data/net_own/htig_own.csv', header=TRUE)->htig_own
read.csv('./data/net_own/htoad_own.csv', header=TRUE)->htoad_own
read.csv('./data/net_own/huchub_own.csv', header=TRUE)->huchub_own
read.csv('./data/net_own/humb_own.csv', header=TRUE)->humb_own
read.csv('./data/net_own/hup_own.csv', header=TRUE)->hup_own
read.csv('./data/net_own/hupem_own.csv', header=TRUE)->hupem_own
read.csv('./data/net_own/hvir_own.csv', header=TRUE)->hvir_own
read.csv('./data/net_own/jfrog_own.csv', header=TRUE)->jfrog_own
read.csv('./data/net_own/jhow_own.csv', header=TRUE)->jhow_own
read.csv('./data/net_own/jsalm_own.csv', header=TRUE)->jsalm_own
read.csv('./data/net_own/jtrou_own.csv', header=TRUE)->jtrou_own
read.csv('./data/net_own/mcmas_own.csv', header=TRUE)->mcmas_own
read.csv('./data/net_own/mtma_own.csv', header=TRUE)->mtma_own
read.csv('./data/net_own/pcat_own.csv', header=TRUE)->pcat_own
read.csv('./data/net_own/pfrog_own.csv', header=TRUE)->pfrog_own
read.csv('./data/net_own/squi_own.csv', header=TRUE)->squi_own
read.csv('./data/net_own/sdart_own.csv', header=TRUE)->sdart_own

# bundle data to cast
rbind(brho_own, brpm_own, bswf_own, cmass_own, crabe_own, csnuf_own, ffs_own, flance_own, fpink_own, fpipl_own, frll_own, frlog_own, fsfs_own, fspec_own, fst_own, 
      ftosh_own, ggrod_own, gjrll_own, gmas_own, hcats_own, hfrog_own, hshrimp_own, hspike_own, hsteel_own, hswfl_own, htig_own, htoad_own, huchub_own, humb_own, 
      hup_own, hupem_own, hvir_own, jfrog_own, jhow_own, jsalm_own, jtrou_own, mcmas_own, mtma_own, pcat_own, pfrog_own, sdart_own, squi_own) -> aq.net.own  
library(dplyr)
library(reshape)
cast(aq.net.own, net~own) -> cast.aq
cast.aq
# export to csv; replace NA's with 0's in Excel
write.csv(cast.aq, './data/aq_net_own.csv', row.names = FALSE)
