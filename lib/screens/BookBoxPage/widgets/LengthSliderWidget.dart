import 'package:flutter/material.dart';

class LengthSliderWidget extends StatefulWidget {
  final Function callback;
  const LengthSliderWidget({Key? key, required this.callback}) : super(key: key);
  @override
  State<LengthSliderWidget> createState() => _LengthSliderWidgetState();
}

class _LengthSliderWidgetState extends State<LengthSliderWidget> {
  double lengthSelectedValue = 1;

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
            max: 8,
            divisions: 7,
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