mcmapcsv <- function(dd, vname){
  # libraries
  require(rgrass7)
  require(rARPACK)
  
  # calc dist, convert to matrix
  vname[,1:2] -> vecdata_pt
  dist(vecdata_pt) -> vecdata_dist
  as.matrix(vecdata_dist) -> vecdata_d

    # create area matrix
  length(vname$area) -> v
  tmp1 <- matrix(rep(vname$area,v), ncol=v, nrow=v, byrow=TRUE)
  tmp2 <- matrix(rep(vname$area,v), ncol=v, nrow=v, byrow=FALSE)
  tmp3 <- tmp1*tmp2
  # discounting for distance & area
  vecdata_d*(-1/dd) -> dm
  exp(dm) -> m
  m*tmp3 -> M.mat
  # eig analysis
  eigs_sym(M.mat, k=5, lower=TRUE) -> M.eig
  M.eig$vectors[,1] -> lead.ev
  lead.ev^2 * M.eig$values[1] -> patch
  list(mc=M.eig$values[1], patch=patch, fid=vname$cat) -> out
  # return output
  return(out)
}