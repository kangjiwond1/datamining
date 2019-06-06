
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
