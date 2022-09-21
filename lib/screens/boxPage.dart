import 'package:flutter/material.dart';

import '../call/simulatorCalls.dart';
import '../models/Simulator.dart';
import 'boxList.dart';

class BoxPage extends StatelessWidget {
  const BoxPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Box",
          style: TextStyle(color: Colors.lightBlue),
        ),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<Simulator>>(
        future: getSimulators(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Web api call error: ${snapshot.error}');
          }
          if (snapshot.hasData) {
            return BoxList(boxes: snapshot.requireData);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}