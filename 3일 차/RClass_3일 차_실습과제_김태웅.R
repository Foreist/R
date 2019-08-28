library(dplyr)

df <- read.csv("student.csv")
summary(df)
table(df$class)
table(df$club)

table(is.na(df$name))
table(is.na(df$class))
table(is.na(df$club)) # 3개의 결측
table(is.na(df$math)) # 1개의 결측
table(is.na(df$eng)) # 2개의 결측

mean_classEng <- df %>%
          filter(!is.na(df$eng)) %>%
          group_by(class) %>%
          mutate(mean_class_eng = mean(eng)); mean_classEng

mean_classMath <- df %>%
          filter(!is.na(df$math)) %>%
          group_by(class) %>%
          mutate(mean_class_math = mean(math)); mean_classMath

mean_eng <- df %>%
          filter(!is.na(df$eng)) %>%
          mutate(mean_eng = mean(eng)); mean_eng

mean_math <- df %>%
          filter(!is.na(df$math)) %>%
          mutate(mean_math = mean(math)); mean_math
mean_math[1,6]

df %>%
  mutate(eng_result = ifelse(eng >= mean_eng[1, 6], "PASS", "FAIL"),
         math_result = ifelse(math >= mean_math[1, 6], "PASS", "FAIL"))
