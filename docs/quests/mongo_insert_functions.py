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
        self.address='mongodb://localhost:27017'    # 호스트 ip 어드레스 지정
        self.host="local"   # 로컬 타입
        self.insert_collection=''
        self.collection_name = collection_name  # 콜렉션 변수 저장
        pass

    def connect(self):
        mongoclient = MongoClient(self.address) #mongo접속
        db_local = mongoclient[self.host]   #database 연결
        self.insert_collection = db_local[self.collection_name] #collection 진입
        return self.insert_collection   #진입 결과 리턴
    
    def insert(self,collection):
        for i in range(len(collection)):    #insert 대신 insertOne으로 길이만큼 주소 반복
            self.insert_collection.insert_one(collection[i])
            pass
        return
    
loinsert=mongo_local_insert('fruits') #collection 입력에 대한 클래스 인스턴스
loinsert.connect()  #DB 연결 함수 호출
loinsert.insert(fruits_info)    #입력된 collection에 대한 inforlist insert