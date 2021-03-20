import 'package:flutter/material.dart';
import 'package:saveness/SignUp/signup.dart';
import 'package:saveness/Login/LoginPage.dart';
import 'package:saveness/Button.dart';

void main() {
  runApp(MaterialApp(
    home : Home(),
  ));
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.blue[500],
              Colors.blue[300],
              Colors.blue[400],
            ])
        ),
        child: Center(

    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[

      Container(
        height: 550.0,
        width: 300.0,
        color: Colors.transparent,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children : [
              Center(
                child: Text("Welcome To ",style: TextStyle(color: Colors.red, fontSize: 20),),
              ),
              Center(
                child: Text("Save'ness  ",style: TextStyle(color: Colors.red, fontSize: 25),),
              ),
              SizedBox(height: 30.0),
         Center( //
           child : Button1(),),
              SizedBox(height: 5.0),
              Button2(),


            ] ,)

            )),

    ]
    ),)
    );



  }
}
