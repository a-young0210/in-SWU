install.packages("readxl")
library(readxl)

setwd("d://r1")

df2<-read_excel("Sample1.xlsx")
df2
View(df2)

str(df2)
dim(df2)
ls(df2)

df2$AMT<-df2$AMT16+df2$AMT17

df2$CNT<-df2$Y16_CNT+df2$Y17_CNT

df2$AGE50<-ifelse(df2$AGE>=50,"Y","N")

df2$AGE_GR<-ifelse(df2$AGE>=50,"50대",ifelse(df2$AGE>=40,"40대",ifelse(df2$AGE>=30,"30대"
,ifelse(df2$AGE>=20,"20대","20대미만"))))