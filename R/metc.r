metc <- function(dmat, alpha){
  # calculate metapopulation capacity
  # input: distance matrix, alpha
  # returns metapopulation capacity
  
  dmat*(-1/alpha) -> dmat2
  exp(dmat2) -> M.mat
  eigen(M.mat,symmetric = TRUE, only.values = FALSE) -> M.eig
  return(M.eig$values[1])
    
  
}

# M.eig$vectors[,1]->lead.ev
# lead.ev^2*M.eig$values[1] -> patch.im
