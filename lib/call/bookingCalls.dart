import 'dart:convert';
import 'package:double_bogey_flutter/models/booking.dart';
import 'package:http/http.dart' as http;
import '../data/local.dart';
import '../services/auth_service.dart';


Future<List<Booking>> getMyBookings() async{
  final String accessToken = AuthService.instance.auth0AccessToken.toString();
  final response = await http.Client().get(Uri.https(apiUrl, '/api/bookings/mybookings'),
      headers: {"Content-type" : "application/json", "Authorization": "Bearer $accessToken",},
  );
  if (response.statusCode == 200){
    final list = json.decode(response.body)['listOfBookings'];
    final parsed = list.cast<Map<String, dynamic>>();
    return parsed.map<Booking>((json) => Booking.fromJson(json)).toList();
  }
  else{
    throw Exception('Failed to get myBookings');
  }
}

Future<int> createBooking(Booking booking) async{
  final String accessToken = AuthService.instance.auth0AccessToken.toString();
  final response = await http.Client().post(Uri.https(apiUrl, '/api/bookings/'),
      headers: {"Content-type" : "application/json", "Authorization": "Bearer $accessToken",},
      body: jsonEncode(booking)
  );
  if (response.statusCode == 200){
    return int.parse(response.body);
  }
  else{
    throw Exception('Failed to create booking');
  }
}

Future<bool> editBookingNP(Booking booking) async{
  booking.isPaid = false;
  booking.isValid = true;
  booking.price = 0;
  final String accessToken = AuthService.instance.auth0AccessToken.toString();
  print(jsonEncode(booking));
  final response = await http.Client().put(Uri.https(apiUrl, '/api/bookings/${booking.id}'),
      headers: {"Content-type" : "application/json", "Authorization": "Bearer $accessToken",},
      body: jsonEncode(booking)
  );
  if (response.statusCode == 204){
    return true;
  }
  else{
    throw Exception('Failed to edit booking');
  }
}

Future<bool> editBookingP(Booking booking) async{
  booking.isPaid = true;
  booking.isValid = true;
  booking.price = 0;
  final String accessToken = AuthService.instance.auth0AccessToken.toString();
  print(jsonEncode(booking));
  final response = await http.Client().put(Uri.https(apiUrl, '/api/bookings/${booking.id}'),
      headers: {"Content-type" : "application/json", "Authorization": "Bearer $accessToken",},
      body: jsonEncode(booking)
  );
  if (response.statusCode == 204){
    return true;
  }
  else{
    throw Exception('Failed to edit booking');
  }
}

Future removeBooking(int bookingId) async{
  final String accessToken = AuthService.instance.auth0AccessToken.toString();
  final response = await http.Client().delete(Uri.https(apiUrl, '/api/bookings/$bookingId'),
      headers: {"Content-type" : "application/json", "Authorization": "Bearer $accessToken",},
      body: jsonEncode(<String, String>{'bookingId': bookingId.toString()}),
  );
  if (response.statusCode == 200){
    return int.parse(response.body);
  }
  else{
    throw Exception('Failed to create booking');
  }
}