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
    b<-a[1,]>a[2,] # T,F
    if((b[,10]!=b[,11])&&(a[1,11]-a[2,11])!=0){
      print(a)


    }
  }
}



#역전의 점수차(9회)
abc <- c()
count <- 1
for(i in 1:1431){
  a<-subset(x.8,x.8$순서==i)
  if(!is.na(a[2,11])){
    b<-a[1,]>a[2,]
    if((b[,10]!=b[,11])&&(a[1,11]-a[2,11])!=0){
      abc[count]=abs(a[1,11]-a[2,11])
      count<-count+1
    }
  }
}
length(abc)

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
abc=c(0)
count<-1

for(i in 1:60){
  a<-subset(x.11,x.11$순서.1==i)
  b<-a[1,]>a[2,]
  if(b[,10]!=b[,12]){
    abc[count]=abs(a[1,12]-a[2,12])
    count<-count+1
    #print(a)
  }
}
abc
write.csv(abc,"10.txt")

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



#11회경기만 추리기

x.12<-x.4[which(!is.na(x.4[,12])),]#11회 낫NA,12회도 포함된거
x.13<-x.12[which(is.na(x.12[,13])),]
dim(x.13)
순서.2<-rep(1:33,each=2,len=66)
x.14<-data.frame(순서.2,x.13)
x.14
#역전한 경기(11회)->8회에서 지던팀이 11회에서이김
for(i in 1:33){
  a<-subset(x.14,x.14$순서.2==i)
  b<-a[1,]>a[2,]
  if(b[,10]!=b[,13]){
    print(a)
  }
}
#11회 역전 경기 점수차(8회에서 지던팀이 11회에서 이김)
abc=c(0)
count<-1

for(i in 1:33){
  a<-subset(x.14,x.14$순서.2==i)
  b<-a[1,]>a[2,]
  if(b[,10]!=b[,13]){
   
    abc[count]=abs(a[1,13]-a[2,13])
    count<-count+1
    #print(a)
  }
}
write.csv(abc,"11.txt")

#12회경기만 추리기
x.15<-x.4[-which(is.na(x.4[,13])),]
x.15 #12회 NA아닌거(12회 노NA도 포함)
dim(x.15)

순서.3<-rep(1:62,each=2,len=124)
x.16<-data.frame(순서.3,x.15) #11회까지 경기가 있었던(순서 붙임)
dim(x.16)
x.16

순서.3

# 12회 역전 경기 점수 차
for(i in 1:62){
  a<-subset(x.16,x.16$순서.3==i)
  b<-a[1,]>a[2,]
  if(a[1,14]!=a[2,14]){
  if(b[,10]!=b[,14]){
    print(abs(a[1,14]-a[2,14])) # 절댓값으로 계산
  }
  }
}
subset(x.11,x.11$순서.1==9)
######################################

# 그래프 그림 7회

p<-subset(x.8,x.8$순서==331)
p.1<-as.numeric(p[1,3:11])
plot(p.1,type="b",ylim=c(-1,14),lwd="4",main="7회")
par(new=TRUE)
p.2<-as.numeric(p[2,3:11])
plot(p.2,type="b",col="red",ylim=c(-1,14),lwd="4")

# 그래프 그림 8회

p<-subset(x.8,x.8$순서==1403)
p.1<-as.numeric(p[1,3:11])
plot(p.1,type="b",ylim=c(-1,8),lwd="4",main="8회")
par(new=TRUE)
p.2<-as.numeric(p[2,3:11])
plot(p.2,type="b",col="red",ylim=c(-1,8),lwd="4")


# 그래프 그림_9회

p<-subset(x.8,x.8$순서==1105)
p.1<-as.numeric(p[1,3:11])
plot(p.1,type="b",ylim=c(-1,12),lwd="4")
par(new=TRUE)
p.2<-as.numeric(p[2,3:11])#삼성(패)
plot(p.2,type="b",col="red",ylim=c(-1,12),lwd="4",main="9회")



