#여기서 시작
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
dim(x.4)

#1.9회까지 경기 있는 것만 추려내기.(9회 까지 못온것 & 9회 초과한것 삭제)

which(x.4[,11]==FALSE)

x.5<-x.4[which(is.na(x.4)[,11]),] #10회는 NA인 값
dim(x.5)

순서<-rep(1:1431,each=2,len=2862)
x.8<-data.frame(순서,x.5)
dim(x.8)
x.8

#경기별로 뽑기(9회에서 끝남.(9회초에서 끝난건 제외.(역전못한거니까))
x.8
for(i in 1:1431){
  a<-subset(x.8,x.8$순서==i)
  if(!is.na(a[2,11])){
    print(a)
  }
}

#역전한 경기(9회)
for(i in 1:1431){
  a<-subset(x.8,x.8$순서==i)
  if(!is.na(a[2,11])){
    b<-a[1,]>a[2,]
    if(b[,10]!=b[,11]){
      #write.csv(a,file="9.csv",row.name=T)
      print(a)
    }
  }
}
setwd('C:/Users/한세미/Desktop')
abc=c(0)
count<-1
#역전의 점수차(9회)
for(i in 1:1431){
  a<-subset(x.8,x.8$순서==i)
  if(!is.na(a[2,11])){
    b<-a[1,]>a[2,]
    if(b[,10]!=b[,11]){
      abc[count]=abs(a[1,11]-a[2,11])
      count<-count+1
    }
  }
}
write.csv(abc,"9.txt")
abc
#8회에서 역전한 경기.
for(i in 1:1431){
  a<-subset(x.8,x.8$순서==i)
  if(!is.na(a[2,11])){
    b<-a[1,]>a[2,]
    if(b[,9]!=b[,10]&b[,10]==b[,11]){
      print(a)
    }
  }
}

abc=c(0)
count<-1
#8회에서 역전한 경기 점수차
for(i in 1:1431){
  a<-subset(x.8,x.8$순서==i)
  if(!is.na(a[2,11])){
    b<-a[1,]>a[2,]
    if(b[,9]!=b[,10]&b[,10]==b[,11]){

      abc[count]=abs(a[1,11]-a[2,11])
      count<-count+1
      
    }
  }
}
write.csv(abc,"8.txt")
abc
#7회에서 역전한 경기.
for(i in 1:1431){
  a<-subset(x.8,x.8$순서==i)
  if(!is.na(a[2,11])){
    b<-a[1,]>a[2,]
    if(b[,8]!=b[,9]&b[,9]==b[,10]&b[,10]==b[,11]){
      print(a)
    }
  }
}

abc=c(0)
count<-1

#7회에서 역전한 경기 점수차
for(i in 1:1431){
  a<-subset(x.8,x.8$순서==i)
  if(!is.na(a[2,11])){
    b<-a[1,]>a[2,]
    if(b[,8]!=b[,9]&b[,9]==b[,10]&b[,10]==b[,11]){
      abc[count]=abs(a[1,11]-a[2,11])
      count<-count+1
      
    }
  }
}
write.csv(abc,"7.txt")

#그래프 그림
s<-subset(x.8,x.8$순서==1027)[1,3:11]
s
plot(as.numeric(s),type="l",ylim=c(1,10))
par(new=TRUE)
plot(as.numeric(subset(x.8,x.8$순서==1027)[2,3:11]),type="l",col="blue",ylim=c(1,10))

#####해야할것.1.9회넘어가는 경기 (10,11,12) 추리기 2.추린거 다시 반복. 3.그래프 그리기 위해 평균구하기.


##10회 경기 추리기
x.9<-x.4[-which(is.na(x.4[,11])),]
x.9#10회 NA아닌거(11회,12회 노NA도 포함)


x.10<-x.9[which(is.na(x.9[,12])),]#10회까지 경기가 있었던것.
x.10
dim(x.10)

순서.1<-rep(1:60,each=2,len=120)
x.11<-data.frame(순서.1,x.10)#10회까지 경기가 있었던(순서 붙임)
dim(x.11)


#역전경기(10회) 8회에서 지던팀이 9회에서동점만들고 10회 이김

for(i in 1:60){
  a<-subset(x.11,x.11$순서.1==i)
  b<-a[1,]>a[2,]
  if(b[,10]!=b[,12]){
    print(a)
  }
}
#10회(8회에서 지던팀이9회에서 동점만들고 10회이김)역전 점수차

for(i in 1:60){
  a<-subset(x.11,x.11$순서.1==i)
  b<-a[1,]>a[2,]
  if(b[,10]!=b[,12]){
    print(abs(a[1,12]-a[2,12]))
  }
}

#역전의 점수(9회)
for(i in 1:1431){
  a<-subset(x.8,x.8$순서==i)
  if(!is.na(a[2,11])){
    b<-a[1,]>a[2,]
    if(b[,10]!=b[,11]){
      print(abs(a[1,11]-a[2,11]))
    }
  }
}


#11회경기만 추리기