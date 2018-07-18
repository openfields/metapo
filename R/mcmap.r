mcmap <- function(dd, vname){
# libraries
require(rgrass7)
require(rARPACK)
  
# read data
readVECT(eval(vname[1])) -> vecdata 
# get coords
coordinates(vecdata) -> vecdata_pt
# calc dist, convert to matrix
dist(vecdata_pt) -> vecdata_dist
as.matrix(vecdata_dist) -> vecdata_d
# create area matrix
length(vecdata@data$area) -> v
tmp1 <- matrix(rep(vecdata@data$area,v), ncol=v, nrow=v, byrow=TRUE)
tmp2 <- matrix(rep(vecdata@data$area,v), ncol=v, nrow=v, byrow=FALSE)
tmp3 <- tmp1*tmp2
# discounting for distance & area
vecdata_d*(-1/dd) -> dm
exp(dm) -> m
m*tmp3 -> M.mat
# eig analysis
eigs_sym(M.mat, k=5, lower=TRUE) -> M.eig
M.eig$vectors[,1] -> lead.ev
lead.ev^2 * M.eig$values[1] -> patch
list(mc=M.eig$values[1], patch=patch, fid=vecdata@data[,1]) -> out
# return output
return(out)
}

# example
# dd <- 92000
# vname <- c("catmer_65r41_5") #, "catmer_65r43_5")
# system.time(mcmap(dd, vname) -> test1) # 16,384 patches, runs in 92 seconds
# vname <- c("catmer_65r43_5")
# system.time(mcmap(dd, vname) -> test2) # 1,609 patches, runs in 6 seconds

