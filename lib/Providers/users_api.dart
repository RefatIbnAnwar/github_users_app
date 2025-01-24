import 'dart:convert';
import 'package:github_users_app/Models/UsersModel.dart';
import 'package:http/http.dart' as http;

class UsersApi {
  Future<List<User>?> getAllGithubUsers() async {
    var client = http.Client();
    var uri = Uri.parse('https://api.github.com/users');
    var response = await client.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer your_api_key',
    });
    if (response.statusCode == 200) {
      return userFromJson(const Utf8Decoder().convert(response.bodyBytes));
    }
    return null;
  }
}
