# �f�[�^�̓ǂݍ���
dat <- read.csv("C:/Users/yut7G/OneDrive/�h�L�������g/econ/finalreport/task2.csv")
dat
attach(dat)
#�@��������
rrent = rent*10 + mng/1000
# textreg�̓ǂݍ���
library(texreg)

# 1�K���ۂ�
result <- (lm(rrent~dis+year+space+bus+height))
summary(result)
l <- list(result)
htmlreg(l)


# �Z���n�悩��1�K���ۂ�, flood�ϐ���Excel�̃t�@�C���̕��Ɏ蓮��1,0����͂��Đݒ肵�Ă��܂�
result2 <- (lm(rrent~dis+year+space+bus+flood))
summary(result2)
l <- list(result2)
htmlreg(l)