import 'package:flutter/material.dart';
import 'package:saveness/Login/InputField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:saveness/testba3dlogin.dart';

class Button extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        color: Colors.cyan[500],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child : FlatButton(
          onPressed: () async { try {
            UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: email,
                password: password );
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              print('No user found for that email.');
            } else if (e.code == 'wrong-password') {
              print('Wrong password provided for that user.');
            }
            else
            {
              print(email);
              print(password);
              Navigator.push(
                context,  MaterialPageRoute(builder: (context) => test() ),);
            }
          }
          },
          child :   Text("Login",style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold
          ),),

        )


      ),
    );
  }
}