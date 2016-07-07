makemat <- function(dtable, n_eles){
  # function to create distance matrix from data table and number of sites
  
  # create matrix
  matrix(-1, nrow=n_eles, ncol=n_eles) -> dmat
  
  # concatenate data and copy first row
  c(0,dtable[1:(n_eles-1),4]) -> dmat[1,]
  
  # get data for rows 2 - (nrow-2)
  for(i in 2:(n_eles-2)){
    which(dtable$from_cat==i) -> tmp # index of 607 elements
    dtable[tmp,4] -> dists # 607 pairwise distances
    dat <- c(dists[1:(i-1)],0,dists[i:(n_eles-1)]) 
    dmat[i,]<-dat
  }
  #penultimate row
  i <- i + 1
  which(dtable$from_cat==i) -> tmp
  dtable[tmp,4] -> dists
  dat <- c(dists[1:(n_eles-2)],0,dists[(n_eles-1)])
  dmat[i,] <- dat
  i <- i + 1
  # 
  # # final row
  which(dtable$from_cat==i) -> tmp
  dtable[tmp,4] -> dists
  dat <- c(dists,0)
  dmat[i,] <- dat

  return(dmat)
  
}
