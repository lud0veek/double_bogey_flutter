import 'package:flutter/material.dart';

class EditBNPRadioTypeWidget extends StatefulWidget {
  final Function callback;
  final String type;
  const EditBNPRadioTypeWidget({Key? key, required this.callback, required this.type}) : super(key: key);
  @override
  _EditBNPRadioTypeWidgetState createState() => _EditBNPRadioTypeWidgetState();
}

class _EditBNPRadioTypeWidgetState extends State<EditBNPRadioTypeWidget> {
  late String radioTypeValue;

  void handleRadioValueChanged(String? value) {
    setState(() {
      radioTypeValue = value!;
      widget.callback(radioTypeValue);
    });
  }

  @override
  void initState() {
    radioTypeValue = widget.type;
    super.initState();
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