### mongodb function
- insertOne() : db.fruits.insertOne({...})
    insertMany() : db.fruits.insertMany([{...},{...},{...}])

- deletmany() : db.posts.deleteMany({}); 모든 항목 삭제
                db.posts.deleteMany({ category: "Technology" }) : 해당 항목과 겹치는 모든 항목 삭제

- find() : db.fruits.find({}); 모든 항목 찾기