import 'dart:io';

import 'package:oxoo/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:oxoo/constants.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:device_info/device_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'landing_screen.dart';
import '../../strings.dart';
class AddKeyPage extends StatefulWidget {
  AddKeyPage({this.pageLink});

  final pageLink;

  @override
  _AddKeyPageState createState() => _AddKeyPageState();
}

class _AddKeyPageState extends State<AddKeyPage> {
  WeatherModel weatherModel = WeatherModel();

  late String userKey;

  _launchURL(String page_link) async {
    var url = page_link;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  bool isSwitched = true;

  Widget _buildKeyTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Key',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            onChanged: (value) {
              userKey = value;
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.vpn_key,
                color: Colors.white,
              ),
              hintText: 'Enter your key',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          String device_id = await getDeviceDetails();
          print(device_id);
          print(userKey);
          var checkCodeData = await weatherModel.checkCode(userKey, device_id);
          if (checkCodeData == 208) //key is not correct
          {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Sorry!'),
                content: const Text('Your key is invalid'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'CANCEL'),
                    child: const Text('CANCEL'),
                  ),
                ],
              ),
            );
          } else {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            prefs.setString("userKey", userKey);
            prefs.setString("device_id", device_id);
            prefs.setString("expire_date", checkCodeData[0]['registration_end_at']);
            AppContent.expire_date = checkCodeData[0]['registration_end_at'];
            //key is correct
            showDialog<String>(
              barrierDismissible: false, // user must tap button!
              // barrierDismissible: false, // user must tap button!
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Congratulations!'),
                content: const Text('Your key activation is successful'),
                actions: <Widget>[
                  TextButton(
                    // onPressed: () => Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //       return LandingScreen();
                    //
                    onPressed: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LandingScreen()),
                        (route) => false),
                    child: const Text('CONTINUE'),
                  ),
                ],
              ),
            );
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'CONTINUE',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildBuyKeyBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => showDialog<String>(
          // barrierDismissible: false, // user must tap button!
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Warning'),
            content: const Text('Cost of a Premium Key is 2\$/month'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('CANCEL'),
              ),
              TextButton(
                onPressed: () {
                  _launchURL(widget.pageLink);
                },
                child: const Text('BUY'),
              ),
            ],
          ),
        ),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'BUY KEY',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {
        _launchURL(widget.pageLink);
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text:
                  'Contact us in Page Message box if you need an assistant22 ',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<String> getDeviceDetails() async {
    String deviceName;
    String deviceVersion;
    String identifier = "";
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        deviceName = build.model;
        deviceVersion = build.version.toString();
        identifier = build.androidId; //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        deviceName = data.name;
        deviceVersion = data.systemVersion;
        identifier = data.identifierForVendor; //UUID for iOS
      }
    } on PlatformException {
      print('Failed to get platform version');
    }

//if (!mounted) return;
    return identifier;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Welcome to MySpectrum',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 30.0),
                          height: 200.0,
                          width: double.infinity,
                          child: Image.asset("assets/images/logo_small2.png")),
                      SizedBox(height: 30.0),
                      _buildKeyTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildLoginBtn(),
                      SizedBox(
                        height: 40.0,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
