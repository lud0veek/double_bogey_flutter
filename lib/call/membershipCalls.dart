import 'dart:convert';

import 'package:double_bogey_flutter/data/local.dart';
import '../services/auth_service.dart';
import 'package:http/http.dart' as http;

Future<int> hasValidMembership(int membershipTypeId) async {
  final String accessToken = AuthService.instance.auth0AccessToken.toString();
  final response = await http.Client().get(
    Uri.https(apiUrl, '/api/memberships/hasvalidmembership/$membershipTypeId'),
    headers: {
      "Content-type": "application/json",
      "Authorization": "Bearer $accessToken",
    },
  );
  if (response.statusCode == 200) {
    return int.parse(response.body);
  } else {
    throw Exception('Failed to know if user has valid membership');
  }
}

Future<int> getSessionLeft(int membershipId) async {
  final String accessToken = AuthService.instance.auth0AccessToken.toString();
  final response = await http.Client().get(
    Uri.https(apiUrl, '/api/memberships/getremainingsession/$membershipId'),
    headers: {
      "Content-type": "application/json",
      "Authorization": "Bearer $accessToken",
    },
  );
  if (response.statusCode == 200) {
    return int.parse(response.body);
  } else {
    throw Exception('Failed to know if user has session left');
  }
}

Future<int> createMembership(int membershipTypeId) async {
  final String accessToken = AuthService.instance.auth0AccessToken.toString();
  final response = await http.Client().post(
    Uri.https(apiUrl, '/api/memberships'),
    headers: {
      "Content-type": "application/json",
      "Authorization": "Bearer $accessToken",
    },
    body: jsonEncode(<String, String>{'membershipTypeId': membershipTypeId.toString()}),
  );
  if (response.statusCode == 200) {
    return int.parse(response.body);
  } else {
    throw Exception('Failed to know if user has session left');
  }
}
