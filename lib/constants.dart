import 'package:flutter/material.dart';

const kLOG_TAG = "[OXOO]";
const kLOG_ENABLE = true;
String API_URL = "https://iose.djduduchat.com";

printLog(dynamic data) {
  if (kLOG_ENABLE) {
    print("$kLOG_TAG${data.toString()}");
  }
}
final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);
final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);
final loadingContainer = Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage("assets/images/splash_image.png"),
      fit: BoxFit.cover,

    ),

  ),
  child: null /* add child content here */,
);