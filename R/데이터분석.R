#### 한국복지패널데이터 분석 ####
https://www.koweps.re.kr
#### 가구의 경제활동을 연구해 정책 지원에 반영할 목적으로 발간하는 조사자료이다. 
전국에서 7000여 가구를 선정해 조사한 자료로 경제활동, 생활실태, 복지욕구 등 다양한 변수를 담고 있다. 
이 데이터를 분석하면 대한민국 사람들이 어떻게 살아가는지 알 수 있다.####

## 데이터분석 준비하기 ##
install.packages("foreign")  # spss에서 작성된 파일을 불러올 수 있는 foreign 패키지 설치
library(foreign)             # foreign 패키지 로드
install.packages("dplyr")    # 전처리에 필요한 dplyr 패키지 설치
library(dplyr)               # dplyr 패키지 로드
install.packages("ggplot2")  # 시각화에 필요한 ggplot2 패키지 설치
library(ggplot2)             # ggplot2 패키지 로드
install.packages("readxl")   # 엑셀 파일을 불러올 수 있는 readxl 패키지 설치
library(readxl)              # readxl 패키지 로드

## 데이터 불러오기 ##
setwd("d:\\r1")
welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav")
str(welfare)
welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav",
                         to.data.frame = T)

# 복사본 만들기
welfare1 <- welfare

# 데이터 검토하기
head(welfare1)
tail(welfare1)
View(welfare1)
dim(welfare1)
str(welfare1)
summary(welfare1)

## 변수명 바꾸기 ##
welfare1 <- rename(welfare,
                  sex = h10_g3,            # 성별
                  birth = h10_g4,          # 태어난 연도
                  income = p1002_8aq1,     # 월급
                  code_job = h10_eco9,     # 직업 코드
                  code_region=h10_reg7)

#### 데이터 분석 절차 ####
##1단계:변수 검토 및 전처리##
##2단계:변수간 관계분석##

## 성별에 따른 월급차이-"성별에 따라 월급이 다를까? ##
## 성별변수 전처리 ##
class(welfare1$sex)
table(welfare1$sex) # 이상치 확인

# 이상치 결측처리
welfare1$sex <- ifelse(welfare1$sex == 9, NA, welfare1$sex)


# 성별 항목 이름 부여
welfare1$sex <- ifelse(welfare1$sex == 1, "male", "female")
table(welfare1$sex)
qplot(welfare1$sex)


## 월급변수 전처리 ##
class(welfare1$income)
summary(welfare1$income)
qplot(welfare1$income)
qplot(welfare1$income) + xlim(0, 1000)

# 이상치 확인
summary(welfare1$income)

# 이상치 결측 처리
welfare1$income <- ifelse((welfare1$income==0 | welfare1$income==9999), NA, welfare1$income)
welfare1$income <- ifelse(welfare1$income %in% c(0, 9999), NA, welfare1$income)

# 결측치 확인
table(is.na(welfare1$income))


## 성별에 따른 월급 차이 분석하기 ##
sex_income <- welfare1 %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>%
  summarise(mean_income = mean(income))

sex_income

ggplot(data = sex_income, aes(x = sex, y = mean_income)) + geom_col()


## 나이와 월급의 관계-"몇 살 때 월급을 가장 많이 받을까? ##
## 나이변수 검토 및 전처리 ##
class(welfare1$birth)
summary(welfare1$birth)
qplot(welfare1$birth)

# 이상치 확인
summary(welfare1$birth)

# 결측치 확인
table(is.na(welfare1$birth))

# 이상치 결측처리
welfare1$birth <- ifelse(welfare1$birth == 9999, NA, welfare1$birth)
table(is.na(welfare1$birth))


## 파생변수-나이만들기 ##
welfare1$age <- 2015 - welfare1$birth + 1
summary(welfare1$age)
qplot(welfare1$age)


## 나이와 월급의 관계분석 ##
## 나이에 따른 월급 평균표 만들기 ##
age_income <- welfare1 %>%
  filter(!is.na(income)) %>%
  group_by(age) %>%
  summarise(mean_income = mean(income))

head(age_income)

ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_line()


## 연령대에 따른 월급 차이-"어떤 연령대의 월급이 가장 많을까? ##

## 연령대 변수 전처리-파생변수 만들기 ##
welfare1 <- welfare1 %>%
  mutate(ageg = ifelse(age < 30, "young",
                       ifelse(age <= 59, "middle", "old")))

table(welfare1$ageg)
qplot(welfare1$ageg)


## 연령대에 따른 월급 차이 분석하기 ##
ageg_income <- welfare1 %>%
  filter(!is.na(income)) %>%
  group_by(ageg) %>%
  summarise(mean_income = mean(income))

ageg_income

ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) + geom_col()


## 그래프가 나이순으로 정렬되도록 설정 ##
ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) +
  geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))


## 연령대 및 성별 월급 차이-"성별 월급 차이는 연령대별로 다를까? ##

## 연령대 및 성별 월급 평균표 만들기 ##
sex_income <- welfare1 %>%
  filter(!is.na(income)) %>%
  group_by(ageg, sex) %>%
  summarise(mean_income = mean(income))

sex_income

##그래프 만들기 ##
ggplot(data = sex_income, aes(x = ageg, y = mean_income, fill = sex)) +
  geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))

ggplot(data = sex_income, aes(x = ageg, y = mean_income, fill = sex)) +
  geom_col(position = "dodge") +
  scale_x_discrete(limits = c("young", "middle", "old"))


## 나이 및 성별 월급 차이 분석하기 ##
# 성별 연령별 월급 평균표 만들기
sex_age <- welfare1 %>%
  filter(!is.na(income)) %>%
  group_by(age, sex) %>%
  summarise(mean_income = mean(income))

head(sex_age)

# 그래프 만들기
ggplot(data = sex_age, aes(x = age, y = mean_income, col = sex)) + geom_line()



