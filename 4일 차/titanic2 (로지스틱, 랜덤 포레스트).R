install.packages("Amelia") # 아멜리아 설치
install.packages("caret")
install.packages("randomForest")

search()
library(Amelia)
library(dplyr)
library(caret)
library(randomForest)

getwd()
# NA나 공백을 NA처리한다
train <- read.csv("train.csv", na.strings = c("NA", ""), stringsAsFactors = F)
head(train)
test <- read.csv("test.csv", na.strings = c("NA", ""), stringsAsFactors = F)
head(test)
sub <- read.csv("gender_submission.csv")
head(sub)

dim(train); dim(test); dim(test)
names(train); names(test)

missmap(train); 

colSums(is.na(train)) # na인 값들을 다 sum
colSums(is.na(test)) #테스트는 결측치처리를 다 해줘야함
train$Cabin

## 데이터 전처리
names(test)
# 서바이브 생성 후 NA로 넣어줌
test$Survived <- NA
all <- rbind(train, test)
dim(all)
# 전체 데이터 안의 True ,False를 컬럼별로 합을 구해줌
colSums(is.na(all))

## 범주형 변환
all$Sex <- as.factor(all$Sex)
all$Survived <- as.factor(all$Survived)
all$Pclass <- as.factor(all$Pclass)

str(all) # 변경 확인

## 추가 파생 변수 생성
##Pclass, Sex 변수 생성
all$PclassSex[all$Pclass == '1' & all$Sex == 'male'] <- 'P1Male'
all$PclassSex[all$Pclass == '1' & all$Sex == 'female'] <- 'P1FeMale'
all$PclassSex[all$Pclass == '2' & all$Sex == 'male'] <- 'P2Male'
all$PclassSex[all$Pclass == '2' & all$Sex == 'female'] <- 'P2FeMale'
all$PclassSex[all$Pclass == '3' & all$Sex == 'male'] <- 'P3Male'
all$PclassSex[all$Pclass == '3' & all$Sex == 'female'] <- 'P3FeMale'

all %>% group_by(PclassSex) %>% summarise(n = n(),
                                          mean_age = mean(Age),
                                          median_age = median(Age))

# 위처럼 하면 Na가 뜸

all %>% group_by(PclassSex) %>% summarise(n = n(),
                                          mean_age = mean(Age, na.rm = T),
                                          median_age = median(Age, na.rm = T))

unique(all$PclassSex)

all[is.na(all$Emebarked), 'Embarked'] = 'S'
all[is.na(all$Fare), 'Fare'] = median(all$Fare, na.rm = T)

# 결측치면서 Pclass 명이 위와 같은 사람들은 'Age'에 해당하는 값을 변경해줌.
all[is.na(all$Age) & all$PclassSex == 'P1FeMale', 'Age'] = 36
all[is.na(all$Age) & all$PclassSex == 'P1Male', 'Age'] = 42
all[is.na(all$Age) & all$PclassSex == 'P2FeMale', 'Age'] = 28
all[is.na(all$Age) & all$PclassSex == 'P2Male', 'Age'] = 29.5
all[is.na(all$Age) & all$PclassSex == 'P3FeMale', 'Age'] = 22
all[is.na(all$Age) & all$PclassSex == 'P3Male', 'Age'] = 25

colSums(is.na(all))

all$Embarked <- as.factor(all$Embarked)
trainClean <- all[!is.na(all$Survived), ]
testClean <- all[!is.na(all$Survived), ]

## 데이터 나누기
# 보통 7:3으로 나눔
idx <-sample(1:nrow(trainClean), 
              size = nrow(trainClean) * 0.7, replace = F)
train_tr <- trainClean[idx,]
train_test <- trainClean[-idx,]

# testClean:
m <- glm(Survived~Pclass + Sex, family = binomial,
         data = train_tr)
pred <- predict(m, newdata = train_test, type = "response")
pred <- as.integer(pred > 0.5)

real <- train_test[, 'Survived']
# pred
xt = xtabs(~pred + real)
xt

getwd()
#install.packages("e1071")
library(e1071)
pred <- as.factor(pred)
real <- as.factor(real)
confusionMatrix(pred, real)
test$Pclass <-as.factor(test$Pclass)

## 최종 모델 예측
pred <- predict(m, newdata = test, type = "response")
pred <- as.integer(pred > 0.6)
pred[0:15]
sub['Survived'] = pred

write.csv(sub, file = "secondSub.csv", row.names = F)
list.files(path = ".")

## 이번에는 앙상블 모델까지
# library(randomForest)
train_tr$PclassSex <- as.factor(train_tr$PclassSex)
train_test$PclassSex <- as.factor(train_test$PclassSex)
m2 <- randomForest(Survived ~ Pclass + Sex + PclassSex + SibSp + Age, data= train_tr)

rf_pred <- predict(m2, newdata = train_test, type = c("prob"))
rf_pred[0:10] # 각 로우당 0, 1확률
rf_pred 
rf_pred <- predict(m2, newdata = train_test, type = c("class")) # 이건 0과 1로
rf_pred[0:10] 
rf_pred <- as.factor(rf_pred)
real <- as.factor(real)
confusionMatrix(pred, real)

pred <- predict(rf_pred, newdata = test, type = "response")
pred <- as.integer(pred > 0.6)
pred[0:15]
sub['Survived'] = pred

write.csv(sub, file = "secondSub.csv", row.names = F)
list.files(path = ".")