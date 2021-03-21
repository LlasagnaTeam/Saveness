import 'package:flutter/material.dart';
import 'package:saveness/Locationfn.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wifi_configuration/wifi_configuration.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';


void main() {
  runApp(MaterialApp(
    home: page(),
  ));

}

class page extends StatefulWidget {
  @override
  _pageState createState() => _pageState();

}

class _pageState extends State<page> {
  var locationt = "";
  void loca() {
    setState(() {
      locationt;
    });

  }
void turnonwifi() async {
  WifiConnectionStatus connectionStatus = await WifiConfiguration.connectToWifi("ssidName", "passName", "your android packagename");
  var listAvailableWifi = await WifiConfiguration.getWifiList();
  bool isConnected = await WifiConfiguration.isConnectedToWifi("ssidName");
  String isconnected = await WifiConfiguration.connectedToWifi();
}
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
        title : Text(" Test ama msh test"),
        centerTitle: true,
      ),
      body: Center(
        child: FlatButton(
          onPressed :  ()
              {
                turnonwifi();
                getposition();
              },
child : Text("Send Location "),
        ),
      ),
    );
  }
}
