import 'package:flutter/material.dart';
import 'package:saveness/SignUp/signup.dart';
import 'package:saveness/Login/LoginPage.dart';
import 'file:///C:/Users/Mehdi/AndroidStudioProjects/saveness/lib/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => Home(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/signup': (context) => SignUp(),
      '/LoginPage' : (context) => LoginPage(),
    },
  ));
}