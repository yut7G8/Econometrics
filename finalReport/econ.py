#! Python3 
# outPut.py - 計量経済学概論期末レポートをPythonで実装

# ライブラリのインポート
import numpy as np
import pandas as pd
from pandas import Series, DataFrame
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
lr = LinearRegression() # 線形回帰のインスタンスを生成
from sklearn.model_selection import train_test_split

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

# 単回帰分析
lr.fit(r, sg)
print('sg={}+{}*r'.format(lr.intercept_,lr.coef_))
# 散布図を出力
plt.scatter(r, sg)
plt.plot(r, lr.predict(r), color='r')
plt.title('r vs sg') # タイトル
plt.xlabel('r') # x軸ラベル
plt.ylabel('sg') # y軸ラベル
plt.show() # 出力

lr.fit(yg, sg)
print('sg={}+{}*yg'.format(lr.intercept_,lr.coef_))
# 散布図を出力
plt.scatter(yg, sg)
plt.plot(yg, lr.predict(yg), color='r')
plt.title('yg vs sg') # タイトル
plt.xlabel('yg') # X軸ラベル
plt.ylabel('sg') # y軸ラベル
plt.show() # 出力

# 重回帰分析
# 説明変数X,目的変数yを用意。
X = df.loc[:, ['r', 'yg']].values
y = df.loc[:, ['sg']].values

# ホールド・アウト法
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state = 0)
lr.fit(X_train, y_train) # 重回帰線形モデル,trainデータのみ。
print('sg={}+{}*X'.format(lr.intercept_,lr.coef_))

# 決定係数/過学習の有無の確認
print('R^2')
print('train: %.3f' % lr.score(X_train, y_train))
print('test : %.3f' % lr.score(X_test, y_test))