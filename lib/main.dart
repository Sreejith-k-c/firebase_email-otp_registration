import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:globalspace_task/white_soft_task/views/mainpage/mainpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyC6NHz5Su4cm6C6jI8WQLl6WEUEL0UPIzA",
        projectId: "white-soft-6ba26",
        appId: '1:785697501268:android:74e61cee85f5f3fd0dfdc1',
        messagingSenderId: '',
        storageBucket: "white-soft-6ba26.appspot.com",
      ));  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
      color: Colors.indigo[900],
    );
  }
}