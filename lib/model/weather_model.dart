// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:weather_app/model/weather_list_item.dart';

class WeatherModel {
  final double temprature;
  final String sky;
  final double humidity;
  final double pressure;
  final double windSpeed;
  final List<WeatherListItem> weatherListItems;
  WeatherModel({
    required this.temprature,
    required this.sky,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.weatherListItems,
  });

  WeatherModel copyWith({
    double? temprature,
    String? sky,
    double? humidity,
    double? pressure,
    double? windSpeed,
    List<WeatherListItem>? weatherListItem,
  }) {
    return WeatherModel(
      temprature: temprature ?? this.temprature,
      sky: sky ?? this.sky,
      humidity: humidity ?? this.humidity,
      pressure: pressure ?? this.pressure,
      windSpeed: windSpeed ?? this.windSpeed,
      weatherListItems: weatherListItem ?? this.weatherListItems,
    );
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    List<dynamic> weatherList = map['list'];
    List<WeatherListItem> wetherModelList = [];
    for (var i = 1; i < weatherList.length; i++) {
      wetherModelList.add(
        WeatherListItem(
          temprature: map['list'][i]['main']['temp'] as double,
          sky: map['list'][i]['weather'][0]['main'] as String,
          time: DateTime.parse(map['list'][i]['dt_txt']),
        ),
      );
    }

    return WeatherModel(
      temprature: map['list'][0]['main']['temp'] as double,
      sky: map['list'][0]['weather'][0]['main'] as String,
      humidity: map['list'][0]['main']['humidity'] as double,
      pressure: map['list'][0]['main']['pressure'] as double,
      windSpeed: map['list'][0]['wind']['speed'] as double,
      weatherListItems: wetherModelList,
    );
  }

  //String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherModel(temprature: $temprature, sky: $sky, humidity: $humidity, pressure: $pressure, windSpeed: $windSpeed, weatherListItem: $weatherListItems)';
  }

  @override
  bool operator ==(covariant WeatherModel other) {
    if (identical(this, other)) return true;

    return other.temprature == temprature &&
        other.sky == sky &&
        other.humidity == humidity &&
        other.pressure == pressure &&
        other.windSpeed == windSpeed &&
        listEquals(other.weatherListItems, weatherListItems);
  }

  @override
  int get hashCode {
    return temprature.hashCode ^
        sky.hashCode ^
        humidity.hashCode ^
        pressure.hashCode ^
        windSpeed.hashCode ^
        weatherListItems.hashCode;
  }
}
