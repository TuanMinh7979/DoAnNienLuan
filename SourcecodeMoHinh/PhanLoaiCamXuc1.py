import numpy as np
import pandas as pd
import re
from matplotlib import pyplot as plt

from google.colab import drive
drive.mount('/content/drive')

#!unzip "/content/drive/MyDrive/NLCS/Data/DataZip/AmazonReviewsUnlockedMobile.zip" -d "/content/drive/MyDrive/NLCS/Data/DataCSVOrigin"


df=pd.read_csv("/content/drive/MyDrive/NLCS/Data/DataCSVOrigin/Amazon_Unlocked_Mobile.csv")

##Lấy các cột cần thiết
df=df[["Product Name","Reviews","Rating"]]
df=df.dropna()


##Loại bỏ các dấu câu và ký tự không phải là chữ
df['Reviews'] = df['Reviews'].apply(lambda x: re.sub('[^a-zA-Z\']'," ", x))


##Chuyển về dạng từ viết thường
df["Reviews"]=df["Reviews"].str.lower()

##Xóa các dòng bị trùng
df=df.drop_duplicates(subset=["Product Name","Reviews"], keep="first")
df=df.dropna()


## Đếm số từ trong câu
df["wordcount"]=df["Reviews"].apply(lambda x: len(str(x).split()))

##Biểu đồ mật độ chiều dài câu trong tập dữ liệu
plt.hist(df["wordcount"],bins = np.arange(0,410,10))

##Xóa các câu 1 từ(do có thể có nhiều nhãn khác nhau có thể gây nhiễu cho việc học)
df=df[df["wordcount"]>1]


##Thay thế các từ viết sai phổ biến
tuvietsai={
    'didnot':"did not",
    'its' : "it is",
    'iam': 'i am',
    'didnt':'did not',
    'doesnt':'does not',
    'dont':'do not'
}
def replaceword(text):
    text1=text.split()
    for i, j in enumerate(text1):
        if j in tuvietsai.keys():
            text1[i]=tuvietsai[j]
        else:
            text1[i]
    text=" ".join(text1)
    return text
df['Reviews']=df['Reviews'].apply(lambda x:replaceword(x))

##Mở rộng Contraction trong tiếng anh
def decontracted(phrase):
    phrase = re.sub(r"\'t", "not", phrase)
    phrase = re.sub(r"\'re", " are", phrase)
    phrase = re.sub(r"\'s", " is", phrase)
    phrase = re.sub(r"\'d", " would", phrase)
    phrase = re.sub(r"\'ll", " will", phrase)
    phrase = re.sub(r"\'ve", " have", phrase)
    phrase = re.sub(r"\'m", " am", phrase)
    return phrase

df['Reviews']=df['Reviews'].apply(lambda x: decontracted(x))

##Tùy chình và loại bỏ các từ dừng(stop word)
import nltk
from nltk.corpus import stopwords
nltk.download("stopwords")
stopw = set(stopwords.words("english"))
oth_sw=["amazon","phone", "samsung", "lenovo","iphone","zte","nokia", "acer", "asus", "sony", "locked", "unlocked", "tmobile","us","seller", "\ufeff1", "galaxy", "apple", "smartphone", "people",
"'","ios", "android", "xperia", "google","facebook"]
stopw.update(oth_sw)
notis_sw=["no", "not","but","also", "only","so","just","much","more","few","most","less","never","quite","except","enough","one","two","three","four","five"]
stopw.difference_update(notis_sw)

df["Reviews"]=df["Reviews"].apply(lambda x: " ".join([word for word in x.split() if word not in stopw]))


import string
## Loại bỏ khoảng trắng thừa
df["Reviews"] = df["Reviews"].apply(lambda x: re.sub(' +', ' ', x))

##Tính lại số từ trong câu(do đã loại bỏ các thành phần trong câu nên cần tính lại số từ)
df["wordcount"]=df["Reviews"].apply(lambda x: len(str(x).split()))


##Xóa bỏ các câu có số từ là 0 hoặc 1
delidx1=df[(df["wordcount"]==1) | (df["wordcount"]==0)].index
df=df[~df.index.isin(delidx1)]


## Chuyển các từ về dạng từ gốc với Spacy
import spacy
nlp = spacy.load('en_core_web_sm', disable=['tagger', 'parser', 'ner'])
def lemma(x):
 doc=nlp(x)
 lemmatized_w=[]
 for token in doc:
    if token.lemma_ != "-PRON-":
       lemmatized_w.append(token.lemma_)
    else:
       lemmatized_w.append(str(token))
 return ' '.join(lemmatized_w)
df["Reviews"]=df["Reviews"].apply(lambda x: lemma(x))

##Lưu lại tập data đã xữ lý
#df.to_csv("/content/drive/MyDrive/NLCS/Data/DataClean/PhanLoaiCamXuc.csv")
