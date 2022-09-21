import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:double_bogey_flutter/models/event.dart';

import '../data/local.dart';

Future<List<Event>> getEvents() async {
  final response = await http.Client().get(
      Uri.https(apiUrl, '/api/events/visible'),);
  if (response.statusCode == 200) {
    final list = json.decode(response.body)['listOfEvents'];
    final parsed = list.cast<Map<String, dynamic>>();
    return parsed.map<Event>((json) => Event.fromJson(json)).toList();
  }
  else {
    throw Exception("Failed to load Events");
  }
}