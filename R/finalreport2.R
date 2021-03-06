# �ۑ�2
# �f�[�^�̓ǂݍ���
dat <- read.csv("C:/Users/yut7G/OneDrive/�h�L�������g/econ/finalreport/task2.csv")
dat
attach(dat)
#�@��������
rrent = rent*10 + mng/1000

# �ۑ�2(1)
# �������ݗ��Ƌ���
plot(dis, rrent)
# �������ݗ��ƍL��
plot(space, rrent)
# �������ݗ��ƒz�N��
plot(year, rrent)

# �ۑ�2(2)
library(texreg)
result1 <- lm(rrent~dis)
summary(lm(rrent~dis))
result2 <- lm(rrent~space)
summary(lm(rrent~year))
result3 <- lm(rrent~year)
summary(lm(rrent~space))
l <- list(result1,result2,result3)
htmlreg(l)
# �ۑ�2(3)
summary(lm(rrent~dis+space+year))
l <- list(lm(rrent~dis+space+year))
htmlreg(l)
# �ۑ�2(4)
summary(lm(rrent~dis+year+space+bus))
l <- list(lm(rrent~dis+year+space+bus))
htmlreg(l)
# �ۑ�2(5)

# �ۑ�2(6)

# �ۑ�2(7)
result <- lm(rrent~dis+year+space+bus)
names(result)
result$coef # �W��
result$fitted # ���_�l
x <- result$residuals # �c��
max(x)
min(x)

# �ۑ�2(9)
summary(lm(rrent~dis+year+space+bus+bus*dis))
l <- list(lm(rrent~dis+year+space+bus+bus*dis))
htmlreg(l)
summary(lm(rrent~dis+year+space+bus*dis))

# �ۑ�3
result <- (lm(rrent~dis+year+space+bus+height))
summary(result)

result2 <- (lm(rrent~dis+year+space+bus+flood))
summary(result2)

l <- list(result2)
htmlreg(l)
