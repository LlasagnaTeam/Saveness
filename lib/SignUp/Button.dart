import 'package:flutter/material.dart';
import 'package:saveness/SignUp/InputField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class Button extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          return Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: Colors.red[500],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: FlatButton(
                  onPressed: () {
                    getemail();
                    FirebaseAuth auth = FirebaseAuth.instance;
                  },
                  child: Text("Sign up", style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),

                )


            ),
          );
        });
  }}
