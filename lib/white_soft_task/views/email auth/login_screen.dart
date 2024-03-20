import 'package:flutter/material.dart';
import 'package:globalspace_task/white_soft_task/views/homepage/homepage.dart';
import 'package:globalspace_task/white_soft_task/views/email%20auth/registration.dart';

import '../../controller/firebase_helper.dart';

class Login extends StatelessWidget {
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Login")),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 100, right: 100, top: 100),
                  child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Text(
                    "Welcome back! Login with your credentials",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.contact_mail_outlined),
                        hintText: "Email ID"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.password),
                        hintText: "Password"),
                    controller: pass,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      String mail = email.text.trim();
                      String pwd = pass.text.trim();
          
                      FirebaseHelper()
                          .signIn(email: mail, password: pwd)
                          .then((result) {
                        if (result == null) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Homepage()));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(result)));
                        }
                      });
                    },
                    child: const Text('Login')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Registration()));
                    },
                    child: Text("Not a user ? register here!!"))
              ],
            ),
          ),
        ));
  }
}
