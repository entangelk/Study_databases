from solvingProblem_functions import mongo_get_question


testquestion=mongo_get_question('mongodb://localhost:27017','local','solvingProblem') # address, database, collection 입력에 대한 클래스 인스턴스
testquestion.connect()  # 몽고 연결
testquestion.struct_save()  # 데이터 베이스에서 받아온 리스트 저장 및 가공
testquestion.pirnt_and_input()   # 프린트 및 인풋
testquestion.result_answer()    # 전체 결과 체크 및 결과 출력
testquestion.insert_db()    # 입력결과 DB 업데이트