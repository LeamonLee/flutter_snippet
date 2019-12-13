import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable(nullable: false)
class Post{

  int userId;
  int id;
  String title;
  String body;

  Post(this.userId, this.id, this.title, this.body);

  factory Post.fromJson(Map<String, dynamic> map) => _$PostFromJson(map);

  Map<String, dynamic> PostToJson() => _$PostToJson(this);

}