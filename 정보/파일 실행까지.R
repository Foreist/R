# 경로 변경
setwd("C:\\Users\\dxodn\\Desktop\\Github\\RBasic\\R_Data")
setwd("C:\\Users\\301-1\\Desktop\\data\\R\\R 수업\\RBasic\\R_Data")
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
save("s.rda")
# 문자열이 있을 때
csv <- read.csv("csv_exam.csv", header = T, stringAsfactors = F)

# range
seq(1, 15, by = 3)
# join
paste(str, collapse = "")

write.csv(df_score3, file="df_score.csv")