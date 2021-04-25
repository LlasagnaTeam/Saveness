import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'file:///C:/Users/Mehdi/AndroidStudioProjects/Saveness-Saveness/lib/allscreens/loginscreen.dart';
import 'file:///C:/Users/Mehdi/AndroidStudioProjects/Saveness-Saveness/lib/allscreens/mainscreen.dart';
import 'file:///C:/Users/Mehdi/AndroidStudioProjects/Saveness-Saveness/lib/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

TextEditingController nameTextEditingController = TextEditingController();
TextEditingController emailTextEditingController = TextEditingController();
TextEditingController phoneTextEditingController = TextEditingController();
TextEditingController passwordTextEditingController = TextEditingController();
class RegisterationScreen extends StatelessWidget
{
static const String idScreen = "register";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 65.0,),
          SizedBox(height: 1.0,),
          Text(
            "Welcome to Saveness ",
            style: TextStyle(fontSize: 41.0, color: Colors.blueAccent),
            textAlign: TextAlign.center,
          ),
          Text(
            "You can register here",
            style: TextStyle(fontSize: 25.0, color: Colors.blueAccent),
            textAlign: TextAlign.center,
          ),


          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 1.0,),
                TextField(
                  controller: nameTextEditingController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText:"Enter you full name",
                    labelStyle: TextStyle(
                      fontSize: 14.0,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.0,
                    ),
                  ),
                  style: TextStyle(fontSize: 14.0),
                ),


                SizedBox(height: 1.0,),
                TextField(
                  controller: emailTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText:"Enter your email",
                    labelStyle: TextStyle(
                      fontSize: 14.0,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.0,
                    ),
                  ),
                  style: TextStyle(fontSize: 14.0),
                ),

                SizedBox(height: 1.0,),
                TextField(
                  controller: phoneTextEditingController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText:"Enter you phone number",
                    labelStyle: TextStyle(
                      fontSize: 14.0,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.0,
                    ),
                  ),
                  style: TextStyle(fontSize: 14.0),
                ),


                SizedBox(height: 1.0,),
                TextField(
                  controller: passwordTextEditingController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText:"Enter your password",
                    labelStyle: TextStyle(
                      fontSize: 14.0,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.0,
                    ),
                  ),
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(height: 15.0,),
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Container(
                    height: 50.0,
                    child: Center(
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  onPressed: ()
                  {
                    if(nameTextEditingController.text.length > 30 )
                      {
                     displayToastMessage("your name must no exceed 30 letters ", context);
                      }
                    else if(!emailTextEditingController.text.contains("@"))
                    {
                      displayToastMessage("you email must contain @", context);
                    }
                    else if(phoneTextEditingController.text.isEmpty)
                    {
                      displayToastMessage("you must enter your phone number", context);
                    }
                    else if(passwordTextEditingController.text.length <6)
                    {
                      displayToastMessage("your password must not exceed 6 characters", context);
                    }
                    else
                      {
                        registerNewUser(context );
                      }
                  },
                ),
              ],
            ),
          ),

          FlatButton(
            onPressed: (){
              Navigator.pushNamedAndRemoveUntil(context, LoginScreen.idScreen, (route) => false);
            },
            child: Text(
                "Already have an account? Login here",
            ),
          ),
        ],
      ),
    );
  }

 final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void registerNewUser(BuildContext context) async
  {
    final User firebaseUser = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text
    ).catchError((errMgs){
        displayToastMessage("Error: " + errMgs.toString(), context);
    })).user;

    if(firebaseUser != null)  //user created
    {
      // save user info to database
      Map userDataMap = {
       "name": nameTextEditingController.text.trim(),
       "email": emailTextEditingController.text.trim(),
       "phone": phoneTextEditingController.text.trim(),
     };
      usersRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage("account created ", context);
      addUser();
      Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
    }
    else
      {
        //error occured - display error msg
        displayToastMessage("New user account has been not created ", context);
      }
  }
}

displayToastMessage(String message, BuildContext context)
{
  Fluttertoast.showToast(msg: message);
}

CollectionReference users = FirebaseFirestore.instance.collection('users');
Future<void> addUser() {

  return users.doc(emailTextEditingController.text.trim())
      .set({
    'Name': nameTextEditingController.text.trim(), // John Doe
    'Email': emailTextEditingController.text.trim(), // Stokes and Sons
    'Phone': phoneTextEditingController.text.trim(), // 42
    'Saver' : 0
  })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}



