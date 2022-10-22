import 'package:double_bogey_flutter/call/usersCalls.dart';
import 'package:flutter/material.dart';
import 'package:double_bogey_flutter/services/extString.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);
  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Réinitialiser mot de passe",
          style: TextStyle(color: Colors.lightBlue),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                  width: 400,
                  child: Text(
                    "Encodez l'email du compte pour lequel il faut effectuer la réinitialisation:",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  )),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 3.0),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez encoder un email';
                    }
                    if (!value.isValidEmail) {
                      return 'Veuillez encoder un email valide';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      resetPassword(emailController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'Si votre email est connu dans le système vous recevre un email')),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Envoyer'),
                ),
              ),
            ],
          )),
    );
  }
}
