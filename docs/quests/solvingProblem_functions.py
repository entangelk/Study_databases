from pymongo import MongoClient

class mongo_get_question:
    def __init__(self,address,database,collection_name) -> None:
        self.address=address    # 호스트 어드레스 변수 지정
        self.database=database   # 'local'이라는 이름의 database 선언
        self.insert_collection=''
        self.collection_name = collection_name  # 콜렉션 변수 저장
        self.save_question_list=[]
        self.save_choices_list=[]
        self.list_database_names=0
        self.save_answer_list=[]
        self.answer_string=None
        pass

    def connect(self):
        mongoclient = MongoClient(self.address) #mongo접속
        db_local = mongoclient[self.database]   #database 연결
        self.insert_collection = db_local[self.collection_name] #collection 진입
        return self.insert_collection   #진입 결과 리턴

    def outprint_question(self,collection):
        for collection in self.insert_collection.find({}, {'question': 1, "_id":0}): 
            self.save_question_list.append(collection)
            pass
        return self.save_question_list

    def outprint_choices(self,collection):
        for collection in self.insert_collection.find({}, {'choices': 1, "_id":0}): 
            self.save_choices_list.append(collection)
            pass
        return self.save_choices_list

    def outprint_answer(self,collection):
        self.answer_string = MongoClient[self.database]['answer']
        for collection in self.answer_string.find({}, {"_id":0,'answer': 1}): 
            self.answer_string.append(collection)
            pass
        return self.answer_string

    def insert_collection(self,input):
        self.list_database_names = list_database_names() # database 갯수 호출
        for i in range(len(self.list_database_names)):
            get_answer = int(input('답을 입력하세요 : '))
            self.save_answer_list.append(get_answer)
            self.collection_name.insert_one(self.save_answer_list[i]) 
            pass
        return self.save_answer_list

    def check_answer(self):
        for i in range(len(list_database_names)):
            if self.save_choices_list['choices'][self.save_answer_list[i]] == self.answer_string['answer'][i]:
                print("정답입니다!")
                pass
            else:
                print('오답입니다!')
                pass
            pass
    




loinsert=mongo_get_question('mongodb://localhost:27017','local','solvingProblem') # address, database, collection 입력에 대한 클래스 인스턴스
connect = loinsert.connect()
print(loinsert.outprint_question(connect))
print(loinsert.outprint_choices(connect))
print(loinsert.outprint_answer(connect))
