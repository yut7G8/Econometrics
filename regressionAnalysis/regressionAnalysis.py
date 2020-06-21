#! python3
# regressionAnalysis.py - 回帰分析:利子率(rr)とyg(GDP成長率)が投資率(inv)に与える影響

# import module
import numpy as np
import openpyxl
import matplotlib.pyplot as plt

# TODO: macro2015.xlsxからyear,inv,rr,ygを読み込み
year = [] # 年
inv = [] # 投資率 
rr = [] # 利子率
yg = [] # GDP成長率

print('読み込み中')
wb = openpyxl.load_workbook('macro2015.xlsx')
sheet = wb.get_sheet_by_name('Sheet1')
for row in range(2, sheet.max_row + 1):
    year.append(sheet['A' + str(row)].value)
    inv.append(sheet['B' + str(row)].value)
    rr.append(sheet['C' + str(row)].value)
    yg.append(sheet['D' + str(row)].value)

# TODO: ndarray作成
year = np.array(year)
inv = np.array(inv)
rr = np.array(rr)
yg = np.array(yg)

# TODO: 平均,分散,共分散を求める関数:MVC(x,y)
def MVC(x,y):
    global x_mean, y_mean, x_variety, y_variety, xy_cov
    x_mean = x.mean()
    y_mean = y.mean()
    x_variety = x.var()
    y_variety = y.var()
    xy_cov = ((x - x_mean).dot((y - y_mean).T)) / len(x)

# TODO: 回帰係数を求める関数:coefficient()
def coefficient():
    global a,b
    b = xy_cov / x_variety
    a = y_mean - b * x_mean

# TODO: t値を求める,t検定(有意水準95%)を行う関数:t_value(x)
def t_value(x,y):
    # 残差を求める
    y_hat = a + b * x
    e = y - y_hat
    e2_sum = np.sum(np.square(e))
    s2 = e2_sum / len(e) - 2
    x2_sum = np.sum(np.square(x - x_mean))
    sb2 = s2 / x2_sum
    t = b / np.sqrt(sb2)
    if t > 1.96 or t < -1.96:
        print('t値:'+str(t)+'より、有意水準95%で有意であると言える.')
    else:
        print('t値:'+str(t)+'より、有意水準95%で有意でないと言える.')

# 回帰直線の標準出力
MVC(rr,inv)
coefficient()
print('inv = '+str(a)+'+'+str(b)+'*rr')
t_value(rr,inv)

MVC(yg,inv)
coefficient()
print('inv = '+str(a)+'+'+str(b)+'*yg')
t_value(yg,inv)

# TODO: プロットと可視化
plt.scatter(rr,inv)
plt.show()
plt.scatter(yg,inv)
plt.show()