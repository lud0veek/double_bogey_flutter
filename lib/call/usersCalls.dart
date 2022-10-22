import 'dart:convert';
import 'package:double_bogey_flutter/screens/ErrorPage/ErrorPage.dart';
import '../data/local.dart';
import '../models/user.dart';
import '../services/auth_service.dart';
import 'package:http/http.dart' as http;

Future resetPassword(String email) async{
  final String accessToken = AuthService.instance.auth0AccessToken.toString();
  final response = await http.Client().get(Uri.https(apiUrl, '/api/users/reset/$email'),
    headers: {"Content-type" : "application/json", "Authorization": "Bearer $accessToken",},
  );
}

Future<int> createUser(User user) async{
  final response = await http.Client().post(Uri.https(apiUrl, '/api/users/'),
      headers: {"Content-type" : "application/json",},
      body: jsonEncode(user)
  );
  if (response.statusCode == 200){
    return int.parse(response.body);
  }
  else{
    throw Exception('Failed to create user');
  }
}

Future<int> updateUser(User user) async{
  final String accessToken = AuthService.instance.auth0AccessToken.toString();
  final response = await http.Client().put(Uri.https(apiUrl, '/api/users/${user.id}'),
      headers: {"Content-type" : "application/json", "Authorization": "Bearer $accessToken",},
      body: jsonEncode(user)
  );
  if (response.statusCode == 204){
    return 0;
  }
  else{
    throw Exception('Failed to update user');
  }
}

Future<User> getUserInfo() async {
  final String accessToken = await AuthService.instance.auth0AccessToken.toString();
  final response = await http.Client().get(
      Uri.https(apiUrl, '/api/users/myaccount/'),
    headers: {"Authorization": "Bearer $accessToken",},);
  if (response.statusCode == 200) {
      Map<String, dynamic> userMap = json.decode(response.body);
      var user = User.fromJson(userMap);
      return user;
  }
  else {
    throw Exception("Failed to load user details");
  }
}