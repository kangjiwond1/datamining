#7ȸ ������ �̱�
t<-c(0)
g<-c(0)
count<-1
gcount<-1
for(i in 1:1431){
  a<-subset(x.8,x.8$����==i)
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
ttt<-c("kia","KIA", "kt", "LG", "NC", "SK" ,"�ؼ�" ,"�λ�" ,"�Ե�" ,"�Ｚ", "Ű��" ,"��ȭ")
seven<-table(ttt[abab])
