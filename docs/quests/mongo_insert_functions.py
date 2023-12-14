from pymongo import MongoClient

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

class mongo_local_insert:
    def __init__(self,collection_name) -> None:
        self.address='mongodb://localhost:27017'
        self.host="local"
        self.insert_collection=''
        self.collection_name = collection_name
        pass

    def connect(self):
        mongoclient = MongoClient(self.address)
        db_local = mongoclient[self.host]
        self.insert_collection = db_local[self.collection_name]
        return self.insert_collection
    
    def insert(self,collection):
        for i in range(len(collection)):
            self.insert_collection.insert_one(collection[i])
            pass
        return
    
loinsert=mongo_local_insert('fruits')
loinsert.connect()
loinsert.insert(fruits_info)