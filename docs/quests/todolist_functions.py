from pymongo import MongoClient

class mongo_get_question:
    def __init__(self,address,database) -> None:
        self.address=address    # 호스트 어드레스 변수 지정
        self.database=database   # 'local'이라는 이름의 database 선언
        self.insert_collection=''
        self.get_name = None
        self.get_name_list=[]
        self.todo_db=None
        self.name_db=None
        self.get_num=None
        self.get_num_list=[]
        self.get_str=None
        self.get_str_list=[]
        self.get_id_list=[]
        self.check_list=[]
        self.upload_dic ={}
        self.upload_list=[]
        self.namelist=[]
        pass

    def connect(self,collection_name):
        mongoclient = MongoClient(self.address) #mongo접속
        db_local = mongoclient[self.database]   #database 연결
        self.insert_collection = db_local[collection_name] #collection 진입
        return self.insert_collection   #진입 결과 리턴

    def input_id(self): # Collection 'participants'
        self.get_name = input('Input Your Name : ')
        self.get_name_list.append(self.get_name)
        self.check_list=list(self.insert_collection.find({},{}))
        if len(self.check_list) == 0:
            self.insert_collection.insert_one({'Name' : self.get_name})
            pass
        else:
            for i in range(len(self.check_list)):
                if self.get_name in self.check_list[i]['Name']:
                    pass 
                else:
                    self.insert_collection.insert_one({'Name' : self.get_name})
                    pass
                pass
            pass
        return

    
    def update_id(self): # Collection 'participants'
        self.get_name = input('Input Your Name : ')
        self.get_name_list.append(self.get_name)
        self.check_list=list(self.insert_collection.find({},{}))
        True_check=False
        for i in range(len(self.check_list)):
            if self.get_name in self.check_list[i]['Name']:
                True_check = True
                count=i
                break
            pass
        if True_check:
            self.insert_collection.update_one({'Name':self.check_list[count]['Name']},{'Name' : self.get_name})
            pass
        else : 
            self.insert_collection.insert_one({'Name' : self.get_name})
            pass
        return 

    def struct_save(self):  # DB에서 콜렉션 출력 후 리스트 저장
        self.todo_db = list(self.insert_collection.find({},{})) 
        self.name_db = list(self.insert_collection.find({},{}))
        return 
    
    def print_menu(self): #collection 'todos_list'
        print("ToDo List 중 하나 선택하세요 !")
        for i in range(len(self.todo_db)):
            print("{}. {}".format(i+1,self.todo_db[i]['title']))
        return

    def input_select(self):    #collection 'todos_list'
        self.get_num=int(input('Title 번호 : '))
        self.get_num_list.append(self.get_num)
        self.get_str=input('Status : ')
        self.get_str_list.append(self.get_str)        
        return
    
    def name_check(self): #collection 'participants'
        self.check_list=list(self.insert_collection.find({},{}))
        for i in range(len(self.check_list)):
            if self.get_name in self.check_list[i]['Name']:
                self.namelist.append(self.check_list[i]['Name'])
                self.get_id_list.append(self.check_list[self.namelist.index(self.get_name)-1]['_id'])
            pass
        return
 
    def input_upload(self): #collection 'participants_todos'
        self.upload_dic ={                                  # 여기 인덱스 값으로 교체해줘야함
            '_id' : self.get_id_list[self.namelist.index(self.get_name)],
            'Title_num' : self.get_num_list[self.namelist.index(self.get_name)],
            'Status': self.get_str_list[self.namelist.index(self.get_name)]
        }
        self.insert_collection.insert_one(self.upload_dic)
        pass

    def update_upload(self):    # 여기 인덱스 값으로 교체해줘야함
        self.upload_list.append(self.upload_dic)
        self.insert_collection.update_many({'_id': {'$in': self.check_list}}, {'$set': {'Title_num': self.upload_dic['Title_num'], 'Status': self.upload_dic['Status']}})
        return


    def run_program(self):
        self.connect('participants')
        self.input_id()
        while True:
            self.connect('todos_list')
            self.struct_save()
            while True:
                self.print_menu()
                self.input_select()
                self.connect('participants')
                self.name_check()
                self.connect('participants_todos')
                if_char=input('종료 여부 : ')
                if if_char == 'c':
                    try:
                        self.update_upload()
                        pass
                    except:
                        self.input_upload()
                        pass
                    pass
                elif if_char =='q':
                    self.connect('participants')
                    self.update_id()
                    self.connect('participants_todos')
                    try:
                        self.update_upload()
                        pass
                    except:
                        self.input_upload()
                        break
                elif if_char == 'x':
                    try:
                        self.update_upload()
                        pass
                    except:
                        self.input_upload()
                        pass
                    break
            if if_char == 'x':
                break
            else :
                pass


letsgo=mongo_get_question('mongodb://localhost:27017','local')
letsgo.run_program()
# 콜렉션 3개 네임 받고 컨넥션 각각 3개 만들어서 사이사이 껴놓기! or 그냥 지금처럼 하기!


