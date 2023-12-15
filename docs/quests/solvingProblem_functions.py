from pymongo import MongoClient

class mongo_get_question:
    def __init__(self,address,database,collection_name) -> None:
        self.address=address    # 호스트 어드레스 변수 지정
        self.database=database   # 'local'이라는 이름의 database 선언
        self.insert_collection=''
        self.collection_name = collection_name  # 콜렉션 변수 저장
        self.total_db = []
        self.get_answer=[]
        self.result_score=0
        pass

    def connect(self):
        mongoclient = MongoClient(self.address) #mongo접속
        db_local = mongoclient[self.database]   #database 연결
        self.insert_collection = db_local[self.collection_name] #collection 진입
        return self.insert_collection   #진입 결과 리턴
    
    def struct_save(self):  # DB에서 콜렉션 출력 후 리스트 저장
        self.total_db = list(self.insert_collection.find({},{"_id":1, "question":1, "choices":1, "answer":1,"score":1}))
        return self.total_db

    def pirnt_and_input(self):
        for i in range(len(self.total_db)):
            print("문제 {} : {}".format(i+1,self.total_db[i]['question']))  # 퀘스쳔 부분 출력
            for j in range(4):
                print("{}. {}".format(j+1,self.total_db[i]['choices'][j]))  # 초이스 부분 출력
                pass
            get_num = int(input('답을 입력하세요 : '))  # 유저 입력값 저장
            self.get_answer.append(get_num)
            if self.total_db[i]['choices'][self.get_answer[i]-1] == self.total_db[i]['answer']: #정답과 비교
                print('정답입니다!')
                self.result_score += self.total_db[i]['score']  # 정답 시 스코어값 호출 후 저장
                pass
            else:
                print('오답입니다!')
                pass
            pass
        return
    
    def result_answer(self):
        print("최종점수 : {}".format(self.result_score))    # 스코어값 저장된 총합 출력
        return
    
    def insert_db(self):    # 유저 입력값 DB 업로드
        for i, doc in enumerate(self.total_db):
            self.insert_collection.update_many({'_id': doc['_id']},{'$set': {'User_answer': self.get_answer[i]}})
            pass
        return







