'fc_pad43' -> fo
dbReadTable(gcon, paste(fo)) -> t1
str(t1)

t1 %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> t1.own


maps <- c()

# fc_pad43
dbReadTable(gcon, "fc_pad43") -> fc_pad43
which(fc_pad43$b_cat>=1) -> incl.fcp43
fc_pad43[incl.fcp43,] -> fc_p43


table(fc_p43$a_Loc_Own)
which(fc_p43$a_Loc_Own=='Army') -> dod1
which(fc_p43$a_Loc_Own=='ARNG') -> dod2
DOD <- c(dod1,dod2)
table(fc_p43$a_Mang_Name)
fc_p43$a_Mang_Name[DOD] <- 'DOD'
table(fc_p43$a_Mang_Name)

fc_p43 %>%
  group_by(a_Mang_Name) %>%
  summarise(totarea = sum(subarea)) -> fc43.man

write.csv(fc43.man, "./data/fc43m.csv")



maps <- c('cm_pad414271', 'fc_p43', 'fc_pad41424390', 'fhctx_pad52', 'fhctx_pad41', 'figab_pad41424390', 'flwo_pad43', 'flwo_pad414390', 'flwo_pad41424390', 'fp_pad42', 'fp_pad41424390', 'fril_pad41424390', 'fs_pad95', 'fs_pad71', 'fs_pad42', 'fva_pad41', 'fva_pad41424390', 'fva_pad42', 'gorjac_pad42', 'gorjac_pad43', 'gorjac_pad41424390', 'gorjac_pad71', 'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

for(i in length(maps)){
  print(i)
  dbReadTable(gcon, paste(maps[i])) -> tmptab
  which(tmptab$b_cat>=1) -> inclt
  tmptab[inclt,] -> tt
  tt %>%
    group_by(a_Own_Name) %>%
    summarise(totarea=sum(subarea)) -> tt.o
  print(tt.o)
  print(i)
}


'cm_pad414271'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'cmp414271_m.csv', row.names = FALSE)

, 'fc_pad41424390', 'fhctx_pad52', 'fhctx_pad41', 'figab_pad41424390', 'flwo_pad43', 'flwo_pad414390', 'flwo_pad41424390', 'fp_pad42', 'fp_pad41424390', 'fril_pad41424390', 'fs_pad95', 'fs_pad71', 'fs_pad42', 'fva_pad41', 'fva_pad41424390', 'fva_pad42', 'gorjac_pad42', 'gorjac_pad43', 'gorjac_pad41424390', 'gorjac_pad71', 'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'fc_pad43'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'fc_p43_m.csv', row.names = FALSE)

'fhctx_pad52', 'fhctx_pad41', 'figab_pad41424390', 'flwo_pad43', 'flwo_pad414390', 'flwo_pad41424390', 'fp_pad42', 'fp_pad41424390', 'fril_pad41424390', 'fs_pad95', 'fs_pad71', 'fs_pad42', 'fva_pad41', 'fva_pad41424390', 'fva_pad42', 'gorjac_pad42', 'gorjac_pad43', 'gorjac_pad41424390', 'gorjac_pad71', 'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'fc_pad41424390'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'fc_p4142390_m.csv', row.names = FALSE)

'fhctx_pad52', 'fhctx_pad41', 'figab_pad41424390', 'flwo_pad43', 'flwo_pad414390', 'flwo_pad41424390', 'fp_pad42', 'fp_pad41424390', 'fril_pad41424390', 'fs_pad95', 'fs_pad71', 'fs_pad42', 'fva_pad41', 'fva_pad41424390', 'fva_pad42', 'gorjac_pad42', 'gorjac_pad43', 'gorjac_pad41424390', 'gorjac_pad71', 'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'fhctx_pad52'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'fhctx_p52_m.csv', row.names = FALSE)

