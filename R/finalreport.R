dat <- read.csv("C:/Users/yut7G/OneDrive/ドキュメント/econ/finalreport/stock2018q.csv")
dat
attach(dat)

library(texreg)

# 課題1(1)
# 株価sの時系列グラフ
plot(time,s,type="l")
data = ts(s, frequency = 4, start = c(1960,3))
plot(data)
# sgの時系列グラフ
sg = (s[5:236] - s[1:232])/s[1:232]*100
data2 = ts(sg, frequency = 4, start = c(1960, 3))
plot(data2)

# 課題1(2)
# sgとrの散布図
rr = r[5:236]
plot(rr,sg)
cor(rr,sg)
# sgとygの散布図
yg = (y[5:236] - y[1:232])/y[1:232]*100
plot(yg,sg)
cor(yg,sg)

# 課題1(3)
# sgとrrの単回帰
summary(lm(sg~yg))
# sgとygの単回帰
summary(lm(sg~rr))

result1 <- lm(sg~yg)
result2 <- lm(sg~rr)

# 課題1(4)
# sgをrrとygに重回帰
summary(lm(sg~rr+yg))
result3 <- lm(sg~rr+yg)

# 課題1(5)
# バブル以前(4)
result4 <- lm(sg[1:116]~rr[1:116]+yg[1:116])
summary(result4)
# バブル以後(4)
result5 <- lm(sg[117:232]~rr[117:232]+yg[117:232])
summary(result5)

# 課題1(6)
# rrの構造変化の検定
D = (time>=121)
Drr = D*r
resultU_rr <- lm(sg~rr+yg+D[5:236]+Drr[5:236])
resultR_rr <- lm(sg~rr+yg)
summary(resultU_rr)
summary(resultR_rr)
anova(resultR_rr, resultU_rr)

# 課題1(7)
# ygの構造変化の検定
D = (time>=121)
Dyg = D[5:236]*yg
resultU_yg <- lm(sg~rr+yg+D[5:236]+Dyg)
resultR_yg <- lm(sg~rr+yg)
anova(resultR_yg, resultU_yg)
summary(resultU_yg)
l <- list(resultR_yg,resultU_yg)
htmlreg(l)

#課題1(8)
# 変数標準化
library(lm.beta)
lm.beta(resultU_rr)
summary(lm.beta(resultU_rr))
lm.beta(resultU_yg)
summary(lm.beta(resultU_yg))
l <- list(lm.beta(resultU_rr),lm.beta(resultU_yg))
htmlreg(l)

# 課題1(9)
# (6),(7)より、rrとygに構造変化(March-90)が見られたので、バブル以前は除く。
rr1 = rr[117:231]
yg1 = yg[117:231]
sg_t = sg[118:232]
summary(lm(sg_t~rr1+yg1))
l <- list(lm(sg_t~rr1+yg1))
htmlreg(l)



rr1 = r[121:235]
yg1 = (y[121:235]-y[117:231])/y[117:231]*100
sg_t = sg[118:232]
summary(lm(sg_t~rr1+yg1))

# 課題1(10)
# yg = a + b*sg + c*rr
rr = rr[117:231]
sg = sg[117:231]
yg = yg[118:232]
summary(lm(yg~sg+rr))
l <- list(lm(yg~sg+rr))
htmlreg(l)
