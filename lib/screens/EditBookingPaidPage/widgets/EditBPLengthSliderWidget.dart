import 'package:flutter/material.dart';

class EditBPLengthSliderWidget extends StatefulWidget {
  final Function callback;
  final int length;
  const EditBPLengthSliderWidget({Key? key, required this.callback, required this.length}) : super(key: key);
  @override
  State<EditBPLengthSliderWidget> createState() => _EditBPLengthSliderWidgetState();
}

class _EditBPLengthSliderWidgetState extends State<EditBPLengthSliderWidget> {
  double lengthSelectedValue = 1;
  late int length;

  @override
  void initState() {
    length = widget.length;
    lengthSelectedValue = length.toDouble();
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
            min: lengthSelectedValue,
            max: lengthSelectedValue,
            divisions: 1,
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