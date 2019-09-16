install.packages('faraway')
install.packages('pscl')
install.packages('ROCR')
library(faraway)
library(pscl)

## 데이터 불균형시도 예측할 수 있는 게 roc
## (Receiver Operating Characteristic curve)
## 아니요를 고르는 모델인데 100개 중 95개가 아니요일 경우

library(caret)
names(pima)
library(ROCR)
data(pima, package="faraway")
pima$test <- factor(pima$test)
dim(pima)


# 샘플 5:5
idx <- sample(NROW(pima)/2)

# 데이터 셋 나누기
train <- pima[idx, ]
test <- pima[-idx, ]
names(pima)
## logistic reggresion model find
## supervised learning 
## m <- glm(종속~독립변수, family = binomial, data = pima_tr)
m <- glm(test ~ pregnant + glucose + bmi, family=binomial, data=train)
m

## 04 모델을 이용하여 예측을 수행하기
## * predict(모델, newdata=데이터, type=[])

# response는 예측 확률을 제공함함
pred <- predict(m , newdata = test , type = "response")
## 385부터 시작하는 걸 보니 총 데이터가 768개인듯
pred[0:10]  # 10개만 보기


pred <- as.integer(pred > 0.5) # 0.5 이상은 1로
pred[0:10]  # 10개만 보기

# 05 모델 평가
actual <- test[, "test"]
xt = xtabs( ~ pred + actual)
xt

prop.table(xt)

# confusion Matrix 확인
pred <- as.factor(pred)
confusionMatrix(pred, actual)
