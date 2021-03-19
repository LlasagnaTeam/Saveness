import 'package:flutter/material.dart';
import 'package:saveness/SignUp/signup.dart';
import 'package:saveness/Login/LoginPage.dart';

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
    return Scaffold(
      appBar:  AppBar(
        title: Text("Home page Saveness"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
            color: Colors.cyan[500],
            child: Center(
              child: FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child :   Text("Sign Up",style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),),

              ),
            ),
          )
        ],
      ),
    );
  }
}
