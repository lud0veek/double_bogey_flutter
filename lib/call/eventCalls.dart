import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:double_bogey_flutter/models/event.dart';

import '../data/local.dart';
import '../services/auth_service.dart';

Future<List<Event>> getEvents() async {
  final response = await http.Client().get(
      Uri.https(apiUrl, '/api/events/visible'));
  if (response.statusCode == 200) {
    final list = json.decode(response.body)['listOfEvents'];
    final parsed = list.cast<Map<String, dynamic>>();
    return parsed.map<Event>((json) => Event.fromJson(json)).toList();
  }
  else {
    throw Exception("Failed to load Events");
  }
}

Future<bool> createRegistration(int eventId) async{
  final String accessToken = AuthService.instance.auth0AccessToken.toString();
  final response = await http.Client().post(Uri.https(apiUrl, '/api/registrations/'),
      headers: {"Content-type" : "application/json", "Authorization": "Bearer $accessToken",},
    body: jsonEncode(<String, String>{'eventId': eventId.toString()}),
  );
  if (response.statusCode == 200){
    return true;
  }
  else{
    throw Exception('Failed to create registration');
  }
}

Future<bool> deleteRegistration(int eventId) async{
  final String accessToken = AuthService.instance.auth0AccessToken.toString();
  final response = await http.Client().delete(Uri.https(apiUrl, '/api/registrations/$eventId'),
    headers: {"Content-type" : "application/json", "Authorization": "Bearer $accessToken",},
  );
  if (response.statusCode == 204){
    return true;
  }
  else{
    throw Exception('Failed to create registration');
  }
}

Future<bool> isUserRegistered(int eventId) async {
  final String accessToken = AuthService.instance.auth0AccessToken.toString();
  final response = await http.Client().get(Uri.https(apiUrl, '/api/registrations/IsUserRegistered/$eventId'),
    headers: {"Content-type" : "application/json", "Authorization": "Bearer $accessToken",},
  );
  if (response.statusCode == 200) {
    final responseBool = json.decode(response.body);
    return responseBool;
  }
  else {
    throw Exception("Failed to registration status");
  }
}