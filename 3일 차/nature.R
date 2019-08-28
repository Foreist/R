# 원래 다운시 오라클 회원가입 필요
install.packages("rJava")
install.packages("memoise")
install.packages("KoNLP")

library(rJava)
library(memoise)
library(KoNLP)

##
# 10만 단어
useNIADic()
search()

spider <- readLines("SpiderMan.txt")
head(spider)

# 문자열 처리
install.packages("stringr")
library(stringr)

# 특수문자 제거(특수문자를 공백으로)(w는 정규 표현식)
spider <- str_replace_all(spider, "\\W", " "); spider

# 명사 추출
library(KoNLP)
extractNoun("오늘은 즐거운 날이다. 당신은 소중한 사람입니다.")
# 문장별 만들기
nouns <- extractNoun(spider)

# 1차원으로 만들어주는 함수
wordCount <- table(unlist(nouns))
wordCount
View(wordCount)

# df 변환
df_word <- as.data.frame(wordCount, stringsAsFactors =  F); df_word
library(dplyr)
# 이름 변경
df_word <- rename(df_word, word = Var1, freq = Freq)
df_word

# install.packages("wordcloud")
library(wordcloud)
library(RColorBrewer)

## 색상 추출
pal <- brewer.pal(8, "Dark2")
set.seed(1004)


# 워드 클라우드
wordcloud(word = df_word$word,
          freq = df_word$freq,
          min.freq = 2,
          max.words = 100,
          random.order = F,
          rot.per = 0.1, 
          scale = c(5, 0.2),
          colors = pal)
nrow(df_word)
View(df_word)
