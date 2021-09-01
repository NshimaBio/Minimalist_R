#教女朋友学R语言之数据结构01
1. 一维数据
原子向量:各个值都是同类型的：logical、integer、double、character、complex、raw，其中 integer 和 double 也统称为 numeric；

Logical:TRUE ; FALSE ; lg <- c(TRUE,TRUE,FALSE)
Integer: i1 <- 1L ; i2 <- c(1,2,3,4)
Double: d1 <- 1.1	;	d2 <- c(1.1,1.35,13.4)
Character: ch1 <- 'hello' ; ch2 <- "hello, world!" ; ch3 <- c('a','b')

列表:各个值可以是不同类型的
list1 <- list('a',TRUE,1,1.1)
2. 二维数据
矩阵
m1 <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9,10), nrow = 2, byrow = FALSE)
数据框
df1 <-  data.frame(
  Name = c("Ken", "Ashley", "Jennifer"),
  Gender = c("Male", "Female", "Female"),
  Age = c(24, 25, 23),
  Major = c("Finance", "Statistics", "Computer Science"))

3.属性
3.1 类型
class(df1)
typeof(df1)
3.2 长度、维度
length(list1)
dim(df1)
4. 访问
4.1通过数字索引
ch3[2]
d2[c(1,3,4)]

list1[[1]]
m1[1,2]
m1[1]
m1[1,]
m1[,1]

df1[1,2]
df1[1]
df1[1,]
df1[,1]
4.2通过名字访问
先起名字,可以之后再加上名字
d2n <- c('one'=1.1,'two'=1.35,'three'=13.4)
names(d2) <- c('one','two','three')
d2
d2['one']
d2n['one']
names(list1)<-c('i','ii','iii','iv')
list1[['yi']]

colnames(m1) <- c('one','two','three')
rownames(m1) <- c('i','ii','iii')

colnames(df1)
rownames(df1) <- c('r1','r2','r3')
df1[,'Name']
df1[,c('Name','Age')]
df1$Name
df1['r1',]
df1[c('r1','r3'),]

