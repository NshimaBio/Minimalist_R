#常用
dfA = fread("/Users/Saul/Documents/code/DataManipulation/ACC_TPM.gz")
head(dfA)
dfA[1:3,1:5]
conflict_prefer("filter",winner = "dplyr")
conflict_prefer("select",winner = "dplyr")
conflict_prefer("rename",winner = "dplyr")
#选择行
#filter 筛选出protein_coding的基因，gene_name不能为空
dfB = dfA %>% 
    filter(gene_type=="protein_coding",!is.na(gene_name))
#选择列select
#删除gene_id&gene_type列
dfC = dfB %>% 
    select(-gene_id,-gene_type)
#选择列select
#选择肿瘤样品 
"TCGA-OR-A5JD-01A-11R-A29S-07"
dfD = dfC %>% 
    select(gene_name,matches("^.{13}01A"))
#修改列名rename
#把改为symbol 并且把样品编号缩短至16位
dfE = dfD  %>% rename(symbol = gene_name) %>% 
    rename_with(.cols=-1, ~ str_sub(.x,1,16)) 
dfE[1:3,1:5]
#column_to_rownames
#把data.frame转matrix
mtA = dfE %>% column_to_rownames(var="symbol")

#把重复的基因取平均值,保留最大值
#mutate增加一列
#arrange列排序
#distinct列去重复
v_unique_exprs <- function(exprs,method='mean')
{
  exprs %>% 
  dplyr::mutate(ref=apply(across(where(is.numeric)),1,method)) %>%
  dplyr::arrange(desc(ref)) %>% #把表达量的平均值按从大到小排序
  dplyr::select(-ref) %>%  #反向选择去除这一列
  dplyr::distinct(symbol,.keep_all = T)
}

dfF = v_unique_exprs(dfE)
#把data.frame转matrix
mtA = dfF %>% column_to_rownames(var="symbol")
mtB = log2(mtA+1)

