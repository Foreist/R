###1  ggplot2의 midwest 데이터를 데이터 프레임 형태로 불러온 다음 데이터의 특징을 파악하세요.
library("ggplot2")
?midwest
df_mw <- data.frame(midwest)

# 데이터의 상단부터 x행 추출 head(데이터 명, 불러올 라인 수(default = 6)
head(df_mw)

# 데이터의 하단부터 x행 추출 tail(데이터 명, 불러올 라인 수(default = 6)
tail(df_mw)

# R 자체에서 데이터 파일을 열어주는 명령어(데이터가 많으면 콘솔창 자체에서 전체 데이터를 확인하기 힘듦으로)
View(df_mw)

# 데이터의 low, column 값 확인
dim(df_mw)

# 데이터의 구조를 개괄적으로 확인할 수 있는 명령어
str(df_mw)

# 컬럼명만 확인
names(df_mw)
# 데이터 각 열의 min, max, mean, 3분위값을 확인할 수 있는 명렁어
summary(df_mw)

###2 poptotal(전체인구) 변수를 total로, popasian(아시아 인구) 변수를 asian으로 수정하세요.

#rename 함수를 사용하기 위한 dplyr 설치
install.packages("dplyr")
library(dplyr)

# 원본에 바로 적용할 수 있도록 변수명을 원본으로 해줍니다.
df_mw <- rename(df_mw, total = poptotal, asian = popasian)
# 바뀌었는지 확인
names(df_mw)

###3 total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 파생변수를 만들고, 히스토그램을 만들어 도시들이 어떻게 분포하는지 살펴보세요.

# 새로 생성할 변수명은 "asian_rate"로 하겠습니다.
df_mw$asian_rate <- (df_mw$asian / df_mw$total)
# 히스토그램이 잘 보이지 않아서 qplot으로 했습니다.
summary(df_mw$asian_rate)

qplot(data = df_mw, x =county, y =asian_rate)

###4 아시아 인구 백분율 전체 평균을 구하고 평균을 초과하면 large, 그 외에는 small을 부여하는 파생변수를 만들어 보세요.
mean_asian <- mean(df_mw$asian_rate); mean_asian

# 위 평균값을 기준으로 ,평균 "초과" 시 "large", 그 외에는 "small"
# 조건은 if mean_asian  값 = "large", mean_asian >= 값 = "small"
df_mw$mean_asian <- ifelse(df_mw$asian_rate > mean_asian, "large", "small")
str(df_mw$mean_asian)

###5 "large"와 "small"에 해당하는 지역이 얼마나 되는지 빈도표와 빈도 막대 그래프를 만들어 확인해 보세요.
# 빈도표
table(df_mw$mean_asian)

# 빈도 막대 그래프
qplot(data = df_mw, x = df_mw$mean_asian)

# 감사합니다~
