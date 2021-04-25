import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'file:///C:/Users/Mehdi/AndroidStudioProjects/Saveness-Saveness/lib/allscreens/mainscreen.dart';
import 'file:///C:/Users/Mehdi/AndroidStudioProjects/Saveness-Saveness/lib/allscreens/register.dart';
import 'file:///C:/Users/Mehdi/AndroidStudioProjects/Saveness-Saveness/lib/main.dart';
import 'package:saveness/allscreens/Page1.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
TextEditingController emailTextEditingController = TextEditingController();
TextEditingController passwordTextEditingController = TextEditingController();
String y =emailTextEditingController.text.trim();
// String get y => L.y;

class LoginScreen extends StatelessWidget
{
  static const String idScreen = "login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 65.0,),
          SizedBox(height: 1.0,),
          Text(
            "You can login here",
            style: TextStyle(fontSize: 41.0, color: Colors.blueAccent),
            textAlign: TextAlign.center,
          ),

        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 1.0,),
              TextField(
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText:"Email",
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
                  labelText:"Password",
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
                      "Login",
                          style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
               shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
               ),
                onPressed: ()
                {
                  if(!emailTextEditingController.text.contains("@"))
                  {
                    displayToastMessage("you email must contain @", context);
                  }
                  else if(passwordTextEditingController.text.isEmpty)
                  {
                    displayToastMessage("you must enter your password", context);
                  }
                  else
                  {


                    loginAndAuthUser(context);


                  }
                },
              ),
            ],
          ),
        ),

          FlatButton(
            onPressed: (){


                Navigator.pushNamedAndRemoveUntil(context, RegisterationScreen.idScreen, (route) => false);


            },
            child: Text(
              "DO not have an account? Register here",
            ),
          ),
        ],
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void loginAndAuthUser(BuildContext context) async
  {
    final  User firebaseUser = (await _firebaseAuth.signInWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text
    ).catchError((errMgs){
      displayToastMessage("Error: " + errMgs.toString(), context);
    })).user;

    if(firebaseUser != null)
    {
      getdata(emailTextEditingController.text.trim());
      usersRef.child(firebaseUser.uid).once().then((DataSnapshot snap){

        if(snap.value != null  )

        {

          if (msg == 1)
          {
            Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => true);
            print("Mahbee mahbee");

            displayToastMessage("Now you are logged-in as a Saver ", context);

          }
          else {
            Navigator.pushNamedAndRemoveUntil(context, Page1.idScreen, (route) => false);
            print("la belmosta7il");
            displayToastMessage("ghalet  fil adressa  yna3n jed aslk",context);
          }

        }
        else
          {
            _firebaseAuth.signOut();
             displayToastMessage("this user doesn't exist, please create an account ", context);
          }
      });

    }
    else
    {
      //error occured - display error msg
      displayToastMessage("Error occured, can not sign in ", context);
    }
  }
}


class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        return Text("loading");
      },
    );
  }
}
var msg;
void  getdata(String mail) async {

  FirebaseFirestore.instance
      .collection('users')
      .doc(mail)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
     msg =  documentSnapshot["Saver"];
      print(msg);
      print(msg.runtimeType);
    }
  });

}
int Hetlkhra()
{
  return msg;
}