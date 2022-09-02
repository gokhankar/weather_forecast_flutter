import 'package:weather_forecast_flutter/data/api_constants.dart';
import 'package:weather_forecast_flutter/models/weather_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Weather?> getWeather(city) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + city);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Weather _model = weatherFromJson(response.body);
        // print("api services _model: ${_model.region}");
        // print("_model: ${_model.currentConditions?.dayhour.toString()}");
        return _model;
      }
    } catch (e) {
      print("from api service : ${e.toString()}");
      return null;
    }
  }

  get weatherData {}
}
