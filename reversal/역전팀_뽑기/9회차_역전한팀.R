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
      
      if(a[1,11]<a[2,11]){
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
