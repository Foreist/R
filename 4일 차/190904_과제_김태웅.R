library(dplyr)
library(ROCR)
df <- read.csv("newAdTracking.csv") 
names(df)
str(df)
dim(df)

table(df$ip)
max(table(df$app)) # app 3번이 100개로 가장 많이 접속했습니다.
max(table(df$device)) # device 1번이 615개로 가장 많습니다.
max(table(df$os)) # os 19번이 165개로 가장 많습니다.
max(table(df$channel)) # channel 213번이 72개로 가장 많습니다.
colSums(is.na(df)) # 결측치 없습니다.
attach(df)
model <- glm(is_attributed~ip + app + device + os + channel, data = df, family = binomial)

new_df <- data.frame( ip = c(2948, 2684, 2685, 2686)
 , app = c(19 , 286, 21, 23)
 , device = c(0, 1, 1, 2)
 , os = c(13 , 25, 13, 13)
 , channel = c(213, 256, 122, 459))
pred <- predict(model, newdata = new_df, type = "response")
pred

new_df <- new_df %>%
 mutate(is_attributed = as.integer(pred > 0.5))
new_df
