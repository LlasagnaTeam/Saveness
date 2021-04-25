import 'package:flutter/material.dart';
import 'package:wifi_configuration/wifi_configuration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Mehdi/AndroidStudioProjects/Saveness-Saveness/lib/allscreens/loginscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';





class Page1 extends StatefulWidget
{
  static const String idScreen = "mainpageuser";
  @override
  _Page1State createState() => _Page1State();
}


class _Page1State extends State<Page1> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Main Screen"),
      ),


      drawer: Container(
        color: Colors.white,
        width: 255.0,
        child: Drawer(
          child: ListView(
            children: [
              //drawer header
              Container(
                height: 165.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      Image.asset("", height: 65.0, width: 65.0,),
                      SizedBox(width: 16.0,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Profile name", style: TextStyle(fontSize: 16.0),),
                          SizedBox(height: 6.0,),
                          Text("View profile"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // DividerWidget(),
              SizedBox(height: 12.0,),
              // drawer body controllers
              ListTile(
                leading: Icon(Icons.history),
                title: Text("History", style: TextStyle(fontSize: 15.0),),
              ),

              ListTile(
                leading: Icon(Icons.person),
                title: Text("Visit profile", style: TextStyle(fontSize: 15.0),),
              ),

              ListTile(
                leading: Icon(Icons.info),
                title: Text("xxx", style: TextStyle(fontSize: 15.0),),
              ),

              GestureDetector(
                onTap: ()
                {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(context, LoginScreen.idScreen, (route) => false);
                },
                child: ListTile(
                  leading: Icon(Icons.info),
                  title: Text("Sign out", style: TextStyle(fontSize: 15.0),),
                ),
              ),

            ],
          ),
        ),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () async {
            WifiConnectionStatus connectionStatus = await WifiConfiguration.connectToWifi("ssidName", "passName", "your android packagename");
            //This will return state of a connection
            //Package name is required to redirect user to application permission settings page to let user allow location permission
            //in case connecting with wifi

            var listAvailableWifi = await WifiConfiguration.getWifiList();
            //If wifi is available then device will get connected
            //In case of ios you will not get list of connected wifi an empty list will be available
            //As Apple does not allow to scan the available hotspot list
            //If you try to access with private api's then apple will reject the app


            bool isConnected = await WifiConfiguration.isConnectedToWifi("ssidName");
            //to get status if device connected to some wifi

            String isconnected = await WifiConfiguration.connectedToWifi();
            //to get current connected wifi name

          },

          child: Text("wifi"),
          color: Colors.blue,

        ),
      ),
    );
  }
}




