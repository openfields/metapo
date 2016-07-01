metc <- function(dmat, alpha){
  # calculate metapopulation capacity
  # input: distance matrix, alpha
  # returns metapopulation capacity
  
  dmat*(-1/alpha) -> dmat2
  exp(dmat2) -> M.mat
  eigen(M.mat,symmetric = TRUE, only.values = TRUE) -> M.eig
  return(max(M.eig$values))
  
  
}

