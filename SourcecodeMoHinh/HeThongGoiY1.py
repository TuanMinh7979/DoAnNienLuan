import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

#!unzip "/content/drive/MyDrive/NLCS/Data/DataZip/AmazonCellPhonesReviews.zip" -d "/content/drive/MyDrive/NLCS/Data/DataCSVOrigin"


##Load 2 tệp csv giải nén từ tập AmazonCellPhonesReviews
item=pd.read_csv("/content/drive/MyDrive/NLCS/Data/DataCSVOrigin/20191226-items.csv")
review=pd.read_csv("/content/drive/MyDrive/NLCS/Data/DataCSVOrigin/20191226-reviews.csv")

#print(review.head())

##Nhóm các đánh giá theo tên khách hàng
danhgia=review
danhgia=danhgia.groupby(["name"]).count()
print(danhgia)

##Sắp xếp các khách theo lượt đánh giá tăng dần
danhgias=danhgia.sort_values(["body"],ascending=False)
##Thống kế sơ lượt đánh giá theo số lượng khách hàng
danhgias=danhgias.iloc[2:,:]
danhgias["asin"].value_counts().reset_index().rename(columns={'index':'soluotdanhgia', 'asin':'soluongkhachhang'})

##Loại bỏ các bình luận của các nhóm người dùng
review = review[~review["name"].isin(["Amazon Customer","AmazonCustomer","Amazon customer","Amazon customer","Kindle Customer"])]
print(review.shape)

## Merge hai tệp csv để xây dựng User Item table
df= pd.merge(item, review, how="right", on="asin")
df.columns

#Lấy các cột cần thiết
df=df[[ 'asin','brand','name','body', 'rating_y']]
print(df.shape)


##Tìm những khách hàng có trên 5 lượt đánh gía
userreviewcount=df["name"].value_counts()
dic=dict(userreviewcount)

u5= {key:value for key, value in dic.items() if value >=5}
df5=df[df["name"].isin(list(u5))]

print(df5.head())
print(df5.shape)

##Tính lại số lượt review cho từng sản phẩm(sau khi thực hiện các bước loại bỏ ở trên)
itemcount=df5["asin"].value_counts()
dic1=dict(itemcount)

##Lọc ra những sản phẩm có trên 15 lượt đánh giá trở lên
item15={key:value for key, value in dic1.items() if value >= 15}
print(item15)



##Lọc ra sản phẩm có từ 15 lượt đánh giá nằm trong tâp các từ sản phẩm mà khách hàng có từ 5 lượt đánh giá
df155=df5[df5["asin"].isin(list(item15))]
df155['sum_review'] = df155['asin'].map(item15)


df155.head(50)

#df155.to_csv("/content/drive/MyDrive/NLCS/Result/RS155.csv")

##Tạo User-Item table
uimatrix = pd.pivot_table(df155, values='rating_y', index=['name'],columns=['asin'], fill_value=0)
#print(uimatrix)

##Lưu lại ma trận user -item
#uimatrix.to_csv("/content/drive/MyDrive/NLCS/Result/RSUImatrix.csv")
