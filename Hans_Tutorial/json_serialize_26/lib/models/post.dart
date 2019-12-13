class Post{

  int userId;
  int id;
  String title;
  String body;

  Post(this.userId, this.id, this.title, this.body);

  Post.fromMap(Map<String, dynamic> map){

    userId = map["userId"]?? 0;
    id = map["id"]?? 0;
    title = map["title"]?? '';
    body = map["body"]?? '';

  }

}