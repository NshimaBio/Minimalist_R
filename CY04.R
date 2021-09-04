#读写文件
#常见文件EXCEL、',', '\t', XML,JSON
#怎么安装软件包
#1.CRAN
install.packages('tidyverse'); install.packages('data.table')
#2.bioconduct
install.packages("BiocManager")
BiocManager::install("TCGAbiolinks")
#3.github
install.packages("devtools")
devtools::install_github("xjsun1221/tinyarray",upgrade = F)
#4.本地安装
#5.从rforge安装

library(tidyverse)

#tidyverse读取EXCEL
readxl::read_excel('input.xlsx')
readxl::read_xls()
readxl::read_xlsx()

#读写大文件 用data.table包
fread('df1.tsv',sep='\t')
fwrite(df1,'df1.tsv',sep='\t');fwrite(df1,'df1.tsv')

写入文件
write.table(df1,'df1.tsv',sep='\t')
write.csv(df1,'df1.tsv')

