import 'package:flutter/material.dart';

class MembershipPeopleSliderWidget extends StatefulWidget {
  final int people;
  final Function callback;
  const MembershipPeopleSliderWidget({Key? key, required this.callback, required this.people}) : super(key: key);
  @override
  State<MembershipPeopleSliderWidget> createState() => _MembershipPeopleSliderWidgetState();
}

class _MembershipPeopleSliderWidgetState extends State<MembershipPeopleSliderWidget> {
  double peopleSelectedValue = 1;
  late int people;
  late int division;

  @override
  void initState() {
    people = widget.people;
    if(people == 1){
      division = 1;
    }
    else{
      division = people-1;
    }
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
            min: 1,
            max: people.toDouble(),
            divisions: division,
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