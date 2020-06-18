#! python3
# regressionAnalysis.py - 回帰分析

# import module
import numpy as np
import openpyxl

# TODO: macro2015.xlsxからyear,inv,rr,ygを読み込み
year = [] # 年
inv = [] # 投資率 
rr = [] # 利子率
yg = [] # GDP成長率

wb = openpyxl.load_workbook('macro2015.xlsx')
sheet = wb.get_sheet_by_name('Sheet1')
print('読み込み中')
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