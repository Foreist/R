# 경로 변경
setwd("C:\\Users\\301-1\\Desktop\\data\\R\\R 수업\\RBasic\\R_data")
getwd()

# 패키지
install.packages(ggplot2)
library()

# 현재 선언된 함수 전체 삭제
rm(list =ls())

# 내장 데이터 셋 부르기
data("mtcars"); mtcars

# 파일 read
excel <- read_excel("excel_exam.xlsx", col_names = T)
csv <- read.csv("csv_exam.csv", header = T)
load("s.rda")
# 문자열이 있을 때
csv <- read.csv("csv_exam.csv", header = T, stringAsfactors = F)

# 데이터 파악 함수
# head, tail, View, dim, str(속성), summary, table()

# 변수명 변경 바꿀 명 = 원래 명
library(dplyr)
exam_new <- rename(exam, sciences = science); exam_new

# 파생 변수
exam_new$eng_sci_plus <- exam_new$english + exam_new$sciences; exam_new

# mpg에서 2000년 이상 값만 추출
mpg %>% filter(year >= 2000)

#ggplot
p1 = ggplot(data = df, aes(x = Age, y = Survived, fill = Sex)) + geom_col()

# 결측치 값 찾기
sum(is.na(df))

# 그래프 여러 개 그리기
grid.arrange(p1, p2, p3, p4, ncol = 2, nrow = 2, top = "Titanic_Survived")