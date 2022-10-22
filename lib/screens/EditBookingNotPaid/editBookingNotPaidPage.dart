import 'package:double_bogey_flutter/call/bookingCalls.dart';
import 'package:double_bogey_flutter/call/simulatorCalls.dart';
import 'package:double_bogey_flutter/models/booking.dart';
import 'package:double_bogey_flutter/screens/EditBookingNotPaid/widgets/EditBNPDatePickerWidget.dart';
import 'package:double_bogey_flutter/screens/EditBookingNotPaid/widgets/EditBNPLengthSliderWidget.dart';
import 'package:double_bogey_flutter/screens/EditBookingNotPaid/widgets/EditBNPMembershipRadioTypeWidget.dart';
import 'package:double_bogey_flutter/screens/EditBookingNotPaid/widgets/EditBNPPeopleSliderWidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/Simulator.dart';

var formatter = DateFormat('dd-MM-yyyy');
final _formKey = GlobalKey<FormState>();

class EditBookingNotPaidPage extends StatefulWidget {
  final Booking oBooking;
  const EditBookingNotPaidPage({Key? key, required this.oBooking}) : super(key: key);
  @override
  State<EditBookingNotPaidPage> createState() => _EditBookingNotPaidPage();
}

class _EditBookingNotPaidPage extends State<EditBookingNotPaidPage> {
  //Variables for comment input
  final controllerComment = TextEditingController();
  String commentInput = '';

  //Form's variables
  DateTime _datePickerSelectedValue = DateTime.now();
  final String _radioPaymentSelectedValue = "cash";
  late String _radioTypeSelectedValue = "golf";
  late int _peopleSliderSelectedValue = 1;
  late int _lengthSliderSelectedValue = 1;

  //Various variables
  late List<Simulator> boxes;
  final List<DropdownMenuItem<Simulator>> _dropdownBoxItems = [];
  final List<DropdownMenuItem<String>> _dropdownSlotItems = [];
  Simulator? _selectedBoxItem;
  String? _selectedSlotItem;
  bool _isLoadingSlots = false;

  late Booking booking;
  late String comment;

  @override
  void initState() {
    super.initState();
    setSimulators();
    booking = widget.oBooking;
    controllerComment.text = widget.oBooking.comment!;
    _datePickerSelectedValue = booking.date;
  }

  //Function to load simulators list
  void setSimulators() async {
    _dropdownBoxItems.clear();
    await getVisibleSimulators().then((value) {
      boxes = value;
      for (Simulator box in boxes) {
        _dropdownBoxItems.add(DropdownMenuItem(
            value: box,
            child: Text(
              box.name,
              style: const TextStyle(color: Colors.blue),
            )));
        if (box.id == booking.simulatorId){_selectedBoxItem = box;}
      }
    });
    setSlots();
    setState(() {});
  }

  //Function to load available slots for a choice
  void setSlots() async {
    _isLoadingSlots = true;
    _dropdownSlotItems.clear();
    await getAvailabilityEdit(_selectedBoxItem!.id, _datePickerSelectedValue,
        _lengthSliderSelectedValue, booking.id!)
        .then((value) {
      List<String> slots = value;
      if (slots.isNotEmpty) {
        for (String slot in slots) {
          _dropdownSlotItems.add(DropdownMenuItem(
              value: slot,
              child: Text(
                slot,
                style: const TextStyle(color: Colors.blue),
              )));
          if (slot == booking.startTime.toString()){_selectedSlotItem = slot;}
        }
        _selectedSlotItem ??= _dropdownSlotItems[0].value;
      }
    });
    setState(() {});
    _isLoadingSlots = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Réserver une session",
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text("Type de session",
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                EditBNPRadioTypeWidget(
                  callback: (val) => setState(() {
                    _radioTypeSelectedValue = val;
                  }), type: booking.type,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Sélectionnez une date",
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                const SizedBox(
                  height: 5,
                ),
                EditBNPDatePickerWidget(
                  callback: (val) => setState(() {
                    _datePickerSelectedValue = DateTime.parse(val);
                    setSlots();
                  }), date: booking.date,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("Nombre de joueurs",
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                EditBNPPeopleSliderWidget(
                  callback: (val) => setState(() {
                    _peopleSliderSelectedValue = val;
                  }), people: booking.people,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("Nombre d'heure(s)",
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                EditBNPLengthSliderWidget(
                  callback: (val) => setState(() {
                    _lengthSliderSelectedValue = val;
                    setSlots();
                  }), length: booking.length,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("Sélectionnez une box",
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                DropdownButton(
                    value: _selectedBoxItem,
                    items: _dropdownBoxItems,
                    onChanged: (value) async {
                      setState(() {
                        _selectedBoxItem = value as Simulator;
                        setSlots();
                      });
                    }),
                const SizedBox(
                  height: 5,
                ),
                const Text("Sélectionnez une heure",
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                if (_isLoadingSlots == true) Column(
                  children: const [
                    SizedBox(height: 10,),
                    CircularProgressIndicator(),
                    SizedBox(height: 10,)
                  ],
                )
                else if (_dropdownSlotItems.isEmpty)
                  Column(
                    children: const [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          "Veuillez nous excuser, ce simulateur n'est pas disponible. Veuillez faire un autre choix",
                          style: TextStyle(color: Colors.black, fontSize: 15), textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                else
                  DropdownButton(
                      value: _selectedSlotItem,
                      items: _dropdownSlotItems,
                      onChanged: (value) {
                        setState(() {
                          _selectedSlotItem = value as String;
                        });
                      }),
                const Text("Commentaire",
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: controllerComment,
                    decoration:
                    const InputDecoration(border: UnderlineInputBorder()),
                    validator: (value) {
                      if (value!.length > 250){
                        return "Le commentaire ne doit pas excéder 250 charactères";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()){
                      print(_radioPaymentSelectedValue);
                      Booking oBooking = Booking(
                        booking.id,
                          _radioPaymentSelectedValue,
                          _radioTypeSelectedValue,
                          _peopleSliderSelectedValue,
                          _lengthSliderSelectedValue,
                          _selectedBoxItem!.id,
                          null,
                          controllerComment.text,
                          _datePickerSelectedValue,
                          _selectedSlotItem.toString());
                        Future bookingId = editBookingNP(oBooking);
                        bookingId.then((value) =>{
                          Navigator.of(context).popUntil((route) => route.isFirst),
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Réservation éditée'),
                                backgroundColor: Colors.green,
                              ))
                        }).catchError((error) {
                          print("Cannot edit booking");
                          throw error;
                        });
                    }
                  },
                  child: const Text("editer"),
                )
              ]),
        ),
      ),
    );
  }
}
