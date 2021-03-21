import 'package:flutter/material.dart';
import 'package:saveness/SignUp/signup.dart';
import 'Button.dart';
import 'InputField.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
class InputWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          SizedBox(height: 40,),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: InputField(),
          ),

          SizedBox(height: 30,),
          Button(
          ),
          SizedBox(height: 20,),
          Text(
            "Forgot password ?",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 5,

          ),
          TextButton(

            child : Text("Are you new here ?",
              style: TextStyle(color: Colors.grey),

            ),
            onPressed: ()
            {  Navigator.pushNamed(context, '/signup');},
          ),


          SizedBox(height: 20,

          ),
        ],
      ),);

  }
}