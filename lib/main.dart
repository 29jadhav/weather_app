import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/pages/weather_screen.dart';
import 'package:weather_app/provider/data_provider.dart';
import 'package:weather_app/repository/weather_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(Object context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(DataProvider()),
      child: BlocProvider(
        create: (context) => WeatherBloc(context.read<WeatherRepository>()),
        child: MaterialApp(
          theme: ThemeData.dark(useMaterial3: true),
          debugShowCheckedModeBanner: false,
          home: const WeatherScreen(),
        ),
      ),
    );
  }
}
