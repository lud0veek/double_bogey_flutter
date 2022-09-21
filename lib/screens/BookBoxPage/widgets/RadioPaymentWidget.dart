import 'package:flutter/material.dart';

class RadioPaymentWidget extends StatefulWidget {
  final Function callback;
  const RadioPaymentWidget({Key? key, required this.callback}) : super(key: key);
  @override
  _RadioPaymentWidgetState createState() => _RadioPaymentWidgetState();
}

class _RadioPaymentWidgetState extends State<RadioPaymentWidget> {
  String radioPaymentValue = "online";

  void handleRadioValueChanged(String? value) {
    setState(() {
      radioPaymentValue = value!;
      widget.callback(radioPaymentValue.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio<String>(
            fillColor: MaterialStateColor.resolveWith((states) => Colors.blue),
            value: "online",
            groupValue: radioPaymentValue,
            onChanged: handleRadioValueChanged,
          ),
          const Text(
            "En ligne",
            style: TextStyle(color: Colors.blue, fontSize: 17),
          ),
          Radio<String>(
            fillColor: MaterialStateColor.resolveWith((states) => Colors.blue),
            value: "cash",
            groupValue: radioPaymentValue,
            onChanged: handleRadioValueChanged,
          ),
          const Text(
            "Sur place",
            style: TextStyle(color: Colors.blue, fontSize: 17),
          ),
        ],
      ),
    );
  }
}