from pymongo import MongoClient
# connect mongodb -> 접속 자원에 대한 class 입력
mongoclient = MongoClient('mongodb://localhost:27017')
# database 연결
db_local = mongoclient["local"]
# collection 작업
collection = db_local['fruits']
# insert 작업
collection.insert_one({
    'name': 'lemon',
    'color': 'yellow',
    'origin': 'Spain'
})
dict_fruit = {
    'name': 'orange',
    'color': 'orange',
    'origin': 'Spain'
    }

collection.insert_one(dict_fruit)
pass