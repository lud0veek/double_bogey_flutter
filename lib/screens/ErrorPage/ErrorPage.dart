import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Veuillez nous excuser, vous avez rencontré une erreur"),
          SizedBox( height: 10,),
          ElevatedButton(
              onPressed: () => Navigator.pop(context), child: Text("Retour"))
        ],
      ),
    );
  }

}