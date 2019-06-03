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
ttt<-c("kia","KIA", "kt", "LG", "NC", "SK" ,"넥센" ,"두산" ,"롯데" ,"삼성", "키움" ,"한화")
ten<-table(ttt[abab])
ten
