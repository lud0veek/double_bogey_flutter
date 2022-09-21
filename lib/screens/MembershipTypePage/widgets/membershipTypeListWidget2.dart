import 'package:double_bogey_flutter/call/membershipCalls.dart';
import 'package:double_bogey_flutter/models/membershipType.dart';
import 'package:double_bogey_flutter/screens/Common/alertDialogWidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../ErrorPage/ErrorPage.dart';

class MembershipTypeListWidget extends StatefulWidget {
  final List<MembershipType> membershipTypes;
  const MembershipTypeListWidget({Key? key, required this.membershipTypes})
      : super(key: key);

  @override
  State<MembershipTypeListWidget> createState() =>
      _MembershipTypeListWidgetState();
}

class _MembershipTypeListWidgetState extends State<MembershipTypeListWidget> {
  int membershipId = 0;
  int membershipTypeId = 0;

  getValidMemberhsipId(int msId) async {
    await hasValidMembership(msId).then((result) => membershipId = result);
    print("external function - membershipId $msId");
  }
  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('dd-MM-yyyy');
    return ListView.builder(
      shrinkWrap: true,
      reverse: true,
      padding: const EdgeInsets.all(10),
      itemCount: widget.membershipTypes.length,
      itemBuilder: (context, i) {
        print(i);
        final membershipType = widget.membershipTypes[i];
        FutureBuilder<int>(
          future: hasValidMembership(widget.membershipTypes[i].id), // Run check for a single queryRow
          builder: (context, snapshot) {
            print("Future builder");
            if (snapshot.hasData) {
              return Card(
                color: Colors.blue,
                child: ListTile(
                    title: Text("test"),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(membershipType.description),
                        Text(
                            "${membershipType.peopleMax} personne(s) - ${membershipType.length} heure(s)"),
                        Text("${membershipType.maxPerWeek} x par semaine"),
                        Text("${membershipType.price.toString()}eur")
                      ],
                    ),
                    onTap: () => {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) =>
                          const AlertDialogWidget(
                            title: 'Confirmation',
                            content: 'Confirmer la demande d\'abonnement?',
                          ))
                    }),
              );
            } else {
              return Card(
                color: Colors.blue,
                child: ListTile(
                    title: Text("test"),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(membershipType.description),
                        Text(
                            "${membershipType.peopleMax} personne(s) - ${membershipType.length} heure(s)"),
                        Text("${membershipType.maxPerWeek} x par semaine"),
                        Text("${membershipType.price.toString()}eur")
                      ],
                    ),
                    onTap: () => {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) =>
                          const AlertDialogWidget(
                            title: 'Confirmation',
                            content: 'Confirmer la demande d\'abonnement?',
                          ))
                    }),
              );
            }
          },
        );
        print("Variable: $i-$membershipId");
        //TODO
        // Add Futur? Or add a widget?
        // https://stackoverflow.com/questions/55862681/how-to-get-use-a-list-from-future-and-use-it-inside-a-listview
        // https://stackoverflow.com/questions/59001341/flutter-future-function-is-calling-continuously
        if (membershipId == 0) {
          return Card(
            color: Colors.blue,
            child: ListTile(
                title: Text(membershipType.name),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(membershipType.description),
                    Text(
                        "${membershipType.peopleMax} personne(s) - ${membershipType.length} heure(s)"),
                    Text("${membershipType.maxPerWeek} x par semaine"),
                    Text("${membershipType.price.toString()}eur")
                  ],
                ),
                onTap: () => {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) =>
                      const AlertDialogWidget(
                        title: 'Confirmation',
                        content: 'Confirmer la demande d\'abonnement?',
                      ))
                }),
          );
        } else {
          return Card(
            color: Colors.red,
            child: ListTile(
                title: Text(membershipType.name),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(membershipType.description),
                    Text(
                        "${membershipType.peopleMax} personne(s) - ${membershipType.length} heure(s)"),
                    Text("${membershipType.maxPerWeek} x par semaine"),
                    Text("Membre")
                  ],
                ),
                onTap: () => {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) =>
                      const AlertDialogWidget(
                        title: 'Confirmation',
                        content: 'Confirmer la demande d\'abonnement?',
                      ))
                }),
          );
        }
      },
    );
  }
}
