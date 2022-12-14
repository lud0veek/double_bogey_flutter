import 'package:double_bogey_flutter/call/bookingCalls.dart';
import 'package:double_bogey_flutter/models/booking.dart';
import 'package:double_bogey_flutter/screens/EditBookingNotPaid/editBookingNotPaidPage.dart';
import 'package:double_bogey_flutter/screens/EditBookingPaidPage/editBookingPaidPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyBookingsListWidget extends StatefulWidget {
  final List<Booking> bookings;
  const MyBookingsListWidget({super.key, required this.bookings});

  @override
  State<MyBookingsListWidget> createState() => _MyBookingsListWidgetState();
}

class _MyBookingsListWidgetState extends State<MyBookingsListWidget> {
  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('dd-MM-yyyy');
    return ListView.builder(
      itemCount: widget.bookings.length,
      itemBuilder: (context, i) {
        final booking = widget.bookings[i];
        var bookingId = booking.id?.toInt() ?? 0;
        return ListTile(
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (booking.date.compareTo(
                      DateTime.now().subtract(const Duration(days: -1))) >=
                  0 && booking.isPaid == true)
                IconButton(
                    onPressed: () => {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditBookingPaidPage(oBooking: booking,),
                    ),
                    )},
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    )),
              const SizedBox(
                width: 20,
              ),
              if (booking.date.compareTo(
                  DateTime.now().subtract(const Duration(days: -1))) >=
                  0 && booking.isPaid == false)
                IconButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditBookingNotPaidPage(oBooking: booking,),
                        ),
                      )},
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    )),
              const SizedBox(
                width: 20,
              ),
              if (booking.date.compareTo(
                          DateTime.now().subtract(const Duration(days: -1))) >=
                      0 &&
                  (booking.isPaid == false || booking.type == "membership"))
                IconButton(
                    onPressed: () => {
                          removeBooking(bookingId),
                          widget.bookings.removeAt(i),
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('R??servation supprim??e'),
                            backgroundColor: Colors.green,
                          )),
                          setState(() {})
                        },
                    icon: const Icon(
                      Icons.remove_circle,
                    )),
            ],
          ),
          title: Text(
            "Le ${dateFormatter.format(booking.date)} ?? ${booking.startTime} - ${booking.type}",
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold, fontSize: 15
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "${booking.people} personne(s) - ${booking.length} heure(s)"),
              if (booking.isPaid == true && booking.type != "membership")
                Text(
                  "${booking.price}??? pay??",
                  style: const TextStyle(color: Colors.green),
                ),
              if (booking.isPaid == true && booking.type == "membership")
                const Text(
                  "Membre",
                  style: TextStyle(color: Colors.green),
                ),
              if (booking.isPaid == false)
                Row(
                  children: [
                    Text(
                      "${booking.price}??? ?? payer sur place",
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}
