import 'package:flutter/material.dart';
import 'Button.dart';
import 'InputField.dart';

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