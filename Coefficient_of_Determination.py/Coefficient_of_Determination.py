#! python3
# Coefficient_of_Determibation.py - 決定係数

import math

# TODO: 観測値の読み込み
import openpyxl
wb = openpyxl.load_workbook('observation.xlsx')
sheet = wb.get_sheet_by_name('Sheet1')

# xiの読み込み
xi = []
for row_of_xi in sheet['A2':'A6']:
    for cell_xi in row_of_xi:
        xi.append(cell_xi.value)

# yiの読み込み
yi = []
for row_of_yi in sheet['B2':'B6']:
    for cell_yi in row_of_yi:
        yi.append(cell_yi.value)

# TODO: 決定係数を求める
sum_xi = math.fsum(xi)
print(sum_xi)