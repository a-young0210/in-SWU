R기반 데이터 분석 입문 11주 => 데이터 가공

#데이터 파악하기
#데이터를 파악할 때 사용하는 함수들
#head() 데이터 앞부분 출력
#tail() 데이터 뒷부분 출력
#View() 뷰어창에서 데이터 확인
#dim() 데이터 차원 출력
#str() 데이터 속성 출력
#summary() 요약 통계량 출력
#ls() 변수 항목을 리스트로 출력



#mpg 데이터 파악하기=>실제 데이터를 불러와 데이터 특성을 파악해보자.
#ggplot2 패키지에 내장된 mpg 데이터 이용

install.packages("ggplot2")
library(ggplot2)
mpg

mpg<-as.data.frame(ggplot2::mpg) #ggplot2의 mpg 데이터를 데이터프레임 형태로 불러오기
View(mpg)
dim(mpg)
str(mpg)
summary(mpg)


###데이터 다루기
##데이터에 변수를 조합하거나 함수를 적용해 새 변수를 만들어 분석할 수 있다. 
##기존의 변수를 변형해 만든 변수를 '파생변수'라고 한다.

#2개의 변수로 구성된 데이터 프레임을 생성한다.
df<-data.frame(var1=c(4,3,8),var2=c(2,6,1))
df

#var1과 var2 변수의 값을 더한 var_sum 파생변수를 만들어 df에 추가한다.
df$var_sum<-df$var1+df$var2  #데이터 프레임명에 $를 붙여 새로운 변수명을 입력
df

#var_mean 파생변수를 만들어보자.
df$var_mean<-(df$var1+df$var2)/2
df


#ggplot2 패키지에 내장된 mpg 데이터 이용, 데이터가 234행, 11열로 구성됨. 하나의 행이 자동차 한종에 대한 정보임.

mpg
mpg2<-as.data.frame(ggplot2::mpg) #ggplot의 mpg 데이터를 데이터프레임 형태로 불러오기
mpg2
View(mpg2)

mpg2$total<-(mpg2$cty+mpg2$hwy)/2 #도시연비와 고속도로 연비를 더하고 2로 나눠 통합연비 변수 생성
head(mpg2)

mean(mpg2$total) #통합연비 변수의 평균

#함수를 활용해 파생변수 만들기
#mpg 데이터에서 전체 자동차 중에서 연비 기준을 충족해 '고연비 합격 판정'을 받은 자동차가 몇대나 되는지..
summary(mpg2)
summary(mpg2$total)
hist(mpg2$total) #히스토그램 생성, 히스토그램은 값의 빈도를 막대 길이로 표현한 그래프.

#히스토그램을 보면 tatal 연비의 평균과 중앙값이 약 20이다.
#tatal 연비가 20~25 사이에 해당하는 자동차 모델이 가장 많다.
#대부분 25이하이고 25를 넘기는 자동차는 많지 않다.

#요약 통계량과 히스토그램을 종합해 total 연비 변수가 20을 넘기면 합격, 
못하면 불합격으로 분류해보자.
#합격 판정 변수 만들기
ifelse(mpg2$total>=20,"pass","fail") 
mpg2$test<-ifelse(mpg2$total>=20,"pass","fail")
head(mpg2,20)
View(mpg2)

table(mpg2$test) #연비 합격 빈도표 생성, 빈도표는 변수의 각 값들이 몇 개씩 존재하는지 
개수를 나타낸 표.
qplot(mpg2$test) #연비 합격 빈도 막대 그래프 생성

#함수를 활용해 파생변수 만들기2
#A,B,C 세 종류의 연비 등급으로 분류하는 변수 만들기
#total이 30 이상이면 A, 20~29는 B, 20미만이면 C등급으로 분류
mpg2$grade<-ifelse(mpg2$total>=30,"A",ifelse(mpg2$total>=20,"B","C"))
head(mpg2,20)

table(mpg2$grade) #등급 빈도표 생성
qplot(mpg2$grade) #등급 빈도 막대 그래프 생성

#A,B,C,D 네 종류의 연비 등급으로 분류는 mpg2$grade2 변수를 만들어 보세요.
#total이 30 이상이면 A, 25 이상이면 B, 20이상이면 C등급으로, 나머지는 D등급으로 분류



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

