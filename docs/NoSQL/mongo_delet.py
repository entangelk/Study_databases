from pymongo import MongoClient
# connect mongodb -> 접속 자원에 대한 class 입력
mongoclient = MongoClient('mongodb://localhost:27017')
# database 연결
db_local = mongoclient["local"]
# collection 작업
collection = db_local['fruits']
# delet 작업
collection.delete_many[{}]
pass
fruits_info = [
    {
        'name': 'apple',
        'color': 'red',
        'origin': 'South Korea'
    },
    {
        'name': 'banana',
        'color': 'yellow',
        'origin': 'Philippines'
    },
    {
        'name': 'strawberry',
        'color': 'red',
        'origin': 'United States'
    },
    {
        'name': 'orange',
        'color': 'orange',
        'origin': 'Spain'
    },
    {
        'name': 'grape',
        'color': 'purple',
        'origin': 'Italy'
    },
    {
        'name': 'watermelon',
        'color': 'green',
        'origin': 'China'
    },
    {
        'name': 'cherry',
        'color': 'red',
        'origin': 'Turkey'
    },
    {
        'name': 'pineapple',
        'color': 'yellow',
        'origin': 'Costa Rica'
    },
    {
        'name': 'mango',
        'color': 'yellow',
        'origin': 'India'
    }
]

insert_result = collection.insert_many(fruits_info)
list_inserted_ids = insert_result.inserted_ids

collection.delete_many({'_id':list_inserted_ids[0]})

pass