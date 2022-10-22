import 'package:flutter/material.dart';

class EditBPPeopleSliderWidget extends StatefulWidget {
  final Function callback;
  final int people;
  const EditBPPeopleSliderWidget({Key? key, required this.callback, required this.people}) : super(key: key);
  @override
  State<EditBPPeopleSliderWidget> createState() => _EditBPPeopleSliderWidgetState();
}

class _EditBPPeopleSliderWidgetState extends State<EditBPPeopleSliderWidget> {
  double peopleSelectedValue = 1;
  late int people;

  @override
  void initState() {
    people = widget.people;
    peopleSelectedValue = people.toDouble();
    super.initState();
  }

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
            min: peopleSelectedValue,
            max: peopleSelectedValue,
            divisions: 1,
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