copdat <- function(nam, r){
  out <- matrix(NA, nrow=length(nam), ncol=length(r))
  # read text files in [names], copy column 2 of [rows] to new object that is returned
  for(i in 1:length(nam)){  
    paste("~/Documents/grass/output/",nam[i],"_elev_s_parameters.csv", sep="") -> foo 
    read.table(paste(foo), header=FALSE, skip=2, sep=",") -> tmptab
    tmptab[,2] -> tmp  
    t.c <- as.character(tmp[r])
    out[i,] <- as.numeric(t.c)
  }
  return(out)
}

# nam
# copdat(nam, c(23,24,25,26,27,28,29,30,31,32)) -> st.st
# class(st.st)
# st.st <- as.data.frame(st.st)
# names(st.st) <- c("mag", "maxst", "tots", "totl", "freq1", "dd", "bif_r", "len_r", "ar_r", "sl_r")
# 
# cbind(mc.south, st.st)->mc.st
# is.na(mc.st$bif_r) -> di
# 
# mc.s <- mc.st[-13,]
# qplot(y=mc.s[,2], x=mc.s$len_r, col=mc.s$mag)
