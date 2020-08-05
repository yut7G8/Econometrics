# 課題2
# データの読み込み
dat <- read.csv("C:/Users/yut7G/OneDrive/ドキュメント/econ/finalreport/task2.csv")
dat
attach(dat)
#　実質賃金
rrent = rent*10 + mng/1000

# 課題2(1)
# 実質賃貸料と距離
plot(dis, rrent)
# 実質賃貸料と広さ
plot(space, rrent)
# 実質賃貸料と築年数
plot(year, rrent)

# 課題2(2)
library(texreg)
result1 <- lm(rrent~dis)
summary(lm(rrent~dis))
result2 <- lm(rrent~space)
summary(lm(rrent~year))
result3 <- lm(rrent~year)
summary(lm(rrent~space))
l <- list(result1,result2,result3)
htmlreg(l)
# 課題2(3)
summary(lm(rrent~dis+space+year))
l <- list(lm(rrent~dis+space+year))
htmlreg(l)
# 課題2(4)
summary(lm(rrent~dis+year+space+bus))
l <- list(lm(rrent~dis+year+space+bus))
htmlreg(l)
# 課題2(5)

# 課題2(6)

# 課題2(7)
result <- lm(rrent~dis+year+space+bus)
names(result)
result$coef # 係数
result$fitted # 理論値
x <- result$residuals # 残差
max(x)
min(x)

# 課題2(9)
summary(lm(rrent~dis+year+space+bus+bus*dis))
l <- list(lm(rrent~dis+year+space+bus+bus*dis))
htmlreg(l)
summary(lm(rrent~dis+year+space+bus*dis))

# 課題3
result <- (lm(rrent~dis+year+space+bus+height))
summary(result)

result2 <- (lm(rrent~dis+year+space+bus+flood))
summary(result2)

l <- list(result2)
htmlreg(l)
