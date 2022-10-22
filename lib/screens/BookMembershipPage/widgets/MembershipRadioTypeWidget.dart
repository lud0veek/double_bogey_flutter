import 'package:flutter/material.dart';

class MembershipRadioTypeWidget extends StatefulWidget {
  final Function callback;
  const MembershipRadioTypeWidget({Key? key, required this.callback}) : super(key: key);
  @override
  _MembershipRadioTypeWidgetState createState() => _MembershipRadioTypeWidgetState();
}

class _MembershipRadioTypeWidgetState extends State<MembershipRadioTypeWidget> {
  String radioTypeValue = "golf";

  void handleRadioValueChanged(String? value) {
    setState(() {
      radioTypeValue = value!;
      widget.callback(radioTypeValue);
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
            value: "golf",
            groupValue: radioTypeValue,
            onChanged: handleRadioValueChanged,
          ),
          const Text(
            "Golf",
            style: TextStyle(color: Colors.blue, fontSize: 17),
          ),
          Radio<String>(
            fillColor: MaterialStateColor.resolveWith((states) => Colors.blue),
            value: "gaming",
            groupValue: radioTypeValue,
            onChanged: handleRadioValueChanged,
          ),
          const Text(
            "Gaming",
            style: TextStyle(color: Colors.blue, fontSize: 17),
          ),
        ],
      ),
    );
  }
}