#조건에 맞는 데이터만 추출
#1반 학생들의 데이터만 추출해보자.
install.packages("dplyr")
library(dplyr)

setwd("d://r1")
exam<-read.csv("csv_exam.csv")
exam

exam %>% filter(class==1)

#2반 학생들의 데이터만 추출해보자.


#1반이 아닌 경우 추출
exam %>% filter(class!=1)

#3반이 아닌 경우만 추출해보자.


#수학점수가 50점을 초과한 경우
exam %>% filter(math>50) 

#영어점수가 80점 이상인 경우를 추출해보자.


#여러 조건을 충족하는 행 추출하기
#1반이면서 수학 점수가 50점 이상인 경우
exam %>% filter(class==1 & math>=50)

#2반이면서 영어 점수가 80점 이상인 경우를 추출해보자.


#수학점수가 90점 이상이거나 영어점수가 90점 이상인 경우
exam %>% filter(math>=90 | english>=90)

#영어점수가 90점 미만이거나 과학점수가 50점 미만인 경우를 추출해보자.


#1,3,5반에 해당하면 추출
exam %>% filter(class==1 | class==3 | class==5)
exam %>% filter(class %in% c(1,3,5))

#추출한 행으로 데이터 만들기
class1<-exam %>% filter(class==1)
class2<-exam %>% filter(class==3)

mean(class1$math)
mean(class2$math)


#변수 추출하기
exam %>% select(math)

#english 변수를 추출해보자.
exam %>% select(english)

#여러 변수 추출하기
exam %>% select(class,math,english)

#변수 제외하기
exam %>% select(-math)
exam %>% select(-math,-english)

#dplyr 패키지 함수들은 %>%를 이용해 조합할 수 있다.
#filter()와 select() 조합하기
#class가 1인 행만 추출한 다음 english 추출
exam %>% filter(class==1) %>% select(english)
exam %>% select(id, math) %>% head
exam %>% select(id, math) %>% head(10)

#오름차순 정렬하기
exam %>% arrange(math)
exam %>% arrange(desc(math)) #내림차순 정렬
exam %>% arrange(class, math)

exam %>% arrange(desc(math)) %>% head(5) 


#파생변수 추가하기
#mutate함수는 데이터에 열을 추가할 때 사용한다.
#mutate(데이터, 추가할 열 이름=조건 1, ...)

#총합변수 추가 후 일부분 추출
exam<-exam %>% mutate(total = math + english + science) %>% head      


#여러 파생변수 한번에 추가하기, 총평균 변수 추가
exam %>% mutate(total=math+english+science, mean=(math+english+science)/3) %>% head

#mutate()에 ifelse() 적용하기
exam %>% mutate(test=ifelse(science>=60,"pass","fail")) %>% head


#총합 변수 추가 후 총합 변수 기준 정렬
exam %>% mutate(total = math + english + science) %>% arrange(desc(total)) %>% head

#summarise함수로 데이터 요약
#summarise함수는 통계 함수와 함께 사용하며 데이터를 요약할 때 사용한다.
#대표적 통계 함수에는 평균을 구하는 mean(), 중앙값 median(), 최소값 min()
 , 최대값 max(), 합계 sum()이 있다. n()개수
#summarise(데이터, 요약 결과 저장 열=통계함수)
exam %>% summarise(mean(math))

#group_by함수로 그룹별 요약
#단독으로 쓰이기보다는 다른 함수와 연계해서 사용된다.


#집단별로 요약하기, class별로 분리 후 math 평균 산출
exam %>% group_by(class) %>% summarise(mean_math=mean(math)) 

#여러 요약 통계량 한 번에 산출하기
exam %>% 
group_by(class) %>%     #class별로 분리
summarise(mean_math=mean(math),sum_math=sum(math),median_math=median(math),n=n()) #math 평균,합계,중앙값,학생수
#n() 빈도를 구하는 기능

#각 집단별로 다시 집단 나누기(mpg 데이터를 이용해 구해보자)
mpg %>%
group_by(manufacturer,drv) %>%     #회사별, 구동 방식별로 분리
summarise(mean_cty=mean(cty)) %>% head(10) #cty 평균 산출

#dplyr조합하기
##혼자해보기##
#회사별로 "suv"자동차의 도시 및 고속도로 통합 연비 평균을 구해 내림차순으로 정렬하고, 1~5위까지 출력하기



