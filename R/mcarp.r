metc <- function(dmat, alpha){
  # calculate metapopulation capacity
  # input: distance matrix, alpha
  # returns metapopulation capacity
  
  # require rARPACK
  library(rARPACK)
  
  dmat*(-1/alpha) -> dmat2
  exp(dmat2) -> M.mat
  
  eigs_sym(M.mat, k=5, lower=TRUE)
 # eigen(M.mat,symmetric = TRUE, only.values = FALSE) -> M.eig
  
  M.eig$vectors[,1]->lead.ev
  lead.ev^2*M.eig$values[1] -> patch
  return(list(mc=M.eig$values[1],patch=patch))
  
}

system.time(eigs_sym(a42e.d, k=5, lower=TRUE) -> foo)
system.time(eigen(a42e.d ,symmetric = TRUE, only.values = FALSE) -> M.eig)
