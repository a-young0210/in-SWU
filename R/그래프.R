##그래프
##r에서 기본으로 제공하는 plot()함수와 ggplot2패키지를 이용하는 방법이 있다.

##plot(x,y,옵션) 
#x-x축 데이터 y-y축 데이터
#옵션에는 main=그래프 제목, sub=그래프 부제목, xlab=x축제목, ylab=y축제목, type=plot의 형태
#axes=plot의 테두리선, col=plot의 색상

#그래프 기본-1
age<-c(24,36,40,42,27,35,55,48)
plot(age,main="나이분포",ylab="나이")

plot.new()
age<-c(24,36,40,42,27,35,55,48)
plot(age,main="나이분포",ylab="나이",col="green")

#그래프 기본-2
plot.new()
height<-c(165,170,177,167,180,172,169,179)
weight<-c(70,73,62,80,85,74,75,68)
plot(weight,height,main="키와 몸무게 분포",xlab="체중",ylab="키")

#실습
cars데이터 불러오기
산점도 그래프 그려보기
제목과 x축제목, y축제목 넣어보기


#type=p 포인트가 점의 형태로 그려짐
#type=l 선의 형태
#type=o 점과 선이 중첩되며 통과됨
#type=h 히스토그램과 같이 수직선 형태
#type=s/S 계단형 그래프

plot.new()
height<-c(165,170,177,167,180,172,169,179)
weight<-c(70,73,62,80,85,74,75,68)
plot(weight,height,main="키와 몸무게 분포",type='o',xlab="체중",ylab="키",col=rainbow(length(height)))


#그래프 기본-3
#par()함수 =>여러 그래프를 한 화면에 그릴 때 유용
#선의 굵기와 종류, 문자의 크기와 글꼴, 색상지정
#par(mfrow=c(행의 개수, 열의 개수))
ex) par(mfrow=c(2,3)) #2행 3열의 그래프, 한 화면에 6개의 그래프가 그려짐

plot.new()
x<-1:5
y<-x
par(mfrow=c(2,3))
kind=c('p','b','l','o','s','h')
for(i in 1:length(kind)) {
title<-paste("type=",kind[i])
plot(x,y,type=kind[i],main=title,col=rainbow(6))
}

#그래프 점과 관련된 points()함수
#points(x,y,pch=점의 형태를 번호로 표시,cex=점의 크기)
plot.new()
plot(1:5,1:5,main="여러 형태의 점")
points(3,2,pch=2,cex=2)
points(2,pch=15,cex=3)
points(2,4,pch=20,cex=1)

#선을 그리는 lines()함수
#lines(x,lty=선의 타입,col=선색상,lwd=선 굵기)
plot.new()
plot(1:5,1:5,main="여러 형태의 선")
lines(c(1,3),c(3,3),lty="dotted",lwd=3,col="red")
lines(c(1,3),c(4,4),lty="solid",lwd=2,col="green")
lines(c(1,5),lty="dashed",lwd=4,col="blue")


#그래프 안에 선 그리기, abline(), abline(h=3,lty="solid")
#그래프 안에 텍스트 삽입, text(), text(3,2,"하위 data군")
#범례삽입, legend(x,y,cex=글자크기,col=색상,lty=선종류)

#그래프 기본-4
plot.new()
x<-1:5
y<-x
plot(x,y,main="sample")
abline(h=c(1:5),col="red",lty="dotted")
text(3,3,"기본점")

#그래프 기본-5
plot.new()
height<-c(165,170,177,167,180,172,169,179)
weight<-c(70,73,62,80,85,74,75,68)
irum<-c('김','박','최','신','정','문','오','추')
plot(weight,height,main="키와 몸무게 분포",type='o',pch=18,xlab="체중",ylab="키",col=rainbow(length(height)))

abline(h=seq(165,180,5),col="gray",lty=2)
text(73,174,"표준",col="brown")

legend("bottomright",col=rainbow(length(height)),legend=irum,lty=1)



plot.new()
y1<-c(0.8,0.5,0.4,0.4,0.5,0.7)
y2<-c(0.8,1.3,1.0,1.3,0.9,1.2)
x<-c(1:6)

par(new=TRUE)
plot(x,y1,ylab="소비자물가상승률",type="o",col="red",ylim=c(0.3,1.5))

par(new=TRUE)
plot(x,y2,lty="dotted",ylab="소비자물가상승률",type="l",col="blue",ylim=c(0.3,1.5))

legend(locator(1),legend=c('2015년','2016년'),lty=1,bg="yellow",col=c('red','blue'))

#막대기본-1
plot.new()
x<-c(100,200,300,350,500)
barplot(x,name=c('a','b','c','d','e'),col='yellow')

#막대그래프-응용1
data<-read.csv("d:\\r1\\seoulpopulation.csv",sep=",",header=TRUE)
data
data1<-subset(data,남자>=230000)
data1
gu<-data1$자치구
barplot(data1$남자,names=gu,las=1,col="darkgreen",horiz=TRUE,
main="서울 남성23만명 이상 거주 자치구")

