x<-read.csv(file.choose(),header = T)
dim(x)
x.1<-x[,2:13]
x.1
dim(x.1)
x.2<-data.frame(t(x.1))
dim(x.2)
x.3<-t(cumsum(x.2))
dim(x.3)
x.3
x.4<-data.frame(x$팀명,x.3)
x.4<-x.4[-(2557:2558),]
x.4
dim(x.4)
x.12 <- x.4[,"X12"]

