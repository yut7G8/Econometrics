# データの読み込み
dat <- read.csv("C:/Users/yut7G/OneDrive/ドキュメント/econ/finalreport/task2.csv")
dat
attach(dat)
#　実質賃金
rrent = rent*10 + mng/1000
# textregの読み込み
library(texreg)

# 1階か否か
result <- (lm(rrent~dis+year+space+bus+height))
summary(result)
l <- list(result)
htmlreg(l)


# 浸水地域かつ1階か否か, flood変数はExcelのファイルの方に手動で1,0を入力して設定しています
result2 <- (lm(rrent~dis+year+space+bus+flood))
summary(result2)
l <- list(result2)
htmlreg(l)
