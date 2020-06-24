import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'dart:convert';


//  Nạp và phân tích cú pháp dữ liệu JSON
Future<Post> getPost(String url, String id) async{
  final response = await http.get('$url/$id');
  return postFromJson(response.body);
}

Future<http.Response> createPost(Post post, String url) async{
  final response = await http.post('$url',
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: postToJson(post)
  );
  return response;
}

Post postFromJson(String str) {
  final jsonData = json.decode(str);
  return Post.fromJson(jsonData);
}

String postToJson(Post data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

//
//Future<List<Post>> getAllPosts(String url) async {
//  final response = await http.get(url);
//  print(response.body);
//  return allPostsFromJson(response.body);
//}
//
//List<Post> allPostsFromJson(String str) {
//  final jsonData = json.decode(str);
//  return new List<Post>.from(jsonData.map((x) => Post.fromJson(x)));
//}
//
//String allPostsToJson(List<Post> data) {
//  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
//  return json.encode(dyn);
//}

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });
// Phân tích cú pháp và chuyển đổi JSON trong Flutter
  factory Post.fromJson(Map<String, dynamic> json) => new Post(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
