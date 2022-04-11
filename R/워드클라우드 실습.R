#### 텍스트 마이닝(Text mining)   

- 문자로 된 데이터에서 가치 있는 정보를 얻어 내는 분석 기법 
- SNS나 웹 사이트에 올라온 글을 분석해 사람들이 어떤 이야기를 나누고 있는지 파악할 때 활용 
- 형태소 분석(Morphology Analysis) : 문장을 구성하는 어절들이 어떤 품사로 되어 있는지 분석 


* 분석 절차 
+ 형태소 분석 
+ 명사, 동사 형용사 등 의미를 지닌 품사 단어 추출 
+ 빈도표 만들기 
+ 시각화 

#### 패키지 설치 및 로드 
# 패키지 설치 
install.packages("rJava") 
install.packages("memoise") 
install.packages("dplyr") 
install.packages("KoNLP") 
install.packages("wordcloud2")


library(memoise)
library(dplyr) 
library(KoNLP) 
library(wordcloud2)

extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다")

## 10-1. 애국가로 형태소 분석하기 
### 텍스트 마이닝 준비하기 

#### 사전 설정하기 
useSystemDic() #시스템 사전 설정
useSejongDic() #세종 사전 설정
useNIADic()  #NIADic 사전 설정

#텍스트 수집=>분해=>단어추출=>정제=>정형 데이터 생성=>분석=>시각화
setwd("c://r1")
word_data<-readLines("애국가(가사).txt")
word_data
View(word_data)
#명사만 추출하기
word_data2<-extractNoun(word_data)
word_data2

#행렬을 벡터로 변환하기
data<-unlist(word_data2)
View(data)

#사용빈도 확인하기
data_table<-table(data)
data_table

#데이터프레임으로 변환
data2<-as.data.frame(data_table,stringsAsFactors =F )
View(data2)
data2<-rename(data2,word=data,freq=Freq)

#두 글자 이상인 단어만 필터링하기
data2<-filter(data2,nchar(word)>=2)

View(data2)
 
#데이터 정렬하기
data3<-data2 %>%
  arrange(desc(freq))

data3

top_15<-data2 %>%
  arrange(desc(freq)) %>%
  head(15)

top_15

#워드 클라우드 만들기
wordcloud2(data3)

wordcloud2(top_15)

#배경 등 색삭 변경하기
wordcloud2(data3,color="random-light",backgroundColor ="black" )

#모양 변경하기
wordcloud2(data3,fontFamily = "맑은 고딕",size=1.2,color="random-light",
           backgroundColor ="black",shape="star")

####################################################
## 10-2. 힙합 가사 텍스트 마이닝 


#### 사전 설정하기 

useNIADic() 

#### 데이터 준비 
# 데이터 불러오기 
setwd("c:\\r1")
txt <- readLines("hiphop.txt") 
head(txt)
View(txt)

#### 특수문자 제거 
install.packages("stringr") 

library(stringr)

# 특수문제 제거 
txt <- str_replace_all(txt, "\\W", " ") 

### 가장 많이 사용된 단어 알아보기 
# 명사 추출하기 
extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다") 

# 가사에서 명사추출 
nouns <- extractNoun(txt) 
# 추출한 명사 list를 문자열 벡터로 변환, 단어별 빈도표 생성 
wordcount <- table(unlist(nouns)) 

#### 자주 사용된 단어 빈도표 만들기 
# 데이터 프레임으로 변환 
df_word <- as.data.frame(wordcount, stringsAsFactors = F)
View(df_word)

# 변수명 수정 
df_word <- rename(df_word, word = Var1, freq = Freq) 

# 두 글자 이상 단어 추출 
df_word <- filter(df_word, nchar(word) >= 2) 

top_20 <- df_word %>% 
  arrange(desc(freq)) %>% 
  head(20) 

top_20 

### 워드 클라우드 만들기 
#### 패키지 준비하기 
# 패키지 설치 
install.packages("wordcloud") 

# 패키지 로드 
library(wordcloud) 
library(RColorBrewer) 

### 워드 클라우드 만들기 
#### 단어 색상 목록 만들기 
pal <- brewer.pal(8,"Dark2")  # Dark2 색상 목록에서 8개 색상 추출 

#### 워드 클라우드 생성 
set.seed(1234)                   # 난수 고정 
wordcloud(words = df_word$word,  # 단어 
          freq = df_word$freq,   # 빈도 
          min.freq = 2,          # 최소 단어 빈도 
          max.words = 200,       # 표현 단어 수 
          random.order = F,      # 고빈도 단어 중앙 배치 
          rot.per = .1,          # 회전 단어 비율 
          scale = c(4, 0.3),     # 단어 크기 범위 
          colors = pal)          # 색깔 목록 


#### 단어 색상 바꾸기 
pal <- brewer.pal(9,"Blues")[5:9]  # 색상 목록 생성 
set.seed(1234)                     # 난수 고정 
wordcloud(words = df_word$word,    # 단어 
          freq = df_word$freq,     # 빈도 
          min.freq = 2,            # 최소 단어 빈도 
          max.words = 200,         # 표현 단어 수 
          random.order = F,        # 고빈도 단어 중앙 배치 
          rot.per = .1,            # 회전 단어 비율 
          scale = c(4, 0.3),       # 단어 크기 범위 
          colors = pal) 