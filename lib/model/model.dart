
class Post {
  //final String userId;
  final String title;
  final String body;

  Post({ required this.title, required this.body});

  Map<String, dynamic> toJson() {
    return {
      //'userId': userId,
      'title': title,
      'body': body,
    };
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
    //  userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }
}
