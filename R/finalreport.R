dat <- read.csv("C:/Users/yut7G/OneDrive/�h�L�������g/econ/finalreport/stock2018q.csv")
dat
attach(dat)

library(texreg)

# �ۑ�1(1)
# ����s�̎��n��O���t
plot(time,s,type="l")
data = ts(s, frequency = 4, start = c(1960,3))
plot(data)
# sg�̎��n��O���t
sg = (s[5:236] - s[1:232])/s[1:232]*100
data2 = ts(sg, frequency = 4, start = c(1960, 3))
plot(data2)

# �ۑ�1(2)
# sg��r�̎U�z�}
rr = r[5:236]
plot(rr,sg)
cor(rr,sg)
# sg��yg�̎U�z�}
yg = (y[5:236] - y[1:232])/y[1:232]*100
plot(yg,sg)
cor(yg,sg)

# �ۑ�1(3)
# sg��rr�̒P��A
summary(lm(sg~yg))
# sg��yg�̒P��A
summary(lm(sg~rr))

result1 <- lm(sg~yg)
result2 <- lm(sg~rr)

# �ۑ�1(4)
# sg��rr��yg�ɏd��A
summary(lm(sg~rr+yg))
result3 <- lm(sg~rr+yg)

# �ۑ�1(5)
# �o�u���ȑO(4)
result4 <- lm(sg[1:116]~rr[1:116]+yg[1:116])
summary(result4)
# �o�u���Ȍ�(4)
result5 <- lm(sg[117:232]~rr[117:232]+yg[117:232])
summary(result5)

# �ۑ�1(6)
# rr�̍\���ω��̌���
D = (time>=121)
Drr = D*r
resultU_rr <- lm(sg~rr+yg+D[5:236]+Drr[5:236])
resultR_rr <- lm(sg~rr+yg)
summary(resultU_rr)
summary(resultR_rr)
anova(resultR_rr, resultU_rr)

# �ۑ�1(7)
# yg�̍\���ω��̌���
D = (time>=121)
Dyg = D[5:236]*yg
resultU_yg <- lm(sg~rr+yg+D[5:236]+Dyg)
resultR_yg <- lm(sg~rr+yg)
anova(resultR_yg, resultU_yg)
summary(resultU_yg)
l <- list(resultR_yg,resultU_yg)
htmlreg(l)

#�ۑ�1(8)
# �ϐ��W����
library(lm.beta)
lm.beta(resultU_rr)
summary(lm.beta(resultU_rr))
lm.beta(resultU_yg)
summary(lm.beta(resultU_yg))
l <- list(lm.beta(resultU_rr),lm.beta(resultU_yg))
htmlreg(l)

# �ۑ�1(9)
# (6),(7)���Arr��yg�ɍ\���ω�(March-90)������ꂽ�̂ŁA�o�u���ȑO�͏����B
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

# �ۑ�1(10)
# yg = a + b*sg + c*rr
rr = rr[117:231]
sg = sg[117:231]
yg = yg[118:232]
summary(lm(yg~sg+rr))
l <- list(lm(yg~sg+rr))
htmlreg(l)