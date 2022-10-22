import 'package:intl/intl.dart';

class Booking{
  int? id;
  final String type;
  final DateTime date;
  final int people;
  final int length;
  final String startTime;
  int? simulatorId;
  int? roomId;
  int? membershipId;
  String? comment;
  String? billing;
  int? price;
  bool? isPaid;
  bool? isValid;

  Booking(this.id, this.billing, this.type, this.people, this.length, this.simulatorId, this.membershipId, this.comment, this.date, this.startTime);

  Booking.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        type = json['type'] as String,
        date = DateTime.parse(json['date']),
        people = json['people'] as int,
        length = json['length'] as int,
        roomId = json['roomId'] as int?,
        membershipId = json['membershipId'] as int?,
        simulatorId = json['simulatorId'] as int?,
        comment = json['comment'] as String?,
        price = json['price'] as int,
        isPaid = json['isPaid'] as bool,
        isValid = json['isValid'] as bool,
        startTime = (json['startTime'] as String).substring(0,5);

  var formatter = DateFormat('yyyy-MM-dd');
  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'people': people,
    'date': formatter.format(date),
    'startTime': startTime,
    'length': length,
    'simulatorId': simulatorId,
    'roomId': roomId,
    'membershipId': membershipId,
    'comment': comment,
    'billing': billing,
    'price': price,
    'isPaid': isPaid,
    'isValid': isValid
  };
}