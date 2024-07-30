import 'package:weather_app/app_secrect.dart';
import 'package:http/http.dart' as http;

class DataProvider {
  Future<String> getCurrentWeather(String cityName) async {
    try {
      final result = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$OpenWeatherSecrectKey"));

      return result.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
