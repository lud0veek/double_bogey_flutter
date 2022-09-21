import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class WheelPage extends StatefulWidget{
  const WheelPage({Key? key}) : super(key: key);

  @override
  State<WheelPage> createState() => _WheelPageState();
}

class _WheelPageState extends State<WheelPage> {
  String result = "";
  @override
  Widget build(BuildContext context) {
    StreamController<int> controller = StreamController<int>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Golf Wheel", style: TextStyle(color: Colors.blue),),
      ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            const SizedBox(height: 50,),
            Text("controller",style: const TextStyle(
                color: Colors.blue,
            fontSize: 50),
            ),
            Expanded(child: FortuneWheel(
              animateFirst: false,
              physics: NoPanPhysics(),
              selected: controller.stream,
              indicators: const <FortuneIndicator>[
                FortuneIndicator(
                    alignment: Alignment.topCenter,
                    child: TriangleIndicator(
                      color: Colors.black,
                    ))
              ],
              items: const [
                FortuneItem(child: Text('Putter')),
                FortuneItem(child: Text('SW')),
                FortuneItem(child: Text('P')),
                FortuneItem(child: Text('Iron9')),
                FortuneItem(child: Text('Iron8')),
                FortuneItem(child: Text('Iron7')),
                FortuneItem(child: Text('Iron6')),
                FortuneItem(child: Text('Iron5')),
                FortuneItem(child: Text('Wood5')),
                FortuneItem(child: Text('Wood3')),
                FortuneItem(child: Text('Driver')),
              ],
            ),
            ),
            ElevatedButton(onPressed: () {controller.add(Fortune.randomInt(3, 20));}, child: Text("Faire tourner"),),
            const SizedBox(height: 50,),
          ],
        )
    );
  }
}