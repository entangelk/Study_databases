from solvingProblem_functions import mongo_get_question


testquestion=mongo_get_question('mongodb://localhost:27017','local','solvingProblem') # address, database, collection 입력에 대한 클래스 인스턴스
testquestion.connect()
testquestion.struct_save()
testquestion.pirnt_and_input()
testquestion.result_answer()
testquestion.insert_db()