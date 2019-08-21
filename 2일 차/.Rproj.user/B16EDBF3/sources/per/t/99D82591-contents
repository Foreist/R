install.packages('gridExtra')
library(dplyr)
library(ggplot2)
library(gridExtra)
?aes
df <- read.csv(".\\tr_mod.csv", header = T)

dim(df)
str(df)
names(df)

table(df$Pclass)
table(df$Embarked)
table(df$Survived)
table(df$SibSp)

max(df$Age)
min(df$Age)

p1 = ggplot(data = df, aes(x = Age, y = Survived, fill = Sex)) + geom_col()
p2 = ggplot(data = df, aes(x = Sex, y = Survived, fill = Sex)) + geom_col()
p3 = ggplot(data = df, aes(x = Pclass, y = Survived, fill = Sex)) + geom_col()
p4 = ggplot(data = df, aes(x = Embarked, y = Survived, fill = Sex)) + geom_col()

grid.arrange(p1, p2, p3, p4, ncol = 2, nrow = 2, top = "Titanic_Survived")

sum(is.na(df))
colSums(is.na(df))
less = colSums(is.na(df))
Cabin

df$Cabin <- ifelse(is.na(df$Cabin), 'AAA', 'NOT NA')
df$Cabin