#히스토그램
plot.new()
x<-c(23,33,32,45,37,28,15,35,43,27,46,33,38,46,50,25)
hist(x,main="연령분포",xlim=c(15,50),col="pink")

#상자도표
plot.new()
data<-read.csv("d:\\r1\\birthdie.csv",sep=",",header=TRUE)
data
boxplot(data$출생,data$사망,names=c('출생','사망'),col=c("pink","darkgreen"),
main="서울2013-2014출생사망자 비교")

#원형그래프
x<-c(27,43,15)
pie(x,labels=c("한식","일식","중식"))
pie(x,labels=c("한식","일식","중식"),init.angle=90,col=rainbow(length(x)))

#3차원 파이차트
install.packages("plotrix")
library(plotrix)

x<-c(9,15,20,6)
label<-c("영업1팀","영업2팀","영업3팀","영업4팀")
pie3D(x,labels=label,explode=0.1,labelcex=0.8,main="부서별 영업실적")

##ggplot2는 그래프를 만들 때 가장 많이 사용하는 패키지이다.
install.packages("ggplot2")
library(ggplot2)

#그래프 기본 틀 만들기
ggplot(데이터세트,aes(데이터속성))

# mpg 데이터로 그래프를 그려보자
# x축은 displ, y축은 hwy로 지정해 기본 틀 설정
ggplot(mpg, aes(x = displ, y = hwy))

# 산점도 만들기
# 배경에 산점도 추가
ggplot(mpg, aes(x = displ, y = hwy)) + geom_point()

# x축 범위 3~6으로 지정
ggplot(mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3, 6)

#  x축 범위 3~6, y축 범위 10~30으로 지정
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  xlim(3, 6) + 
  ylim(10, 30)


# airquality 데이터로 그래프를 그려보자
# airquality 데이터에서 날짜별 온도를 시각화해보자. x축은 날짜(Day), y축은 온도(Temp)
str(airquality)
ggplot(airquality, aes(x = Day, y = Temp))

# 산점도 만들기
ggplot(airquality, aes(x = Day, y = Temp)) + geom_point()
# 크기를 3, 색상을 빨강으로 적용하여 산점도 만들기
ggplot(airquality, aes(x = Day, y = Temp)) + geom_point(size=3,color="red")
# 산점도 차트에 텍스트 추가하기
ggplot(airquality, aes(x = Day, y = Temp)) + geom_point()+
geom_text(aes(label = Temp, vjust = 0, hjust = 0 ))


## 막대 그래프-집단 간 차이 표현하기 ##
install.packages("dplyr")
library(dplyr)

#집단별 평균표만들기
df_mpg <- mpg %>% 
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))

df_mpg

#막대 그래프 생성하기
ggplot(df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()
#크기 순으로 정렬하기
ggplot(df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) + geom_col()

#빈도 막대 그래프 만들기
ggplot(mpg, aes(x = drv)) + geom_bar()

ggplot(mpg, aes(x = hwy)) + geom_bar()

#mtcars 데이터에서 실린더별 빈도수를 빈도 막대 그래프 만들기
ggplot(mtcars, aes(x = cyl)) + geom_bar()
ggplot(mtcars, aes(x = cyl)) + geom_bar(width=0.5)
ggplot(mtcars, aes(x = factor(cyl))) + geom_bar(width=0.5)
#gear에 따른 빈도 막대 그래프를 그리고 그래프의 제목, 축제목 입력해보기
ggplot(mtcars, aes(x = cyl)) + geom_bar() +
labs(x = "기어수", y = "자동차수", title = "변속기 기어별 자동차수")

#테마설정해보기
ggplot(mtcars, aes(x = cyl)) + geom_bar() +
labs(x = "기어수", y = "자동차수", title = "변속기 기어별 자동차수") +
theme_bw()




#누적 막대 그래프 만들기, 실린더 종류별 gear 빈도까지 파악해보자.
ggplot(mtcars, aes(x = factor(cyl))) + geom_bar(aes(fill=factor(gear)))
#누적 막대 그래프를 선버스트 차트로 변환하기
ggplot(mtcars, aes(x = factor(cyl))) + 
geom_bar(aes(fill=factor(gear))) +
coord_polar()
#선버스트 차트를 다시 원형으로 변환
ggplot(mtcars, aes(x = factor(cyl))) + 
geom_bar(aes(fill=factor(gear))) +
coord_polar(theta="y")

## 선 그래프##
#시계열 그래프 만들기
ggplot(economics, aes(x = date, y = unemploy)) + geom_line()

ggplot(airquality, aes(x = Day, y = Temp)) + geom_line()

ggplot(airquality, aes(x = Day, y = Temp)) + geom_line() + geom_point()

## 상자 그림-집단 간 분포 차이 표현하기 ##
#상자 그림 만들기
ggplot(mpg, aes(x = drv, y = hwy)) + geom_boxplot()

ggplot(airquality, aes(x = Day, y = Temp, group= Day)) + geom_boxplot()

#히스토그램 그리기
ggplot(airquality, aes(Temp)) + geom_histogram()



