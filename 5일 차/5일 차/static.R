## 통계 기본 모델 만들기
kor <- c(50,70,80,90,100)
eng <- c(77,88,99,100,70)
math <- c(55, 75, 85, 95, 105)

# continuous

all_score <- data.frame(kor, eng, math)
all_score

model1 <- lm(math~kor, data = all_score)
model1

model2 <- lm(math~kor + eng, data = all_score)
model2

kor_ <- c(25, 26, 64, 42, 65)
eng_ <- c(35, 73, 73, 73, 65)
math_ <- c(64, 34, 52, 74, 34)

all_score <- data.frame(kor_, eng_, math_)


dat1 <- data.frame(kor_ = c(80, 85, 53, 42),
                  eng_ = c(34, 56, 73, 35))
mode1 <- lm(math_~kor_ + eng_, data = all_score); summary(mode1)
pred <- predict(mode1, newdata = dat1)
pred


dat2 <- data.frame(kor_ = c(80, 85))
mode2 <- lm(math_~kor_, data = all_score); mode2
pred2 <- predict(mode2, newdata = dat2)
pred2

## mtcars 

mtcars

head(mtcars)
names(mtcars)
# cyl, disp, hp, drat, wt, qsec, vs, am, gear, carb
plot(mtcars$disp, mtcars$mpg,
     xlab = '자동차 배기량',
     ylab = '자동차의 연비',
     pch = 15, main = '자동차 배기량과 연비의 관계')

model <- lm(mpg~disp, data = mtcars)
summary(model) #0.71
model2 <- lm(mpg~., data = mtcars)
summary(model2) # 0.72
abline(model) # 이 직선이 잔차가 최소가 되는 값을 구해줌.

# 모델과 잔차의 차이
model$residuals

## MSE(Mean Square Error)

# mpg와 관계가 가장 높은 독립변수를 찾자.
산점도와 회귀직선을 그려보자.


library(MASS)
data('Boston')
head(Boston)

set.seed(0)
idx <- sample(1:nrow(Boston),
              size = nrow(Boston) * 0.905,
              replace = F) # 뽑은 걸 다시 뽑지 않겠다
idx

Boston_tr <- Boston[idx, ]
Boston_test <- Boston[-idx, ]

# 모델 생성
lm.Model <- lm(medv~. , data = Boston_tr)
summary(lm.Model)

# 모델 예측

pred_value <- predict(lm.Model, Boston_test)
pred_value[0:10]

dim(Boston_test); length(pred_value)
n1 = length(pred_value)
diff_val = (Boston_test$medv - pred_value) ^ 2
mae_value = sum(diff_val) / n1
mae_value

## 1. 7:3 = 3.3745
## 2. 6:4 = 3.477267
## 3. 5:5 = 3.480892
## 4. 8:2 = 4.145378
## 5. 9:1 = 2.772267

## 가장 좋은 mae 찾기 9:1이 가장 좋음

## 2. MSE 값을 구해보기
## 9:1 13.61195

