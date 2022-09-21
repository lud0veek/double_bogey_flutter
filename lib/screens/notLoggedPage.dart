import 'package:flutter/material.dart';

class NotLoggedPage extends StatelessWidget{
  const NotLoggedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Réserver une session",
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Vous devez être connecté pour atteindre cette page"),
            SizedBox(height: 20,),
            ElevatedButton(style: ElevatedButton.styleFrom(fixedSize: const Size(125, 1),primary: Colors.blue),onPressed: () => Navigator.pop(context), child: Text("Retour"))
          ],
        ),
      ),
    );
  }
  
}