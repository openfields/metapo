read.csv('C:/Users/u4cnnwrf/Documents/Regional Networks/own_score.csv') -> netscore
str(netscore)
boxplot(netscore$Percent.Public.Lands~as.factor(netscore$Score), ylab = "Percentage Public Lands", xlab = "Relative Network Conservation Value")
boxplot(netscore$Percent.Private.Conservation.Lands~as.factor(netscore$Score), ylab = "Percentage Private Conservation Lands", xlab = "Relative Network Conservation Value")
