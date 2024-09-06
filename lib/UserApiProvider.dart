import 'dart:convert';
import 'package:api_bloc/model/model.dart';
import 'package:http/http.dart' as http;


class UserApiProvider {
  Future<Post> addPost(Post post) async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    
    try {
      final response = await http.post(
        Uri.parse(url),
        body: post.toJson(),
      );

      if (response.statusCode == 201) {
        print('Post added successfully');
        return Post.fromJson(jsonDecode(response.body));
      } else {
        print('Failed with status code: ${response.statusCode}');
        throw Exception('Failed to add post. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred: $error');
      throw Exception('Failed to add post due to an error: $error');
    }
  }
}
