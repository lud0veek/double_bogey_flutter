import 'package:double_bogey_flutter/call/bookingCalls.dart';
import 'package:double_bogey_flutter/models/booking.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/event.dart';

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
                  0)
                const Icon(Icons.edit),
              const SizedBox(
                width: 20,
              ),
              if (booking.date.compareTo(
                          DateTime.now().subtract(const Duration(days: -1))) >=
                      0 &&
                  booking.isPaid == false)
                IconButton(
                    onPressed: () => {
                          removeBooking(bookingId),
                          widget.bookings.removeAt(i),
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Réservation supprimée'),
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
            "Le ${dateFormatter.format(booking.date)} à ${booking.startTime} - ${booking.type}",
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "${booking.people} personne(s) - ${booking.length} heure(s)"),
              if (booking.isPaid == true && booking.type != "membership")
                Text(
                  "${booking.price}€ payé",
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
                      "${booking.price}€ à payer sur place",
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
