import 'package:double_bogey_flutter/call/membershipCalls.dart';
import 'package:double_bogey_flutter/data/local.dart';
import 'package:double_bogey_flutter/screens/BookMembershipPage/bookMembershipPage.dart';
import 'package:flutter/material.dart';
import '../../../call/paymentCalls.dart';
import '../../../models/membershipType.dart';
import '../../BookBoxPage/widgets/VivawalletWebviewWidget.dart';
import '../../ErrorPage/ErrorPage.dart';

class MembershipTypeCardWidget extends StatefulWidget {
  final MembershipType membershipType;

  const MembershipTypeCardWidget({Key? key, required this.membershipType})
      : super(key: key);

  @override
  State<MembershipTypeCardWidget> createState() =>
      _MembershipTypeCardWidgetState();
}

class _MembershipTypeCardWidgetState extends State<MembershipTypeCardWidget> {
  late MembershipType oMembershipType;
  int membershipId = 0;
  int sessionLeft = 0;
  bool _visible = false;
  late Future<int> newMemberhsipId;
  late Future<String> orderCode;

  @override
  void initState() {
    oMembershipType = widget.membershipType;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (isLoggedIn) {
        await GetMembershipInfo();
        print(membershipId);
        print(sessionLeft);
      }
      _visible = true;
      setState(() {});
    });
    super.initState();
  }

  Future<bool> GetMembershipInfo() async {
    await hasValidMembership(oMembershipType.id)
        .then((value) => membershipId = value);
    if (membershipId > 0) {
      await getSessionLeft(membershipId).then((value) => sessionLeft = value);
    }
    setState(() {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    print("widget card");
    if (!isLoggedIn) {
      return AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 1000),
          child: Card(
            color: Colors.lightBlue,
            child: ListTile(
                title: Text(oMembershipType.name),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(oMembershipType.description),
                    Text(
                        "${oMembershipType.peopleMax} personne(s) - ${oMembershipType.length} heure(s)"),
                    Text("${oMembershipType.maxPerWeek} x par semaine"),
                    Text("Prix ${oMembershipType.price}")
                  ],
                ),),
          ));
    }
    if (membershipId == 0 || !isLoggedIn) {
      return AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 1000),
        child: Card(
          color: Colors.lightBlue,
          child: ListTile(
              title: Text(oMembershipType.name),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(oMembershipType.description),
                  Text(
                      "${oMembershipType.peopleMax} personne(s) - ${oMembershipType.length} heure(s)"),
                  Text("${oMembershipType.maxPerWeek} x par semaine"),
                  Text("Prix ${oMembershipType.price}")
                ],
              ),
              onTap: () =>
              {
                newMemberhsipId = createMembership(oMembershipType.id),
                newMemberhsipId.then((value) =>
                {
                  print("Payment en ligne"),
                  print("Membership id: $value"),
                  orderCode = createPaymentMembership(value),
                  orderCode.then((value) async =>
                  {
                    await Navigator.push(context, MaterialPageRoute(builder: (
                        context) =>
                        VivawalletWebviewWidget(orderCode: value,))),
                    Navigator.pop(context),
                  })
                }).catchError((error) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ErrorPage()));
                }
                ),
              }),
      ));
    }
    if (sessionLeft > 0) {
      return AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 1000),
        child: Card(
          color: Colors.green,
          child: ListTile(
            title: Text(oMembershipType.name),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(oMembershipType.description),
                Text(
                    "${oMembershipType.peopleMax} personne(s) - ${oMembershipType.length} heure(s)"),
                Text("${oMembershipType.maxPerWeek} x par semaine"),
                Text("Membre. Session(s) restante(s) $sessionLeft")
              ],
            ),
            onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookMembershipPage(membershipPeople: oMembershipType.peopleMax, membershipLength: oMembershipType.length, membershipId: membershipId,)))
            },
          ),
        ),
      );
    } else {
      return AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 1000),
        child: Card(
          color: Colors.redAccent,
          child: ListTile(
            title: Text(oMembershipType.name),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(oMembershipType.description),
                Text(
                    "${oMembershipType.peopleMax} personne(s) - ${oMembershipType.length} heure(s)"),
                Text("${oMembershipType.maxPerWeek} x par semaine"),
                const Text("Membre. Plus de session disponible.")
              ],
            ),
          ),
        ),
      );
    }
  }
}
