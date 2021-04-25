import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'file:///C:/Users/Mehdi/AndroidStudioProjects/Saveness-Saveness/lib/allscreens/loginscreen.dart';
import 'file:///C:/Users/Mehdi/AndroidStudioProjects/Saveness-Saveness/lib/allscreens/mainscreen.dart';
import 'file:///C:/Users/Mehdi/AndroidStudioProjects/Saveness-Saveness/lib/allscreens/register.dart';
import 'file:///C:/Users/Mehdi/AndroidStudioProjects/Saveness-Saveness/lib/allscreens/Haha.dart';
import 'package:saveness/allscreens/Page1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




FirebaseFirestore firestore = FirebaseFirestore.instance;

var x;
var y;
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 // FirebaseUser user = (await FirebaseAuth.instance)
 // y =  await getdata2(FirebaseAuth.instance.currentUser.email);
print(y);
    runApp(MyApp());
}
//

DatabaseReference usersRef = FirebaseDatabase.instance.reference().child("users");


class MyApp extends StatefulWidget
{

  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
//print(c);
    print(FirebaseAuth.instance.currentUser.email);

setState(() {
  y = getdata2(FirebaseAuth.instance.currentUser.email);

});
  //  print(msg);
print(y);
    return StreamBuilder <User> (

      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {

      if (snapshot.hasData) {

        if ( y == 1  )
          return MainScreen();
        else
          if (y==0)
            return Page1();

      }
        else {
          return LoginScreen();
      }
      }

    ); }
}


 Future <int> getdata2(String mail)  async {


  FirebaseFirestore.instance
      .collection('users')
      .doc(mail)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      x = documentSnapshot["Saver"];
      print(x);
      print(x.runtimeType);
    }
  });
  return x;
}

//   MaterialApp(
//   title: 'Saveness',
//   theme: ThemeData(
//   primarySwatch: Colors.blue,
//   visualDensity: VisualDensity.adaptivePlatformDensity,
//   ),
//
//   initialRoute: FirebaseAuth.instance.currentUser == null ? LoginScreen
//       .idScreen : y==1 ? MainScreen.idScreen : Page1.idScreen ,
//
//   routes:
//   {
//   RegisterationScreen.idScreen: (context) => RegisterationScreen(),
//   LoginScreen.idScreen: (context) => LoginScreen(),
//   MainScreen.idScreen: (context) => MainScreen(),
//   Page1.idScreen: (context) => Page1(),
//
//   },
//
//   debugShowCheckedModeBanner: false,
//   );
// }
