### mongodb function
- insertOne() : db.fruits.insertOne({...})
    insertMany() : db.fruits.insertMany([{...},{...},{...}])

- deletmany() : db.posts.deleteMany({}); 모든 항목 삭제
                db.posts.deleteMany({ category: "Technology" })  해당 항목과 겹치는 모든 항목 삭제

- find() : db.fruits.find({}); 모든 항목 찾기 (모든 카테고리를 전부 보여줌)
        db.posts.find({},{_id:1,title:1,category:1,likes:1});   원하는 카테고리를 선택해서 추려서 볼 수 있음
- {
  _id: ObjectId("657a8df6d4c6d4a4aa603e0d"),
  title: 'Post Title 2',
  category: 'Event',
  likes: 2
}
- {
  _id: ObjectId("657a8df6d4c6d4a4aa603e0e"),
  title: 'Post Title 3',
  category: 'Technology',
  likes: 3
}

- db.posts.updateMany({},{key:value}); 업데이트 기본형태 ({}가 2개 있다. 왜? 어떤걸 어떻게 바꾸어야 하니까)
- db.posts.updateMany({},{$inc : {likes:1}}); 포스트 데이터베이스에서 모든 항목에서 increase한다. 뭐를? likes에다 1을
- db.posts.updateMany({category:'Event'},{$inc:{likes:100}}); 카테고리가 이벤트인 애들에게 라이크를 100씩 증가시킨다.
- [$ 벨류값 모음](https://www.w3schools.com/mongodb/mongodb_query_operators.php)
- db.posts.find({likes:{$eq:2}},{title:1, category:1, likes:1}); 단일 조건
- db.posts.find({$and:[{category:{ $in : ["Event", "Tech"] }},{ likes : { $gt : 4 }}]},{title:1, category:1, likes:1}); 앤드 연산자 중복 조건 사용 바꾸려면 업데이트메니 사용

- db.posts.updateMany({category :{$eq:'Technology'}},{$set:{likes:0}}); 수정하기
- db.posts.updateMany({category :{$eq:'Technology'}},{$set:{likes:1, body:"update post", date:Date()}}); 다중 내용 수정하기
- db.posts.updateMany({category :{$eq:'Technology'}},{$set: {new_id : 45 } }); 새로운 col 추가하기 (여기서는 new_id 추가)