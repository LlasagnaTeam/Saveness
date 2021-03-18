import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var locationt = "";
  void loca() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      locationt;
    });
  }

  @override


  void getposition() async {
    var  position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lastlocation = await Geolocator.getLastKnownPosition();
    // print(lastlocation);
    locationt = "$position";
    print(locationt.split(","));
    print("$position");
    var doubleRE = RegExp(r"-?(?:\d*\.)?\d+(?:[eE][+-]?\d+)?");
    var numbers = doubleRE.allMatches(locationt).map((m) => double.parse(m[0])).toList();
    print(numbers);
    double x = numbers[0];
    double y = numbers[1];
   String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$x,$y';
    launch(googleUrl);
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("l mohem ikhdm"),
        centerTitle: true,
      ),
      body :
     Column(
        children : [ Container(

        child:  Text ("Inty tawa fi =  $locationt "),

    ),
      FlatButton(
      onPressed: () {
        getposition();
      },
        color: Colors.cyan,
        child : Text("INZEL HNE "),
      ), ])
    );
  }




}
