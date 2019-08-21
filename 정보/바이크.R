install.packages("readxl")
library("readxl")
bike <- read_excel(".\\train_bike.xlsx")
names(bike)
summary(bike)
View(bike)
str(bike$datetime)

# 날씨에 따른 카운트
bike1 = ggplot(data = bike, aes(x = weather, y = count)) + geom_col(); bike1
# 온도에 따른 카운트
bike1 = ggplot(data = bike, aes(x = temp, y = count)) + geom_col(); bike1
# 시간에 따른 카운트
bike1 = ggplot(data = bike, aes(x = datetime, y = count)) + geom_col() + +xlim("2011-01-01", "2011-01-01") + ylim(0, 750); bike1
#날씨 자체의 비중               
qplot(data = bike, x = weather)
qplot(data = bike, x = datetime)
head(bike$datetime)
