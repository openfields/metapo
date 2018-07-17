library(rgrass7)

dd <- 92000

vname <- c("catmer_65r41_5", "catmer_65r43_5")
#vname <- c("tmp1", "tmp2")

#get(vname[1])


#system.time(
system.time(readVECT(eval(vname[1])) -> catmer_65r41_5)
system.time(readVECT(eval(vname[2])) -> catmer_65r43_5)

# system.time(readVECT('catmer_65r41_5') -> catmer_65r41_5)
# system.time(readVECT('catmer_65r43_5')- > catmer_65r43_5)

system.time(coordinates(catmer_65r41_5) -> catmer_65r41_pt)
system.time(coordinates(catmer_65r43_5) -> catmer_65r43_pt)

system.time(dist(catmer_65r43_pt) -> catmer_65r43_dist)
system.time(as.matrix(catmer_65r43_dist) -> catmer_65r43_d)

length(catmer_65r43_5@data$area) -> v
system.time(tmp1 <- matrix(rep(catmer_65r43_5@data$area,v), ncol=v, nrow=v, byrow=TRUE))
system.time(tmp2 <- matrix(rep(catmer_65r43_5@data$area,v), ncol=v, nrow=v, byrow=FALSE))
system.time(tmp3 <- tmp1*tmp2)

library(rARPACK)
system.time(catmer_65r43_d*(-1/dd) -> dm)
system.time(exp(dm) -> m)
system.time(m*tmp3 -> M.mat)

system.time(eigs_sym(M.mat, k=5, lower=TRUE) -> M.eig)
system.time(M.eig$vectors[,1] -> lead.ev)
system.time(lead.ev^2 * M.eig$values[1] -> patch)
system.time(list(mc=M.eig$values[1], patch=patch) -> out)





source('C:/Users/u4cnnwrf/Documents/Regional Networks/metapo/R/mcarp.r')
system.time(mcarp(catmer_65r43_d, 92000) -> catmer_65r43_mc) # dist matrix, inverse of dispersal dist



