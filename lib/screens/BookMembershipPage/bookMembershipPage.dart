import 'package:double_bogey_flutter/call/bookingCalls.dart';
import 'package:double_bogey_flutter/call/simulatorCalls.dart';
import 'package:double_bogey_flutter/models/booking.dart';
import 'package:double_bogey_flutter/screens/BookBoxPage/widgets/DatePickerWidget.dart';
import 'package:double_bogey_flutter/screens/BookBoxPage/widgets/LengthSliderWidget.dart';
import 'package:double_bogey_flutter/screens/BookBoxPage/widgets/PeopleSliderWidget.dart';
import 'package:double_bogey_flutter/screens/BookBoxPage/widgets/RadioPaymentWidget.dart';
import 'package:double_bogey_flutter/screens/BookBoxPage/widgets/RadioTypeWidget.dart';
import 'package:double_bogey_flutter/screens/BookBoxPage/widgets/VivawalletWebviewWidget.dart';
import 'package:double_bogey_flutter/screens/BookMembershipPage/widgets/MembershipDatePickerWidget.dart';
import 'package:double_bogey_flutter/screens/BookMembershipPage/widgets/MembershipLengthSliderWidget.dart';
import 'package:double_bogey_flutter/screens/BookMembershipPage/widgets/MembershipPeopleSliderWidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../call/paymentCalls.dart';
import '../../models/Simulator.dart';
import '../ErrorPage/ErrorPage.dart';

var formatter = DateFormat('dd-MM-yyyy');
final _formKey = GlobalKey<FormState>();

class BookMembershipPage extends StatefulWidget {
  final int membershipLength;
  final int membershipPeople;
  final int membershipId;

  const BookMembershipPage({Key? key, required this.membershipLength, required this.membershipPeople, required this.membershipId}) : super(key: key);

  @override
  State<BookMembershipPage> createState() => _BookMembershipPageState();
}

class _BookMembershipPageState extends State<BookMembershipPage> {
  //Variables for comment input
  final controllerComment = TextEditingController();
  String commentInput = '';

  //Form's variables
  DateTime _datePickerSelectedValue = DateTime.now();
  final String _radioTypeSelectedValue = "membership";
  late int _peopleSliderSelectedValue = 1;
  late int _lengthSliderSelectedValue = 1;

  //Various variables
  late List<Simulator> boxes;
  final List<DropdownMenuItem<Simulator>> _dropdownBoxItems = [];
  final List<DropdownMenuItem<String>> _dropdownSlotItems = [];
  Simulator? _selectedBoxItem;
  String? _selectedSlotItem;
  bool _isLoadingSlots = false;

  @override
  void initState() {
    super.initState();
    setSimulators();
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
      }
      _selectedBoxItem = _dropdownBoxItems[0].value;
    });
    setSlots();
    setState(() {});
  }

  //Function to load available slots for a choice
  void setSlots() async {
    _isLoadingSlots = true;
    _dropdownSlotItems.clear();
    await getAvailability(_selectedBoxItem!.id, _datePickerSelectedValue,
            _lengthSliderSelectedValue)
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
        }
        _selectedSlotItem = _dropdownSlotItems[0].value;
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
                const Text("Sélectionnez une date",
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                const SizedBox(
                  height: 5,
                ),
                MembershipDatePickerWidget(
                  callback: (val) => setState(() {
                    _datePickerSelectedValue = DateTime.parse(val);
                    setSlots();
                  }),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("Nombre de joueurs",
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                MembershipPeopleSliderWidget(
                  callback: (val) => setState(() {
                    _peopleSliderSelectedValue = val;
                  }), people: widget.membershipPeople,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("Nombre d'heure(s)",
                    style: TextStyle(color: Colors.black, fontSize: 17)),
                MembershipLengthSliderWidget(
                  callback: (val) => setState(() {
                    _lengthSliderSelectedValue = val;
                    setSlots();
                  }), length: widget.membershipLength,
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
                  height: 15,
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()){
                      Booking oBooking = Booking(
                          0,
                          "membership",
                          "membership",
                          _peopleSliderSelectedValue,
                          _lengthSliderSelectedValue,
                          _selectedBoxItem!.id,
                          widget.membershipId,
                          controllerComment.text,
                          _datePickerSelectedValue,
                          _selectedSlotItem.toString());
                        Future bookingId = createBooking(oBooking);
                        bookingId.then((value) =>{
                          print("Membership"),
                          print("Booking id: $value"),
                          Navigator.of(context).popUntil((route) => route.isFirst),
                        ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                        content: Text('Réservation validée'),
                          backgroundColor: Colors.green,
                        ))
                        }).catchError((error) {
                          print("Cannot create booking");
                          throw error;
                        });
                    }
                    },
                  child: const Text("Réserver"),
                )
              ]),
        ),
      ),
    );
  }
}
