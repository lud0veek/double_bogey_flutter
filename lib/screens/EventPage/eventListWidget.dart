import 'package:double_bogey_flutter/screens/EventPage/starWidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../call/eventCalls.dart';
import '../../data/local.dart';
import '../../models/event.dart';

class EventListWidget extends StatefulWidget{
  final List<Event> events;
  const EventListWidget({super.key, required this.events});

  @override
  State<EventListWidget> createState() => _EventListWidgetState();
}

class _EventListWidgetState extends State<EventListWidget> {
  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('dd-MM-yyyy');
    return ListView.builder(
      itemCount: widget.events.length,
      itemBuilder: (context, i){
        final event = widget.events[i];
          return ListTile(
            trailing: StarWidget(eventId: widget.events[i].id),
            title: Text("Le ${dateFormatter.format(event.date)}: ${event.name}",
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),),
            subtitle: Text("Description: ${event.description}"),
          );
      },);
  }}