#그래프 그림_10회
s<-subset(x.11,x.11$순서.1==9)[1,3:12]
s
plot(as.numeric(s),type="b",main="10회",ylim=c(-1,10),xlim=c(1,10),lwd="4")
par(new=TRUE)
plot(as.numeric(subset(x.11,x.11$순서.1==9)[2,3:12]),type="b",col="red",lwd="4",ylim=c(-1,10),xlim=c(1,10))


#그래프 그림_11회
s<-subset(x.14,x.14$순서.2==4)[1,3:13]
s
plot(as.numeric(s),type="b",ylim=c(-1,8),main="11회",xlim=c(1,11),lwd="4")
par(new=TRUE)

plot(as.numeric(subset(x.14,x.14$순서.2==25)[2,3:13]),lwd="4",type="b",col="red",ylim=c(-1,8),xlim=c(1,11))


# 그래프 그림 12회
s<-subset(x.16,x.16$순서.3==61)[1,3:14]
s
plot(as.numeric(s),type="b",main="12회",ylim=c(-1,9),xlim=c(1,13),lwd="4")
par(new=TRUE)

plot(as.numeric(subset(x.16,x.16$순서.3==61)[2,3:14]),lwd="4",type="b",col="red",ylim=c(-1,9),xlim=c(1,13))


###################################3
##티테스트
s<-read.csv(file.choose(),header = T)#역전 합산
mean(s[,1])
t.test(s,mu=2)

####역전평균 막대그래프
a_7<-read.csv(file.choose(),header = T)#7회
a_8<-read.csv(file.choose(),header = T)#8회
mean(a_7[,1])#7회
mean(a_8[,1])#8회

d.9 <- read.csv(file.choose(),header=T)
mean(d.9[,1])#9회
#10회
d.10 <- read.csv(file.choose(),header=T)
mean(d.10[,1])
s.1<-read.csv(file.choose(),header=T)#11회
mean(s.1[,1])
s.2<-read.csv(file.choose(),header=T)#12회
mean(s.2[,1])
c<-rep(7:12)
plot(c,c(mean(a_7[,1]),mean(a_8[,1]),mean(d.9[,1]),mean(d.10[,1]),mean(s.1[,1]),mean(s.2[,1])),type="h",ylab="평균",lwd="30",col="pink",ylim=c(1.6,2.7))


# 역전 팀 뽑기


#7회 역전팀 뽑기
t<-c(0)
g<-c(0)
count<-1
gcount<-1
for(i in 1:1431){
  a<-subset(x.8,x.8$순서==i)
  if(!is.na(a[2,11])){
    b<-a[1,]>a[2,]
    if(b[,8]!=b[,9]&b[,9]==b[,10]&b[,10]==b[,11]&b[,11]==TRUE){
      t[count]=a[1,2]
      count<-count+1
    }else if(b[,8]!=b[,9]&b[,9]==b[,10]&b[,10]==b[,11]&b[,11]==FALSE){
      g[gcount]=a[2,2]
      gcount<-gcount+1
    }
  }
}
abab<-c(t,g)
abab
ttt<-c("KIA", "kt", "LG", "NC", "SK" ,"넥센" ,"두산" ,"롯데" ,"삼성", "키움" ,"한화")
table(ttt[abab])

#8
t<-c(0)
g<-c(0)
count<-1
gcount<-1
for(i in 1:1431){
  a<-subset(x.8,x.8$순서==i)
  if(!is.na(a[2,11])){
    b<-a[1,]>a[2,]
    if(b[,9]!=b[,10]&b[,10]==b[,11]&b[,10]==TRUE){
      t[count]=a[1,2]
      count<-count+1
    }else if(b[,9]!=b[,10]&b[,10]==b[,11]&b[,10]==FALSE) {
      g[gcount]=a[2,2]
      gcount<-gcount+1
      
    }
  }
}
abab<-c(t,g)
abab
ttt<-c("KIA", "kt", "LG", "NC", "SK" ,"넥센" ,"두산" ,"롯데" ,"삼성", "키움" ,"한화")
table(ttt[abab])


