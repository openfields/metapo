instmc <- function(dds, mnames, onames){
  # function to calculate metapopulation metrics for species on an installation
  # source mcmap, load rgrass7
  source("C:/Users/u4cnnwrf/Documents/Regional Networks/metapo/R/mcmap.r")
  require(rgrass7)

    for(i in 1:length(mnames)){
      # call mcmap
      #system.time(mcmap(dd=dds[i], vname=mnames[i]) -> paste(onames[i]))
      assign(onames[i], value=mcmapcsv(dd=dds[i], vname=mnames[i]), envir = .GlobalEnv)
    }

}

# dds <- c(10000, 22000)
# mnames <- c("fcpc_65r_71_5", "fcpc_65r_42_5")
# onames <- c("fcpc.fer", "fcpc.mso")
#
# dd <- 10000
# mname <- "fcpc_65r_42_5"
# oname <- "fcpc.mso"
#
# instmc(dds=dd, mnames=mname, onames=oname)
