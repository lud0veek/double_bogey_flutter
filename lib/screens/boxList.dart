import 'package:flutter/material.dart';
import '../models/Simulator.dart';

class BoxList extends StatelessWidget{

  final List<Simulator> boxes;

  const BoxList({super.key, required this.boxes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: boxes.length,
      itemBuilder: (context, i){
        final box = boxes[i];
        return ListTile(
          title: Text("Name: ${box.name}",
            style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold
            ),),
          subtitle: Text("Est visible: ${box.isVisible}"),
        );
      },);
  }}