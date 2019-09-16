library(MASS)
head(UScrime)

tbl_So <- table(UScrime$So)
tbl_So
barplot(tbl_So)

library(ggplot2)
ggplot(UScrime, aes(x = So)) + geom_bar()

library(gglplot2)
## 가설검정
# 귀무가설: 기존의 사실, 같은 투옥 확률을 갖는다.
# 대립가설: 연구자가 제안한 가설, 같은 투옥이 아니다.

## t 검정
# t - test: 독립성, 정규성. 등분산성 만족되어야 함.

# 남부, 비남부
# 정규성: 30개 이상일 경우 정규성이 만족됨.
# 10개 미만이면 정규성을 띠지 않는 것으로 간주

## var.test(변수1, 변수2)
var.test(UScrime$Prob, UScrime$So)
# p-value가 0.05 이하이니 유의하다.
# 0.05보다 작으면 분산이 유의미하게 다르다.

## p-value = 0.0006506
t.test(Prob~So, data = UScrime)

## 귀무가설을 기각하고 대립가설을 채택
# 남부와 비남부가 같은 투옥확률을 가지지 않는다.

# 두 집단이 독립이 아닌 종속의 경우 종속 표본 t 검정
## null: 젊은 남성 장년 남성의 실업률 평균이 같다.
## alternative: 젊은 남성 장년 남성의 실업률 평균이 다르다.

## 등분산 체크 p = 9.637e-07
var.test(UScrime$U1, UScrime$U2)

## p = 2.2e - 16
t.test(UScrime$U1, UScrime$U2, paired = TRUE)

# alternative 채택