'fhctx_pad41', 'figab_pad41424390', 'flwo_pad43', 'flwo_pad414390', 'flwo_pad41424390', 'fp_pad42', 'fp_pad41424390', 'fril_pad41424390', 'fs_pad95', 'fs_pad71', 'fs_pad42', 'fva_pad41', 'fva_pad41424390', 'fva_pad42', 'gorjac_pad42', 'gorjac_pad43', 'gorjac_pad41424390', 'gorjac_pad71', 'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'fhctx_pad41'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'fhctx_p41_m.csv', row.names = FALSE)

'figab_pad41424390', 'flwo_pad43', 'flwo_pad414390', 'flwo_pad41424390', 'fp_pad42', 'fp_pad41424390', 'fril_pad41424390', 'fs_pad95', 'fs_pad71', 'fs_pad42', 'fva_pad41', 'fva_pad41424390', 'fva_pad42', 'gorjac_pad42', 'gorjac_pad43', 'gorjac_pad41424390', 'gorjac_pad71', 'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'figab_pad41424390'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'figab_p41424390_m.csv', row.names = FALSE)

'flwo_pad43', 'flwo_pad414390', 'flwo_pad41424390', 'fp_pad42', 'fp_pad41424390', 'fril_pad41424390', 'fs_pad95', 'fs_pad71', 'fs_pad42', 'fva_pad41', 'fva_pad41424390', 'fva_pad42', 'gorjac_pad42', 'gorjac_pad43', 'gorjac_pad41424390', 'gorjac_pad71', 'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'flwo_pad43'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'flwo_p43_m.csv', row.names = FALSE)

'flwo_pad414390', 'flwo_pad41424390', 'fp_pad42', 'fp_pad41424390', 'fril_pad41424390', 'fs_pad95', 'fs_pad71', 'fs_pad42', 'fva_pad41', 'fva_pad41424390', 'fva_pad42', 'gorjac_pad42', 'gorjac_pad43', 'gorjac_pad41424390', 'gorjac_pad71', 'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'flwo_pad414390'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'flwo_p414390_m.csv', row.names = FALSE)

'flwo_pad41424390', 'fp_pad42', 'fp_pad41424390', 'fril_pad41424390', 'fs_pad95', 'fs_pad71', 'fs_pad42', 'fva_pad41', 'fva_pad41424390', 'fva_pad42', 'gorjac_pad42', 'gorjac_pad43', 'gorjac_pad41424390', 'gorjac_pad71', 'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'flwo_pad41424390'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'flwo_p41424390_m.csv', row.names = FALSE)


'fp_pad42', 'fp_pad41424390', 'fril_pad41424390', 'fs_pad95', 'fs_pad71', 'fs_pad42', 'fva_pad41', 'fva_pad41424390', 'fva_pad42', 'gorjac_pad42', 'gorjac_pad43', 'gorjac_pad41424390', 'gorjac_pad71', 'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'fp_pad42'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'fp_p42_m.csv', row.names = FALSE)

'fp_pad41424390', 'fril_pad41424390', 'fs_pad95', 'fs_pad71', 'fs_pad42', 'fva_pad41', 'fva_pad41424390', 'fva_pad42', 'gorjac_pad42', 'gorjac_pad43', 'gorjac_pad41424390', 'gorjac_pad71', 'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'fp_pad41424390'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'fp_p41424390_m.csv', row.names = FALSE)

'fril_pad41424390', 'fs_pad95', 'fs_pad71', 'fs_pad42', 'fva_pad41', 'fva_pad41424390', 'fva_pad42', 'gorjac_pad42', 'gorjac_pad43', 'gorjac_pad41424390', 'gorjac_pad71', 'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'fril_pad41424390'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'fril_p41424390_m.csv', row.names = FALSE)

'fs_pad95', 'fs_pad71', 'fs_pad42', 'fva_pad41', 'fva_pad41424390', 'fva_pad42', 'gorjac_pad42', 'gorjac_pad43', 'gorjac_pad41424390', 'gorjac_pad71', 'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'fs_pad95'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'fs_p95_m.csv', row.names = FALSE)

'fs_pad71', 'fs_pad42', 'fva_pad41', 'fva_pad41424390', 'fva_pad42', 'gorjac_pad42', 'gorjac_pad43', 'gorjac_pad41424390', 'gorjac_pad71', 'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'fs_pad71'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'fs_p71_m.csv', row.names = FALSE)

