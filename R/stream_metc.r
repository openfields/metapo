# command to get data from sqlite to csv
# sqlite3 -header -csv ~/Documents/sqlite.db "select * from br_ap_1;" > out1.csv



read.csv("/home/will/out1.csv") -> pdata

# create matrix
matrix(-1, nrow=608, ncol=608) -> dmat

c(0,pdata[1:607,4]) -> dmat[1,]

for(i in 2:606){
  which(pdata$from_cat==i) -> tmp # index of 607 elements
  pdata[tmp,4] -> dists # 607 pairwise distances
  dat <- c(dists[1:(i-1)],0,dists[i:607]) 
  dmat[i,]<-dat
  
}

# when 607 and 608

i=607
if(i==607){
  which(pdata$from_cat==i) -> tmp
  pdata[tmp,4] -> dists
  dat <- c(dists[1:606],0,dists[607])
}
dmat[607,] <- dat

i = 608
if(i==608){
  which(pdata$from_cat==i) -> tmp
  pdata[tmp,4] -> dists
  dat <- c(dists,0)
}
dmat[608,] <- dat

dmat*(-1/1000) -> dmat2
exp(dmat2) -> M.mat
eigen(M.mat,symmetric = TRUE, only.values = TRUE) -> M.eig
max(M.eig$values)

# create figure
source('~/Documents/metapo/R/metc.r')

seq(100,8000,by=100) -> threshs
cbind(threshs,rep(NA,80))->thresh.mc
for(i in 1:80){
  thresh.mc[i,2] <- metc(dmat,thresh.mc[i,1])
}
