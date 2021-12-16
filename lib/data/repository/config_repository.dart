import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/configuration.dart';
import '../../network/api_configuration.dart';
import '../../constants.dart';

abstract class ConfigurationRepository {
  Future<ConfigurationModel> getConfigurationData();
}

class ConfigurationRepositoryImpl implements ConfigurationRepository {
  @override
  Future<ConfigurationModel> getConfigurationData() async {
    var url = ConfigApi().getApiUrl() + "/config?device_id=&code=";
    var response = await http.get(Uri.parse(url), headers: ConfigApi().getHeaders());

    print("my api url is");
    print(url);

    print("our response isss");
    print(response);

    printLog(response.statusCode);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      ConfigurationModel configuration = ConfigurationModel.fromJson(data);
      return configuration;
    } else {
      throw Exception();
    }
  }
}
