import 'package:flutter/material.dart';
import 'package:saveness/SignUp/InputField.dart';
import 'package:saveness/SignUp/signup.dart';
import 'package:saveness/Login/LoginPage.dart';


class Button1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

          return Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: Colors.blue[500],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,  MaterialPageRoute(builder: (context) => SignUp() ),);
                  },
                  child: Text("Sign up", style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),

                )


            ),
          );
        }
  }
class Button2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

          return Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: Colors.blue[500],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: FlatButton(
                  onPressed: ()  {  Navigator.pushNamed(context, '/LoginPage');},
                  child: Text("Login", style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),

                )


            ),
          );
        }
  }
