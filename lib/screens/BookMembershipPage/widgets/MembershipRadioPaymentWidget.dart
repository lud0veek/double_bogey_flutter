import 'package:flutter/material.dart';

class MembershipRadioPaymentWidget extends StatefulWidget {
  final Function callback;
  const MembershipRadioPaymentWidget({Key? key, required this.callback}) : super(key: key);
  @override
  _MembershipRadioPaymentWidgetState createState() => _MembershipRadioPaymentWidgetState();
}

class _MembershipRadioPaymentWidgetState extends State<MembershipRadioPaymentWidget> {
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