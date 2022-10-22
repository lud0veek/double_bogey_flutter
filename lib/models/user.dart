import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User{
  final int id;
  final String? auth0Id;
  final String firstname;
  final String lastname;
  final DateTime birthdate;
  final String email;
  final String? company;
  final String phone;
  final double handicap;
  final String? password;

  User(this.id, this.auth0Id, this.firstname, this.lastname, this.birthdate, this.email, this.company, this.phone, this.handicap, this.password);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        auth0Id = json['auth0Id'] as String?,
        firstname = json['firstname'] as String,
        lastname = json['lastname'] as String,
        birthdate = DateTime.parse(json['birthdate']),
        email = json['email'] as String,
        company = json['company'] as String?,
        phone = json['phone'] as String,
        handicap = json['handicap'].toDouble(),
        password = json['password'] as String?;

  var formatter = DateFormat('yyyy-MM-dd');
  Map<String, dynamic> toJson() => {
    'id': id,
    'auth0Id': auth0Id,
    'firstname': firstname,
    'lastname': lastname,
    'birthdate': formatter.format(birthdate),
    'email': email,
    'company': company,
    'phone': phone,
    'handicap': handicap,
    'password': password,
  };
}