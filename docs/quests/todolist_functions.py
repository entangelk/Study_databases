from pymongo import MongoClient

class mongo_get_question:
    def __init__(self,address,database) -> None:
        self.address=address    # 호스트 어드레스 변수 지정
        self.database=database   # 'local'이라는 이름의 database 선언
        self.insert_collection=''
        self.get_name = None
        self.todo_db=None
        self.name_db=None
        self.get_num=None
        self.get_str=None
        pass

    def connect(self,collection_name):
        mongoclient = MongoClient(self.address) #mongo접속
        db_local = mongoclient[self.database]   #database 연결
        self.insert_collection = db_local[collection_name] #collection 진입
        return self.insert_collection   #진입 결과 리턴

    def input_id(self):
        self.get_name = input('Input Your Name : ')
        self.insert_collection.update_one({'Name' : self.get_name})
        return self.get_name
    
    def struct_save(self):  # DB에서 콜렉션 출력 후 리스트 저장
        self.todo_db = list(self.insert_collection.find({},{})) 
        self.name_db = list(self.insert_collection.find({},{}))
        return self.todo_db
    
    def pirnt_menu(self):
        print("ToDo List 중 하나 선택하세요 !")
        print("{}".format(self.todo_db['title']))
        return

    def input_select(self):    
        self.get_num=int(input('Title 번호 : '))
        self.insert_collection.update_one({'Title_num' : self.get_num})
        self.get_str=input('Status : ')
        self.insert_collection.update_one({'Status': self.get_str})
        return
    
    def run_program(self):
        self.input_id()
        self.struct_save()
        while True:
            self.pirnt_menu()
            self.input_select()

# 콜렉션 3개 네임 받고 컨넥션 각각 3개 만들어서 사이사이 껴놓기! or 그냥 지금처럼 하기!



