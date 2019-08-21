library(ggplot2)
mpg
names(mpg)
ggplot(data = mpg)
# col은 값들의 합을 표현
# 1단계: 배경과 x, y 축 설정
ggplot(data = mpg, aes(x = cyl, y = hwy))

# 2단계: 어떤 모양의 그래프를 그릴 것인가?
ggplot(data = mpg, aes(x = cyl, y = hwy)) + geom_col()

# 3단계: 축 범위 지정 등
range(mpg$hwy)
# lim들은 볼 수 있는 데이터를 제한해줌.
ggplot(data = mpg, aes(x = cyl, y = hwy)) + geom_col() +ylim(0, 3000) + xlim(5, 8)

# 실습 6-1 (2)
#ggplot을 이용해서 전체 인구,  아시아 인구 산점도 찍기
summary(midwest)

ggplot(data = midwest, aes(x = poptotal, y = popasian)) + 
  geom_point() + xlim(0, 50000) + ylim(0, 250)
View(midwest)
ggplot(data = midwest, aes(x = poptotal, y = popasian)) + 
  geom_line()
# bar는 y축이 없고 빈도만 카운트해준다.
ggplot(data = midwest, aes(x = poptotal, y = popasian)) + 
  geom_bar()
library(ggplot2)
titanic <- read.csv(".\\tr_mod.csv")
titanic

# 클래스별 생존율
ggplot(titanic, aes(x = Pclass, y = Survived)) + geom_col()

# 나이대별 생존 그래프
library(dplyr)
## 파생 변수 생성
#mutate(변수명 = 식) = ifelse
new_dat <- titanic %>% mutate(family = SibSp + Parch)
new_dat <- titanic %>% mutate(EM_C = ifelse(Embarked == 'C', 1, 0),
                              EM_S = ifelse(Embarked == 'S', 1, 0),
                              EM_Q = ifelse(Embarked == 'Q', 1, 0))
new_dat %>% select(Embarked, EM_C, EM_S, EM_Q)

# 성별, 메일. 성별, 피메일
new_dat <- titanic %>% mutate(Sex_F = ifelse(Sex == 'female', 1, 0),
                              Sex_M = ifelse(Sex == 'male', 1, 0))
new_dat %>% select(Sex_F, Sex, Sex_M)


10 = 1... 60대 이상은 6                              
new_dat <- titanic %>% mutate(Ages =  ifelse(Age < 10, 0,
                                      ifelse(Age < 20, 1, 
                                      ifelse(Age < 30, 2, 
                                      ifelse(Age < 40, 3,
                                      ifelse(Age < 50, 4,
                                      ifelse(Age < 60, 5, 6)))))))
new_dat %>% select(Age, Ages)
library(ggplot2)
ggplot(new_dat, aes(x = Ages, y = Survived, fill = Sex)) + geom_col() + xlim(2, 4)
#fill은 색인데 색을 범주형으로넣어주면 이렇게 됨


df <- data.frame(dose=c("D0.5", "D1", "D2"),
                 len=c(4.2, 10, 29.5))
head(df)

# Outside bars
ggplot(data=df, aes(x=dose, y=len)) +
  geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=len), vjust=-0.3, size=3.5)

# Inside bars
ggplot(data=df, aes(x=dose, y=len)) +
  geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=len), vjust=1.6, color="white", size=3.5)

# 각 파일마다 코멘트 확인
# 03_2일 ㅊ차 실습 과제 PDf 파일 열면 빈칸이 있는데 그때처럼 채워주면 됨(기한은 오늘까지, 안 되면 주말까지 해주시면 됨)
