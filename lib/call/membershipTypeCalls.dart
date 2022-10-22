import 'dart:convert';
import 'package:double_bogey_flutter/models/membershipType.dart';
import 'package:http/http.dart' as http;

import '../data/local.dart';
import '../services/auth_service.dart';

Future<List<MembershipType>> getVisibleMembershipTypes() async {
  //final String accessToken = AuthService.instance.auth0AccessToken.toString();
  final response = await http.Client().get(
    Uri.https(apiUrl, '/api/membershiptypes/visible'));
  if (response.statusCode == 200) {
    final list = json.decode(response.body)['listOfMembershipTypes'];
    final parsed = list.cast<Map<String, dynamic>>();
    return parsed.map<MembershipType>((json) => MembershipType.fromJson(json)).toList();
  }
  else {
    throw Exception("Failed to load MembershipTypes");
  }
}