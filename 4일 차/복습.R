## R의 자로형 최소 단위: 벡터
데이터 프레임

###
seq(시작, 끝, by = 증가)

### 패키지 업데이트
update.packages

###
python seaborn = R ggplot2
library(ggplot2)

ggplot

### 데이터 탐색
head/tail/summary/view/dim/str/table/class/is

### 변수 삭제
rm(list = ls()) # 할당된 변수 전체 삭제

### 패키지 확인
search()


attach() # 글로벌 변수, 메모리에 올림
mtcars$mpg # 이렇게 적어줘야 했던 걸 attach에 올리면
# mpg만 쓰면 되는데 실무에서는 쓰지 않는다고 함
detach() # 

## 변수명 확인
ls

### 데이터 처리
## factor: 범주형, num: 수치형, int: 정수, chr: 문자
## float: 실수형
read.csv("", stringsAsFactors = )# 문자형을 범주형으로 바꾸겠냐 아니겠냐
read.csv("", na.strings = c("", "NA")) # 공백을 NA로 처리해주느냐 아니냐
read.csv("", header = T) # 첫 행을 컬럼명으로 하느냐 아니냐
read_excel() readxl # 엑셀
read.spss() foreign # spss
read.table(, sep = "\t") # txt 파일, sep는 쉼표나 띄어쓰기, 쉼표로 구분된 것들을 확인해줌
save(".rda")
load(".dd")

### 데이터 처리
df <- data.frame(kor = c(1, 2, 3), eng = c(2, 2, 2), math = c(4, 4, 4)); df


kor <- c(50, 70, 80, 90, 100)
eng <- c(77, 88, 99, 100, 70)
math <- c(55, 75, 85, 95, 105)

all_score <- data.frame(kor, eng, math); all_score

## 모델 - 회귀분석
## lm(패턴, 데이터)
## lm(출력(답) ~ 입력(문제), data = 이름) ~이 ~부터가 아님 딱 2개만 정해준 거
model1 <- lm(math~kor, data = all_score)
model1

## intercept = y절편
## 수학 = 1 * kor + 5

dat <- data.frame(kor = c(80, 85))
# 이 모델을 이용해서 국어점수가 저거일 때 수학점수를 예측해본다.
pred <- predict(model1, newdata = dat)
pred

summary(model1) # 별표가 있는 게 유의한 변수

# 모델 만들어서 예측해보기
# 역사를 예측해 보자.
sub <- data.frame(kor <- c(45, 56, 64),
                  eng <- c(68, 55, 46),
                  his <- c(57, 34, 23))
model2 <- lm(his~kor, data = sub)
model2
dat2 <- data.frame(c = c(22, 23, 54))
predict(model2, newdata = dat2)

getwd()
bike <- read.csv(".//bike.csv")
head(bike)
count_temp <- data.frame( count <- bike$count,
                          temp <- bike$temp)
model3 <- lm(count~temp, data = count_temp)
model3
ex_temp <- data.frame(temp = c(10, 20, 30, 40, 50))
predict(model3, newdata = ex_temp)

