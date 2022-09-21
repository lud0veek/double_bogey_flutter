import 'package:double_bogey_flutter/call/membershipTypeCalls.dart';
import 'package:double_bogey_flutter/models/membershipType.dart';
import 'package:double_bogey_flutter/screens/ErrorPage/ErrorPage.dart';
import 'package:double_bogey_flutter/screens/MembershipTypePage/widgets/membershipTypeListWidget.dart';
import 'package:flutter/material.dart';

class MembershipTypePage extends StatelessWidget{
  const MembershipTypePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,title: const Text("Abonnements"),),
      body: FutureBuilder<List<MembershipType>>(
        future: getVisibleMembershipTypes(),
        builder: (context, snapshot){
          if (snapshot.hasError){
            return ErrorPage();
          }
          if (snapshot.hasData){
            return MembershipTypeListWidget(membershipTypes: snapshot.requireData);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}