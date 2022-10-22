import 'package:flutter/material.dart';
import '../../call/eventCalls.dart';
import '../../data/local.dart';

class StarWidget extends StatefulWidget{
  final int eventId;

  const StarWidget({Key? key, required this.eventId}) : super(key: key);
  @override
  State<StarWidget> createState() =>
      _StarWidgetState();
}

class _StarWidgetState extends State<StarWidget>{
  bool oIsRegistered = false;
  late int oEventId;

  @override
  void initState() {
    oEventId = widget.eventId;
    if (isLoggedIn == true){
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await isUserRegisteredLocal(oEventId);
        setState(() {});
      });
    }
    super.initState();
}

  Future isUserRegisteredLocal(oEventId) async {
    await isUserRegistered(oEventId)
        .then((value) => oIsRegistered = value);
    setState(() {});
  }

  Future createRegistrationLocal(oEventId) async {
    await createRegistration(oEventId)
        .then((value) => {
          if (value == true){
            oIsRegistered = true
          }
          else{
            oIsRegistered = false
          }
        });
    setState(() {});
  }

  Future deleteRegistrationLocal(oEventId) async {
    await deleteRegistration(oEventId)
        .then((value) => {
      if (value == true){
        oIsRegistered = false
      }
      else{
        oIsRegistered = true
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn == false) {
      return IconButton(
          onPressed: () => {},
          icon: const Icon(
            Icons.star, color: Colors.white,
          ));
    }
    if (oIsRegistered == true) {
      return IconButton(
          onPressed: () => {deleteRegistrationLocal(oEventId)},
          icon: const Icon(
            Icons.star, color: Colors.yellow,
          ));
    }
    else {
      return IconButton(
          onPressed: () => {
          createRegistrationLocal(oEventId)},
          icon: const Icon(
            Icons.star, color: Colors.blue,
          ));
    }
  }
}