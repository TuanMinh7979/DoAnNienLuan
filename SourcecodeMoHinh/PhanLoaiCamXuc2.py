MAX_SEQ_LEN=100
MAX_VOCAB=5000
EMB_DIM=100
BATCH_SIZE=256

import numpy as np
import pandas as pd
from keras.preprocessing.text import Tokenizer
from keras.preprocessing.sequence import pad_sequences
from keras.layers import Dense, Input, LSTM, Embedding, Dropout, Activation, SpatialDropout1D
from keras.layers import Bidirectional, GlobalMaxPool1D, Flatten
from keras.models import Model


#!unzip "/content/drive/MyDrive/NLCS/Data/DataZip/glove100d.zip" -d "/content/drive/MyDrive/NLCS/Data/DataCSVOrigin"


##Load các vector trong tập pretrained Glove vào một dictionary
gloveWord={}
with open('/content/drive/MyDrive/NLCS/Data/DataCSVOrigin/glove.6B.100d.txt', encoding='utf8') as f:
  for line in f:
    linei= line.split()
    wordi=linei[0]
    veci=np.asarray(linei[1:], dtype="float32")
    gloveWord[wordi]=veci

##Đọc dữ liệu đã xử lý
data =pd.read_csv('/content/drive/MyDrive/NLCS/Data/DataClean/PhanLoaiCamXuc.csv')



##Nhóm tập dữ liệu theo nhãn
data.groupby("Rating").count()

##Gán nhãn dữ liệu
data['labels']=data['Rating'].apply(lambda x: 2 if x == 5 else (0 if x < 3 else 1))
data.groupby("labels").count()

##Encode các nhãn thành nhị phân
from sklearn.preprocessing import OneHotEncoder
oh=OneHotEncoder(handle_unknown='ignore', sparse=False)
oh_col_train= pd.DataFrame(oh.fit_transform(data[['labels']]))
#Remove categorical columns(and replace)
num_X_train= data.drop(["labels"], axis=1)
#add one hot encoded columns to numberic feature
data=pd.concat([num_X_train, oh_col_train], axis=1)
data[[0,1,2,]] = data[[0,1,2]].astype('int32')
data.rename(columns={0: "Neg", 1: "Neu", 2:"Pos"}, inplace=True)
data

##Chọn làm nhãn
target=data[["Neg","Neu", "Pos"]]

##Xây dựng từ điển gòm 5000 từ, và khi số hóa các câu với các từ không có trong tập từ điển thì từ đó sẽ là "<oov>"
tudien=Tokenizer(MAX_VOCAB, oov_token="<oov>")
review=data['Reviews']
##xây dựng trên cột review
tudien.fit_on_texts(review)

##Số hóa các câu bình luận trong tập dữ liệu
list_seq=tudien.texts_to_sequences(review)

##Lấy các từ và index của chúng trong tập dữ liệu
wordandindex=tudien.word_index
print(wordandindex)

##Với các câu có nhiều hơn 100 từ thì chỉ lấy 100 từ cuối câu
pad_list_seq=pad_sequences(list_seq, maxlen=MAX_SEQ_LEN)

#Khởi tạo ma trận zero của embedding(5000 x 100)
emb_matrix=np.zeros((MAX_VOCAB,EMB_DIM))


##Thêm các vector ứng với từ trong từ điển đã xây vào ma trận embedding
for wordandindexI, i in wordandindex.items():
  if i < MAX_VOCAB:
    glove_veci=gloveWord.get(wordandindexI)
    if glove_veci is not None:
      emb_matrix[i]=glove_veci

## XÂY DỰNG MODEL

##Sử dụng functional api của keras để xây dựng mô hình
inp=Input(shape=(MAX_SEQ_LEN,))
x=Embedding(MAX_VOCAB, EMB_DIM, weights=[emb_matrix], input_length=MAX_SEQ_LEN)(inp)
x = LSTM(64, return_sequences=True)(x)
##Sử dụng drop out để hạn chế overfit
x=Dropout(0.5)(x)
x = LSTM(32)(x)
##Sử dụng soft max cho mô hình đa nhãn
x=Dense(3, activation="softmax")(x)
model=Model(inputs=inp, outputs=x)

model.summary()

##Sử dụng categorical_crossentropy cho mô hình đa nhãn
model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])


##Sử dụng 80% cho train và 20% cho test và train khoảng 20 epochs
model.fit(pad_list_seq,target, BATCH_SIZE, epochs=20,validation_split=0.2);

#Lưu lại model vào file h5
model.save('/content/drive/MyDrive/NLCS/Result/PhanLoaiCamXucModel.h5')
