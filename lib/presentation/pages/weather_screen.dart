import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/widgets/additional_info_item.dart';
import 'package:weather_app/presentation/widgets/weather_forecast_card.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(WeatherFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<WeatherBloc>().add(WeatherFetched());
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherFailuer) {
            return Center(
              child: Text(state.error),
            );
          }

          if (state is! WeatherSuccess) {
            return const CircularProgressIndicator.adaptive();
          }

          final weatherModel = state.weatherModel;
          final temp = weatherModel.temprature;
          final sky = weatherModel.sky;
          final humidity = weatherModel.humidity;
          final pressure = weatherModel.pressure;
          final windSpeed = weatherModel.windSpeed;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10,
                          sigmaY: 10,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "$temp K",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 32),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Icon(
                                (sky == 'Clouds' || sky == 'Rain')
                                    ? Icons.cloud
                                    : Icons.sunny,
                                size: 64,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                sky,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Weather Forecase",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: weatherModel.weatherListItems.length,
                    itemBuilder: (context, index) {
                      final weatherListItem =
                          weatherModel.weatherListItems.elementAt(index);
                      final tempListItem = weatherListItem.temprature;
                      final skyListItem = weatherListItem.sky;
                      final timeListItem = weatherListItem.time;
                      return WeatherForecastCard(
                        time: DateFormat.Hm().format(timeListItem),
                        temprature: tempListItem,
                        icon: (skyListItem == 'Clouds' || skyListItem == 'Rain')
                            ? Icons.cloud
                            : Icons.sunny,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Additional Information",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdditionalInfoItem(
                      condition: "Humidity",
                      value: humidity,
                      icon: Icons.water_drop,
                    ),
                    AdditionalInfoItem(
                      condition: "Wind Speed",
                      value: windSpeed,
                      icon: Icons.air,
                    ),
                    AdditionalInfoItem(
                      condition: "Pressure",
                      value: pressure,
                      icon: Icons.beach_access,
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
