library(rpart)

library(ROCR)
test <- factor(test)

df <- iris
set.seed(123)
idx <- sample(1 : nrow(df), 0.7 * nrow(df), replace = FALSE)
train <-iris[idx, ]
test <-iris[-idx, ]
new_test <- test[, c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width')]

dim(train)
dim(new_test)
names(train)
names(new_test)

r_model <- rpart(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data = train, method = 'class')

pred <- predict(r_model, new_test, type = 'class')
pred

a <- data.frame(predict = pred, test_Species = test$Species)
# 시드 123의 첫 번째 시행 시는 135번이 다른 것을 알 수 있습니다.