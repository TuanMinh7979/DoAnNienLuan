import pandas as pd
import numpy as np
import warnings
from keras.models import load_model
from sklearn.metrics.pairwise import cosine_similarity


## Đọc ma trận User item
df=pd.read_csv("/content/drive/MyDrive/NLCS/Result/RSUImatrix.csv")
print(df.head())

##Chuẩn hóa
def chuanhoa(row):
  new_row=(row-row.mean())/(row.max()-row.min())
  return new_row
uimatrix=df.iloc[:,1:]
uimatrixchuan= uimatrix.apply(chuanhoa)

##Xây dụng ma trận tương đồng với consine_similarity
user_simmilar=pd.DataFrame(cosine_similarity(uimatrixchuan), index=df.name, columns=df.name)

user_simmilar

def dudoanuser(name):
  return user_simmilar[name].sort_values(ascending=False).head(6)

dudoanuser("A")