# 역전 승을 거둔 팀 (9회)


aaa1 <- c()
aaa2 <- c()
cnt1 <- 1
cnt2 <- 1
for(i in 1:1431){
  a<-subset(x.8,x.8$순서==i)
  if(!is.na(a[2,11])){
    b<-a[1,]>a[2,] #결과 _ T,F로 출력함
    if(b[,10]!=b[,11]){
      if(a[1,11]>a[2,11]){
        aaa1[cnt1] <- a[1,2]
        cnt1 <- cnt1 + 1
      } # 윗 행에 있는 팀이 이긴 경우
      
      else if(a[1,11]<a[2,11]){
        aaa2[cnt2] <- a[2,2]
        cnt2 <- cnt2 + 1
      }
    }
  }
}


length(aaa1)
length(aaa2)
aaa1
aaa2

aaa3 <- c(aaa1,aaa2)
length(aaa3)


ttt<-c("KIA", "kt", "LG", "NC", "SK" ,"넥센" ,"두산" ,"롯데" ,"삼성", "키움" ,"한화")
table(ttt[aaa3])

#10회역전팀 뽑기(역전경기(10회) 8회에서 지던팀이 9회에서동점만들고 10회 이김)

t<-c(0)
g<-c(0)
count<-1
gcount<-1
for(i in 1:60){
  a<-subset(x.11,x.11$순서.1==i)
  b<-a[1,]>a[2,]
  if(b[,10]!=b[,12]&b[,12]==TRUE){
    t[count]=a[1,2]
    count<-count+1
  }else if(b[,10]!=b[,12]&b[,12]==FALSE){
    g[gcount]=a[2,2]
    gcount<-gcount+1
  }
}
abab<-c(t,g)
abab
ttt<-c("KIA", "kt", "LG", "NC", "SK" ,"넥센" ,"두산" ,"롯데" ,"삼성", "키움" ,"한화")
table(ttt[abab])


#11회 역전팀뽑기
#역전한 경기(11회)->8회에서 지던팀이 11회에서이김

t<-c(0)
g<-c(0)
count<-1
gcount<-1
for(i in 1:33){
  a<-subset(x.14,x.14$순서.2==i)
  b<-a[1,]>a[2,]
  if(b[,10]!=b[,13]&b[,13]==TRUE){
    t[count]=a[1,2]
    count<-count+1
  }else if(b[,10]!=b[,13]&b[,13]==FALSE){
    g[gcount]=a[2,2]
    gcount<-gcount+1
  }
}
abab<-c(t,g)
abab
ttt<-c("KIA", "kt", "LG", "NC", "SK" ,"넥센" ,"두산" ,"롯데" ,"삼성", "키움" ,"한화")
table(ttt[abab])

#12회역전팀 뽑기

aaa1 <- c()
aaa2 <- c()
cnt1 <- 1
cnt2 <- 1



for(i in 1:62){
  a<-subset(x.16,x.16$순서.3==i)
  b<-a[1,]>a[2,]
  if(a[1,14]!=a[2,14]){
    if(b[,10]!=b[,14]){
      if(a[1,14]>a[2,14]){
        print(a[1,2])
        aaa1[cnt1] <- a[1,2]
        cnt1 <- cnt1 + 1
      }
      if(a[1,14]<a[2,14]){
        print(a[2,2])
        aaa2[cnt2] <- a[2,2]
        cnt2 <- cnt2 + 1
  }
    }
  }
}


aaa1
aaa2

aaa3 <- c(aaa1,aaa2)
length(aaa3)

ttt<-c("KIA", "kt", "LG", "NC", "SK" ,"넥센" ,"두산" ,"롯데" ,"삼성", "키움" ,"한화")
table(ttt[aaa3])

