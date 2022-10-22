import 'dart:convert';
import 'package:double_bogey_flutter/data/local.dart';
import 'package:double_bogey_flutter/models/booking.dart';
import 'package:http/http.dart' as http;
import 'package:double_bogey_flutter/models/Simulator.dart';
import 'package:intl/intl.dart';

Future<List<Simulator>> getSimulators() async {
  final response = await http.Client().get(
      Uri.https(apiUrl, '/api/simulators/'));
  if (response.statusCode == 200) {
    final list = json.decode(response.body)['listOfSimulators'];
    final parsed = list.cast<Map<String, dynamic>>();
    return parsed.map<Simulator>((json) => Simulator.fromJson(json)).toList();
  }
  else {
    throw Exception("Failed to load Box");
  }
}

Future<List<Simulator>> getVisibleSimulators() async {
  final response = await http.Client().get(
      Uri.https(apiUrl, '/api/simulators/visible'));
  if (response.statusCode == 200) {
    final list = json.decode(response.body)['listOfSimulators'];
    final parsed = list.cast<Map<String, dynamic>>();
    return parsed.map<Simulator>((json) => Simulator.fromJson(json)).toList();
  }
  else {
    throw Exception("Failed to load Box");
  }
}

Future<List<String>> getAvailability(int simulatorId, DateTime dateTime, int length) async {
  var formatter = DateFormat('yyyy-MM-dd');
  var date = formatter.format(dateTime);
  final response = await http.Client().post(
      Uri.https(apiUrl, '/api/simulators/availability/$simulatorId'),
    body: jsonEncode(<String, String>{'Day': date, 'Length': length.toString(), 'SimulatorId': simulatorId.toString()}),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },);
  if (response.statusCode == 200) {
    List<String> oSlots = [];
    var content = jsonDecode(response.body)['listOfSlots'];
    for (int i = 0; i < content.length; i++){

      oSlots.add(content[i]["slot"].toString());
    }
    return oSlots;
  }
  else {
    throw Exception("Failed to load slots");
  }
}

Future<List<String>> getAvailabilityEdit(int simulatorId, DateTime dateTime, int length, int bookingId) async {
  var formatter = DateFormat('yyyy-MM-dd');
  var date = formatter.format(dateTime);
  final response = await http.Client().post(
    Uri.https(apiUrl, '/api/simulators/availability/$simulatorId'),
    body: jsonEncode(<String, String>{'Day': date, 'Length': length.toString(), 'SimulatorId': simulatorId.toString(), 'id': bookingId.toString()}),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },);
  if (response.statusCode == 200) {
    List<String> oSlots = [];
    var content = jsonDecode(response.body)['listOfSlots'];
    for (int i = 0; i < content.length; i++){

      oSlots.add(content[i]["slot"].toString());
    }
    return oSlots;
  }
  else {
    throw Exception("Failed to load slots");
  }
}