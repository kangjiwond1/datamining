aaa1 <- c()
aaa2 <- c()
cnt1 <- 1
cnt2 <- 1
for(i in 1:1431){
  a<-subset(x.8,x.8$����==i)
  if(!is.na(a[2,11])){
    b<-a[1,]>a[2,] #��� _ T,F�� �����
    if(b[,10]!=b[,11]){
      if(a[1,11]>a[2,11]){
        aaa1[cnt1] <- a[1,2]
        cnt1 <- cnt1 + 1
      } # �� �࿡ �ִ� ���� �̱� ���
      
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


ttt<-c("KIA", "kt", "LG", "NC", "SK" ,"�ؼ�" ,"�λ�" ,"�Ե�" ,"�Ｚ", "Ű��" ,"��ȭ")
table(ttt[aaa3])
