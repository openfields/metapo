makemat <- function(dtable, n_eles){
  # function to create distance matrix from data table and number of sites
  
  # create matrix
  matrix(-1, nrow=n_eles, ncol=n_eles) -> dmat
  
  # concatenate data and copy first row
  c(0,pdata[1:(n_eles-1),4]) -> dmat[1,]
  
  # 
  
}