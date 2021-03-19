import 'package:flutter/material.dart';
import 'Button.dart';
import 'InputField.dart';
import 'package:saveness/Login/LoginPage.dart';

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
          SizedBox(height: 40,
           ),
          Button(
          ),
      SizedBox(height: 20,),
          TextButton(

          child : Text("Alraedy have an account?",
            style: TextStyle(color: Colors.grey),

          ),
          onPressed: ()
            {  Navigator.pushNamed(context, '/LoginPage');},
          ),

          SizedBox(height: 40,

          ),

        ],
      ),);

  }
}