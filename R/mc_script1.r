source('./R/metc.r')

library(shapefiles)
read.dbf('F:/Regional Networks/a42vd_2ha.dbf') -> a42e
cbind(a42e$dbf$x, a42e$dbf$y) -> cs
dist(cs, diag=FALSE, upper=TRUE) -> a42e.dists
as.matrix(a42e.dists)  -> a42e.d
system.time(metc(a42e.d, 1000) -> a42e.1k)

system.time(metc(a42e.d, 2000) -> a42e.2k)
system.time(metc(a42e.d, 3000) -> a42e.3k)
system.time(metc(a42e.d, 4000) -> a42e.4k)
system.time(metc(a42e.d, 5000) -> a42e.5k)

system.time(metc(a42e.d, 500) -> a42e.500)
system.time(metc(a42e.d, 100) -> a42e.100)


read.dbf('./gis/a42_pfo1c_pt.dbf') -> a42nwi
wcs <- cbind(a42nwi$dbf$x, a42nwi$dbf$y)
dist(wcs, diag=FALSE, upper=TRUE) -> nwi.dists
as.matrix(nwi.dists) -> nwi.d
system.time(metc(nwi.d, 1500))
