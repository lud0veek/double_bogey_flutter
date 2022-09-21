import 'package:flutter/material.dart';
import '../../call/eventCalls.dart';
import '../../models/event.dart';
import 'eventListWidget.dart';

class EventPage extends StatelessWidget{
  const EventPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
            body: FutureBuilder<List<Event>>(
        future: getEvents(),
        builder: (context, snapshot){
          if (snapshot.hasError){
            return Text('Web api call error: ${snapshot.error}');
          }
          if (snapshot.hasData){
            return EventListWidget(events: snapshot.requireData);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}