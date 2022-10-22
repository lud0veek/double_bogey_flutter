import 'package:double_bogey_flutter/screens/BookBoxPage/bookBoxPage.dart';
import 'package:double_bogey_flutter/screens/MembershipTypePage/membershipTypePage.dart';
import 'package:flutter/material.dart';

import '../../data/local.dart';
import '../notLoggedPage.dart';

class GamingPage extends StatelessWidget{
  const GamingPage({Key? key}) : super(key: key);

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
                      ElevatedButton(style: ElevatedButton.styleFrom(fixedSize: const Size(125, 1),primary: Colors.blue),onPressed: () async {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MembershipTypePage()));}, child: const Text("Abonnements",style: TextStyle(fontSize: 14),),),
                      const SizedBox(width: 60,),
                      ElevatedButton(style: ElevatedButton.styleFrom(fixedSize: const Size(125, 1),primary: Colors.blue),onPressed: () async {
                        if (isLoggedIn) {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BookBoxPage()));}
                      else {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NotLoggedPage()));}}
                        , child: const Text("Réserver",style: TextStyle(fontSize: 14),),)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const Text("Notre Espace", style: TextStyle(color: Colors.blue, fontSize: 25, fontFamily: 'AgentOrange'),textAlign: TextAlign.center,),
                  const SizedBox(height: 10,),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Découvrez l'ensemble de nos installations et des services que nous proposons autour du jeux-vidéo. Nous souhaitons rendre accessible à tous l'utilisation des jeux numériques dans un cadre de confiance.", style: TextStyle(color: Colors.black, fontSize: 17), textAlign: TextAlign.justify,),
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
                  ),child: Image.asset('media/img/gaming1.jpg',height: 200)),
                  const SizedBox(height: 20,),
                  const Text("Ambiance", style: TextStyle(color: Colors.blue, fontSize: 25, fontFamily: 'AgentOrange'),textAlign: TextAlign.center,),
                  const SizedBox(height: 10,),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Pour 1 à 4 personnes prenez place dans des sièges super confort avec un rafraichissement afin de profiter pleinement d’une belle partie entre amis. Un moment de détente en perspectiviste.", style: TextStyle(color: Colors.black, fontSize: 17), textAlign: TextAlign.justify,),
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
                  ),child: Image.asset('media/img/gaming2.jpg',height: 200,)),
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
                  ),child: Image.asset('media/img/gaming3.jpg',width: 350,)),
                  const SizedBox(height: 20,),
                  const Text("Que la partie commence!", style: TextStyle(color: Colors.blue, fontSize: 25, fontFamily: 'AgentOrange'),textAlign: TextAlign.center,),
                  const SizedBox(height: 10,),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Venez vous amuser de 1 à 4 joueurs sur les classique de la Nintendo Switch. Vous avez besoin d’espace pour vous exprimer quand vous jouer, une envie d’avoir une nouvelle expérience sur Switch? Dans un espace convivial et lounge lancez une partie jusqu’au bout de la nuit.", style: TextStyle(color: Colors.black, fontSize: 17), textAlign: TextAlign.justify,),
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
                  ),child: Image.asset('media/img/gaming4.jpg',width: 350,)),
                  const SizedBox(height: 20,),
                ]),
          ),
        )
    );
  }

}