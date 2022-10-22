import 'package:flutter/material.dart';

class EditBNPLengthSliderWidget extends StatefulWidget {
  final int length;
  final Function callback;
  const EditBNPLengthSliderWidget({Key? key, required this.callback, required this.length}) : super(key: key);
  @override
  State<EditBNPLengthSliderWidget> createState() => _EditBNPLengthSliderWidgetState();
}

class _EditBNPLengthSliderWidgetState extends State<EditBNPLengthSliderWidget> {
  late double lengthSelectedValue;
  late int length = 8;
  late int division;

  @override
  void initState() {
    lengthSelectedValue = widget.length.toDouble();
    if(length == 1){
      division = 1;
    }
    else{
      division = length-1;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Text(lengthSelectedValue.toInt().toString(),
            style: const TextStyle(color: Colors.black)),
        SliderTheme(
          data: const SliderThemeData(
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7.5)),
          child: Slider(
            activeColor: Colors.blue,
            value: lengthSelectedValue,
            min: 1,
            max: length.toDouble(),
            divisions: division,
            onChanged: (double value) {
                setState(() {
                  lengthSelectedValue = value;
                });
            },
            onChangeEnd: (double value){
              widget.callback(lengthSelectedValue.toInt());
            },
          ),
        ),
      ],
    );
  }
}