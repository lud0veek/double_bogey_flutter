import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget{
  final String title;
  final String content;
  const AlertDialogWidget({Key? key, required this.title, required this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text(title)),
      content: Text(content, textAlign: TextAlign.center,),
      actions: <Widget>[
        TextButton(onPressed: () => Navigator.pop(context, "Cancel"), child: const Text("Annuler")),
        TextButton(onPressed: () => Navigator.pop(context, "Ok"), child: const Text("Ok"))
      ],
    );
  }

}