# from https://www.r-bloggers.com/r-and-sqlite-part-1/

#load library
library(sqldf)

# check/set wd
getwd()
setwd("C:/Users/u4cnnwrf/Documents/Regional Networks/")

# create db
db <- dbConnect(SQLite(), dbname="test.sqlite")

# add data


