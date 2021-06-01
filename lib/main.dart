import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'file:///C:/Users/Mehdi/AndroidStudioProjects/Saveness-Saveness/lib/allscreens/loginscreen.dart';
import 'file:///C:/Users/Mehdi/AndroidStudioProjects/Saveness-Saveness/lib/allscreens/mainscreen.dart';
import 'file:///C:/Users/Mehdi/AndroidStudioProjects/Saveness-Saveness/lib/allscreens/register.dart';
import 'file:///C:/Users/Mehdi/AndroidStudioProjects/Saveness-Saveness/lib/allscreens/Haha.dart';
import 'package:saveness/allscreens/Page1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




DatabaseReference usersRef = FirebaseDatabase.instance.reference().child("users");
FirebaseFirestore firestore = FirebaseFirestore.instance;

CollectionReference users = FirebaseFirestore.instance.collection('users');



var x;
var y;
 void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp2());

//await print(x);
}
//




class MyApp2 extends StatefulWidget
{
  // final int  x;
  // MyApp(this.x);
  @override
  _MyApp2State createState() => _MyApp2State();

}

class _MyApp2State extends State<MyApp2> {


  @override
  void initState() {
    super.initState();}
  Widget build(BuildContext context) {
//print(c);
   // print(FirebaseAuth.instance.currentUser.email);
       if ( FirebaseAuth.instance.currentUser == null  )
         return MaterialApp(
           title: "hahaha",

           home: LoginScreen(),

         );
       else
        return  MaterialApp(
      title: "hahaha",

      home: test(),

    );
  }
}


class test extends StatefulWidget {
  @override
  _testState createState() => _testState();
}
var s;
class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      home: FutureBuilder<DocumentSnapshot>(
          future:  FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser.email)
              .get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            s = Container(

              child :  SizedBox(

                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),

            );
            if ((snapshot.hasData) ) {
              Map<String, dynamic> data = snapshot.data.data();
              x=  data['Saver'];
              print(x);
              if (x == 1 )
              {
                s=  MainScreen();

              //      initialRoute:  MainScreen.idScreen

              }
              else {
                if (x==0)
                  s=  Page1();
              }
            }
            return s;
          }

        // MainScreen FirebaseAuth.instance.currentUser == null ? LoginScreen
        //     .idScreen : x==1 ? MainScreen.idScreen : Page1.idScreen ,



        // debugShowCheckedModeBanner: false,
      ),

    );
  }
}

void getdata2(String mail) async   {


  FirebaseFirestore.instance
      .collection('users')
      .doc(mail)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      x = documentSnapshot["Saver"];
print(x);

    }
  });

//return x;
}

var routes =
{
RegisterationScreen.idScreen: (context) => RegisterationScreen(),
LoginScreen.idScreen: (context) => LoginScreen(),
MainScreen.idScreen: (context) => MainScreen(),
Page1.idScreen: (context) => Page1(),

};
