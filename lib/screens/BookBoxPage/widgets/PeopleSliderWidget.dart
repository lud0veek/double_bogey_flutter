import 'package:flutter/material.dart';

class PeopleSliderWidget extends StatefulWidget {
  final Function callback;
  const PeopleSliderWidget({Key? key, required this.callback}) : super(key: key);
  @override
  State<PeopleSliderWidget> createState() => _PeopleSliderWidgetState();
}

class _PeopleSliderWidgetState extends State<PeopleSliderWidget> {
  double peopleSelectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Text(peopleSelectedValue.toInt().toString(),
            style: const TextStyle(color: Colors.black)),
        SliderTheme(
          data: const SliderThemeData(
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7.5)),
          child: Slider(
            activeColor: Colors.blue,
            value: peopleSelectedValue,
            min: 1,
            max: 4,
            divisions: 3,
            onChanged: (double value) {
              setState(() {
                peopleSelectedValue = value;
              });
            },
            onChangeEnd: (double value) {
              widget.callback(peopleSelectedValue.toInt());
            },
          ),
        ),
      ],
    );
  }
}