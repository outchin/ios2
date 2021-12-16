
import 'package:oxoo/services/networking.dart';


import 'package:oxoo/constants.dart';
const apiKey = "00bca40b1b9c210aaa4185c2f4090042";
const openWeatherMapURL = "http://api.openweathermap.org/data/2.5/weather";

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    NetworkHelper networkHelper = NetworkHelper("$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  // Future<dynamic> getLocationWeather() async{
  //   Location location = Location();
  //   await location.getCurrentLocation();
  //
  //   var lati =location.lat;
  //   var longi =location.lon;
  //   NetworkHelper networkHelper = NetworkHelper("$openWeatherMapURL?lat=$lati&lon=$longi&appid=$apiKey&units=metric");
  //   var weatherData = await networkHelper.getData();
  //   return weatherData;
  // }

  Future<dynamic> getConfig() async{
    NetworkHelper networkHelper = NetworkHelper("$API_URL/config?code=");
    var configData = await networkHelper.getData();
    return configData;
  }
  Future<dynamic> check() async{
    NetworkHelper networkHelper = NetworkHelper("$API_URL/config?code=");
    var configData = await networkHelper.getData();
    return configData;
  }


  Future<dynamic> checkCode(String code,String device_id) async{
    NetworkHelper networkHelper = NetworkHelper("$API_URL/checkCode4?code=$code&device_id=$device_id&type=ios");
    var checkCodeData = await networkHelper.getData();
    return checkCodeData;
  }



  Future<dynamic> homeContentForAndroid(String userCode) async{
    NetworkHelper networkHelper = NetworkHelper("$API_URL/home_content_for_android?code=$userCode&os_type=ios");
    var homeContentForAndroidData = await networkHelper.getData();
    return homeContentForAndroidData;
  }

  Future<dynamic> allTVChannelByCategory(String userCode) async{
    NetworkHelper networkHelper = NetworkHelper("$API_URL/all_tv_channel_by_category?code=$userCode&os_type=ios");
    var homeContentForAndroidData = await networkHelper.getData();
    return homeContentForAndroidData;
  }

  Future<dynamic> featuredTvChannel(String userCode,String page) async{
    NetworkHelper networkHelper = NetworkHelper("$API_URL/featured_tv_channel?page=$page&code=$userCode&os_type=ios");
    var homeContentForAndroidData = await networkHelper.getData();
    return homeContentForAndroidData;
  }
  Future<dynamic> movies(String userCode,String page) async{
    NetworkHelper networkHelper = NetworkHelper("$API_URL/movies?page=$page&code=$userCode&os_type=ios");
    var homeContentForAndroidData = await networkHelper.getData();
    return homeContentForAndroidData;
  }

  Future<dynamic> singleDetailsLiveTV(String userCode,String id,String type,String device_id) async{
    NetworkHelper networkHelper = NetworkHelper("$API_URL/single_details?id=28&type=tv&device_id=feb91bb4c0f4e432&code=MM9m6k");
    print("here is API");
    print("$API_URL/single_details?id=28&type=tv&device_id=feb91bb4c0f4e432&code=MM9m6k");
    var homeContentForAndroidData = await networkHelper.getData();
    return homeContentForAndroidData;
  }




  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
