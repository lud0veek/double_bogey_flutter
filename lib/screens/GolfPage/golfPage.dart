import 'package:double_bogey_flutter/screens/BookBoxPage/bookBoxPage.dart';
import 'package:double_bogey_flutter/screens/MembershipTypePage/membershipTypePage.dart';
import 'package:double_bogey_flutter/screens/notLoggedPage.dart';
import 'package:flutter/material.dart';

import '../../data/local.dart';

class GolfPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                const SizedBox(height: 20,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(style: ElevatedButton.styleFrom(fixedSize: const Size(125, 1),primary: Colors.blue),onPressed: () async {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MembershipTypePage()));}, child: const Text("Abonnements", style: TextStyle(fontSize: 14),),),
                    const SizedBox(width: 60,),
                    ElevatedButton(style: ElevatedButton.styleFrom(fixedSize: const Size(125, 1),primary: Colors.blue),
                      onPressed: () async {
                      if (isLoggedIn) {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BookBoxPage()));}
                      else {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NotLoggedPage()));}
                      },
                      child: const Text("Réserver", style: TextStyle(fontSize: 14),),)
                  ],
                ),
                const SizedBox(height: 20,),
                const Text("Haute precision", style: TextStyle(color: Colors.blue, fontSize: 25, fontFamily: 'AgentOrange'),textAlign: TextAlign.center,),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Nous sommes équipés d'un des meilleurs trackers du marché! Oubliez les ratés ou les données imprécises. Le traceur Uneekor QED est un bijou de technologie qui analysera chacune de vos frappes sous tous les angles.", style: TextStyle(color: Colors.black, fontSize: 17), textAlign: TextAlign.justify,),
                ),
                const SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                    child: Image.asset('media/img/uneekor1.jpg',height: 200)),
                const SizedBox(height: 20,),
                const Text("Tous niveaux", style: TextStyle(color: Colors.blue, fontSize: 25, fontFamily: 'AgentOrange'),textAlign: TextAlign.center,),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Tout le monde passera un agréable moment! Nos logiciels s'adaptent à votre niveau. Vous êtes débutant? Vous pourrez travailler votre swing sur des parcours adaptés. Vous êtes confirmé? Libre à vous de vous aventurer sur l'herbe de Torrey Pines.", style: TextStyle(color: Colors.black, fontSize: 17), textAlign: TextAlign.justify,),
                ),
                const SizedBox(height: 20,),
                Container(decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),child: Image.asset('media/img/uneekor2.jpg',height: 200,)),
                const SizedBox(height: 20,),
                const Text("Spacieux", style: TextStyle(color: Colors.blue, fontSize: 25, fontFamily: 'AgentOrange'),textAlign: TextAlign.center,),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Nos installations de golf sont spacieuses et vous permettent de lâcher pleinement le tigre qui est en vous. Elles ont été pensées par des golfeurs, pour des golfeurs! Venez profiter de cet espace entre amis, entre collègues ou en famille.", style: TextStyle(color: Colors.black, fontSize: 17), textAlign: TextAlign.justify,),
                ),
                const SizedBox(height: 20,),
                Container(decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),child: Image.asset('media/img/db-full.jpg',width: 350,)),
                const SizedBox(height: 20,),
                const Text("Bar lounge", style: TextStyle(color: Colors.blue, fontSize: 25, fontFamily: 'AgentOrange'),textAlign: TextAlign.center,),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Notre bar est à votre disposition à tout moment. Que ce soit pour vous rafraîchir durant votre parcours, votre entrainement ou pour profiter d'un agréable moment entre amis. Quelques snacks sont aussi prévus au rendez-vous pour les plus gourmands.", style: TextStyle(color: Colors.black, fontSize: 17), textAlign: TextAlign.justify,),
                ),
                const SizedBox(height: 20,),
                Container(decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),child: Image.asset('media/img/db-bar.jpg',width: 350,)),
                const SizedBox(height: 20,),
              ]),
      ),
        )
    );
  }
  
}