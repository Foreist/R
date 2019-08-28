library(dplyr)
library(ggplot2)
### 결측치 처리하기
df <- data.frame(Pclass = c(1, 2, 3, NA, 1),
                 Embarked = c("C", "S", "Q", NA, NA),
                 FARE = c(NA, 150, 300, 300, 100))
# 문자열은 <NA>임
df
df[c(1, 4), 1] # Pclass에 1과 4 불러오기 
# is.na(데이터셋)
is.na(df)

## 결측치 개수 확인
table(is.na(df))

## 각각의 컬럼별 결측치 확인
table(is.na(df$Pclass))

table(is.na(df$Embarked))
table(is.na(df$FARE))

#
df %>% filter(!is.na(Pclass))

## 실습, Embarked NA 뺴고 출력
## Fare NA 빼고 출력
## 모든 NA 빼고 출력하기 3-
df %>% filter(!is.na(FARE))
df %>% filter(!is.na(Embarked))
df %>% filter(!is.na(Pclass) & !is.na(FARE) & !is.na(Embarked))

# na.rm 결측치 제거
mean(df$FARE, na.rm = T)
min(df$Fare, na.rm = T)

## 데이터 선택
mtcars[seq(1, 10, 1),]

## 결측치 생성
mc_part <- mtcars
mc_part[c(4, 8), 'drat'] <- NA; mc_part
# 4, 8열에 결측치 생성성

mc_part %>% summarise(mean_drat = mean(drat, na.rm = T),
                      sum_drat = sum(drat, na.rm = T),
                      med_drat = median(drat, na.rm = T))

mc_part[c(4, 8), 'qsec'] <- NA; mc_part
mc_part %>% summarise(mean_qset = mean(qsec, na.rm = T),
                      sum_qset = sum(qsec, na.rm = T),
                      med_qset = median(qsec, na.rm = T),
                      var_qset = var(qsec, na.rm = T),
                      sd_qset = sd(qsec, na.rm = T)
)                      

names(mc_part)

outlier <- data.frame(Pclass = c(1, 2, 3, 4, 55, 3, 1, 1, 2), family = c(1, 2, 3, 1, 2, 3, 1, 1, 1))
outlier

library(ggplot2)
ggplot(outlier, aes(x = Pclass)) + geom_bar()

# Pclass안에 1, 2, 3이 아닌 거
outlier$Pclass %in% c(1, 2, 3)

# Notin을 쓰고 싶다면
install.packages("Hmisc")
library(Hmisc)
`%notin%` <- Negate(`%in%`)
outlier$Pclass %in% c(1, 2, 3)
outlier$Pclass %in% c(1, 2, 3)
outlier[c(1, 4), 'Pclass'] <- NA; outlier
outlier[!(outlier$Pclass %in% c(1, 2, 3)), 'Pclass']
outlier[!(outlier$family %in% c(1, 2)),]
outlier[outlier$family %notin% c(1, 2),]
outlier[!(outlier$Pclass %in% c(1, 2, 3)), 'Pclass']
outlier[!(outlier$Pclass %in% c(1, 2, 3)), 'Pclass'] = 3
table(outlier)

되면 타이타닉 동일 방법으로 1, 2등급 사람들만 뽑기


titanic <- read.csv("tr_mod.csv", header = T)
titanic %>% filter(!is.na(PassengerId)
                & !is.na(Survived)
                & !is.na(Pclass)
                & !is.na(Name)
                & !is.na(Sex)
                & !is.na(Age)
                & !is.na(SibSp)
                & !is.na(Parch)
                & !is.na(Ticket)
                & !is.na(Fare)
                & !is.na(Cabin)
                & !is.na(Embarked))
View(titanic)
names(titanic)

titanic[titanic$Pclass %notin% c(1, 2),]
