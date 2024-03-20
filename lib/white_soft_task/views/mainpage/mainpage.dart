import 'package:flutter/material.dart';
import 'package:globalspace_task/white_soft_task/views/phone_auth/phone_auth.dart';
import '../email auth/login_screen.dart';

class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 100,right:100,top: 100),
                child: Text("Hello There!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              ),
              SizedBox(
                height: 30,
              ),
              Image.asset("assets/images/main.png",height: 220,width: 300,),

              Padding(
                padding:  const EdgeInsets.only(top: 50),
                child: ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      minimumSize: Size(250, 50),
                    ),
                    child: Text("Email and Password",style: TextStyle(color: Colors.black))),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Phone()));
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      minimumSize: Size(250, 50),
                    ),
                    child: Text("Phone OTP",style: TextStyle(color: Colors.black),)),
              ),


            ],
          ),
        )

    );
  }
}