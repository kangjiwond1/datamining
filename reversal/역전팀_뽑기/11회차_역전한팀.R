#11ȸ �������̱�
#������ ���(11ȸ)->8ȸ���� �������� 11ȸ�����̱�

t<-c(0)
g<-c(0)
count<-1
gcount<-1
for(i in 1:33){
  a<-subset(x.14,x.14$����.2==i)
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
ttt<-c("kia","KIA", "kt", "LG", "NC", "SK" ,"�ؼ�" ,"�λ�" ,"�Ե�" ,"�Ｚ", "Ű��" ,"��ȭ")
eleven<-table(ttt[abab])
eleven
