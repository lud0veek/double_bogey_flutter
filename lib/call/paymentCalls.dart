import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data/local.dart';
import '../services/auth_service.dart';

Future<String> createPaymentBooking(int bookingId) async {
  final String accessToken = AuthService.instance.auth0AccessToken.toString();
  final response = await http.Client().post(
    Uri.https(apiUrl, '/api/payments/'),
    body: jsonEncode(<String, String>{'bookingId': bookingId.toString()}),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',"Authorization": "Bearer $accessToken",
    },);
  if (response.statusCode == 200) {
    String ordercode = response.body;
    ordercode = ordercode.replaceAll("\"", "");
    return ordercode;
    }
  else {
    throw Exception("Failed to create payment");
  }
}

Future<String> createPaymentMembership(int membershipId) async {
  final String accessToken = AuthService.instance.auth0AccessToken.toString();
  final response = await http.Client().post(
    Uri.https(apiUrl, '/api/payments/'),
    body: jsonEncode(<String, String>{'membershipId': membershipId.toString()}),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',"Authorization": "Bearer $accessToken",
    },);
  if (response.statusCode == 200) {
    String ordercode = response.body;
    ordercode = ordercode.replaceAll("\"", "");
    return ordercode;
  }
  else {
    throw Exception("Failed to create payment");
  }
}

Future updatePayment(String transactionId) async {
  final String accessToken = AuthService.instance.auth0AccessToken.toString();
  final response = await http.Client().put(
    Uri.https(apiUrl, '/api/payments/'),
    body: jsonEncode(<String, String>{'transactionId': transactionId.toString()}),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',"Authorization": "Bearer $accessToken",
    },);
  if (response.statusCode == 204) {
    print(response.body);
  }
  else {
    throw Exception("Failed to create payment");
  }
}