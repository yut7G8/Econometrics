#! python3
# the_least_squares_methods.py - 最小二乗法

# TODO: observation.xlsxからx,yを読み取り、変数に格納
import openpyxl

wb = openpyxl.load_workbook('observation.xlsx')
sheet = wb.get_sheet_by_name('Sheet1')

# xiを読み取る
xi = []
for row_of_cell_objects_xi in sheet['A2':'A6']:
    for cell_obj_xi in row_of_cell_objects_xi:
        xi.append(cell_obj_xi.value)
        
# yiを読み取る
yi = []
for row_of_cell_objects_yi in sheet['B2':'B6']:
    for cell_obj_yi in row_of_cell_objects_yi:
        yi.append(cell_obj_yi.value)  

# TODO: 最小二乗法を計算

# 回帰直線 - y=a+b*x

# aを求める - xiとyiの平均を求める
sum_xi = 0
for i in range(len(xi)):
    sum_xi += xi[i]
av_xi = sum_xi / len(xi)
sum_yi = 0
for j in range(len(yi)):
    sum_yi += yi[j]
av_yi = sum_yi / len(yi)

# bを求める - xiの分散とxi,yiの共分散を求める
v_x = 0
for k in range(len(xi)):
    v_x += (xi[k] - av_xi)*(xi[k] - av_xi)
V_xi = v_x / len(xi)
cov_x_y = 0
for l in range(len(xi)):
    cov_x_y += (xi[l] - av_xi)*(yi[l] - av_yi)
Cov_xi_yi = cov_x_y / len(xi)

b = Cov_xi_yi / V_xi
a = av_yi - b*av_xi

print('回帰直線:' + 'y=' + str(a) + '+' + str(b) +'x')
