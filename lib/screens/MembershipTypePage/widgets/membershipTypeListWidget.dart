import 'package:double_bogey_flutter/call/membershipCalls.dart';
import 'package:double_bogey_flutter/models/membershipType.dart';
import 'package:double_bogey_flutter/screens/Common/alertDialogWidget.dart';
import 'package:double_bogey_flutter/screens/MembershipTypePage/widgets/membershipTypeCardWidget.dart';
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

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('dd-MM-yyyy');
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        reverse: true,
        padding: const EdgeInsets.all(10),
        itemCount: widget.membershipTypes.length,
        itemBuilder: (context, i) {
          print("start -> i = $i");
          final membershipType = widget.membershipTypes[i];
          return MembershipTypeCardWidget(membershipType: widget.membershipTypes[i]);
        },
      ),
    );
  }
}
