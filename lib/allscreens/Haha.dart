import 'package:flutter/material.dart';
import 'package:wifi_configuration/wifi_configuration.dart';




class wifion extends StatelessWidget {
  static const String idScreen = "mainpageuser";
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Test Wifi"),
        centerTitle: true,

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
