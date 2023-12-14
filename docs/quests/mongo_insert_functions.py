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

class mongo_local_insert:   # 로컬 데이터베이스 인서트 클래스 선언
    def __init__(self,collection_name) -> None:
        self.address='mongodb://localhost:27017'    # 호스트 어드레스 지정
        self.database="local"   # 'local'이라는 이름의 database 선언
        self.insert_collection=''
        self.collection_name = collection_name  # 콜렉션 변수 저장
        pass

    def connect(self):
        mongoclient = MongoClient(self.address) #mongo접속
        db_local = mongoclient[self.database]   #database 연결
        self.insert_collection = db_local[self.collection_name] #collection 진입
        return self.insert_collection   #진입 결과 리턴
    
    def insert(self,collection):
        for i in range(len(collection)):    #insertOne으로 리스트 길이만큼 입력 반복
            self.insert_collection.insert_one(collection[i])
            pass
        return
    
loinsert=mongo_local_insert('fruits') #collection 입력에 대한 클래스 인스턴스
loinsert.connect()  #DB 연결 함수 호출
loinsert.insert(fruits_info)    #입력된 collection에 대한 infor_list insert