'fs_pad42', 'fva_pad41', 'fva_pad41424390', 'fva_pad42', 'gorjac_pad42', 'gorjac_pad43', 'gorjac_pad41424390', 'gorjac_pad71', 'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'fs_pad42'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'fs_p42_m.csv', row.names = FALSE)

'fva_pad41', 'fva_pad41424390', 'fva_pad42', 'gorjac_pad42', 'gorjac_pad43', 'gorjac_pad41424390', 'gorjac_pad71', 'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'fva_pad41'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'fva_p41_m.csv', row.names = FALSE)

'fva_pad41424390', 'fva_pad42', 'gorjac_pad42', 'gorjac_pad43', 'gorjac_pad41424390', 'gorjac_pad71', 'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'fva_pad41424390'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'fva_p41424390_m.csv', row.names = FALSE)

'fva_pad42', 'gorjac_pad42', 'gorjac_pad43', 'gorjac_pad41424390', 'gorjac_pad71', 'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'fva_pad42'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'fva_p42_m.csv', row.names = FALSE)

'gorjac_pad42', 'gorjac_pad43', 'gorjac_pad41424390', 'gorjac_pad71', 'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'gorjac_pad42'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'gorjac_p42_m.csv', row.names = FALSE)

'gorjac_pad43', 'gorjac_pad41424390', 'gorjac_pad71', 'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'gorjac_pad43'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'gorjac_p43_m.csv', row.names = FALSE)

'gorjac_pad41424390', 'gorjac_pad71', 'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'gorjac_pad41424390'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'gorjac_p41424390_m.csv', row.names = FALSE)

'gorjac_pad71', 'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'gorjac_pad71'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'gorjac_p71_m.csv', row.names = FALSE)

'graf_pad41424390', 'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'graf_pad41424390'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'graf_p41424390_m.csv', row.names = FALSE)

'huach_pad71', 'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'huach_pad71'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'huach_p71_m.csv', row.names = FALSE)

'huach_pad43', 'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'huach_pad43'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'huach_p43_m.csv', row.names = FALSE)

'huach_pad42', 'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'huach_pad42'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'huach_p42_m.csv', row.names = FALSE)

'huach_pad41', 'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'huach_pad41'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'huach_p41_m.csv', row.names = FALSE)

'mccoy_pad43', 'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'mccoy_pad43'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'mccoy_p43_m.csv', row.names = FALSE)

'mccoy_pad41424390', 'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'mccoy_pad41424390'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'mccoy_p4142390_m.csv', row.names = FALSE)

'mccoy_pad71', 'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'mccoy_pad71'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'mccoy_p71_m.csv', row.names = FALSE)

'mta_pad71', 'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'mta_pad71'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'mta_p71_m.csv', row.names = FALSE)

'mta_pad41424390', 'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'mta_pad41424390'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'mta_p41424390_m.csv', row.names = FALSE)

'rave_pad41424390', 'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'rave_pad41424390'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'rave_p41424390_m.csv', row.names = FALSE)

'rip_pad42', 'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'rip_pad42'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'rip_p42_m.csv', row.names = FALSE)

'rip_pad41424390', 'shel_pad42', 'sill_pad52', 'west_pad41424390')

'rip_pad41424390'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'rip_p41424390_m.csv', row.names = FALSE)

'shel_pad42', 'sill_pad52', 'west_pad41424390')

'shel_pad42'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'shel_p42_m.csv', row.names = FALSE)

'sill_pad52', 'west_pad41424390')

'sill_pad52'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'sill_p52_m.csv', row.names = FALSE)

'west_pad41424390'

'west_pad41424390'-> maps
dbReadTable(gcon, paste(maps)) -> tmptab
which(tmptab$b_cat>=1) -> inclt
tmptab[inclt,] -> tt
tt %>%
  group_by(a_Own_Name) %>%
  summarise(totarea = sum(subarea)) -> tt.o
write.csv(tt.o, 'west_p41424390_m.csv', row.names = FALSE)
