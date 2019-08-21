## 데이터 다루기
## 데이터 프레임
##

kor <- c(80, 80, 90)
eng <- c(90, 80, 80)
math <- c(95, 100, 70)

##
# data.frame(col1, col2, col3) row.names, stringasfactors 부하기

df_score <- data.frame(kor, eng, math); df_score
#얘는 벡터고 클래스 중 하나이고 리스트이고 데이터프레임입니다.
is(df_score)
class(df_score)
# df_score 중 kor의 평균만 구해보자
mean(df_score$kor)
mean(df_score$eng)
mean(df_score$math)


## 실습해보기 3-1 표준편차와 그래프

products <- c("사과", "딸기", "수박")
price <- c(6000, 8000, 12000)
sales_volume <- c(10, 5, 5)
mean(sale$price)
sale <- data.frame(products, price, sales_volume);sale
# 가격 평균
price_mean <- mean(sale$price)
#판매량 평균
volume_mean <- mean(sale$sales_volume)

qplot(data = sale, x = products, y = price)

#데이터타입 수치형
class(sale$price)
#데이터타입 범주형
class(sale$products)

## 4-1 엑셀, csv 파일 불러오기
#read.csv()
#read.excel()
#엑셀은 readxl 패키지 설치 후 불러와야 함

csv <- read.csv(file = "C:\Users\301-1\Documents\GitHub\RBasic\R_Doit\csv_exam.csv", header = t)

install.packages("readxl")
library(readxl)
search()

### read_excel([파일 경로])
df_exam <- read_excel("C:\\Users\\301-1\\Desktop\\자료\\R\\R 수업\\R_Doit\\excel_exam_novar.xlsx", col_names = F);df_exam

df_csv <- read.csv("C:\\Users\\301-1\\Desktop\\자료\\R\\R 수업\\R_Doit\\csv_exam.csv", header = T) ;df_csv

# 데이터를 쓴다. write.csv(dataset, file = "파일명")
df_score3 <- data.frame(kor, eng, math); df_score3

write.csv(df_score3, file = "C:\\Users\\301-1\\Desktop\\자료\\R\\R 수업\\R_Doit\\df_score.scv")

#데이터셋 만들어서 csv 파일 생성하기 5-1
제품 = c("사과", "딸기", "수박")
가격 = c(6000, 8000, 12000)
판매량 = c(10, 5, 5)
매출액 = c(판매량[1] * 가격[1], 판매량[2] * 가격[2], 판매량[3] * 가격[3])
df = data.frame(제품, 가격, 판매량, 매출액); df

write.csv(df, file = "C:\\Users\\301-1\\Desktop\\자료\\R\\R 수업\\R_Doit\\과일가게.csv")

View(df)
str(mpg)
