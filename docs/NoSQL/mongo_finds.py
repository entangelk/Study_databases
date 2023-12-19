from pymongo import MongoClient
# connect mongodb -> 접속 자원에 대한 class 입력
# mongoclient = MongoClient('mongodb://localhost:27017')
mongoclient = MongoClient('mongodb://192.168.0.145:27017')
# database 연결
db_local = mongoclient["local"]
# collection 작업
collection = db_local['posts']
# find작업
documents=collection.find({},{"_id":1,"title":1,"likes":1})

# cast cursor to list
list_documents = list(documents)
print("list_documents length : {}".format(len(list_documents)))
for document in documents:
    print("document : {}".format(document))

pass