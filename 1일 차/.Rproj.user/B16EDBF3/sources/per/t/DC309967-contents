setwd("C:\\Users\\301-1\\Desktop\\data\\R\\R 수업\\RBasic\\R_data")
getwd()
library(readxl)
# 파일을 불러와서 첫 행을 컬럼명으로 쓰기
excel <- read_excel("excel_exam.xlsx", col_names = T); excel

mean(excel$english)
mean(excel$science)

excel <- read_excel("excel_exam.xlsx", col_names = T); excel

csv <- read.csv("csv_exam.csv", header = T); csv

# 문자열이 있는 파일을 불러올 때는 csv 파라미터 stringAsfactors = F

s <- data.frame(q = c(1, 2, 3),
                w = c(4, 5, 6),
                e = c(7, 8, 9)); s
write.csv(s, file = "s.csv")

# 현재 선언된 함수 전체 삭제
rm(list = ls())

# RData file
save(s, file = "s.rda")

# RData 파일 불러오기
load("s.rda")

# 데이터 파악 함수
# head, tail, View, dim, str(속성), summary, table()

exam <- read.csv("csv_exam.csv"); exam
str(exam)

# 내장 데이터 셋 부르기
data("mtcars"); mtcars

names(exam)

# 변수명 변경 바꿀 명 = 원래 명
library(dplyr)
exam_new <- rename(exam, sciences = science); exam_new

# 파생 변수
exam_new$eng_sci_plus <- exam_new$english + exam_new$sciences; exam_new

hist(exam_new$eng_sci_plus)


mpg$years <- ifelse(mpg$year <= 2007, "True", "False")

library(ggplot2)
mpg
q <- qplot(data = mpg, x = years); q

# mpg에서 2000년 이상 값만 추출
mpg %>% filter(year >= 2000)

