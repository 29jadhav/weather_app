import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/repository/weather_repository.dart';

part 'weather_state.dart';
part 'weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFetched>(_getCurrentWeather);
  }

  void _getCurrentWeather(
      WeatherFetched event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weatherModel = await weatherRepository.getCurrentWeather();
      emit(WeatherSuccess(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherFailuer(e.toString()));
    }
  }
}
