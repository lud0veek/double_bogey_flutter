import 'package:flutter/material.dart';

class MembershipLengthSliderWidget extends StatefulWidget {
  final int length;
  final Function callback;
  const MembershipLengthSliderWidget({Key? key, required this.callback, required this.length}) : super(key: key);
  @override
  State<MembershipLengthSliderWidget> createState() => _MembershipLengthSliderWidgetState();
}

class _MembershipLengthSliderWidgetState extends State<MembershipLengthSliderWidget> {
  double lengthSelectedValue = 1;
  late int length;
  late int division;

  @override
  void initState() {
    length = widget.length;
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