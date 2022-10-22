import 'package:double_bogey_flutter/call/usersCalls.dart';
import 'package:double_bogey_flutter/screens/ErrorPage/ErrorPage.dart';
import 'package:double_bogey_flutter/screens/HomePage/homePage.dart';
import 'package:double_bogey_flutter/screens/MyAccountPage/EditMyAccountPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/user.dart';

class ViewMyAccountPage extends StatelessWidget{
  const ViewMyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        title: const Text(
        "Mon compte",
        style: TextStyle(color: Colors.lightBlue),
    ),
    backgroundColor: Colors.black,
    ),
    body: FutureBuilder<User>(
      future: getUserInfo(),
        builder: (context, snapshot){
          if (snapshot.hasError){
            return ErrorPage();
          }
          if (snapshot.hasData){
            return Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Prénom: ", style: TextStyle(color: Colors.blue, fontSize: 20),),
                          Text(snapshot.data!.firstname.toString(), style: const TextStyle(fontSize: 20),),
                          const SizedBox(height: 15,),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Nom de famille: ", style: TextStyle(color: Colors.blue, fontSize: 20),),
                          Text(snapshot.data!.lastname.toString(), style: const TextStyle(fontSize: 20),),
                          const SizedBox(height: 15,),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Date de naissance: ", style: TextStyle(color: Colors.blue, fontSize: 20),),
                          Text(DateFormat('dd-MM-yyyy').format(snapshot.data!.birthdate), style: const TextStyle(fontSize: 20),),
                          const SizedBox(height: 15,),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Email: ", style: TextStyle(color: Colors.blue, fontSize: 20),),
                          Text(snapshot.data!.email.toString(), style: const TextStyle(fontSize: 20),),
                          const SizedBox(height: 15,),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Société: ", style: TextStyle(color: Colors.blue, fontSize: 20),),
                          Text(snapshot.data!.company.toString(), style: const TextStyle(fontSize: 20),),
                          const SizedBox(height: 15,),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Téléphone: ", style: TextStyle(color: Colors.blue, fontSize: 20),),
                          Text(snapshot.data!.phone.toString(), style: const TextStyle(fontSize: 20),),
                          const SizedBox(height: 15,),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Handicap: ", style: TextStyle(color: Colors.blue, fontSize: 20),),
                          Text(snapshot.data!.handicap.toString(), style: const TextStyle(fontSize: 20),),
                          const SizedBox(height: 15,),
                        ],
                      ),
                      const SizedBox(height: 25,),
                      ElevatedButton(style: ElevatedButton.styleFrom(fixedSize: const Size(125, 1),primary: Colors.blue),onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditMyAccountPage(oUser: snapshot.data!)));}
                        , child: const Text("Editer", style: TextStyle(fontSize: 14),),),
                    ],
                  ),
                ));
          }
          return const Center(child: CircularProgressIndicator());
        }
    )
    );
  }
}