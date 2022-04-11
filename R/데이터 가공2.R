R기반 데이터 분석 입문 12주 => 데이터 가공

###데이터 가공하기(데이터를 추출하거나 여러 데이터 합치기 등)
##주어진 데이터를 분석에 적합하게 데이터를 가공하는 작업을 '데이터 전처리'라고 한다.

##dplyr은 데이터 전처리에 가장 많이 사용되는 패키지이다.
#filter() 행추출
#select() 열(변수)추출
#arrange() 정렬
#mutate() 변수추가
#summarise() 통계치 산출
#group_by() 집단별로 나누기
#left_join() 데이터 합치기(열)
#bind_rows() 데이터 합치기(행)

install.packages("dplyr")
library(dplyr)

setwd("d://r1")
exam<-read.csv("csv_exam.csv")
exam


#dplyr조합하기
##혼자해보기##
#회사별로 "suv"자동차의 도시 및 고속도로 통합 연비 평균을 구해 내림차순으로 정렬하고, 1~5위까지 출력하기





#데이터합치기
#중간고사 데이터 생성
test1<-data.frame(id=c(1,2,3,4,5),midterm=c(60,80,70,90,85))
test1
#기말고사 데이터 생성
test2<-data.frame(id=c(1,2,3,4,5),final=c(70,83,65,95,80))
test2

total<-left_join(test1,test2,by="id") #id를 기준으로 total에 할당
total

#다른 데이터를 활용해 변수 추가하기
name<-data.frame(class=c(1,2,3,4,5),teacher=c("kim","lee","park","choi","jung"))
name

exam_new<-left_join(exam,name,by="class")
exam_new

#세로로 합치기
#학생 1~5번 시험 데이터 생성
group_a<-data.frame(id=c(1,2,3,4,5),test=c(60,80,70,90,85))
#학생 6~10번 시험 데이터 생성
group_b<-data.frame(id=c(6,7,8,9,10),test=c(70,83,65,95,80))

group_a
group_b

group_all<-bind_rows(group_a,group_b)
group_all




##데이터 정제
##결측치 정제하기
#결측치는(missing value)는 누락된 값, 비어 있는 값을 의미한다.
#결측치가 있으면 함수가 적용되지 않거나 분석 결과가 왜곡되는 문제가 발생한다.
#실제 데이터에는 결측치가 있는지 확인해 제거하는 과정을 거친 후 분석해야 한다.
df<-data.frame(sex=c("M","F",NA,"M","F"),score=c(5,4,3,4,NA))
df

#결측치 확인하기
is.na(df)

table(is.na(df)) #결측치 빈도 확인
table(is.na(df$sex))
table(is.na(df$score))

sum(df$score)
mean(df$score)

#결측치 제거하기
df %>% filter(is.na(score)) #score가 NA인 데이터만 출력
df %>% filter(!is.na(score)) #score 결측치 제거
df_nomiss<-df %>% filter(!is.na(score))
mean(df_nomiss$score)

#여러 변수 동시에 결측치 없는 데이터 추출
df_nomiss<-df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

#결측치가 하나라도 있으면 제거하기
#na.omit()를 이용하면 변수를 지정하지 않고 결측치가 한번에 제거됨.
df_nomiss2<-na.omit(df)
df_nomiss2

#함수의 결측치 제외 기능 사용하기
mean(df$score,na.rm=T)

exam<-read.csv("csv_exam.csv")
exam[c(3,8,15),"math"]<-NA
exam
exam %>% summarise(mean_math=mean(math))
exam %>% summarise(mean_math=mean(math,na.rm=T))

exam %>% summarise(mean_math=mean(math,na.rm=T),
	sum_math=sum(math,na.rm=T),
	median_math=median(math,na.rm=T)) #평균,합계,중앙값 산출

#결측치 대체하기
#평균값으로 결측치 대체하기
mean(exam$math,na.rm=T)

exam$math<-ifelse(is.na(exam$math),55,exam$math)
table(is.na(exam$math))
exam

#이상치 정제하기
#정상범주에서 크게 벗어난 값을 '이상치(outlier)'라고 한다. 이상치가 데이터에 포함되어 있으면 결과가 왜곡되기 때문에 이상치를 제거해야 한다.

outlier<-data.frame(sex=c(1,2,1,3,2,1),score=c(5,4,3,4,2,6))
outlier

table(outlier$sex)
table(outlier$score)
#sex가 3이면 NA 할당
outlier$sex<-ifelse(outlier$sex==3,NA,outlier$sex)
outlier
#score가 5보다 크면 NA 할당
outlier$score<-ifelse(outlier$score>5,NA,outlier$score)
outlier
#SEX,SCORE 변수 모두 이상치를 결측치로 변환했으니 결측치 제거하기
outlier %>% filter(!is.na(sex) & !is.na(score)) %>% 
            group_by(sex) %>% 
            summarise(mean_score=mean(score))