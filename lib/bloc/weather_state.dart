part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final WeatherModel weatherModel;

  WeatherSuccess({required this.weatherModel});
}

final class WeatherFailuer extends WeatherState {
  final String error;

  WeatherFailuer(this.error);
}

final class WeatherLoading extends WeatherState {}
