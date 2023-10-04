import 'dart:convert';

import 'package:api_practice_2/models/post.dart';
import 'package:http/http.dart' as http;

// Get Api Requests

class ApiService {
  Future<List<userModel>?> getPosts() async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      List<userModel> _model = userModelFromJson(response.body);
      return _model;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
