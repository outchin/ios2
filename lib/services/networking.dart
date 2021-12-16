import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper  {
  NetworkHelper(this.myurl);
  final String myurl;


  Future getData ()  async{
    var url = Uri.parse(myurl);
    Response response = await get(url);
    if(response.statusCode == 200)
    {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    }else
    {
      return response.statusCode;
    }
  }



}