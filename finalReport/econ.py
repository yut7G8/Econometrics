#! Python3 
# outPut.py - 計量経済学概論期末レポートをPythonで実装

# ライブラリのインポート
import numpy as np
import pandas as pd
from pandas import Series, DataFrame
import matplotlib.pyplot as plt 
# 不要な警告を非表示にする
import warnings
warnings.filterwarnings('ignore')

# データの読み込み
df = pd.read_csv('stock2018v2.csv')
print(df)

# 散布図行列を出力
df_pickup = df.loc[:, ['sg','r','yg','iv','cpi']]
import seaborn as sns
sns.pairplot(df_pickup, size=2.0)
plt.show()

# 相関係数行列を出力
print(df.corr())
# ヒートマップの表示
plt.figure(figsize=(12, 9))
sns.heatmap(df_pickup.corr(), annot=True, square=True, fmt='.2f')
plt.show()

# 単回帰
# 説明変数X,目的変数yをarrayに変換。sklearnはarray型にしか対応していない。
r = np.array(df.loc[:, ['r']])
yg = np.array(df.loc[:, ['yg']])
sg = np.array(df.loc[:, ['sg']])

# 散布図を出力
plt.scatter(r, sg)
plt.title('r vs sg') # タイトル
plt.xlabel('r') # x軸ラベル
plt.ylabel('sg') # y軸ラベル
plt.show() # 出力

plt.scatter(yg, sg)
plt.title('yg vs sg') # タイトル
plt.xlabel('yg') # X軸ラベル
plt.ylabel('sg') # y軸ラベル
plt.show() # 出力