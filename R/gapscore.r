gapscore <- function(gmat){
  # gapscore: calculates relative GAP status protection score for habitat networks according to these rules:
  # 1 - 4 points
  # 2 - 3 points
  # 3 - 2 points
  # 4 - 1 point
  # NA - 1 point (presumably private land)
  # input: matrix with column for gap status and column for total area (m^2)
  # processing: loop through rows, 
  #             calculate row score, 
  #             add to running score,
  #             relative score = total / total possible score
  # output: relative score

  
  which(gmat[,1]==1) -> p4 
  which(gmat[,1]==2) -> p3
  which(gmat[,1]==3) -> p2
  c(p4,p3,p2) -> ps
  gmat[-ps,] -> ones
  gmat[p4,2]*4+ gmat[p3,2]*3 + gmat[p2,2]*2 + sum(ones[,2])*1 -> tot
  tot/(sum(gmat[,2])*4) -> relscore
  return(relscore)
}

a <- c(1,2,3,4,NA)
b <- c(1,1,1,1,1)
cbind(a,b) -> gmat
gapscore(gmat)