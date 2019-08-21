titanic <- read.csv("C:\\Users\\301-1\\Documents\\카카오톡 받은 파일\\tr_mod.csv", header = T) ;titanic
View(titanic)
library(dplyr)
table(titanic$Pclass)
View(titanic)
# filter (Embarked = 'C')
# %는 이 데이터셋을 다음 문장으로 넘기겠다
P1 <- titanic %>% filter(Pclass == 1) %>% head(5); P1

# Embarked가 C고 Survived가 1인 것
P2 <- titanic %>% filter(Embarked == 'C' & Survived == 1); P2

# 6명
View(head(P2))

# Embarked가 C가 아니고 Survived가 1인 것
P3 <- titanic %>% filter(Embarked != 'C' & Survived == 1);
# 3명
View(head(P3))
library(ggplot2)

# select는 열 추출

#C Q S를 뽑아서 데이터에 대한 막대 그래프 생성
qplot( data = titanic, x = Embarked)

# in
dat <- titanic %>% filter(Pclass %in% c(2, 3)); dat

# select(변수명)
names(titanic)
dat <- titanic %>% select(Pclass, Name, Sex)
head(dat)

# 4-1 Survived만 제외한 컬럼을 만들어 보자
N_Sur <- titanic %>% select(-Survived); N_Sur
N_Sur_Pas <- titanic %>% select(-Survived, -PassengerId); N_Sur 
View(N_Sur)
View(arrange(N_Sur_Pas))

# filter나 select는 쌍따옴표가 필요없다.

# 나이 기준 정렬(오름차순)
titanic % > % arrange(Age)

# 어떤 경우에 가장 생존자가 많은지
# 35분까지
library(ggplot2)
titanic_Sex <- qplot(data = titanic, x = ); titanic_Sex
ggplot(titanic, aes(x=Sex, y=Survived)) + geom_col()

ggplot(titanic, aes(x=Pclass, y=Survived)) + geom_col()
ggplot(titanic, aes(x=Age, y = Survived)) + geom_col()
# 10대 q 20대 w 30대 e 40대 r 50대 t 60대 y 70대 u 80대 i
