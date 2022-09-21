import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/event.dart';

class EventListWidget extends StatelessWidget{
  final List<Event> events;
  const EventListWidget({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('dd-MM-yyyy');
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, i){
        final event = events[i];
        return ListTile(
          trailing: const Icon(Icons.ads_click),
          title: Text("Le ${dateFormatter.format(event.date)}: ${event.name}",
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),),
          subtitle: Text("Description: ${event.description}"),
        );
      },);
  }}
