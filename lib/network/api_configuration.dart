import 'dart:convert';
import '../config.dart';

class ConfigApi {
  String getApiUrl() {
    //return Config.apiServerUrl + "v130"; //FIX BY ZG
    return Config.apiServerUrl;
  }

  Map<String, String> getHeaders() {
    /*authorization*/
    String username = 'admin';
    String password = '1234';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));

    print("basic Auth is");
    print(basicAuth);
    /*headers */
    Map<String, String> headers = {'API-KEY': Config.apiKey, 'authorization': basicAuth};
    return headers;
  }
}
