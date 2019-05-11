a <- readLines(file.choose())
matrix(a)
for( i in 1:length(a)){
  i=2*i-1
  a=a[-c(i)]
}
a
write.table(a,file = "rowdelete.text")