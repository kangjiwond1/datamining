#10ȸ������ �̱�(�������(10ȸ) 8ȸ���� �������� 9ȸ������������� 10ȸ �̱�)

t<-c(0)
g<-c(0)
count<-1
gcount<-1
for(i in 1:60){
  a<-subset(x.11,x.11$����.1==i)
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
ttt<-c("kia","KIA", "kt", "LG", "NC", "SK" ,"�ؼ�" ,"�λ�" ,"�Ե�" ,"�Ｚ", "Ű��" ,"��ȭ")
ten<-table(ttt[abab])
ten
