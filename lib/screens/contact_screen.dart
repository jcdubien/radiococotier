import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactScreen extends StatelessWidget {
  ContactScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5fd),
      body: Center(
        child: Container(
          /*height: 450,
          width: 400,*/
          margin: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 20,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 20,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 10,
                    spreadRadius: 1,
                    color: Colors.grey[300]!)
              ]),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Nous contacter',
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: 'Nom'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Requis';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'Email'),
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Requis*';
                    } else if (!EmailValidator.validate(email)) {
                      return 'Merci d entrer un mail valide';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: messageController,
                  decoration: const InputDecoration(hintText: 'Message'),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Requis';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 45,
                  width: 110,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: const Color(0xff151534),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(nameController.text);
                        print(emailController.text);
                        print(messageController.text);

                        nameController.clear();
                        emailController.clear();
                        messageController.clear();

                        String? encodeQueryParameters(Map<String, String> params) {
                          return params.entries
                              .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                              .join('&');
                        }

                        final Uri emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: 'jcdubien@gmail.com',
                          query: encodeQueryParameters(<String, String>{
                            'subject': messageController.text
                          }),
                        );

                        launch(emailLaunchUri.toString());
                      }
                    },
                    child: const Text('Envoyer', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}