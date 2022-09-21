import 'package:double_bogey_flutter/models/booking.dart';
import 'package:double_bogey_flutter/screens/MyBookingsPage/myBookingsListWidget.dart';
import 'package:flutter/material.dart';
import '../../call/bookingCalls.dart';

class MyBookingsPage extends StatelessWidget{
  const MyBookingsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,title: const Text("Mes réservations",style: TextStyle(color: Colors.blue),),),
      body: FutureBuilder<List<Booking>>(
        future: getMyBookings(),
        builder: (context, snapshot){
          if (snapshot.hasError){
            return Text('Web api call error: ${snapshot.error}');
          }
          if (snapshot.hasData){
            return MyBookingsListWidget(bookings: snapshot.requireData);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}