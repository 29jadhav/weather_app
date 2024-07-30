import 'dart:convert';

import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/provider/data_provider.dart';

class WeatherRepository {
  final DataProvider dataProvider;
  WeatherRepository(this.dataProvider);

  Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = "London";

      String weatherData = await dataProvider.getCurrentWeather(cityName);
      final data = jsonDecode(weatherData);
      if (data['cod'] != '200') {
        throw ("Unexpected error has occured!!");
      }

      return WeatherModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
