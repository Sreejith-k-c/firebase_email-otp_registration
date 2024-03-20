import 'package:flutter/material.dart';
import '../../controller/firebase_helper.dart';
import '../email auth/login_screen.dart';

class Homepage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
          FirebaseHelper().signOut().then((result) =>
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login())));
        }, child: Text("SignOut")),
      ),
    );
  }
}