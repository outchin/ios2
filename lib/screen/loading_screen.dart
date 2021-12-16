import 'dart:convert';

import 'package:oxoo/add_key.dart';
import 'package:oxoo/screen/add_key.dart';
import 'package:oxoo/screen/landing_screen.dart';


import 'package:oxoo/service/networking.dart';
import 'package:oxoo/service/weather.dart';
import 'package:oxoo/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:package_info/package_info.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../strings.dart';
class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  WeatherModel weatherModel = WeatherModel();
  @override
  void initState() {
    // TODO: implement initState
    isUpdateAvailable();
    super.initState();
  }

  void isUpdateAvailable() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String version = packageInfo.version;

    print('ves');
    String ver = version[0];
    int appVersionCode = int.parse(ver);


    WeatherModel weatherModel = WeatherModel();
    var configData = await weatherModel.getConfig();





    String latestUpdateVersionCodeStr = configData['apk_version_info']['version_code'];
    int latestUpdateVersionCode = int.parse(latestUpdateVersionCodeStr);
    print('version code is' + latestUpdateVersionCode.toString());



    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userKey = prefs.getString("userKey") ?? "null";
    String expire_date = prefs.getString("expire_date") ?? "null";
    print("this is before");
    if(userKey != 'null')  //user has key
      {
        AppContent.expire_date = expire_date;
        print("user has key");
        print(userKey);


        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
          return LandingScreen();
        }),
              (route) => false,
        );
      }else //user doesn't has key
        {
      print("user doesn t has key");
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
        return AddKeyPage();
      }),
        (route) => false,
      );
          // print('user do not have key 1');
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return  (pageLink: configData['apk_version_info']['page_link']);
          // }));
        }


  }

  Widget _alertDialog() {
    return AlertDialog(

      title: const Text('Warning'),
      content: const Text('Cost of a Premium Key is 2\$/month'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('CANCEL'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('BUY'),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: loadingContainer

    );
  }


}
