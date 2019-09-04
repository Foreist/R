install.packages("Amelia") # 아멜리아 설치
install.packages("caret")
install.packages("randomForest")

search()
library(Amelia)
library(dplyr)
library(caret)
library(randomForest)

Amelia
getwd()
# NA나 공백을 NA처리한다
train <- read.csv("train.csv", na.strings = c("NA", ""), stringsAsFactors = F)
head(train)
test <- read.csv("test.csv", na.strings = c("NA", ""))
head(test)
sub <- read.csv("gender_submission.csv")
head(sub)

dim(train); dim(test); dim(test)
names(train); names(test)

missmap(train); 

colSums(is.na(train)) # na인 값들을 다 sum
colSums(is.na(test)) #테스트는 결측치처리를 다 해줘야함
train$Cabin

?read.csv
quantile(train$Age, na.rm = T) # 결측값이 포함돼 있어도 계산해줌
# 중앙값이 영향을 제일 덜 받음 28임

train[is.na(train$Age), 'Age'] = median(train$Age, na.rm = T)
test[is.na(test$Age), 'Age'] = median(test$Age, na.rm = T)

# 범주의 NA값 확인
colSums(is.na(train))
colSums(is.na(test))

# table = 범주형이면 범주의 빈도, NA도 포함할 거면 useNA
table(train$Embarked, useNA = 'always')
table(test$Embarked, useNA = 'always')

### Embarked 처리
# 범주형의 경우 결측치를 가장 많이 나온 값으로 처리
train[is.na(train$Embarked), 'Embarked'] = 'S'
test[is.na(test$Embarked), 'Embarked'] = 'S'

colSums(is.na(train))
colSums(is.na(test))

### Fare
train[is.na(train$Fare), 'Fare'] = median(train$Fare, na.rm = T)
test[is.na(test$Fare), 'Fare'] = median(test$Fare, na.rm = T)

names(model)
model <- data.frame(train)
# 열 삭제 model <- model[,-10]
# 답을 종속변수, 예측하는 애들을 독립변수라고 함.
model1 <- glm(Survived ~ Sex,
              data = model, family = binomial)
summary(model1)
pred <- predict(model1, newdata = test, type = "response"); pred

# 확률을 0 or 1로만 해주고 omr에 적어준다.
pred <- as.integer(pred > 0.7)
pred[0:15]

# pred를 sub의 Survived 칸에 저장해주자.
names(sub)
sub['Survived'] = pred
# 로우 네임 생성 안 되게
write.csv(sub, file = "firstSub.csv", row.names = F)
list.files(path = ".")

