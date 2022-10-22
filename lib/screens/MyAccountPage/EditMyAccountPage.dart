import 'package:double_bogey_flutter/call/usersCalls.dart';
import 'package:double_bogey_flutter/screens/MyAccountPage/widgets/editUserBirthdateDatePickerWidget.dart';
import 'package:double_bogey_flutter/services/extString.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/user.dart';

class EditMyAccountPage extends StatefulWidget {
  final User oUser;
  const EditMyAccountPage({Key? key, required this.oUser}) : super(key: key);

  @override
  State<EditMyAccountPage> createState() => _EditMyAccountPageState();
}

class _EditMyAccountPageState extends State<EditMyAccountPage> {
  late final int id;
  late final String auth0Id;
  final lastnameController = TextEditingController();
  final firstnameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final handicapController = TextEditingController();
  final companyController = TextEditingController();
  final birthdateController = TextEditingController();
  late DateTime _datePickerSelectedValue;
  late final User oUser;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    oUser = widget.oUser;
    id = oUser.id;
    auth0Id = oUser.auth0Id!;
    firstnameController.text = oUser.firstname.toString();
    lastnameController.text = oUser.lastname.toString();
    phoneController.text = oUser.phone.toString();
    handicapController.text = oUser.handicap.toString();
    companyController.text = oUser.company.toString();
    emailController.text = oUser.email.toString();
    _datePickerSelectedValue = oUser.birthdate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    widthSize = (widthSize / 100) * 80;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Mon compte - edition",
            style: TextStyle(color: Colors.lightBlue),
          ),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: widthSize,
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Prénom",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    TextFormField(
                      controller: firstnameController,
                      style: const TextStyle(color: Colors.black, fontSize: 20),textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 0.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez indiquer votre prénom';
                        }
                        if (!value.isValidName) {
                          return 'Veuillez encoder un prénom valide';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Nom de famille:",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    TextFormField(
                      controller: lastnameController,
                      style: const TextStyle(color: Colors.black, fontSize: 20),textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 0.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez indiquer votre prénom';
                        }
                        if (!value.isValidName) {
                          return 'Veuillez encoder un prénom valide';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Email:",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    TextFormField(
                      controller: emailController,
                      style: const TextStyle(color: Colors.black, fontSize: 20),textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 0.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Téléphone:",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    TextFormField(
                      controller: phoneController,
                      style: const TextStyle(color: Colors.black, fontSize: 20),textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 0.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Date de naissance:",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    EditUserBirthdateDatePickerWidget(
                        callback: (val) => setState(() {
                          _datePickerSelectedValue = DateTime.parse(val);
                        }), birthdate: oUser.birthdate,),
                    const Text(
                      "Société:",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    TextFormField(
                      controller: companyController,
                      style: const TextStyle(color: Colors.black, fontSize: 20),textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 0.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const Text(
                      "Handicap:",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    TextFormField(
                      controller: handicapController,
                      style: const TextStyle(color: Colors.black, fontSize: 20),textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 0.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            User oUser = User(
                                id,
                                auth0Id,
                                firstnameController.text,
                                lastnameController.text,
                                _datePickerSelectedValue,
                                emailController.text,
                                companyController.text,
                                phoneController.text,
                                double.parse(handicapController.text.toString()),
                                "");
                            Future<int> userId = updateUser(oUser);
                            userId.then((value) => {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Vos informations ont été mises à jour')),
                              ),
                            Navigator.of(context).popUntil((route) => route.isFirst)
                            });
                          }
                        },
                        child: const Text('Envoyer'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
