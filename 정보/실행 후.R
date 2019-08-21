# 데이터 파악 함수
# head, tail, View, dim, str(속성), summary, table()

# 변수명 변경 바꿀 명 = 원래 명
library(dplyr)
exam_new <- rename(exam, sciences = science); exam_new

# 파생 변수
exam_new$eng_sci_plus <- exam_new$english + exam_new$sciences; exam_new

# mpg에서 2000년 이상 값만 추출
mpg %>% filter(year >= 2000)

#ggplot(col, point, line, bar)
p1 = ggplot(data = df, aes(x = Age, y = Survived, fill = Sex)) + geom_col() + ylim(0, 3000) + xlim(5, 8)
ggplot(data=df, aes(x=dose, y=len)) +
  geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=len), vjust=-0.3, size=3.5)

# 결측치 값 찾기
sum(is.na(df))

# 데이터 조건부
p1 <- titanic %>% filter(Pclass == 1) %>% head(p1)
dat <- titanic %>% filter(Pclass %in% c(2, 3)); dat
dat <- titanic %>% select(Pclass, Name, Sex)
df$Cabin <- ifelse(is.na(df$Cabin), 'AAA', 'NOT NA')
new_dat <- titanic %>% mutate(Sex_F = ifelse(Sex == 'female', 1, 0),
                              Sex_M = ifelse(Sex == 'male', 1, 0))

# 정렬
arrange(N_Sur_Pas)

# 그래프 여러 개 그리기
grid.arrange(p1, p2, p3, p4, ncol = 2, nrow = 2, top = "Titanic_Survived")
