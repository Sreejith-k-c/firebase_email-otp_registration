import 'package:flutter/material.dart';
import 'package:globalspace_task/white_soft_task/views/email%20auth/login_screen.dart';
import '../../controller/firebase_helper.dart';

class Registration extends StatefulWidget {
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var formkey = GlobalKey<FormState>();
  var uname = TextEditingController();
  var email = TextEditingController();
  var pass = TextEditingController();
  var cpass = TextEditingController();
  bool passvisibility1 = true;
  bool passvisibility2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 100, right: 100, top: 100),
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text(
                  "Create an Account, It's free",
                  style: TextStyle(fontSize: 10),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: uname,
                  validator: (email) {
                    if (email!.isEmpty) {
                      return "Name is required";
                    } else
                      return null;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      hintText: "Name",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: email,
                  validator: (username) {
                    if (username!.isEmpty ||
                        !username.contains("@") ||
                        !username.contains(".")) {
                      return "Fields are empty or Invalid";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Email ID",
                      prefixIcon: Icon(Icons.contact_mail_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (pass1) {
                    if (pass1!.isEmpty || pass1.length < 6) {
                      return "Fields are empty or Password length must be greaterthan 6";
                    } else {
                      return null;
                    }
                  },
                  controller: pass,
                  obscuringCharacter: "*",
                  obscureText: passvisibility1,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (passvisibility1 == true) {
                                passvisibility1 = false;
                              } else {
                                passvisibility1 = true;
                              }
                            });
                          },
                          icon: Icon(passvisibility1 == true
                              ? Icons.visibility_off_sharp
                              : Icons.visibility)),
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (pass2) {
                    if (pass2!.isEmpty || pass2.length < 6) {
                      return "Password length must be greater than 6";
                    } else if (pass.text != cpass.text) {
                      return "Password not matching";
                    } else {
                      return null;
                    }
                  },
                  controller: cpass,
                  obscuringCharacter: "*",
                  obscureText: passvisibility2,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (passvisibility2 == true) {
                                passvisibility2 = false;
                              } else {
                                passvisibility2 = true;
                              }
                            });
                          },
                          icon: Icon(passvisibility2 == true
                              ? Icons.visibility_off_sharp
                              : Icons.visibility)),
                      hintText: "Conform Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    String mail = email.text.trim();
                    String pwd = pass.text.trim();

                    FirebaseHelper()
                        .signUp(email: mail, password: pwd)
                        .then((result) {
                      if (result == null) {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Login()));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(result)));
                      }
                    });
                  },
                  child: Text('Register'))
            ],
          ),
        )));
  }
}
